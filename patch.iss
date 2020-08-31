; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "HoneySelect2"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "1.1"
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
LZMANumBlockThreads=7
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

#define CurrentDate GetDateTimeString('yyyy-mm-dd', '-', ':');

[Components]
Name: "Patch";                                 Description: "Free updates up to 2020-07-03 + game repair"                                          ; Types: full_en full extra extra_en custom bare none; Flags: fixed
Name: "BepInEx";                               Description: "BepInEx v5.3 Plugin framework + MessageCenter v1.1 + ConfigurationManager v16.0"      ; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "BepInEx\Dev";                           Description: "{cm:CompDev}"                                                                         
Name: "KKManager";                             Description: "KKManager v0.13.1 (Mod updater and manager)"                                          ; Types: full_en full extra extra_en custom bare; Flags: fixed
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "API";                                   Description: "APIs (Plugins required by other plugins and mods to function)"                        ; Types: full_en full extra extra_en custom bare
Name: "API\BepisPlugins";                      Description: "BepisPlugins v15.4 (Essential plugins required by many other plugins to function)"    ; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "API\HS2API";                            Description: "Modding API v1.13.1 (Modding API needed by many plugins)"                             ; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "API\XUnityResourceRedirector";          Description: "XUnity Resource Redirector v1.1.2 (Modding API for overriding resources)"             ; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "API\BonesFramework";                    Description: "BonesFramework v1.4.0 (Lets mods add new bones)"                                      ; Types: full_en full extra extra_en custom bare
Name: "API\DependencyLoader";                  Description: "HS2_DependencyLoader v1.1.2 (Needed by some map mods to load dependant asset bundles)"; Types: full_en full extra extra_en custom bare
Name: "API\HS2HeadBundleRedirect";             Description: "HeadBundleRedirect v1.0 (Support for custom head tints)"                              ; Types: full_en full extra extra_en custom bare
Name: "API\HS2_Hooah";                         Description: "HS2_Hooah v1.0.0 (Collection of randum stuff needed by some of hooah's mods)"         ; Types: full_en full extra extra_en custom bare
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Launcher";                              Description: "IllusionLaunchers v2.1.1 (Multilangual launcher)"                                     ; Types: full_en full extra extra_en custom
Name: "TL";                                    Description: "{cm:CompTL}"                                                                          ; Types: full_en extra_en
Name: "TL\AutoTranslator";                     Description: "XUnity Auto Translator v4.12.1 (Translation loader)"                                  ; Types: full extra full_en extra_en custom
Name: "TL\AutoTranslator\EnglishTranslation";  Description: "Fan Translations up to {#CurrentDate} + HS2_TextResourceRedirector v1.4.1.1"          ; Types: full_en extra_en
Name: "TL\HS2_Subtitles";                      Description: "Subtitles v2.0 (Warning: Machine translated, bad quality)"                            ; Types: full_en extra_en
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "UNC";                                   Description: "{cm:CompUNC}"                                                                         ; Types: full_en full extra extra_en
Name: "UNC\Selector";                          Description: "Uncensor Selector v3.10 (Support for user-selectable uncensors)"                      ; Types: full_en full extra extra_en
Name: "UNC\Selector\Pack";                     Description: "Uncensor Modpack {#CurrentDate} (Uncensors for use with Uncensor Selector)"           ; Types: full_en full extra extra_en
Name: "UNC\Selector\HS2_BetterPenetration";    Description: "HS2BetterPenetration v2.1.0.0 (Improves animations in H scenes)"                      ; Types: full_en full extra extra_en
Name: "UNC\Selector\BeaverHS2";                Description: "Beaver v1.2.1 (Allows changing some uncensor-specific settings in maker)"             ; Types: full_en full extra extra_en
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Content";                               Description: "Additional content (Needed to properly load most character cards and scenes)"         ; Types: full_en full extra extra_en
Name: "Content\Modpack";                       Description: "Sideloader Modpack {#CurrentDate} (Additional content for making characters)"         ; Types: full_en full extra extra_en
; Name: "Content\ModpackStudio";                 Description: "Sideloader Modpack - Studio {#CurrentDate} (Additional content for making scenes)"    ; Types: full_en full extra extra_en
; Name: "Content\ModpackMaps";                   Description: "Sideloader Modpack - Maps {#CurrentDate} (Additional maps for studio and game)"       ; Types: full_en full extra extra_en
Name: "Content\HS2_MaterialEditor";            Description: "Material Editor v2.1.4 (Material editing in maker and studio)"                        ; Types: full_en full extra extra_en
Name: "Content\HS2_MaterialEditor\Modpack";    Description: "Shader Modpack {#CurrentDate} (Shaders for use with Material Editor)"                 ; Types: full_en full extra extra_en
Name: "Content\RendererEditor";                Description: "RendererEditor v1.6.0 (Edit materials of items in Studio)"                            ; Types: full_en full extra extra_en
Name: "Content\HS2PE";                         Description: "HS2PE v2.12.0 (Advanced studio controls)"                                             ; Types: full_en full extra extra_en
Name: "Content\MoreAccessories";               Description: "MoreAccessories v1.2.2 (Unlocks accessory limit above 20)"                            ; Types: full_en full extra extra_en
Name: "Content\NodesConstraints";              Description: "NodesConstraints v1.2.1 (Connect studio items to create custom animations)"           ; Types: full_en full extra extra_en
Name: "Content\HS2ABMX";                       Description: "HS2ABMX (BonemodX) v4.3 (More sliders in character maker)"                            ; Types: full_en full extra extra_en
Name: "Content\KSOX";                          Description: "Overlay Mods v5.2 (Set custom body, clothes and eye textures)"                        ; Types: full_en full extra extra_en
Name: "Content\HS2_Colliders";                 Description: "Colliders v1.1 (Cloth physics support for mods)"                                      ; Types: full_en full extra extra_en
Name: "Content\HS2_ClothColliders";            Description: "HS2_ClothColliders v1.0.1 (Cloth physics support for mods)"                           ; Types: full_en full extra extra_en
Name: "Content\HS2_InvisibleBody";             Description: "Invisible Body v1.3.2 (Hide character body in studio for trickery with clothes)"      ; Types: full_en full extra extra_en
Name: "Content\HS2_StudioSceneSettings";       Description: "StudioSceneSettings v1.2.1 (Add clip plane settings to studio scene effects)"         ; Types: full_en full extra extra_en
Name: "Content\HS2_StudioImageEmbed";          Description: "StudioImageEmbed v1.0 (Save custom images into scenes so other people can load them)" ; Types: full_en full extra extra_en
Name: "Content\HS2_StudioCustomMasking";       Description: "Studio Custom Masking v1.0 (Can make studio items disappear when blocking the camera view)"; Types: full_en full extra extra_en
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "FIX";                                   Description: "{cm:CompFIX}"                                                                         ; Types: extra extra_en
Name: "FIX\IllusionFixes";                     Description: "IllusionFixes v13.2 (A collection of essential fixes and improvements)"               ; Types: full_en full extra extra_en
Name: "FIX\HS2_InputHotkeyBlock";              Description: "Input Hotkey Block v1.2 (Blocks plugin keybinds while typing)"                        ; Types: full_en full extra extra_en
Name: "FIX\HS2_UnlockPlayerHeight";            Description: "HS2_UnlockPlayerHeight v1.4.3 (Allows non-default heights of male characters)"        ; Types: full_en full extra extra_en
Name: "FIX\HS2_UnlockPlayerHClothes";          Description: "HS2_UnlockPlayerHClothes v1.4.2 (Fixes inability to change clothes in h scenes)"      ; Types: full_en full extra extra_en
Name: "FIX\HS2_BetterHScenes";                 Description: "HS2_BetterHScenes v2.5.1 (Fixes H performance bugs and adds extra features)"          ; Types: full_en full extra extra_en
Name: "FIX\HS2_HLightControl";                 Description: "HS2_HLightControl v1.2.2 (Allows you to change some light settings)"                  ; Types: full_en full extra extra_en
Name: "FIX\HS2_MaleJuice";                     Description: "Male Juice v1.2.2 (Fixes male juice textures not being shown on males)"               ; Types: full_en full extra extra_en
Name: "FIX\LightprobesReset";                  Description: "HS2_LightprobesReset v1.1.0 (Fixes neck seam and other light related issues in Studio)"; Types: full_en full extra extra_en
Name: "FIX\AnimationPairing";                  Description: "HS2_AnimationPairing v1.0.0 (Synchronizes animations between characters in studio)"   ; Types: full_en full extra extra_en
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Feature";                               Description: "Improvements and additional features"                                                 ; Types: extra extra_en
Name: "Feature\Graphics";                      Description: "Additional graphics settings (has to be enabled in launcher first)"                   ; Types: full_en full extra extra_en
Name: "Feature\Graphics\DHH";                  Description: "DHH Graphics Enhancer v1.10 (More settings to make the game look better)"             ; Types: full_en full extra extra_en
Name: "Feature\Graphics\HS2Graphics";          Description: "HS2 Graphics v0.3.3 (More powerful than DHH but harder to use)"                       ; Types: full_en full extra extra_en
Name: "Feature\Graphics\GraphicsSettings";     Description: "Graphics Settings v1.2.0 (More settings to make graphics more or less demanding)"     ; Types: full_en full extra extra_en
Name: "Feature\Graphics\HS2_BetterAA";         Description: "Better Anti-Aliasing v1.6 (Improves anti-aliasing without any performance hit)"       ; Types: full_en full extra extra_en
Name: "Feature\DragAndDrop";                   Description: "Drag and Drop v1.2.1 (Load cards and scenes by dragging them into game window)"       ; Types: full_en full extra extra_en
Name: "Feature\HS2_BrowserFolders";            Description: "Maker/Studio Browser Folders v2.2 (Adds folder support to studio character and scene lists)"; Types: full_en full extra extra_en
Name: "Feature\HS2US";                         Description: "HS2US v1.9.0 (Tweaks and improvements to studio and maker interfaces)"                ; Types: full_en full extra extra_en
Name: "Feature\HS2_HeightBar";                 Description: "HeightBarX v3.3 (Adds height measure bar to maker)"                                   ; Types: full_en full extra extra_en
Name: "Feature\HS2_ColorPanelX";               Description: "HS2_ColorPanelX v1.2.0 (Improves color picker in maker)"                              ; Types: full_en full extra extra_en
Name: "Feature\GravureHS2";                    Description: "Gravure plugin v1.4.1 (More posing options in character maker)"                       ; Types: full_en full extra extra_en
Name: "Feature\MakerSearch";                   Description: "HS2_MakerSearch v1.2.1 (Adds search boxes in character maker item lists)"             ; Types: full_en full extra extra_en
Name: "Feature\MakerAdditions";                Description: "HS2_MakerAdditions v1.0.0 (Adds extra features to character maker)"                   ; Types: full_en full extra extra_en
Name: "Feature\HS2_MakerDefaults";             Description: "Maker Defaults v1.0 (Customize default character maker settings)"                     ; Types: full_en full extra extra_en
Name: "Feature\HS2_QuickAccessBox";            Description: "HS2_QuickAccessBox v2.2.1 (Quick search studio items)"                                ; Types: full_en full extra extra_en
Name: "Feature\HS2_PoseFolders";               Description: "Pose Folders v1.0 (Folder support in studio pose list)"                               ; Types: full_en full extra extra_en
Name: "Feature\HS2_PoseQuickLoad";             Description: "Pose Quick Load v1.0 (Immediately apply pose when selected in studio, turn on in F1 menu)"; Types: full_en full extra extra_en
Name: "Feature\HS2_StudioObjectMoveHotkeys";   Description: "Studio Object Move Hotkeys v1.0 (Adds T/Y/U/I hotkeys for manipulating items in studio)"; Types: full_en full extra extra_en
Name: "Feature\MoveControllerHS2";             Description: "Move Controller AI v1.5.1 (Improved object move window in studio)"                    ; Types: full_en full extra extra_en
Name: "Feature\HS2_FKIK";                      Description: "FK and IK v1.1 (Adds FK/IK mode in studio)"                                           ; Types: full_en full extra extra_en
Name: "Feature\HS2_CharacterExport";           Description: "Character Export v1.0 (Export characters from studio scenes)"                         ; Types: full_en full extra extra_en
Name: "Feature\HS2_AnimationOverdrive";        Description: "Animation Overdrive v1.1 (Unlock animation speed in studio, type in the text box)"    ; Types: full_en full extra extra_en
Name: "Feature\StudioCharaSort";               Description: "Studio Character Sort v1.0.1 (Change default sort order of cards in studio)"          ; Types: full_en full extra extra_en
Name: "Feature\HS2_StudioSceneLoadedSound";    Description: "Studio Scene Loaded Sound v1.1 (Make a sound when a studio scene finishes loading)"   ; Types: full_en full extra extra_en
Name: "Feature\HS2_OrthographicCamera";        Description: "OrthographicCamera v1.1.1 (Can switch to an orthographic camera in studio and game)"  ; Types: full_en full extra extra_en
Name: "Feature\HS2_ANIMATIONOVERDRIVE";        Description: "HS2_AnimationOverdrive v1.1 (Unlock animation speed in studio, type in the text box)" ; Types: full_en full extra extra_en
Name: "Feature\Bra";                           Description: "PushUp plugin v2.0.0 (Bras affect breast shape)"                                      ; Types: extra extra_en
Name: "Feature\Heelz";                         Description: "HS2Heelz v1.2.0 (Support for high heel shoes)"                                        ; Types: full_en full extra extra_en
Name: "Feature\HideAllUI";                     Description: "HideAllUI v2.2.0 (Press space to hide interface)"                                     ; Types: full_en full extra extra_en
Name: "Feature\HS2_PovX";                      Description: "HS2 PoV X v1.1.1 (First-person mode in main game)"                                    ; Types: extra extra_en
Name: "Feature\HS2_StudioPOV";                 Description: "HS2_StudioPOV v1.1.1 (First-person mode in studio)"                                   ; Types: extra extra_en
Name: "Feature\VideoExport";                   Description: "VideoExport v1.2.1 (Video and image sequence recorder)"                               ; Types: extra extra_en
Name: "Feature\HS2_RemoveToRecycleBin";        Description: "Remove Cards To Recycle Bin v1.1.1 (Move removed/overwritten cards to recycle bin)"   ; Types: full_en full extra extra_en
Name: "Feature\HS2_ExtraGroups";               Description: "HS2_ExtraGroups v1.0.1 (Unlock max number of groups and girls per group)"             ; Types: full_en full extra extra_en
Name: "Feature\HCharaSwitcher";                Description: "HCharaSwitcher v1.1.0 (Change characters during H scene)"                             ; Types: extra extra_en
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "MISC";                                  Description: "{cm:CompMISC}"                                                                        
Name: "MISC\FPS";                              Description: "FPS Counter v3.1 (Useful for performance testing)"                                    ; Types: full_en full extra extra_en
Name: "MISC\Trainer";                          Description: "Runtime Unity Editor v2.1.1 (Tool for making arbitrary modifications to the game)"    ; Types: full_en full extra extra_en
Name: "MISC\Trainer\Cheats";                   Description: "Cheat Tools v2.7.2 (Trainer, press F12 to open)"                                      ; Types: full_en full extra extra_en
Name: "MISC\ScriptLoader";                     Description: "C# Script Loader v1.2.1 (Runs custom user scripts)"                                   ; Types: full_en full extra extra_en
Name: "MISC\FullSave";                         Description: "Full save (WARNING - OVERWRITES CURRENT SAVE)"                                        

