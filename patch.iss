; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "HoneySelect2"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "1.0"
;----------------------------------------------------------------------------------------------------
#include "_Common\Header.iss"

[Setup]
AppName=HF Patch for HoneySelect2
OutputBaseFilename=HoneySelect2 HF Patch v{#VERSION}
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
LZMANumBlockThreads=6
DiskSpanning=yes
DefaultDirName=C:\Illusion\HoneySelect2

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "sc"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

#include "Translations.iss"

[Types]
Name: "full_en";  Description: "{cm:fullInstall}"; Languages: en;
Name: "full";     Description: "{cm:fullInstall}"; Languages: jp sc;
Name: "extra_en"; Description: "{cm:extraInstall}"; Languages: en;
Name: "extra";    Description: "{cm:extraInstall}"; Languages: jp sc;
Name: "bare";     Description: "{cm:bareInstall}"
Name: "none";     Description: "{cm:noneInstall}"
Name: "custom";   Description: "{cm:customInstall}"; Flags: iscustom

[Components]
Name: "Patch"; Description: "Free patches up to 2020-06-26 (with Studio) + game repair"; Types: full_en full extra extra_en custom bare none; Flags: fixed

Name: "BepInEx"; Description: "BepInEx v5.1 Plugin framework + MessageCenter v1.1 + ConfigurationManager v16.0"; Types: full_en full extra extra_en custom bare; Flags: fixed 
Name: "BepInEx\Dev"; Description: "{cm:CompDev}";

Name: "BepisPlugins"; Description: "BepisPlugins r15.1.2 (Core plugins needed for most things)"; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "KKAPI"; Description: "HS2API v1.12.3 (Modding API needed by many plugins)"; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "XUnityResourceRedirector"; Description: "XUnity.ResourceRedirector 1.1.2 (Modding API)"; Types: full_en full extra extra_en custom bare; Flags: fixed

Name: "KKManager"; Description: "KKManager v0.12.0 (Mod updater and manager)"; Types: full_en full extra extra_en custom bare; Flags: fixed

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Launcher"; Description: "Multilangual launcher v2.0 2020-06-20"; Types: full_en full extra extra_en custom

Name: "TL"; Description: "{cm:CompTL}"; Types: full_en extra_en

Name: "TL\AutoTranslator"; Description: "XUnity.AutoTranslator 4.11.3"; Types: full extra full_en extra_en custom
Name: "TL\AutoTranslator\EnglishTranslation"; Description: "Fan Translations up to 2020-06-24 + HS2_TextResourceRedirector v1.3"; Types: full_en extra_en

Name: "TL\AI_Subtitles"; Description: "HS2_Subtitles v1.6"; Types: full_en extra_en

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "UNC"; Description: "{cm:CompUNC}"; Types: full_en full extra extra_en

Name: "UNC\Selector"; Description: "Uncensor Selector v3.9.1 + BepisFixHS2"; Types: full_en full extra extra_en
Name: "UNC\Selector\Pack"; Description: "Sideloader Modpack - Uncensor Selector 2020-06-24"; Types: full_en full extra extra_en

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Content"; Description: "Additional content for character and scene creation (Needed to properly load most character cards and scenes)"; Types: full_en full extra extra_en

Name: "Content\Modpack"; Description: "Sideloader Modpack 2020-06-24 (Lots of additional content for making characters)"; Types: full_en full extra extra_en
;Name: "Content\ModpackStudio"; Description: "Sideloader Modpack - Studio 2020-06-24 (Additional content for making Studio scenes)"; Types: full_en full extra extra_en
;Name: "Content\ModpackMaps"; Description: "Sideloader Modpack - Maps 2020-06-24 (Additional maps for making Studio scenes)"; Types: full_en full extra extra_en

Name: "Content\KK_MaterialEditor"; Description: "HS2_MaterialEditor v2.0.6 + Shader Modpack 2020-06-24 (Material editing in maker and studio)"; Types: full_en full extra extra_en
;Name: "Content\RendererEditor"; Description: "RendererEditor 1.5.0 (Material editing in studio)"; Types: full_en full extra extra_en

Name: "Content\MoreAccessories"; Description: "MoreAccessories 1.2.1 (Unlocks accessory limit, but might cause compatibility issues)"; Types: full_en full extra extra_en

Name: "Content\KKABMX"; Description: "HS2ABMX / BonemodX v4.3 (More sliders in maker)"; Types: full_en full extra extra_en
Name: "Content\KSOX"; Description: "HS2_OverlayMods v5.2 (Custom body, clothes and eye textures)"; Types: full_en full extra extra_en

Name: "Content\KK_InvisibleBody"; Description: "InvisibleBody v1.3.2 (Hide character body in studio for trickery with clothes)"; Types: full_en full extra extra_en
Name: "Content\KK_AnimationController"; Description: "HS2_AnimationController v2.2 (Helps create custom animations in studio)"; Types: full_en full extra extra_en
;Name: "Content\NodesConstraints"; Description: "NodesConstraints 1.1.0 (Helps create custom animations in studio)"; Types: full_en full extra extra_en

Name: "Content\BonesFramework"; Description: "BonesFramework v1.4.0 (Lets mods add new bones)"; Types: full_en full extra extra_en
Name: "Content\AI_ClothColliders"; Description: "HS2_ClothColliders v1.0 (Cloth physics support for mods)"; Types: full_en full extra extra_en
Name: "Content\AI_StudioSceneSettings"; Description: "HS2_StudioSceneSettings v1.1 (Add clip plane settings to studio scene effects)"; Types: full_en full extra extra_en

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "FIX"; Description: "{cm:CompFIX}"; Types: extra extra_en

Name: "FIX\KoikatuFixes"; Description: "IllusionFixes 13.2 (A collection of important fixes)"; Types: full_en full extra extra_en

Name: "FIX\KK_InputHotkeyBlock"; Description: "HS2_InputHotkeyBlock v1.2 (Blocks plugin keybinds while typing)"; Types: full_en full extra extra_en

Name: "FIX\AI_BetterAA"; Description: "HS2_BetterAA v1.5 (Improves anti-aliasing without any performance hit)"; Types: full_en full extra extra_en

Name: "FIX\AI_UnlockPlayerHeight"; Description: "HS2_UnlockPlayerHeight v1.4.1 (Allows non-default heights of male characters)"; Types: full_en full extra extra_en
Name: "FIX\AI_UnlockPlayerHClothes"; Description: "HS2_UnlockPlayerHClothes v1.4 (Fixes inability to change clothes in h scenes)"; Types: full_en full extra extra_en
Name: "FIX\AI_BetterHScenes"; Description: "HS2_BetterHScenes v2.4 (Fixes H performance bugs and adds extra features)"; Types: full_en full extra extra_en
Name: "FIX\HS2_HLightControl"; Description: "HS2_HLightControl v1.1.1 (Allows you to change some light settings)"; Types: full_en full extra extra_en

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "Feature"; Description: "Improvements and additional features"; Types: extra extra_en
Name: "Feature\DragAndDrop"; Description: "IllusionDragAndDrop v1.2.1 (Drag cards and scenes into maker/studio)"; Types: full_en full extra extra_en
Name: "Feature\KK_PoseFolders"; Description: "HS2_PoseFolders v1.0 (Folder support in studio pose list)"; Types: full_en full extra extra_en

;Name: "Feature\AIUS"; Description: "AIUS v1.8.1 (Convenient UI improvements)"; Types: full_en full extra extra_en
;Name: "Feature\AIPE"; Description: "AIPE v2.11.0 (Additional studio object manipulation)"; Types: full_en full extra extra_en
Name: "Feature\AI_QuickAccessBox"; Description: "HS2_QuickAccessBox v2.2.1 (Quick search studio items)"; Types: full_en full extra extra_en
Name: "Feature\AI_BrowserFolders"; Description: "HS2_BrowserFolders v2.1 (Adds folder support to studio character and scene lists)"; Types: full_en full extra extra_en
Name: "Feature\KK_StudioObjectMoveHotkeys"; Description: "HS2_StudioObjectMoveHotkeys v1.0 (Adds T/Y/U/I hotkeys for manipulating items in studio)"; Types: full_en full extra extra_en
Name: "Feature\MoveControllerAI"; Description: "MoveControllerHS2 1.5.1 (Improved object move window in studio)"; Types: full_en full extra extra_en
Name: "Feature\AI_PoseQuickLoad"; Description: "HS2_PoseQuickLoad v1.0 (Immediately apply pose when selected in studio, turn on in F1 menu)"; Types: full_en full extra extra_en
Name: "Feature\AI_FKIK"; Description: "HS2_FKIK v1.1 (Adds FK/IK mode in studio)"; Types: full_en full extra extra_en

Name: "Feature\Bra"; Description: "Bra Push-Up Mod v2.0 (Bras affect breast shape)"; Types: extra extra_en
Name: "Feature\Heelz"; Description: "Heelz v1.2 (Support for high heel shoes)"; Types: full_en full extra extra_en
;Name: "Feature\AI_ReverseTrap"; Description: "AI_ReverseTrap v1.0 (Can make girls act like guys)"; Types: full_en full extra extra_en
Name: "Feature\AI_HeightBar"; Description: "HS2_HeightBar v3.3 (Adds height measure bar to maker)"; Types: full_en full extra extra_en
Name: "Feature\AI_ColorPanelX"; Description: "HS2_ColorPanelX v1.2 (Improves color picker in maker)"; Types: full_en full extra extra_en

;Name: "Feature\AI_CharacterReplacer"; Description: "AI_CharacterReplacer v1.6.2 (Can replace default maker characters)"; Types: full_en full extra extra_en

Name: "Feature\Graphics"; Description: "Additional graphics settings (has to be enabled in launcher first)"; Types: full_en full extra extra_en
Name: "Feature\Graphics\DHH"; Description: "DHH Graphics Enhancer v1.01"; Types: full_en full extra extra_en
Name: "Feature\Graphics\AIGraphics"; Description: "HS2 Graphics v0.3.3 (More powerful than DHH but harder to use)"; Types: full_en full extra extra_en
Name: "Feature\Graphics\GraphicsSettings"; Description: "GraphicsSettings v1.2 (More settings to make graphics more or less demanding)"; Types: full_en full extra extra_en

Name: "Feature\KK_ANIMATIONOVERDRIVE"; Description: "HS2_AnimationOverdrive v1.1 (Unlock animation speed in studio, type in the text box)"; Types: full_en full extra extra_en

Name: "Feature\HideAllUI"; Description: "HideAllUI.HoneySelect2 v2.2 (Press space to hide interface)"; Types: full_en full extra extra_en

Name: "Feature\AI_PovX"; Description: "HS2_PovX v1.1.1 + HS2_StudioPOV v1.1 (First-person mode)"; Types: extra extra_en

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Name: "MISC"; Description: "{cm:CompMISC}";

Name: "MISC\FPS"; Description: "FPS Counter v3.1-beta (Useful for performance testing)"; Types: full_en full extra extra_en
Name: "MISC\Trainer"; Description: "RuntimeUnityEditor v2.1 (Allows you to make arbitrary modifications to the game)"; Types: full_en full extra extra_en
Name: "MISC\Trainer\Cheats"; Description: "HS2_CheatTools v2.7.2 (Trainer, press F12 to open)"; Types: full_en full extra extra_en

Name: "MISC\ScriptLoader"; Description: "ScriptLoader v1.2.2 (Runs user scripts)"; Types: full_en full extra extra_en

Name: "MISC\FullSave"; Description: "Full save (WARNING - OVERWRITES CURRENT SAVE)"

[Files]
Source: "HelperLib.dll"; DestDir: "{app}"; Flags: dontcopy

Source: "Input\start.bat"; DestDir: "{tmp}\hfp"; Flags: ignoreversion recursesubdirs createallsubdirs
 
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Patch\empty_ud\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\empty_ud_eng\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Languages: en
Source: "Input\_Patch\honey2_01_plus_0626fEw2_all\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Patch

;Source: "Input\_Patch\aisyoujyo_02_plus_0214cah6j_all_jp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch; Check: not IsSteam

;Source: "Input\_Patch\aisteam_StudioCompat\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Patch; Check: IsSteam
;Source: "Input\_Patch\aisteam_EcstasyPatch\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Patch; Check: IsSteam

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Placed here instead of in content group to optimize solid compression chunks
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack\*";          DestDir: "{app}\mods\Sideloader Modpack";                      Flags: ignoreversion recursesubdirs solidbreak; Components: Content\Modpack;    
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Exclusive HS2\*";DestDir: "{app}\mods\Sideloader Modpack - Exclusive HS2";Flags: ignoreversion recursesubdirs; Components: Content\Modpack;      
;Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Studio\*"; DestDir: "{app}\mods\Sideloader Modpack - Studio";             Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackStudio; 
;Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Maps\*"; DestDir: "{app}\mods\Sideloader Modpack - Maps";             Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackMaps; 

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\BepInEx\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: BepInEx
Source: "Input\BepInEx_Dev\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: BepInEx\Dev

Source: "Input\HS2_BepisPlugins\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepisPlugins
Source: "Input\HS2API\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: KKAPI
Source: "Input\XUnity.ResourceRedirector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: XUnityResourceRedirector

Source: "Input\[UTILITY] KKManager\*"; DestDir: "{app}\[UTILITY] KKManager\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: KKManager

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_TL\XUnity.AutoTranslator-BepIn-5x\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator

Source: "Input\_TL\HS2-Translation-master\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator\EnglishTranslation
;Source: "Input\_TL\AI-Girl-Translations-master_steam\*"; DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator\EnglishTranslation; Check: IsSteam

Source: "Input\_TL\TextResourceRedirector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator\EnglishTranslation

Source: "Input\_TL\_lang jp\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en

Source: "Input\_TL\launcher\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Launcher; 
;Source: "Input\_TL\launcher_steam\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Launcher; Check: IsSteam

Source: "Input\_TL\Subtitles\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: TL\AI_Subtitles

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Uncensor\HS2_UncensorSelector v3.9\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: UNC\Selector
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Uncensor Selector\*"; DestDir: "{app}\mods\Sideloader Modpack - Uncensor Selector"; Flags: ignoreversion recursesubdirs; Components: UNC\Selector\Pack

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Content\AI_MaterialEditor v1.8\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_MaterialEditor
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - MaterialEditor Shaders\*"; DestDir: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders";             Flags: ignoreversion recursesubdirs; Components: Content\KK_MaterialEditor; 
;Source: "Input\_Content\RendererEditor\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\RendererEditor

Source: "Input\_Content\MoreAccessories.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion ; Components: Content\MoreAccessories
Source: "Input\_Feature\BonesFramework.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion ; Components: Content\BonesFramework
Source: "Input\_Content\AI_ClothColliders\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\AI_ClothColliders
Source: "Input\_Content\AI_StudioSceneSettings\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\AI_StudioSceneSettings

Source: "Input\_Content\AIABMX v3.5\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KKABMX
Source: "Input\_Content\AI_OverlayMods v5.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KSOX

Source: "Input\_Content\InvisibleBody v1.3.2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_InvisibleBody
Source: "Input\_Content\AI_AnimationController v2.2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Content\KK_AnimationController
;Source: "Input\_Content\NodesConstraints.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Content\NodesConstraints

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Fix\IllusionFixes_AIGirl_1.6.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KoikatuFixes
; Always install critical fixes
Source: "Input\_Fix\IllusionFixes_AIGirl_1.6.1\bepinex\patchers\*"; DestDir: "{app}\bepinex\patchers"; Flags: ignoreversion recursesubdirs; Components: Patch

Source: "Input\_Fix\AI_InputHotkeyBlock v1.2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\KK_InputHotkeyBlock

Source: "Input\_Fix\AI_BetterAA v1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\AI_BetterAA

Source: "Input\_Fix\AI_UnlockPlayerHeight\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\AI_UnlockPlayerHeight
Source: "Input\_Fix\AI_UnlockPlayerHClothes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\AI_UnlockPlayerHClothes
Source: "Input\_Fix\AI_BetterHScenes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\AI_BetterHScenes
Source: "Input\_Fix\HS2_HLightControl\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: FIX\HS2_HLightControl


;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Feature\DragAndDrop.HoneySelect2.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\DragAndDrop
Source: "Input\_Feature\AI_PoseFolders v1.0\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_PoseFolders

;Source: "Input\_Feature\AIUS.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: Feature\AIUS
;Source: "Input\_Feature\AIPE\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\AIPE
Source: "Input\_Feature\AI_QuickAccessBox\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_QuickAccessBox
Source: "Input\_Feature\HS2_BrowserFolders.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_BrowserFolders
Source: "Input\_Feature\AI_StudioObjectMoveHotkeys v1.0\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_StudioObjectMoveHotkeys
Source: "Input\_Feature\MoveControllerAI\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\MoveControllerAI
Source: "Input\_Feature\AI_PoseQuickLoad\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_PoseQuickLoad
Source: "Input\_Feature\AI_FKIK v1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_FKIK

Source: "Input\_Feature\PushUpAI.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\Bra
Source: "Input\_Feature\Heelz v1.01\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\Heelz;
;Source: "Input\_Feature\AI_ReverseTrap.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_ReverseTrap
Source: "Input\_Feature\HS2_HeightBar.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_HeightBar
Source: "Input\_Feature\AI_ColorPanelX\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_ColorPanelX

;Source: "Input\_Feature\AI_CharacterReplacer.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_CharacterReplacer

Source: "Input\_Feature\DHH\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\Graphics\DHH
Source: "Input\_Feature\AIGraphics\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\Graphics\AIGraphics
Source: "Input\_Feature\GraphicsSettings.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\Graphics\GraphicsSettings

Source: "Input\_Feature\AI_AnimationOverdrive v1.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\KK_ANIMATIONOVERDRIVE

Source: "Input\_Feature\HideAllUI.HoneySelect2.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\HideAllUI

Source: "Input\_Feature\HS2_StudioPOV\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_PovX
Source: "Input\_Feature\HS2_PovX.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion recursesubdirs; Components: Feature\AI_PovX

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Source: "Input\_Misc\FPSCounter.dll"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion; Components: MISC\FPS

Source: "Input\_Misc\RuntimeUnityEditor.Bepin5_v1.10\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\Trainer
Source: "Input\_Misc\AI_CheatTools\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: MISC\Trainer\Cheats

Source: "Input\_Misc\ScriptLoader\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\ScriptLoader

Source: "Input\_Misc\save.dat"; DestDir: "{app}\UserData\save"; Flags: ignoreversion recursesubdirs; Components: MISC\FullSave

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation"; Components: TL\AutoTranslator\EnglishTranslation
Type: filesandordirs; Name: "{app}\UserData\LauncherEN"; Components: Launcher
Type: files; Name: "{app}\InitSetting.exe.config"

; Clean up old modpacks. Large modpacks might not be fully included so don't remove here, instead they get cleaned up from old versions later
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"                       ; Components: Content\Modpack
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Bleeding Edge"       ; Components: Content\Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps"                ; Components: Content\ModpackMaps
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders" ; Components: Content\KK_MaterialEditor
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"              ; Components: Content\ModpackStudio
Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Uncensor Selector"   ; Components: UNC\Selector\Pack

; Always not necessary
Type: files; Name: "{app}\0Harmony.dll"
Type: files; Name: "{app}\BepInEx.dll"
Type: files; Name: "{app}\Mono.Cecil.dll"

; Has issues
Type: files; Name: "{app}\BepInEx\plugins\Heelz.dll"; Check: IsSteam
Type: files; Name: "{app}\BepInEx\plugins\PushUpAI.dll"; Check: IsSteam

; Prevent both disabled and enabled dlls existing at the same time, they will get restored later
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dll"
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dl_"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\Graphics.dll"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\Graphics.dl_"

; Junk
Type: files; Name: "{app}\*.log"
Type: files; Name: "{app}\*.pdb"
Type: files; Name: "{app}\changelog.txt"
; Yikes, someone extracted a sideloader mod...
Type: files; Name: "{app}\manifest.xml"
Type: filesandordirs; Name: "{app}\temp"

; Will get replaced, makes sure there are no stale files left
Type: filesandordirs; Name: "{app}\BepInEx\cache"; Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\core"; Components: BepInEx
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx
Type: files; Name: "{app}\version.dll"; Components: BepInEx
Type: files; Name: "{app}\winhttp.dll"; Components: BepInEx
Type: files; Name: "{app}\doorstop_config.ini"; Components: BepInEx

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\HoneySelect2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\StudioNEOV2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\MonoBleedingEdge"; Components: Patch


[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Components: Launcher; Flags: unchecked
Name: desktopicon\jp; Description: "{cm:TaskIcon}"; Components: not Launcher; Flags: unchecked
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\scripts; Description: "Delete old scripts"
;Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";

[Icons]
Name: "{userdesktop}\{cm:IconGame}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon
Name: "{userdesktop}\HoneySelect2"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon

[Run]
Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=AI_Syoujyo"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/F3bDEFE"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://www.patreon.com/ManlyMarco"; Description: "ManlyMarco Patreon (Creator of this patch)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

[Code]
procedure CreateBackup(path: String);
external 'CreateBackup@files:HelperLib.dll stdcall';

procedure FixConfig(path: String);
external 'FixConfig@files:HelperLib.dll stdcall';

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

function IsSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Initial Settings.exe'));
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpSelectDir) then
  begin
    if (not FileExists(ExpandConstant('{app}\HoneySelect2_Data\resources.assets'))) then
    begin
      if(SuppressibleMsgBox(ExpandConstant('{cm:MsgExeNotFound}'), mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
    end;
    
    if Result = True then
    begin
      if (Length(ExpandConstant('{app}')) > 100) then
      begin
        MsgBox('Your game is in a very deep folder, which can cause serious issues or even prevent the game from starting.%n%nPlease move your game folder to a simpler path like for example "C:\Games\Koikatsu" and try to run this patch again.', mbError, MB_OK);
        Result := False;
      end
    end;
    
    if Result = True then
    begin
      if (Pos(LowerCase(ExpandConstant('{app}')), LowerCase(ExpandConstant('{src}'))) > 0) then
      begin
        MsgBox('This patch is inside of the game directory you are attempting to install to. You have to move the patch files outside of the game directory and try again.', mbError, MB_OK);
        Result := False;
      end
    end;
    
    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\Initial Settings.exe'))) then
      begin
        MsgBox('This patch was made before the Steam release of the game and is not compatible with it. Please look for a new version of the patch that supports the Steam release.', mbError, MB_OK);
        Result := False;
      end
    end;
    
    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\EmotionCreators.exe')) 
      or FileExists(ExpandConstant('{app}\Koikatu.exe')) 
      or FileExists(ExpandConstant('{app}\Koikatsu Party.exe')) 
      or FileExists(ExpandConstant('{app}\PlayHome.exe')) 
      or FileExists(ExpandConstant('{app}\AI-Syoujyo.exe')) 
      or FileExists(ExpandConstant('{app}\AI-Shoujo.exe'))) then
      begin
        MsgBox('It looks like a different game is installed to the selected directory. This is very likely to break one or both of the games, and to break the patch.%n%nMake sure you selected the correct directory. If you installed 2 games to the same directory you will have to reinstall them both to separate directories to fix this.', mbError, MB_OK);
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
    end;
  end;

  // After install completes
  if (CurPageID = wpFinished) then
  begin
    
    // Always clean up sideloader mods in case user already messed up
    if IsComponentSelected('fixSideloaderDupes') then
        RemoveSideloaderDuplicates(ExpandConstant('{app}'));
        
    FixConfig(ExpandConstant('{app}'));
    WriteVersionFile(ExpandConstant('{app}'), '{#VERSION}');
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  ResultCode: Integer;
begin
  NeedsRestart := false;
  try
    // Close the game if it's running
    Exec('taskkill', '/F /IM StudioNEOV2.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM HoneySelect2.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSetting.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM Initial Settings.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);

    // Fix file permissions
    //Exec('takeown', ExpandConstant('/f "{app}" /r /SKIPSL /d y'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    //Exec('icacls', ExpandConstant('"{app}" /grant everyone:F /t /c /l'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    FixPermissions(ExpandConstant('{app}'));
  except
    ShowExceptionMessage();
  end;
  
  CreateBackup(ExpandConstant('{app}'));
  
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
      DelTree(ExpandConstant('{app}\scripts'), True, True, True);
      Exec(ExpandConstant('{cmd}'), '/c del *.dll', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
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
    
  if (IsTaskSelected('delete\Sidemods')) then
    RemoveModsExceptModpacks(ExpandConstant('{app}'));
    
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
  
  //if (IsTaskSelected('delete\Listfiles')) then
  //  RemoveNonstandardListfiles(ExpandConstant('{app}'));
    
  SetConfigDefaults(ExpandConstant('{app}'));
end;
