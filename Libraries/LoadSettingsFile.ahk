;Initial location where we assume the settings file will be.
;If it does NOT exist, it will be created with default values.
;If it DOES exist, it will be loaded and used to populate the script's settings variables.
;If the DefaultSettingsFile exists, and specifies a different settings file for custom settings, then we'll look for that file instead, and if it exists, we'll load settings from there.
;Finally, if the DefaultSettingsFile specifies a different, custom settings file, and that file does not exist, the script will fall back to using the DefaultSettingsFile.
;Note: While the user can directly edit the DefaultSettingsFile, it's better if they create a copy of it and specify that copy in the DefaultSettingsFile as the location for script settings, and then edit that copy.
    ;This way, if the user accidentally deletes or misconfigures their custom settings file, they can easily reference the original, working version.
    ;In the worst case, the user can delete BOTH the default and custom settings files, and then when they run the script, a new default settings file with default values will be generated for them to reference.
defaultScriptSettingsFile := "ScriptFiles\DefaultSettingsFile.ini" ;Where we'll first look for the settings file.

defaultScriptLogFile := "Logs\Log.log" ;Default location for the script's log file, if not specified in the custom settings file.
defaultScriptIconFileLight := "Icons\ScriptIconBlack.ico" ;Default location for the script's tray icon (light theme), if not specified in the custom settings file.
defaultScriptIconFileDark := "Icons\ScriptIconWhite.ico" ;Default location for the script's tray icon (dark theme), if not specified in the custom settings file.
defaultScriptActiveIconFile := "Icons\ActiveIcon.ico" ;Default location for the script's tray icon when the script is actively doing something, if not specified in the custom settings file.
defaultScriptSuccessIconFile := "Icons\SuccessIcon.ico" ;Default location for the script's tray icon when the script has successfully completed an action, if not specified in the custom settings file.
defaultScriptErrorIconFile := "Icons\ErrorIcon.ico" ;Default location for the script's tray icon when the script has encountered an error, if not specified in the custom settings file.
defaultScriptHungIconFile := "Icons\HungIcon.ico" ;Default location for the script's tray icon when the script has encountered a hang or freeze, if not specified in the custom settings file.
defaultScriptWarningIconFile := "Icons\WarningIcon.ico" ;Default location for the script's tray icon when the script has encountered a warning, if not specified in the custom settings file.
defaultFolderIconFile := "Icons\FolderIcon.ico" ;Default location for the script's parent folder icon, if not specified in the custom settings file.
defaultScriptFilesFolderIconFile := "Icons\ScriptFilesFolderIcon.ico" ;Default location for the ScriptFiles folder icon, if not specified in the custom settings file.
defaultLogsFolderIconFile := "Icons\LogsFolderIcon.ico" ;Default location for the Logs folder icon, if not specified in the custom settings file.
defaultIconsFolderIconFile := "Icons\IconsFolderIcon.ico" ;Default location for the Icons folder icon, if not specified in the custom settings file.

;Flag to indicate whether we had to create a new default settings file
;(Used later to determine whether to show a message box about the new settings file).
newDefaultSettingsFileCreated := false

