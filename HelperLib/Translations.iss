[Setup]
; Copyright (C) 2026  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

[CustomMessages]
fullInstall=Recommended installation
extraInstall=Extra installation
bareInstall=Update and repair
noneInstall=Skip BepInEx install (NOT RECOMMENDED)
customInstall=Custom installation

MsgInvalidModsDetected=WARNING - Outdated or useless plugins/files were detected in your BepInEx directory. To avoid issues all mods will be deleted.
MsgIncompatibleModsDetected=WARNING - Incompatible mods have been detected in your game folder! You are using very outdated mods or mods from other games, which WILL cause problems. All old mods will have to be removed to fix this.
MsgExeNotFound=WARNING - Game files were not found in selected directory. This patch has to be installed directly to the main game directory in order to work properly.%n%nAre you sure that this directory is correct?
MsgMissingGameFiles=ERROR - Critical game files are missing, make sure this is the game directory. If the directory is correct you have to reinstall the game or verify game files on steam.

MsgExtractedZipmod=WARNING - Most likely a sideloader mod was extracted inside the game directory. Some game files might now be corrupted.%n%nRepair will be attempted, but if you still have problems you will have to reinstall the game.

RunGame=&Run the game
RunWiki=Open wiki (FAQ, English manual)
RunDiscord=Join the Discord server (Help, updates, sharing)
StartUpdate=Look for mod updates (Optional, only needed when downloading very recent scenes and characters)

