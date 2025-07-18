﻿; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

;-------------Full game name for naming patch itself and desktop icons
#define NAME "HoneySelect2"
;---------------------------------------------Current HF Patch version
#define VERSION "2.15"
;-----------------------------------------Sideloader modpack directory
#define GameDir "L:\HFpatchmaking\HS\MODSOURCE"
;#define ModsDir "F:\Games\KoikatsuP\mods"
;--Don't include any files in the build to make it go fast for testing
;#define DEBUG
;---Skip file verification for easier testing, COMMENT OUT FOR RELEASE
;#define NOVERIFY
;------------Don't include general, studio and map sideloader modpacks
#define LITE
;---------------------------------------------------------------------

#include "_Common\Header.iss"
[Setup]
#ifndef LITE
AppName=HF Patch for HoneySelect2
OutputBaseFilename=HoneySelect2 HF Patch v{#VERSION}
#else
AppName=HF Patch for HoneySelect2 (Light Version)
OutputBaseFilename=HoneySelect2 HF Patch v{#VERSION} Light Version
#endif
ArchitecturesInstallIn64BitMode=x64
CloseApplications=yes
RestartApplications=no
CloseApplicationsFilter=*.exe,*.dll
Compression=lzma2/ultra64
;lzma2/ultra64 | zip | lzma2/fast
LZMAUseSeparateProcess=yes
;LZMADictionarySize=208576
LZMADictionarySize=208576
LZMANumFastBytes=273
LZMANumBlockThreads=8
DiskSpanning=yes
DefaultDirName={code:GetDefaultDirName}

WindowResizable=yes
WizardStyle=modern
WizardSizePercent=120,150

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "sc"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

#include "Translations.iss"

[Types]
Name: "full_en";  Description: "{cm:fullInstall}"; Languages: en sc;
Name: "full";     Description: "{cm:fullInstall}"; Languages: jp; 
Name: "extra_en"; Description: "{cm:extraInstall}"; Languages: en sc;
Name: "extra";    Description: "{cm:extraInstall}"; Languages: jp; 
Name: "bare";     Description: "{cm:bareInstall}"
Name: "none";     Description: "{cm:noneInstall}"
Name: "custom";   Description: "{cm:customInstall}"; Flags: iscustom

#define CurrentDate GetDateTimeString('yyyy-mm-dd', '-', ':');

[Components]
Name: "Patch";                    Description: "All free updates + game repair"                                  ; Types: full_en full extra_en extra custom bare none; Flags: fixed
Name: "Patch\VR";                 Description: "Install/Update VR Module"                                                         ; Types: extra_en extra
Name: "Server";                   Description: "Use worldwide server in the in-game card browser instead of Japanese-only"        ; Types: full_en extra_en
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Modpack"                 ; Description: "Sideloader Modpacks {#CurrentDate} (Add additional content to the game, needs at least BepisPlugins to work)"
#ifndef LITE
Name: "Modpack\General"         ; Description: "General (Content for making characters, always recommended)"                      ; Types: full_en full extra_en extra
;Name: "Modpack\Studio"          ; Description: "Studio (Additional content for making Studio scenes)"                           ; Types: full_en full extra_en extra
;Name: "Modpack\MapsStudio"      ; Description: "Maps for use in Studio (Add > Map)"
Name: "Modpack\MapsGame"        ; Description: "Maps for use in main game (H scenes)"                                             ; Types: full_en full extra_en extra
;Name: "Modpack\Animations"      ; Description: "Animations (Additional adnimations for use in Studio and H scenes)"               ; Types: full_en full extra_en extra                          ; Types: full_en full extra_en extra
#endif
;Name: "Modpack\Fixes"           ; Description: "Fixes (Fixes to some of the official content, always recommended)"              ; Types: full_en full extra_en extra
Name: "Modpack\MaterialEditor"  ; Description: "MaterialEditor (Materials for use with MaterialEditor)"                      ; Types: full_en full extra_en extra
Name: "Modpack\UncensorSelector"; Description: "UncensorSelector (Uncensors for use with UncensorSelector)"                  ; Types: full_en full extra_en extra
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[Files]
Source: "HelperLib.dll";                  DestDir: "{app}"                       ; Flags: dontcopy
Source: "Input\start.bat";                DestDir: "{tmp}\hfp"                   ; Flags: ignoreversion recursesubdirs createallsubdirs
#ifndef DEBUG
Source: "Input\DirectX\Jun2010\*";        DestDir: "{tmp}\hfp\DirectXRedist2010" ; Flags: ignoreversion recursesubdirs createallsubdirs deleteafterinstall; Check: DirectXRedistNeedsInstall
Source: "Plugin Readme.md";               DestDir: "{app}"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\empty_ud\*";        DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; Components: Patch
Source: "Input\_Patch\empty_ud_eng\*";    DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch; Languages: en
Source: "Input\_Patch\steam_diff\*";      DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch; Check: IsSteam
Source: "Input\_Patch\2020-08-14-all\*";  DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch
Source: "Input\_Patch\2021-02-14-subdx\*";DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch; Check: DxInstalled
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\vr_normal\*";       DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch\VR; Check: not DxInstalled
Source: "Input\_Patch\vr_dx\*";           DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch\VR; Check: DxInstalled
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\steam_post\*";      DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Patch; Check: IsSteam
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Solidbreak at the start to split off the modpacks from other files in case they don't have to be installed. solidbreak splits before the files entry with it is processed
#ifndef LITE
Source: "{#GameDir}\mods\Sideloader Modpack\*"                          ; DestDir: "{app}\mods\Sideloader Modpack"                         ; Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack\General;        
Source: "{#GameDir}\mods\Sideloader Modpack - Exclusive HS2\*"          ; DestDir: "{app}\mods\Sideloader Modpack - Exclusive HS2"         ; Flags: ignoreversion recursesubdirs; Components: Modpack\General
;Source: "{#ModsDir}\Sideloader Modpack - Bleeding Edge\*"         ; DestDir: "{app}\mods\Sideloader Modpack - Bleeding Edge"         ; Flags: ignoreversion recursesubdirs; Components: Modpack\Bleeding
;Source: "{#GameDir}\mods\Sideloader Modpack - Studio\*"                ; DestDir: "{app}\mods\Sideloader Modpack - Studio"                ; Flags: ignoreversion recursesubdirs; Components: Modpack\Studio
;Source: "{#ModsDir}\Sideloader Modpack - Maps\*"                  ; DestDir: "{app}\mods\Sideloader Modpack - Maps"                  ; Flags: ignoreversion recursesubdirs; Components: Modpack\MapsStudio
Source: "{#GameDir}\mods\Sideloader Modpack - Maps (HS2 Game)\*"       ; DestDir: "{app}\mods\Sideloader Modpack - Maps (HS2 Game)"       ; Flags: ignoreversion recursesubdirs; Components: Modpack\MapsGame
#endif
Source: "{#GameDir}\mods\Sideloader Modpack - MaterialEditor Shaders\*"; DestDir: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders"; Flags: ignoreversion recursesubdirs solidbreak; Components: Modpack\MaterialEditor
Source: "{#GameDir}\mods\Sideloader Modpack - Uncensor Selector\*"     ; DestDir: "{app}\mods\Sideloader Modpack - Uncensor Selector"     ; Flags: ignoreversion recursesubdirs; Components: Modpack\UncensorSelector
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "{#GameDir}\BepInEx\cache\sideloader_zipmod_cache.bin*";                 DestDir: "{app}\BepinEx\cache";                      Flags: ignoreversion recursesubdirs createallsubdirs;           
Source: "Input\AIS_HS2_QuickAccessBox_Thumbs_Stock.zipmod";                 DestDir: "{app}\mods\Sideloader Modpack - Studio\Misc";    Flags: ignoreversion recursesubdirs createallsubdirs;           
Source: "Input\Server\*";                 DestDir: "{app}";                      Flags: ignoreversion recursesubdirs createallsubdirs;            Components: Server
; Make sure this is never missing in case the plugin archive doesn't have it included. Also solidbreak to split off the modpacks
Source: "Input\_Plugins\HS2_UncensorSelector Base.zipmod"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: UNC\Selector
; Always install critical fixes
Source: "Input\_Plugins\_out\IllusionFixes_HoneySelect2\BepInEx\patchers\*"; DestDir: "{app}\BepInEx\patchers"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
; If BP isn't installed, exclude BP uncensors from the random selection
Source: "Input\US_config_noBP.cfg"; DestDir: "{app}\BepInEx\config"; DestName: "com.deathweasel.bepinex.uncensorselector.cfg"; Flags: solidbreak
; This config only allows BP uncensors to be chosen by random
Source: "Input\US_config_BP.cfg";   DestDir: "{app}\BepInEx\config"; DestName: "com.deathweasel.bepinex.uncensorselector.cfg"; Flags: solidbreak; Components: UNC\Selector\BetterPenetration
#endif

; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; This include should be here because the patch files above can be overwritten by this include, and the Files section below overwrites some config files that this include extracts
#include "components.iss"

[Files]
#ifndef DEBUG
Source: "Input\BepInEx_config\*";                           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; Components: BepInEx
Source: "Input\BepInEx_Dev\*";            DestDir: "{app}"                     ; Flags: ignoreversion recursesubdirs createallsubdirs;            Components: BepInEx\Dev
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_TL\HS2-Translation-master\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation
;Source: "Input\_TL\MysteryTranslation\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: AT\TL\EnglishTranslation
Source: "Input\_TL\_lang jp\*";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\Launcher_branding\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: IllusionLaunchers
#endif

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation"; Components: AT\TL\EnglishTranslation
Type: files; Name: "{app}\InitSetting.exe"
Type: files; Name: "{app}\InitSetting.exe.config"
;Type: files; Name: "{app}\Initial Settings.exe" ; DO NOT remove since the steam check relies on this existing
Type: files; Name: "{app}\Initial Settings.exe.config"
Type: filesandordirs; Name: "{app}\BepInEx\LauncherEN"; Components: IllusionLaunchers
; Used by stock launcher in steam release, remove to declutter if using custom launcher
Type: filesandordirs; Name: "{app}\ja-JP"; Components: IllusionLaunchers   
Type: filesandordirs; Name: "{app}\zh-CN"; Components: IllusionLaunchers
Type: filesandordirs; Name: "{app}\zh-TW"; Components: IllusionLaunchers

; Clean up old modpacks. Large modpacks might not be fully included so don't remove here, instead they get cleaned up from old versions later
#ifndef LITE
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"                       ; Components: Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Bleeding Edge"       ; Components: Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps"                ; Components: Modpack\MapsStudio
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps (HS2 Game)"     ; Components: Modpack\MapsGame
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders" ; Components: Modpack\MaterialEditor
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"              ; Components: Modpack\Studio
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Uncensor Selector"   ; Components: Modpack\UncensorSelector
#endif

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
Type: files; Name: "{app}\*.pdb"
Type: files; Name: "{app}\changelog.txt"
Type: files; Name: "{app}\HF_Patch_log.txt"
Type: files; Name: "{app}\output_log.txt"
Type: files; Name: "{app}\HoneySelect2_Data\output_log.txt"
Type: files; Name: "{app}\HoneySelect2VR_Data\output_log.txt"
; Yikes, someone extracted a sideloader mod...
Type: files; Name: "{app}\manifest.xml"

; Just in case. Also resets any hash caches
Type: filesandordirs; Name: "{app}\[UTILITY] KKManager"; Components: KKManager
Type: filesandordirs; Name: "{app}\temp"

; Will get replaced, makes sure there are no stale files left
Type: filesandordirs; Name: "{app}\BepInEx\cache"; Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\core"; Components: BepInEx
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx
Type: files; Name: "{app}\version.dll"; Components: BepInEx
Type: files; Name: "{app}\winhttp.dll"; Components: BepInEx
Type: files; Name: "{app}\doorstop_config.ini"; Components: BepInEx

; Convert steam to jp (together with contents of steam_diff)
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c-1\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c-2\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c00\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c01\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c02\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c03\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c04\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c05\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c06\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c07\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c08\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c09\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c10\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c11\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c12\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\c13\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\etc\70"        ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\op\70"         ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\adv\scenario\op_append\70"  ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\gamedata\achievement"       ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\abdata\localize"                   ; Components: Patch; Check: IsSteam
;Type: filesandordirs; Name:  "{app}\DefaultData\coordinate"           ; Components: Patch; Check: IsSteam
;Type: filesandordirs; Name:  "{app}\DefaultData\ScreenEffect"         ; Components: Patch; Check: IsSteam
Type: filesandordirs; Name: "{app}\HoneySelect2_Data\StreamingAssets\aa\Windows\StandaloneWindows64" ; Components: Patch; Check: IsSteam
Type: files; Name: "{app}\abdata\add101"                              ; Components: Patch; Check: IsSteam
Type: files; Name: "{app}\abdata\add102"                              ; Components: Patch; Check: IsSteam
Type: files; Name: "{app}\abdata\add103"                              ; Components: Patch; Check: IsSteam
Type: files; Name: "{app}\abdata\add70"                               ; Components: Patch; Check: IsSteam
Type: files; Name: "{app}\abdata\list\h\animationinfo\70.unity3d"     ; Components: Patch; Check: IsSteam

; Prevent both disabled and enabled dlls existing at the same time, they will get restored later
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dll"
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dl_"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\HS2Graphics.dll"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\HS2Graphics.dl_"

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\HoneySelect2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\StudioNEOV2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\MonoBleedingEdge"; Components: Patch

[Registry]
Root: HKCU; Subkey: "Software\Illusion"
Root: HKCU; Subkey: "Software\Illusion\HoneySelect2"
Root: HKCU; Subkey: "Software\Illusion\HoneySelect2\HoneySelect2"
Root: HKCU; Subkey: "Software\Illusion\HoneySelect2\HoneySelect2"; ValueType: string; ValueName: "INSTALLDIR_HFP"; ValueData: "{app}\"

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\scripts; Description: "Delete old scripts"
;Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
;Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";

[Icons]
Name: "{userdesktop}\{cm:IconGame}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"
Name: "{userdesktop}\HoneySelect2"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"

[Run]
Filename: "{tmp}\hfp\DirectXRedist2010\DXSETUP.exe"; Parameters: "/silent"; Description: "Installing DirectX redistributables"; Flags: skipifdoesntexist runascurrentuser

Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist

Filename: "{app}\manual\English\README.html"; Description: "Open official game manual"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=Honey_Select_2/Technical_Help"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/illusionsoft"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://github.com/ManlyMarco/HS2-HF_Patch"; Description: "Latest releases and source code"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent

Filename: "https://www.patreon.com/ManlyMarco"; Description: "ManlyMarco Patreon (Creator of this patch)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

[Code]
procedure FindInstallLocation(path: String; gameName: String; gameNameSteam: String; out strout: WideString);
external 'FindInstallLocation@files:HelperLib.dll stdcall';

procedure CreateBackup(path: String);
external 'CreateBackup@files:HelperLib.dll stdcall';

procedure FixConfig(path: String);
external 'FixConfig@files:HelperLib.dll stdcall';

procedure PostInstallCleanUp(path: String);
external 'PostInstallCleanUp@files:HelperLib.dll stdcall';

procedure WriteVersionFile(path, version: String);
external 'WriteVersionFile@files:HelperLib.dll stdcall';

procedure SetConfigDefaults(path: String);
external 'SetConfigDefaults@files:HelperLib.dll stdcall';

procedure FixPermissions(path: String);
external 'FixPermissions@files:HelperLib.dll stdcall';

procedure RemoveJapaneseCards(path: String);
external 'RemoveJapaneseCards@files:HelperLib.dll stdcall';

procedure RemoveNonstandardListfiles(path: String);
external 'RemoveNonstandardListfiles@files:HelperLib.dll stdcall';

procedure RemoveSideloaderDuplicates(path: String);
external 'RemoveSideloaderDuplicates@files:HelperLib.dll stdcall';

procedure RemoveModsExceptModpacks(path: String);
external 'RemoveModsExceptModpacks@files:HelperLib.dll stdcall';

function GetDefaultDirName(Param: string): string;
var
  str: WideString;
begin
  FindInstallLocation(ExpandConstant('{src}'), 'HoneySelect2', 'HoneySelect2', str);
  Result := str;
end;

function IsSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Initial Settings.exe'));
end;

function IsConvertedSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\BRConvert\OK.txt'));
end;

function DxInstalled(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\abdata\add50'));
end;

function DirectXRedistNeedsInstall(): Boolean;
begin
  Result := not RegKeyExists(HKLM, 'SOFTWARE\WOW6432Node\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010')
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectTasks then
  begin
    // If garbage plugins are detected, delete all old mods by default
    if(FileExists(ExpandConstant('{app}\BepInEx\config\EC.Core.Fixes.MakerFPS.cfg')) or FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll')) or FileExists(ExpandConstant('{app}\BepInEx\0Harmony.dll')) or FileExists(ExpandConstant('{app}\BepInEx\TexResPatch.dll')) or FileExists(ExpandConstant('{app}\BepInEx\KK_GUIDMigration.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Sideloader.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Assembly-CSharp.dll'))) then
    begin
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 5, coCheckWithChildren);
    end;
    
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  // After install completes
  if (CurStep = ssPostInstall) then
  begin
    // Delete Japanese versions of cards and bgs if English versions are installed (only those with different names)
    //if IsComponentSelected('AT\TL\EnglishTranslation\UserData') then
    //    RemoveJapaneseCards(ExpandConstant('{app}'));

    // Always clean up sideloader mods in case user already messed up
    //if IsTaskSelected('fixSideloaderDupes') then
    //    RemoveSideloaderDuplicates(ExpandConstant('{app}'));

    FixConfig(ExpandConstant('{app}'));
    WriteVersionFile(ExpandConstant('{app}'), '{#VERSION}');
    
    if(IsSteam()) then
      DeleteFile(ExpandConstant('{app}\InitSetting.exe'));

    // Always turn these off just to be safe, user can turn them back on in launcher
    if(FileExists(ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dll'))) then
      RenameFile(ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dll'), ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dl_'));
    if(FileExists(ExpandConstant('{app}\BepInEx\plugins\Graphics\HS2Graphics.dll'))) then
      RenameFile(ExpandConstant('{app}\BepInEx\plugins\Graphics\HS2Graphics.dll'), ExpandConstant('{app}\BepInEx\plugins\Graphics\HS2Graphics.dl_'));
      
    // Prevent trying to install the redist again
    Exec('reg', 'add HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010 /v dxsetup /t REG_DWORD /d 1 /f /reg:32', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    
    PostInstallCleanUp(ExpandConstant('{app}'));
  end;
end;

function IsCharValid(Value: Char): Boolean;
begin
  Result := Ord(Value) <= $007F;
end;

function IsDirNameValid(const Value: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 1 to Length(Value) do
    if not IsCharValid(Value[I]) then
      Exit;
  Result := True;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpSelectDir) then
  begin
    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\EmotionCreators.exe'))
      or FileExists(ExpandConstant('{app}\Koikatu.exe'))
      or FileExists(ExpandConstant('{app}\Koikatsu Party.exe'))
      or FileExists(ExpandConstant('{app}\KoikatsuSunshine.exe'))
      or FileExists(ExpandConstant('{app}\KoiKoiMonogatari.exe'))
      or FileExists(ExpandConstant('{app}\KoiKoiMonogatariVR.exe'))
      or FileExists(ExpandConstant('{app}\PlayHome.exe'))
      or FileExists(ExpandConstant('{app}\VR_Kanojo.exe'))
      or FileExists(ExpandConstant('{app}\AI-Syoujyo.exe'))
      or FileExists(ExpandConstant('{app}\AI-Shoujo.exe'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgDifferentGameDetected}'), mbError, MB_OK);
        Result := False;
      end
    end;

    if (not FileExists(ExpandConstant('{app}\HoneySelect2_Data\resources.assets'))) then
    begin
      if(SuppressibleMsgBox(ExpandConstant('{cm:MsgExeNotFound}'), mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
    end;
    
    if Result = True then
    begin
      if (Length(ExpandConstant('{app}')) > 100) then
      begin
        MsgBox(ExpandConstant('{cm:MsgPathTooLong}'), mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      if not IsDirNameValid(ExpandConstant('{app}')) then
      begin
        MsgBox(ExpandConstant('{cm:MsgPathNonLatin}'), mbError, MB_OK);
      end;
    end;

    if Result = True then
    begin
      if (Pos(LowerCase(ExpandConstant('{app}\')), LowerCase(ExpandConstant('{src}\'))) > 0) then
      begin
        MsgBox('This patch is inside of the game directory you are attempting to install to. You have to move the patch files outside of the game directory and try again.', mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      // Check for file corruptions
      if (not FileExists(ExpandConstant('{app}\abdata\adv\camera\action.unity3d'))
      or not FileExists(ExpandConstant('{app}\abdata\sound\setting\sound3dsettingdata\00.unity3d'))
      or not FileExists(ExpandConstant('{app}\abdata\sound\setting\soundsettingdata\00.unity3d'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgMissingGameFiles}'), mbError, MB_OK);
        Result := False;
      end;
    end;

    if Result = True then
    begin
      // Check for extracted zipmods
      if FileExists(ExpandConstant('{app}\manifest.xml')) then
      begin
        SuppressibleMsgBox(ExpandConstant('{cm:MsgExtractedZipmod}'), mbError, MB_OK, 0);
      end;
      
      if not DxInstalled then begin
        SuppressibleMsgBox('NOTICE - You are missing the optional "DX" expansion (2020-10-30 Paid DLC). It adds new new items, maps and animations.' + #13#10 + #13#10 + 'This expansion is optional, the patch will work fine without it. If you want to use it, install it BEFORE running HF Patch.', mbInformation, MB_OK, 0);
      end;
    end;
  end;
end;

procedure VerifyFiles(srcexe: String; out errormsg: WideString);
external 'VerifyFiles@files:HelperLib.dll stdcall';

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

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  ResultCode: Integer;
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
    try
      PrepareToInstallWithProgressPage.SetProgress(4, 10);
      PrepareToInstallWithProgressPage.SetText('Exiting running game processes', '');
      
      // Close the game if it's running
      Exec('taskkill', '/F /IM StudioNEOV2.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('taskkill', '/F /IM HoneySelect2.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('taskkill', '/F /IM InitSetting.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('taskkill', '/F /IM Initial Settings.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('taskkill', '/F /IM BepInEx.Patcher.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('taskkill', '/F /IM KKManager.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('taskkill', '/F /IM StandaloneUpdater.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);

        // Often needed after fixing permissions to unlock the files so the permissions can be written, without this access to them is always denied
        //Exec('taskkill', '/F /IM explorer.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    
      PrepareToInstallWithProgressPage.SetProgress(5, 10);
      PrepareToInstallWithProgressPage.SetText('Fixing file permissions of game directory', '');
      
      // Fix file permissions
      //Exec('takeown', ExpandConstant('/f "{app}" /r /SKIPSL /d y'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      //Exec('icacls', ExpandConstant('"{app}" /grant everyone:F /t /c /l'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
      FixPermissions(ExpandConstant('{app}'));
      
      //try
      //  ExecAsOriginalUser('explorer.exe', '', '', 0, ewNoWait, ResultCode);
      //except
      //  ShowExceptionMessage();
      //end;
    except
      ShowExceptionMessage();
    end;

    PrepareToInstallWithProgressPage.SetProgress(6, 10);
    PrepareToInstallWithProgressPage.SetText('Creating a plugin backup', '');
      
    CreateBackup(ExpandConstant('{app}'));

    PrepareToInstallWithProgressPage.SetProgress(8, 10);
    PrepareToInstallWithProgressPage.SetText('Changing plugin configuration', '');
    
    // Backup plugin settings
    if (not IsTaskSelected('delete\Config') and FileExists(ExpandConstant('{app}\BepInEx\config.ini'))) then
      FileCopy(ExpandConstant('{app}\BepInEx\config.ini'), ExpandConstant('{app}\config.ini'), false);

    // Remove BepInEx folder
    if (IsTaskSelected('delete\Config') and IsTaskSelected('delete\Plugins')) then begin
      DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
    end
    else
    begin
      // Or only remove plugins
      if (IsTaskSelected('delete\Plugins')) then begin
        DelTree(ExpandConstant('{app}\BepInEx\plugins'), True, True, True);
        DelTree(ExpandConstant('{app}\BepInEx\patchers'), True, True, True);
        DelTree(ExpandConstant('{app}\BepInEx\IPA'), True, True, True);
        Exec(ExpandConstant('{cmd}'), '/c del *.dll', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
        Exec(ExpandConstant('{cmd}'), '/c del *.dl_', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
      end;
    end;
    
    if (not IsTaskSelected('delete\Config')) then
    begin
      // Restore the settings and remove the backup
      CreateDir(ExpandConstant('{app}\BepInEx'));
      if(FileExists(ExpandConstant('{app}\config.ini'))) then
      begin
        FileCopy(ExpandConstant('{app}\config.ini'), ExpandConstant('{app}\BepInEx\config.ini'), false);
        DeleteFile(ExpandConstant('{app}\config.ini'));
      end;
    end
    else
    begin
      // Or remove settings
      DeleteFile(ExpandConstant('{app}\BepInEx\config.ini'));
    end;

    PrepareToInstallWithProgressPage.SetProgress(9, 10);
    PrepareToInstallWithProgressPage.SetText('Cleaning up old mods and scripts', '');
    
    if (IsTaskSelected('delete\Sidemods')) then
      RemoveModsExceptModpacks(ExpandConstant('{app}'));

    //if (IsTaskSelected('delete\Listfiles')) then
    //  RemoveNonstandardListfiles(ExpandConstant('{app}'));
    
    if (IsTaskSelected('delete\scripts')) then
    begin
      DeleteFile(ExpandConstant('{app}\AYAYA.cs'));
      if(FileExists(ExpandConstant('{app}\scripts\AYAYA.cs'))) then
        RenameFile(ExpandConstant('{app}\scripts\AYAYA.cs'), ExpandConstant('{app}\AYAYA.cs'));

      DelTree(ExpandConstant('{app}\scripts'), True, True, True);

      if(FileExists(ExpandConstant('{app}\AYAYA.cs'))) then
      begin
        CreateDir(ExpandConstant('{app}\scripts'));
        RenameFile(ExpandConstant('{app}\AYAYA.cs'), ExpandConstant('{app}\scripts\AYAYA.cs'));
      end;
    end;

    SetConfigDefaults(ExpandConstant('{app}'));
  end;
  
  PrepareToInstallWithProgressPage.SetProgress(10, 10);
  PrepareToInstallWithProgressPage.Hide;
end;