;Default Settings File Info
defaultScriptSettingsTimestamp := A_Now ;When this settings file was created (if we're creating a new one).
defaultScriptSettingsVersion := scriptVersion ;What version of the script was used to generate the settings file.
defaultScriptSettingsAuthor := scriptAuthor ;;Who authored the script that created the settings file.

;Default Script-Specific Settings (If this script is repurposed for a different use case, these should be adjusted accordingly.)

;Default Home Names (for in-game /home commands)
;(Assuming the user is utilizing a 10-key number pad for quick access to their homes, these are the default names for those homes.)
defaultHome00Name := "Home"
defaultHome01Name := "Home01"
defaultHome02Name := "Home02"
defaultHome03Name := "Home03"
defaultHome04Name := "Home04"
defaultHome05Name := "Home05"
defaultHome06Name := "Home06"
defaultHome07Name := "Home07"
defaultHome08Name := "Home08"
defaultHome09Name := "Home09"
defaultHomeAlt00Name := "AltHome"
defaultHomeAlt01Name := "AltHome01"
defaultHomeAlt02Name := "AltHome02"
defaultHomeAlt03Name := "AltHome03"
defaultHomeAlt04Name := "AltHome04"
defaultHomeAlt05Name := "AltHome05"
defaultHomeAlt06Name := "AltHome06"
defaultHomeAlt07Name := "AltHome07"
defaultHomeAlt08Name := "AltHome08"
defaultHomeAlt09Name := "AltHome09"
;Default additional delay for chat/command interface.
;In the case of a slower computer, the game may need additional time for the chat window to appear.
;This can give it more time if needed.
defaultAdditionalChatCommandDelay := 0

;Default rate limiter delay for chat commands.
;This helps prevent sending chat commands too quickly, which could result in them being ignored or rate-limited by the game.
defaultChatRateLimiterDelay := 1000

;Default chat text file for the Chatterbox function.
defaultChatterboxTextFile := "ScriptFiles\ChatText.txt"
;Default chat box mode for the Chatterbox function.
defaultChatterBoxMode := "Auto"

if not FileExist(defaultScriptSettingsFile) {
    ;If we have no settings file, use these default values and then write them to a new default settings file.
    newDefaultSettingsFileCreated := true

    ;Write the above default values to the new default settings file.
	IniWrite(defaultScriptSettingsTimestamp, defaultScriptSettingsFile, "SettingsInfo", "SettingsFileCreationTimestamp")
	IniWrite(defaultScriptSettingsVersion, defaultScriptSettingsFile, "SettingsInfo", "SettingsFileCreationVersion")
	IniWrite(defaultScriptSettingsAuthor, defaultScriptSettingsFile, "SettingsInfo", "SettingsFileCreationAuthor")

    IniWrite(defaultScriptSettingsFile, defaultScriptSettingsFile, "ScriptSettings", "SettingsFileLocation")
	IniWrite(defaultScriptLogFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptLogFileLocation")
	IniWrite(defaultScriptIconFileLight, defaultScriptSettingsFile , "ScriptSettings" , "ScriptIconFileLight")
    IniWrite(defaultScriptIconFileDark, defaultScriptSettingsFile , "ScriptSettings" , "ScriptIconFileDark")
	IniWrite(defaultScriptActiveIconFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptActiveIconFile")
	IniWrite(defaultScriptSuccessIconFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptSuccessIconFile")
	IniWrite(defaultScriptErrorIconFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptErrorIconFile")
	IniWrite(defaultScriptHungIconFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptHungIconFile")
    IniWrite(defaultScriptWarningIconFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptWarningIconFile")
    IniWrite(defaultFolderIconFile, defaultScriptSettingsFile, "ScriptSettings", "FolderIconFile")
    IniWrite(defaultScriptFilesFolderIconFile, defaultScriptSettingsFile, "ScriptSettings", "ScriptFilesFolderIconFile")
    IniWrite(defaultLogsFolderIconFile, defaultScriptSettingsFile, "ScriptSettings", "LogsFolderIconFile")
    IniWrite(defaultIconsFolderIconFile, defaultScriptSettingsFile, "ScriptSettings", "IconsFolderIconFile")

    IniWrite(defaultHome00Name, defaultScriptSettingsFile, "HomesSettings", "Home00Name")
    IniWrite(defaultHome01Name, defaultScriptSettingsFile, "HomesSettings", "Home01Name")
    IniWrite(defaultHome02Name, defaultScriptSettingsFile, "HomesSettings", "Home02Name")
    IniWrite(defaultHome03Name, defaultScriptSettingsFile, "HomesSettings", "Home03Name")
    IniWrite(defaultHome04Name, defaultScriptSettingsFile, "HomesSettings", "Home04Name")
    IniWrite(defaultHome05Name, defaultScriptSettingsFile, "HomesSettings", "Home05Name")
    IniWrite(defaultHome06Name, defaultScriptSettingsFile, "HomesSettings", "Home06Name")
    IniWrite(defaultHome07Name, defaultScriptSettingsFile, "HomesSettings", "Home07Name")
    IniWrite(defaultHome08Name, defaultScriptSettingsFile, "HomesSettings", "Home08Name")
    IniWrite(defaultHome09Name, defaultScriptSettingsFile, "HomesSettings", "Home09Name")
    IniWrite(defaultHomeAlt00Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt00Name")
    IniWrite(defaultHomeAlt01Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt01Name")
    IniWrite(defaultHomeAlt02Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt02Name")
    IniWrite(defaultHomeAlt02Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt02Name")
    IniWrite(defaultHomeAlt03Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt03Name")
    IniWrite(defaultHomeAlt04Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt04Name")
    IniWrite(defaultHomeAlt05Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt05Name")
    IniWrite(defaultHomeAlt06Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt06Name")
    IniWrite(defaultHomeAlt07Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt07Name")
    IniWrite(defaultHomeAlt08Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt08Name")
    IniWrite(defaultHomeAlt09Name, defaultScriptSettingsFile, "HomesSettings", "HomeAlt09Name")
    IniWrite(defaultAdditionalChatCommandDelay, defaultScriptSettingsFile, "ScriptSettings", "AdditionalChatCommandDelay")
    IniWrite(defaultChatRateLimiterDelay, defaultScriptSettingsFile, "ScriptSettings", "ChatRateLimiterDelay")
    IniWrite(defaultChatterboxTextFile, defaultScriptSettingsFile, "ScriptSettings", "ChatterboxTextFile")
    IniWrite(defaultChatterBoxMode, defaultScriptSettingsFile, "ScriptSettings", "ChatterBoxMode")
}

;Now that we have a default settings file to fall back on, we'll attempt to load settings from it to populate the script's settings variables.
if FileExist(defaultScriptSettingsFile) {
    ;If we have a default settings file, then we'll load settings from there.
    ;But first, check if the settings file specifies a different settings file to use for custom settings.
    ;If so, and if that file exists, then we'll load settings from there instead of the default settings file.
    scriptSettingsFile := IniRead(defaultScriptSettingsFile, "ScriptSettings", "SettingsFileLocation", defaultScriptSettingsFile) ;Location of the .ini file from which to pull script settings. If not specified, will pull from the default settings file.
    if (scriptSettingsFile != defaultScriptSettingsFile) && FileExist(scriptSettingsFile) {
        ;If the specified settings file is different from the default, and it exists, then we'll use that one instead.
        scriptSettingsFile := scriptSettingsFile ;Pointless assignment, but included for clarity.
    } else {
        ;Otherwise, we'll use the default settings file.
        scriptSettingsFile := defaultScriptSettingsFile
    }

    ;TODO: If the existing settings file (either default or custom)is missing any of the expected settings, we should write those missing settings with default values.
        ;That way, the settings file is always comprehensive and up-to-date with the latest version of the script.
    scriptSettingsTimestamp := IniRead(scriptSettingsFile, "SettingsInfo", "SettingsFileCreationTimestamp", defaultScriptSettingsTimestamp)
    scriptSettingsVersion := IniRead(scriptSettingsFile, "SettingsInfo", "SettingsFileCreationVersion", defaultScriptSettingsVersion)
    scriptSettingsAuthor := IniRead(scriptSettingsFile, "SettingsInfo", "SettingsFileCreationAuthor", defaultScriptSettingsAuthor)

    scriptLogFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptLogFileLocation", defaultScriptLogFile)
    scriptIconFileLight := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptIconFileLight", defaultScriptIconFileLight)
    scriptIconFileDark := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptIconFileDark", defaultScriptIconFileDark)

    scriptActiveIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptActiveIconFile", defaultScriptActiveIconFile)
    scriptSuccessIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptSuccessIconFile", defaultScriptSuccessIconFile)
    scriptErrorIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptErrorIconFile", defaultScriptErrorIconFile)
    scriptHungIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptHungIconFile", defaultScriptHungIconFile)
    scriptWarningIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptWarningIconFile", defaultScriptWarningIconFile)
    folderIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "FolderIconFile", defaultFolderIconFile)
    scriptFilesFolderIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "ScriptFilesFolderIconFile", defaultScriptFilesFolderIconFile)
    logsFolderIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "LogsFolderIconFile", defaultLogsFolderIconFile)
    iconsFolderIconFile := IniRead(scriptSettingsFile, "ScriptSettings", "IconsFolderIconFile", defaultIconsFolderIconFile)

    home00Name := IniRead(scriptSettingsFile, "HomesSettings", "Home00Name", defaultHome00Name)
    home01Name := IniRead(scriptSettingsFile, "HomesSettings", "Home01Name", defaultHome01Name)
    home02Name := IniRead(scriptSettingsFile, "HomesSettings", "Home02Name", defaultHome02Name)
    home03Name := IniRead(scriptSettingsFile, "HomesSettings", "Home03Name", defaultHome03Name)
    home04Name := IniRead(scriptSettingsFile, "HomesSettings", "Home04Name", defaultHome04Name)
    home05Name := IniRead(scriptSettingsFile, "HomesSettings", "Home05Name", defaultHome05Name)
    home06Name := IniRead(scriptSettingsFile, "HomesSettings", "Home06Name", defaultHome06Name)
    home07Name := IniRead(scriptSettingsFile, "HomesSettings", "Home07Name", defaultHome07Name)
    home08Name := IniRead(scriptSettingsFile, "HomesSettings", "Home08Name", defaultHome08Name)
    home09Name := IniRead(scriptSettingsFile, "HomesSettings", "Home09Name", defaultHome09Name)
    homeAlt00Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt00Name", defaultHomeAlt00Name)
    homeAlt01Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt01Name", defaultHomeAlt01Name)
    homeAlt02Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt02Name", defaultHomeAlt02Name)
    homeAlt03Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt03Name", defaultHomeAlt03Name)
    homeAlt04Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt04Name", defaultHomeAlt04Name)
    homeAlt05Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt05Name", defaultHomeAlt05Name)
    homeAlt06Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt06Name", defaultHomeAlt06Name)
    homeAlt07Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt07Name", defaultHomeAlt07Name)
    homeAlt08Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt08Name", defaultHomeAlt08Name)
    homeAlt09Name := IniRead(scriptSettingsFile, "HomesSettings", "HomeAlt09Name", defaultHomeAlt09Name)

    additionalChatCommandDelay := IniRead(scriptSettingsFile, "ScriptSettings", "AdditionalChatCommandDelay", defaultAdditionalChatCommandDelay)
    chatRateLimiterDelay := IniRead(scriptSettingsFile, "ScriptSettings", "ChatRateLimiterDelay", defaultChatRateLimiterDelay)
    chatterboxTextFile := IniRead(scriptSettingsFile, "ScriptSettings", "ChatterboxTextFile", defaultChatterboxTextFile)
    chatterBoxMode := IniRead(scriptSettingsFile, "ScriptSettings", "ChatterBoxMode", defaultChatterBoxMode)

} else if not FileExist(scriptSettingsFile){
    ;We just ensured that a default settings file exists, so if we still can't find a settings file at this point, then something has gone horribly wrong.
    ;We'll attempt to log an error and exit the script, since it shouldn't be run without any settings file(s).
    LogEvent("Error", "Couldn't find or create a settings file, so the script should not be run.`nPlease verify that the script has permission to create files in the `"ScriptFiles`" folder, and that there is not some other issue preventing file creation.")
    ExitApp()
}

if newDefaultSettingsFileCreated{
    LogEvent("Event", "No settings file found, so a new default settings file has been created at " . defaultScriptSettingsFile . "`nTerminating script to allow user to review and customize settings before relaunching.")
    MsgBox("Default Settings File Created, A new default settings file has been created in " . defaultScriptSettingsFile . ".`n`nPlease review this file and adjust settings as necessary for your use case.`nIf you want to use a different settings file for customization, create a copy of this default settings file, specify the name of that copy in the `"SettingsFileLocation`" setting in the default settings file, and then edit that copy with your custom settings.`nIf you have any questions or need assistance, please refer to the documentation or boop Trevor on the nose.`nThe script will now terminate.`nRelaunch once settings are sorted out.", "New Settings File Created", "Iconi")
    Run(scriptSettingsFile) ;Open the newly created default settings file for the user to review.
    ExitApp()
}