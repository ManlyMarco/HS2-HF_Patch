[Setup]
; Copyright (C) 2026  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

[Run]
Filename: "notepad.exe"; Parameters: """{app}\Plugin Readme.md"""; Description: "{cm:OpenPluginInfo}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist unchecked
#ifdef WikiLink
Filename: "{#WikiLink}"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
#endif
#ifdef DiscordLink
Filename: "{#DiscordLink}"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;
#endif
#ifdef RepoLink
Filename: "{#RepoLink}"; Description: "{cm:OpenRepo}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
#endif
Filename: "https://www.patreon.com/ManlyMarco"; Description: "{cm:OpenPatreon}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;


[Registry]
#if CompanyName == "Illusion"
Root: HKCU; Subkey: "Software\Illusion"
Root: HKCU; Subkey: "Software\Illusion\{#GameName}"
Root: HKCU; Subkey: "Software\Illusion\{#GameName}\{#GameName}"
Root: HKCU; Subkey: "Software\Illusion\{#GameName}\{#GameName}"; ValueType: string; ValueName: "INSTALLDIR"; ValueData: "{app}\"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\Illusion\{#GameName}\{#GameName}"; ValueType: string; ValueName: "INSTALLDIR_HFP"; ValueData: "{app}\"
#elif CompanyName != ""
Root: HKCU; Subkey: "Software\{#CompanyName}"
Root: HKCU; Subkey: "Software\{#CompanyName}\{#GameName}"
Root: HKCU; Subkey: "Software\{#CompanyName}\{#GameName}\"; ValueType: string; ValueName: "INSTALLDIR"; ValueData: "{app}\"; Components: MISC\FIX
Root: HKCU; Subkey: "Software\{#CompanyName}\{#GameName}\"; ValueType: string; ValueName: "INSTALLDIR_HFP"; ValueData: "{app}\"
#endif