[Files]
Source: "HelperLib.dll";                             DestDir: "{app}"; Flags: dontcopy
Source: "Input\start.bat";                           DestDir: "{tmp}\hfp"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Input\DirectX\Jun2010\*";                   DestDir: "{tmp}\hfp\DirectXRedist2010"; Flags: ignoreversion recursesubdirs createallsubdirs deleteafterinstall; Check: DirectXRedistNeedsInstall
Source: "Plugin Readme.md";                          DestDir: "{app}"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\empty_ud\*";                   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Patch\empty_ud_eng\*";               DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Languages: en
Source: "Input\_Patch\2020-07-03-all\*";             DestDir: "{app}"; Flags: ignoreversion recursesubdirs solidbreak; Components: Patch
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Placed here instead of in content group to optimize solid compression chunks
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack\*"; DestDir: "{app}\mods\Sideloader Modpack"; Flags: ignoreversion recursesubdirs solidbreak; Components: Content\Modpack
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Exclusive HS2\*"; DestDir: "{app}\mods\Sideloader Modpack - Exclusive HS2"; Flags: ignoreversion recursesubdirs; Components: Content\Modpack
; Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Studio\*"; DestDir: "{app}\mods\Sideloader Modpack - Studio";             Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackStudio;
; Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Maps\*"; DestDir: "{app}\mods\Sideloader Modpack - Maps";             Flags: ignoreversion recursesubdirs solidbreak; Components: Content\ModpackMaps;
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\BepInEx_x64\*";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; Components: BepInEx
Source: "Input\BepInEx_Essentials\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx
Source: "Input\BepInEx_Dev\*";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx\Dev
Source: "Input\KKManager\*";                         DestDir: "{app}\[UTILITY] KKManager\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: KKManager
Source: "Input\Launcher_jp\*";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Launcher
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Plugins\HS2_BepisPlugins\*";         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\BepisPlugins; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2API\*";                   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\HS2API; Excludes: "manifest.xml"
Source: "Input\_Plugins\XUnity.ResourceRedirector\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\XUnityResourceRedirector; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2HeadBundleRedirect\*";    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\HS2HeadBundleRedirect; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_DependencyLoader\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\DependencyLoader; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_Hooah\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\HS2_Hooah; Excludes: "manifest.xml"
Source: "Input\_Plugins\BonesFramework\*";           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: API\BonesFramework; Excludes: "manifest.xml"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_TL\HS2-Translation-master\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: TL\AutoTranslator\EnglishTranslation
Source: "Input\_TL\HS2_TextResourceRedirector\*";    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: TL\AutoTranslator\EnglishTranslation
Source: "Input\_TL\_lang jp\*";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en
Source: "Input\_Plugins\XUnity.AutoTranslator-BepIn-5x\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: TL\AutoTranslator; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_Subtitles\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: TL\HS2_Subtitles; Excludes: "manifest.xml"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Plugins\HS2_UncensorSelector\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: UNC\Selector; Excludes: "manifest.xml"
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Uncensor Selector\*"; DestDir: "{app}\mods\Sideloader Modpack - Uncensor Selector"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: UNC\Selector\Pack
Source: "Input\_Plugins\BeaverHS2\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: UNC\Selector\BeaverHS2; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_BetterPenetration\*";    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: UNC\Selector\HS2_BetterPenetration; Excludes: "manifest.xml"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Plugins\HS2_MaterialEditor\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_MaterialEditor; Excludes: "manifest.xml"
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - MaterialEditor Shaders\*"; DestDir: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders"; Flags: ignoreversion recursesubdirs; Components: Content\HS2_MaterialEditor\Modpack
Source: "Input\_Plugins\MoreAccessories\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\MoreAccessories; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2ABMX\*";                  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2ABMX; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2PE\*";                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2PE; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_ClothColliders\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_ClothColliders; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_Colliders\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_Colliders; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_InvisibleBody\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_InvisibleBody; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_OverlayMods\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\KSOX; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_StudioCustomMasking\*";  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_StudioCustomMasking; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_StudioImageEmbed\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_StudioImageEmbed; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_StudioSceneSettings\*";  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\HS2_StudioSceneSettings; Excludes: "manifest.xml"
Source: "Input\_Plugins\NodesConstraints\*";         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\NodesConstraints; Excludes: "manifest.xml"
Source: "Input\_Plugins\RendererEditor\*";           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Content\RendererEditor; Excludes: "manifest.xml"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Always install critical fixes
Source: "Input\_Plugins\IllusionFixes_HoneySelect2\BepInEx\patchers\*"; DestDir: "{app}\BepInEx\patchers"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Plugins\IllusionFixes_HoneySelect2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\IllusionFixes; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_BetterHScenes\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\HS2_BetterHScenes; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_HLightControl\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\HS2_HLightControl; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_InputHotkeyBlock\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\HS2_InputHotkeyBlock; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_MaleJuice\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\HS2_MaleJuice; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_UnlockPlayerHClothes\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\HS2_UnlockPlayerHClothes; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_UnlockPlayerHeight\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\HS2_UnlockPlayerHeight; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_AnimationPairing\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\AnimationPairing; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_LightprobesReset\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: FIX\LightprobesReset; Excludes: "manifest.xml"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Plugins\DragAndDrop.HoneySelect2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\DragAndDrop; Excludes: "manifest.xml"
Source: "Input\_Plugins\DHH\*";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\Graphics\DHH; Excludes: "manifest.xml"
Source: "Input\_Plugins\GraphicsSettings\*";         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\Graphics\GraphicsSettings; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2Graphics\*";              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\Graphics\HS2Graphics; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_BetterAA\*";             DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\Graphics\HS2_BetterAA; Excludes: "manifest.xml"
Source: "Input\_Plugins\GravureHS2\*";               DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\GravureHS2; Excludes: "manifest.xml"
Source: "Input\_Plugins\Heelz\*";                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\Heelz; Excludes: "manifest.xml"
Source: "Input\_Plugins\HideAllUI.HoneySelect2\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HideAllUI; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2US\*";                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2US; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_AnimationOverdrive\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_AnimationOverdrive; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_BrowserFolders\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_BrowserFolders; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_CharacterExport\*";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_CharacterExport; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_ColorPanelX\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_ColorPanelX; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_FKIK\*";                 DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_FKIK; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_HeightBar\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_HeightBar; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_MakerDefaults\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_MakerDefaults; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_PoseFolders\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_PoseFolders; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_PoseQuickLoad\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_PoseQuickLoad; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_PovX\*";                 DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_PovX; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_QuickAccessBox\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_QuickAccessBox; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_RemoveToRecycleBin\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_RemoveToRecycleBin; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_StudioObjectMoveHotkeys\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_StudioObjectMoveHotkeys; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_StudioPOV\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_StudioPOV; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_StudioSceneLoadedSound\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_StudioSceneLoadedSound; Excludes: "manifest.xml"
Source: "Input\_Plugins\MoveControllerHS2\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\MoveControllerHS2; Excludes: "manifest.xml"
Source: "Input\_Plugins\PushUpHS2\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\Bra; Excludes: "manifest.xml"
Source: "Input\_Plugins\StudioCharaSort\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\StudioCharaSort; Excludes: "manifest.xml"
Source: "Input\_Plugins\VideoExport\*";              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\VideoExport; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_ExtraGroups\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_ExtraGroups; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_HCharaSwitcher\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HCharaSwitcher; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_MakerAdditions\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\MakerAdditions; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_MakerSearch\*";          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\MakerSearch; Excludes: "manifest.xml"
Source: "Input\_Plugins\HS2_OrthographicCamera\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\HS2_OrthographicCamera; Excludes: "manifest.xml"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Plugins\FPSCounter\*";               DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\FPS; Excludes: "manifest.xml"
Source: "Input\_Misc\save.dat";                      DestDir: "{app}\UserData\save"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\FullSave
Source: "Input\_Plugins\HS2_CheatTools\*";           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\Trainer\Cheats; Excludes: "manifest.xml"
Source: "Input\_Plugins\RuntimeUnityEditor.Bepin5\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\Trainer; Excludes: "manifest.xml"
Source: "Input\_Plugins\ScriptLoader\*";             DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\ScriptLoader; Excludes: "manifest.xml"

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation"; Components: TL\AutoTranslator\EnglishTranslation
Type: filesandordirs; Name: "{app}\UserData\LauncherEN"; Components: Launcher
Type: files; Name: "{app}\InitSetting.exe"
Type: files; Name: "{app}\InitSetting.exe.config"
Type: files; Name: "{app}\Initial Settings.exe"
Type: files; Name: "{app}\Initial Settings.exe.config"

