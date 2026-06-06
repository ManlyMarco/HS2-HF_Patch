; Copyright (C) 2026  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

#include "Translations.iss"
; Szumqcu is unique for tracking
#define KoiDiscordLink "https://discord.gg/Szumqcu"
#define IsDiscordLink "https://discord.gg/illusionsoft"
; Date of compilation, not of running
#define CurrentDate GetDateTimeString('yyyy-mm-dd', '-', ':');

[Setup]
AppPublisher=ManlyMarco

AppVersion={#VERSION}
VersionInfoVersion={#VERSION}

Uninstallable=no
DisableProgramGroupPage=yes
OutputDir=.\Output
DirExistsWarning=no
AppendDefaultDirName=no

SolidCompression=yes

WizardSmallImageFile={#__DIR__}\hf.bmp
WizardImageStretch=yes
WizardImageBackColor=$FFFFFF
WizardImageFile=banner.bmp
SetupIconFile={#__DIR__}\icon.ico
InfoBeforeFile=INFO.rtf
InfoAfterFile=Plugin Readme.md
LicenseFile={#__DIR__}\LICENSE_binaries

DisableWelcomePage=no

ArchitecturesInstallIn64BitMode=x64os
CloseApplications=yes
RestartApplications=no
CloseApplicationsFilter=*.exe,*.dll

DefaultDirName={code:GetDefaultDirName}

WizardStyle=modern
WizardSizePercent=120,150

[Files]
Source: "{#__DIR__}\bin\HelperLib.dll";   DestDir: "{app}"      ; Flags: dontcopy
Source: "Plugin Readme.md";               DestDir: "{app}"

[InstallDelete]
; Clean up old patches and packs
Type: files; Name: "{app}\start.bat"
Type: files; Name: "{app}\desktop.ini"
Type: files; Name: "{app}\*.ico"
Type: files; Name: "{app}\[BR]*"

; Always not necessary
Type: files; Name: "{app}\0Harmony.dll"
Type: files; Name: "{app}\BepInEx.dll"
Type: files; Name: "{app}\Mono.Cecil.dll"

; Junk
Type: filesandordirs; Name: "{app}\BepInEx\bepinex4_backup"
Type: filesandordirs; Name: "{app}\BepInEx_Shim_Backup"
Type: filesandordirs; Name: "{app}\BepInEx\cache"
Type: filesandordirs; Name: "{app}\temp"
Type: files; Name: "{app}\README.*"
Type: files; Name: "{app}\*.log"
Type: files; Name: "{app}\BepInEx\*.log"
Type: files; Name: "{app}\*.pdb"
Type: files; Name: "{app}\changelog.txt"
Type: files; Name: "{app}\HF_Patch_log.txt"
Type: files; Name: "{app}\output_log.txt"
Type: files; Name: "{app}\*_Data\output_log.txt"
; Yikes, someone extracted a sideloader mod...
Type: files; Name: "{app}\manifest.xml"

; Will get replaced, makes sure there are no stale files left
Type: filesandordirs; Name: "{app}\BepInEx\cache";       Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\core";        Components: BepInEx
Type: files;          Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx
Type: files;          Name: "{app}\version.dll";         Components: BepInEx
Type: files;          Name: "{app}\winhttp.dll";         Components: BepInEx
Type: files;          Name: "{app}\doorstop_config.ini"; Components: BepInEx
; BepInEx 6
Type: filesandordirs; Name: "{app}\BepInEx\dummy";       Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\unhollowed";  Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\unity-libs";  Components: BepInEx
Type: filesandordirs; Name: "{app}\dotnet";              Components: BepInEx

; IPA, useless because patched assemblies are replaced
Type: files; Name: "{app}\IPA.exe"

; Someone tried using Reipatcher to install AT
Type: filesandordirs; Name: "{app}\ReiPatcher"
Type: files;          Name: "{app}\SetupReiPatcherAndAutoTranslator.exe"
Type: files;          Name: "{app}\*(Patch and Run).lnk"

[Code]
// ---------------------------------------------------------------------- C# extern method calls
procedure FindInstallLocation(srcPath, companyName, gameName, gameNameSteam: String; out strout: WideString);
external 'FindInstallLocation@files:HelperLib.dll stdcall';

procedure TestInstallLocation(appPath, srcPath, gameName, gameNameSteam: String; out errorStr: WideString; out warnStr: WideString);
external 'TestInstallLocation@files:HelperLib.dll stdcall';

procedure CreateBackup(appPath, srcPath: String);
external 'CreateBackup@files:HelperLib.dll stdcall';

procedure WriteVersionFile(appPath, srcPath, version: String);
external 'WriteVersionFile@files:HelperLib.dll stdcall';

procedure FixPermissions(appPath, srcPath: String);
external 'FixPermissions@files:HelperLib.dll stdcall';

procedure FixConfigIllusion(appPath, srcPath: String);
external 'FixConfigIllusion@files:HelperLib.dll stdcall';

procedure FixConfigKoikatsu(appPath, srcPath: String);
external 'FixConfigKoikatsu@files:HelperLib.dll stdcall';

procedure RemoveModsExceptModpacks(appPath, srcPath: String);
external 'RemoveModsExceptModpacks@files:HelperLib.dll stdcall';

procedure RemoveSideloaderDuplicates(appPath, srcPath: String);
external 'RemoveSideloaderDuplicates@files:HelperLib.dll stdcall';

procedure RemoveNonstandardListfiles(appPath, srcPath: String);
external 'RemoveNonstandardListfiles@files:HelperLib.dll stdcall';

procedure VerifyFiles(srcexe: String; out errormsg: WideString);
external 'VerifyFiles@files:HelperLib.dll stdcall';

function GetDefaultDirName(Param: string): string;
var
  str: WideString;
begin
  FindInstallLocation(ExpandConstant('{src}'), '{#CompanyName}', '{#GameName}', '{#GameNameSteam}', str);
  Result := str;
end;

// ---------------------------------------------------------------------- API

function OnInstallLocationTest(): Boolean; forward;
procedure OnTasksPageOpen(); forward;

procedure OnPrepKillTasks(); forward;
procedure OnPrepDoCleanup(); forward;

procedure OnInstallCompleted(); forward;

// ---------------------------------------------------------------------- Event handlers
   
<event('NextButtonClick')>
function NextButtonClick_Common(CurPageID: Integer): Boolean;
var
  errorStr: WideString;
  warnStr: WideString;
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpInfoBefore) then
  begin
      if (FileExists('C:\windows\system32\winecfg.exe')) then
      begin
          if (MsgBox('Since you are running under Linux you must perform additional steps at the end of the installation.'#13#10#13#10'Read the Linux guides linked on this page before continuing. Click No to continue.', mbError, MB_YESNO) = IDYES) then
          begin
            Result := False;
          end;
      end;
  end;
  
  if (CurPageID = wpSelectDir) then
  begin
    TestInstallLocation(ExpandConstant('{app}'), ExpandConstant('{src}'), '{#GameName}', '{#GameNameSteam}', errorStr, warnStr);
    if not (errorStr = '') then
    begin
      MsgBox(ExpandConstant(errorStr), mbCriticalError, MB_OK);
      Result := False;
    end
    else
    begin
      if not (warnStr = '') then
        SuppressibleMsgBox(ExpandConstant(warnStr), mbError, MB_OK, 0);
    end;
    
    if Result = True then
    begin
        if not OnInstallLocationTest() then
            Result := False;
    end;
  end;
end;

<event('CurPageChanged')>
procedure CurPageChanged_Common(CurPageID: Integer);
begin
  // When tasks page is opened
  // TODO: Only trigger once?
  if CurPageID = wpSelectTasks then
  begin
    OnTasksPageOpen();
  end;
end;

<event('CurStepChanged')>
procedure CurStepChanged_Common(CurStep: TSetupStep);
begin
  // After install completes
  if CurStep = ssPostInstall then
  begin
    try
      WriteVersionFile(ExpandConstant('{app}'), ExpandConstant('{src}'), '{#VERSION}');
      DeleteFile(ExpandConstant('{app}\changelog.txt'));
    except
      ShowExceptionMessage();
    end;
    
    OnInstallCompleted();
  end;
end;


// Set up a custom prepare to install page with progress
var
  PrepareToInstallWithProgressPage : TOutputProgressWizardPage;
procedure InitializeWizard;
var
  A: AnsiString;
  S: String;
begin
  // The string msgWizardPreparing has the placeholder '[name]' inside that I have to replace with the name of my app, stored in a define constant of my script.
  S := SetupMessage(msgPreparingDesc); 
  StringChange(S, '[name]', '{#NAME} HF Patch');
  A := S;
  PrepareToInstallWithProgressPage := CreateOutputProgressPage(SetupMessage(msgWizardPreparing), A);
end;

procedure DeletePluginsAndConfig(deleteConfig, deletePlugins: Boolean); forward;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  VerifyResult: WideString;
begin
  NeedsRestart := false;

  PrepareToInstallWithProgressPage.Show;
  
  PrepareToInstallWithProgressPage.SetProgress(0, 10);
  PrepareToInstallWithProgressPage.SetText('Verifying HF Patch files, this can take a few minutes', '');
  
#ifndef NOVERIFY
  VerifyFiles(ExpandConstant('{srcexe}'), VerifyResult);
#endif

  // If verification failed, set return of this method to it and innosetup will automatically fail the install. Still need to skip rest of the code though.
  if not (VerifyResult = '') then
  begin
    Result := VerifyResult;
  end
  else
  begin
    PrepareToInstallWithProgressPage.SetProgress(4, 10);
    PrepareToInstallWithProgressPage.SetText('Exiting running game processes', '');
    
    OnPrepKillTasks();
    
    PrepareToInstallWithProgressPage.SetProgress(5, 10);
    PrepareToInstallWithProgressPage.SetText('Fixing file permissions of game directory', '');

    try
      // Fix file permissions
      FixPermissions(ExpandConstant('{app}'), ExpandConstant('{src}'));
    except
      ShowExceptionMessage();
    end;

    PrepareToInstallWithProgressPage.SetProgress(6, 10);
    PrepareToInstallWithProgressPage.SetText('Creating a plugin backup', '');

    CreateBackup(ExpandConstant('{app}'), ExpandConstant('{src}'));

    PrepareToInstallWithProgressPage.SetProgress(8, 10);
    PrepareToInstallWithProgressPage.SetText('Changing plugin configuration', '');
    
    DeletePluginsAndConfig(WizardIsTaskSelected('delete\Config'), WizardIsTaskSelected('delete\Plugins'));

    PrepareToInstallWithProgressPage.SetProgress(9, 10);
    PrepareToInstallWithProgressPage.SetText('Cleaning up old mods and scripts', '');

    OnPrepDoCleanup();
  end;
  
  PrepareToInstallWithProgressPage.SetProgress(10, 10);
  PrepareToInstallWithProgressPage.Hide;
end;

// ---------------------------------------------------------------------- Utility methods

procedure DeletePluginsAndConfig(deleteConfig, deletePlugins: Boolean);
var 
  discard: Integer;
begin
  // Remove BepInEx folder
  if deleteConfig and deletePlugins then
  begin
    DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
  end
  else
  begin
    // Or only remove plugins
    if deletePlugins then
    begin
      DelTree(ExpandConstant('{app}\BepInEx\plugins'), True, True, True);
      DelTree(ExpandConstant('{app}\BepInEx\patchers'), True, True, True);
      DelTree(ExpandConstant('{app}\BepInEx\IPA'), True, True, True);
      Exec(ExpandConstant('{cmd}'), '/c del *.dll', ExpandConstant('{app}\BepInEx'), SW_HIDE, ewWaitUntilTerminated, discard);
      Exec(ExpandConstant('{cmd}'), '/c del *.dl_', ExpandConstant('{app}\BepInEx'), SW_HIDE, ewWaitUntilTerminated, discard);
    end;
    // Or remove settings
    if deleteConfig then
    begin
      DeleteFile(ExpandConstant('{app}\BepInEx\config.ini'));
      DelTree(ExpandConstant('{app}\BepInEx\config'), True, True, True);
    end;
  end;
end;

procedure MassTaskKill (Params: array of String);
var
  I: Integer;
  discard: Integer;
begin
  try
    for I := 0 to High(Params) do
    begin
      Exec('taskkill', '/F /IM ' + Params[I], ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, discard);
    end;
  except
    ShowExceptionMessage();
  end;
end;

procedure MassDeleteFile (Params: array of String);
var
  I: Integer;
begin
  try
    for I := 0 to High(Params) do
    begin
      DeleteFile(ExpandConstant(Params[I]));
    end;
  except
    ShowExceptionMessage();
  end;
end;

[Setup]

// #expr SaveToFile(AddBackslash(SourcePath) + "Preprocessed.iss")