TaskIcon=Create a game &desktop icon
TaskDelete=Clean up old mods (Helps fix and avoid issues. Your old plugins will be backed up to a .zip inside game root.)
TaskDeleteSide=Delete third-party sideloader mods (Removes everything except for Sideloader Modpacks from the mods folder. WARNING: Back up any important files you've placed inside the mods folder!)
TaskDeletePlugins=Delete BepInEx plugins (Always recommended. Do not disable unless you know what you are doing)
TaskDeletePluginSettings=Delete plugin settings (Recommended if you have issues or when updating from old repacks)
TaskDeleteLst=Delete custom listfiles (Disable hardmods, they will be replaced with sideloader mods. Always recommended)
TaskSideDupes=Delete duplicate sideloader mods after installation (Only the newest versions are kept. Always recommended)

CompDev=Developer version with dnSpy debugging
CompTL=English translation
CompDefCards=Default cards, scenes and backgrounds
CompUNC=Uncensor
CompFIX=Important fixes
CompMISC=Other


jp.fullInstall=推奨インストール
jp.extraInstall=大規模インストール
jp.bareInstall=更新と修復
jp.noneInstall=BepInExのインストールをスキップする（非推奨）
jp.customInstall=カスタムインストール

jp.MsgInvalidModsDetected=警告 - あなたのBepInExディレクトリで古いまたは無用なプラグイン/ファイルが検出されました。 問題を避けるために、すべてのmodは削除されます。
jp.MsgIncompatibleModsDetected=警告 - あなたのゲームフォルダで互換性のない改造が検出されました！ あなたは非常に古くなったモッズを使っているか、Koikatsuの他のゲームのモッズを使っています。 これを修正するには、古いモッズをすべて削除する必要があります。
jp.MsgExeNotFound=警告 - 選択したディレクトリにゲームファイルが見つかりませんでした。このパッチは正しく動作させるために、メインのゲームディレクトリに直接インストールする必要があります。%n%nこのディレクトリが正しいことを確認してください。
jp.MsgMissingGameFiles=エラー - 重要なゲームファイルがありません。これがゲームディレクトリであることを確認してください。 ディレクトリが正しい場合は、ゲームを再インストールする必要があります。

jp.MsgExtractedZipmod=警告 - Sideloader modがゲームディレクトリ内に抽出されたようです。 一部のゲームファイルが破損している可能性があります。%n%n修復を試みますが、それでも問題が解決しない場合は、ゲームを再インストールする必要があります。

jp.RunGame=ゲームを始める
jp.RunWiki=オープン英語wiki（FAQ、マニュアル）
jp.RunDiscord=英語のDiscordチャンネルに参加する（ヘルプ、アップデート、カード、モッズの共有）
jp.StartUpdate=MODアップデーターを開始します（オプション。最近のシーンとキャラクターをダウンロードする場合のみ必要。）

jp.TaskIcon=ゲームのデスクトップアイコンを作成する
jp.TaskDelete=インストール前に古いmodを削除します（問題を回避したい場合に推奨）
jp.TaskDeleteSide=既存のSideloader modを削除します（Sideloader Modpackを除く）
jp.TaskDeletePlugins=BepInExプラグインを削除する（古いプラグインを削除します。問題がある場合や古いバージョンを更新する場合に推奨）
jp.TaskDeletePluginSettings=プラグイン設定をリセットする（問題がある場合に推奨）
jp.TaskDeleteLst=カスタムリストファイルを削除します（代わりにSideloader modが使用されます。常に推奨）
jp.TaskSideDupes=インストール後に重複したSideloader modを削除します（最新バージョンは保持されます。常に推奨されます）。

jp.CompDev=dnSpyデバッグ付き開発者版
jp.CompTL=英訳
jp.CompDefCards=デフォルトのカード、シーン、背景
jp.CompUNC=無修正化
jp.CompFIX=重要な修正
jp.CompMISC=他の

MsgPathTooLong=Your game is in a very deeply nested folder, which can cause serious issues or even prevent the game from starting.%n%nPlease move your game folder to a simpler path like for example "C:\Games\KK" and try to run this patch again.
jp.MsgPathTooLong=ゲームは非常に深くネストされたフォルダーにあります。これにより、深刻な問題が発生したり、ゲームが開始できなくなったりする可能性があります。%n%nゲームフォルダを、たとえば「C：\Games\KK」のような単純なパスに移動して、このパッチをもう一度実行してみてください。

MsgPathNonLatin=There are non-latin characters in the game installation path. This can cause issues with mods and the patch.%n%nMove your game to a simple path like "D:\Games\KK" to avoid issues. It is best to use only a-z, A-Z and 0-9.
jp.MsgPathNonLatin=ゲームのインストールパスに非ラテン文字が含まれています。このため、MODやHFで問題が発生することがあります。%n%n問題を避けるために、ゲームを「D:\Games\KK」のようなシンプルなパスに移動してください。a-z、A-Z、0-9のみを使用するのがベストです。

MsgSteamUpdatesMissing=Your game is missing official updates from Steam. Please go to your Steam Library and update the game installing this patch.
jp.MsgSteamUpdatesMissing=お使いのゲームにはSteamからの公式アップデートがありません。Steamライブラリにアクセスして、このパッチをインストールしてゲームをアップデートしてください。

MsgPatchInsideGameDirErr=This patch is inside of the game directory you are attempting to install to. You have to move the patch files outside of the game directory and try again. You can keep the patch files in your downloads folder.
jp.MsgPatchInsideGameDirErr=このパッチは、インストール先のゲームディレクトリ内にあります。パッチファイルをゲームディレクトリの外に移動して、再試行する必要があります。パッチファイルはダウンロードフォルダー内に残すことができます。

MsgDifferentGameDetected=It looks like a different game is installed to the selected directory.%n%nMake sure you selected the correct directory. If you installed 2 games to the same directory you will have to reinstall them both to separate directories to fix this.
jp.MsgDifferentGameDetected=選択したディレクトリに別のゲームがインストールされているようです。これにより、一方または両方のゲームが破損し、パッチが破損する可能性があります。%n%n正しいディレクトリを選択していることを確認してください。同じディレクトリに2つのゲームをインストールした場合は、両方を別のディレクトリに再インストールして、これを修正する必要があります。

OpenRepo=See latest HF Patch releases and source code
jp.OpenRepo=最新のHFパッチリリースとソースコードをご覧ください
OpenPatreon=Go to ManlyMarco's Patreon page (Creator of this patch)
jp.OpenPatreon=ManlyMarcoのPatreonページを開いてください（このパッチの作成者です）
OpenPluginInfo=Show information about included plugins
jp.OpenPluginInfo=含まれているプラ​​グインに関する情報を表示します