; Clean up old modpacks. Large modpacks might not be fully included so don't remove here, instead they get cleaned up from old versions later
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"                       ; Components: Content\Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Bleeding Edge"       ; Components: Content\Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps"                ; Components: Content\ModpackMaps
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders" ; Components: Content\HS2_MaterialEditor
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"              ; Components: Content\ModpackStudio
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Uncensor Selector"   ; Components: UNC\Selector\Pack

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

; Needed to migrate from BepInEx 3.x to 4.x
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx

; Just in case. Also resets any hash caches
Type: filesandordirs; Name: "{app}\[UTILITY] KKManager"; Components: KKManager
Type: filesandordirs; Name: "{app}\temp"

; Will get replaced, makes sure there are no stale files left
Type: filesandordirs; Name: "{app}\BepInEx\core"; Components: BepInEx
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx
Type: files; Name: "{app}\version.dll"; Components: BepInEx
Type: files; Name: "{app}\winhttp.dll"; Components: BepInEx
Type: files; Name: "{app}\doorstop_config.ini"; Components: BepInEx

; Potentially incompatible, outdated or buggy plugins
Type: files; Name: "{app}\BepInEx\plugins\Heelz.dll"; Check: IsSteam
Type: files; Name: "{app}\BepInEx\plugins\PushUpAI.dll"; Check: IsSteam

; Prevent both disabled and enabled dlls existing at the same time, they will get restored later
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dll"
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dl_"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\Graphics.dll"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\Graphics.dl_"

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\HoneySelect2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\StudioNEOV2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\MonoBleedingEdge"; Components: Patch

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\scripts; Description: "Delete old scripts"
;Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";

[Icons]
Name: "{userdesktop}\{#NAME}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"
Name: "{userdesktop}\HoneySelect2"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"

[Run] 
;todo generate plugin readme and add an option here to open it
Filename: "{tmp}\hfp\DirectXRedist2010\DXSETUP.exe"; Parameters: "/silent"; Description: "Installing DirectX redistributables"; Flags: skipifdoesntexist runascurrentuser

Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist

Filename: "notepad.exe"; Parameters: """{app}\Plugin Readme.md"""; Description: "Show information about included plugins"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist unchecked

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=AI_Syoujyo"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/F3bDEFE"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://github.com/ManlyMarco/HS2-HF_Patch"; Description: "Latest releases and source code"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent

Filename: "https://www.patreon.com/ManlyMarco"; Description: "ManlyMarco Patreon (Creator of this patch)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

[Code]
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

function IsSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\Initial Settings.exe'));
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
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 6, coCheckWithChildren);
    end;
    
  end;
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
        MsgBox(ExpandConstant('{cm:MsgDeepPath}'), mbError, MB_OK);
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
    // Delete Japanese versions of cards and bgs if English versions are installed (only those with different names)
    //if IsComponentSelected('AT\TL\EnglishTranslation\UserData') then
    //    RemoveJapaneseCards(ExpandConstant('{app}'));

    // Always clean up sideloader mods in case user already messed up
    if IsTaskSelected('fixSideloaderDupes') then
        RemoveSideloaderDuplicates(ExpandConstant('{app}'));

    FixConfig(ExpandConstant('{app}'));
    WriteVersionFile(ExpandConstant('{app}'), '{#VERSION}');

    // Always turn these off just to be safe, user can turn them back on in launcher
    if(FileExists(ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dll'))) then
      RenameFile(ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dll'), ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dl_'));
    if(FileExists(ExpandConstant('{app}\BepInEx\plugins\Graphics\Graphics.dll'))) then
      RenameFile(ExpandConstant('{app}\BepInEx\plugins\Graphics\Graphics.dll'), ExpandConstant('{app}\BepInEx\plugins\Graphics\Graphics.dl_'));
      
    // Prevent trying to install the redist again
    Exec('reg', 'add HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010 /v dxsetup /t REG_DWORD /d 1 /f /reg:32', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    
    PostInstallCleanUp(ExpandConstant('{app}'));
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
    
    //try
    //  ExecAsOriginalUser('explorer.exe', '', '', 0, ewNoWait, ResultCode);
    //except
    //  ShowExceptionMessage();
    //end;
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