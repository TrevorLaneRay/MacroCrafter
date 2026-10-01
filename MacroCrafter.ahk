/*
	/=======================================================================\
	|MacroCrafter
	|	A straightforward script for keystroke injection in MineCraft.
	|
	|	TODO:
	|		+ Proofread ReadMe.md for clarity and intact resource links.
	|		+ Flesh out Documentation folder with more detailed information about the script, its functions, and how to use it.
	|			- While the ReadMe is pretty succinct, it doesn't go into much detail about the script's structure and how to customize it.
	|			- Maybe some screenshots or videos of the script in action, to show how it works and what it can do.
	|
	|	Problems:
	|		+ None at the moment.
	|
	|	Ideas:
	|		+ Moar features.
	\=======================================================================/
*/

/*
	/=======================================================================\
	|Compiler Directives
	|	These commented lines are for the Ahk2Exe compiler. (They're ignored when running the script directly from source.)
	|	Windows Defender sometimes flags compiled AutoHotkey scripts as suspicious, so compiling can help with that.
	|	(I personally started using these directives after Windows Defender started nuking my scripts as false positives.)
	|	This especially comes in handy if you want to protect your source code from casual reverse-engineering.
	|	This entire section can be removed if you don't care about compilation. :)
	\=======================================================================/
*/
; @Ahk2Exe-Obey U_Bin,= "%A_BasePath~^.+\.%" = "bin" ? "Cont" : "Nop" ; .bin?
; @Ahk2Exe-Obey U_au, = "%A_IsUnicode%" ? 2 : 1 ; Base file ANSI or Unicode?
; @Ahk2Exe-PostExec "BinMod.exe" "%A_WorkFileName%"
; @Ahk2Exe-PostExec "MPRESS.exe" "%A_WorkFileName%" -q -x, 0,, 1
; @Ahk2Exe-%U_Bin%  "%U_au%2.>AUTOHOTKEY SCRIPT<. RANDOM"

/*
	/=======================================================================\
	|Script Settings
	|	These settings are for general environment parameters.
	\=======================================================================/
*/

;Ensure AHK is running on v2.0, as a 64-bit version.
#Requires AutoHotkey v2.0+ 64-bit
;Make sure only one running instance of the script exists at any given time.
#SingleInstance Force

;Ensure we have UAC permission to actually function.
;(Necessary for writing files to certain locations, and for other functions that require elevated permissions.)
#Include Libraries/UACCheck.ahk ;This library checks if the script is running with admin privileges, and if not, restarts the script with those privileges.

;Ensure the script has the ability to differentiate between virtual and physical input.
InstallKeybdHook(true, true)

;Version & author of the script.
scriptVersion := "0.1.0b"
scriptAuthor := "TrevorLaneRay"
;Create a little tray icon info.
A_IconTip := "MacroCrafter v." . scriptVersion
A_ScriptName := "MacroCrafter"
;Make a note of when the script was launched.
scriptLaunchTimestamp := A_Now

;Ensure user hasn't dumped the script into a primary folder (i.e., Desktop, Documents, etc.)
;Verify that the user hasn't lazily dumped the script into a primary folder (i.e.: Desktop, Documents, etc.)
;TODO: What if we could close the script, create a folder, move the script into said folder, and then re-launch it from there?
;Probably would have to kick off a delayed command to handle the folder creation and script relocation from outside the script itself.
if (A_ScriptDir == "C:\Users\" . A_UserName . "\Desktop" || A_ScriptDir == "C:\Users\" . A_UserName . "\Music" || A_ScriptDir == "C:\Users\" . A_UserName . "\Pictures" || A_ScriptDir == "C:\Users\" . A_UserName . "\Documents" || A_ScriptDir == "C:\Users\" . A_UserName . "\Downloads"){
	MsgBox("You went and saved this in Downloads, or some other silly place, didn't ya?`nPut it in a dedicated folder, then try again.`nCreate a shortcut to it, if you need.", "Oi. Dumdum.", "Icon!")
	ExitApp()
}

;Ensure necessary folders exist for storing script files, icons, and logs.
;If these folders don't exist, create them. If they do exist, nothing will be done here.
DirCreate("ScriptFiles")
DirCreate("Icons")
DirCreate("Logs")

/*
	/=======================================================================\
	|Settings
	|	These settings are loaded from the .ini file, if available.
	|	Adjust these to your specific use case.
	|	Most settings should be in the separate .ini file for customization after compilation.
	|	Keep in mind that if said .ini file does not yet exist, one will be created with these default values.
	\=======================================================================/
*/

;This library autoexecutes, loading settings from the .ini file, or creating the .ini file with default settings if it doesn't already exist.
#Include Libraries/LoadSettingsFile.ahk

;Make sure our icons are embedded in the compiled script.
;When the compiled version is run, it will deploy the icons to the ScriptIcons folder if they don't already exist.
;This can be ignored/removed if you're just running the script from source.
;It's necessary for the compiled version to redeploy the icons if missing.
FileInstall("Icons\ScriptIconBlack.ico", scriptIconFileLight, 1)
FileInstall("Icons\ScriptIconWhite.ico", scriptIconFileDark, 1)
FileInstall("Icons\ActiveIcon.ico", scriptActiveIconFile, 1)
FileInstall("Icons\SuccessIcon.ico", scriptSuccessIconFile, 1)
FileInstall("Icons\ErrorIcon.ico", scriptErrorIconFile, 1)
FileInstall("Icons\WarningIcon.ico", scriptWarningIconFile, 1)
FileInstall("Icons\HungIcon.ico", scriptHungIconFile, 1)
FileInstall("Icons\FolderIcon.ico", folderIconFile, 1)
FileInstall("Icons\ScriptFilesFolderIcon.ico", scriptFilesFolderIconFile, 1)
FileInstall("Icons\LogsFolderIcon.ico", logsFolderIconFile, 1)
FileInstall("Icons\IconsFolderIcon.ico", iconsFolderIconFile, 1)

;Make sure the parent folder is sensible, and has an appropriate icon.
SetFolderIcons(folderIconFile)

;Here we'll choose a Light or Dark theme icon based on the user's system settings, if we can read them from the registry.
try {
    isDarkModeUser := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme") = 0
    if (isDarkModeUser)
        scriptIconFile := ScriptIconFileDark ;Use the white icon for dark mode users.
    else
        scriptIconFile := scriptIconFileLight ;Use the black icon for light mode users.
} catch {
    try{
    	scriptIconFile := ScriptIconFileDark ;If we can't read the registry for some reason, just default to the white icon.
    }
}

;Make sure our tray icon is set to something appropriate, if the file exists. If not, log an error and continue without the icon.
if FileExist(scriptIconFile)
	TraySetIcon(scriptIconFile)
else if not FileExist(scriptIconFile)
	LogEvent("Error", "Couldn't load main script icon file:`n" . scriptIconFile . "`nVerify that the icons are present for better indicators.`nFor now, the tray icon will not indicate script status.")

LogEvent("Event", "Script launched. Version: " . scriptVersion . ". Author: " . scriptAuthor . ".`nSettings loaded from file: " . scriptSettingsFile)

/*
	/=======================================================================\
	|Hotkeys
	|	These hotkeys are for controlling the state of the script.
	|	These will work anywhere, not just in a specific window.
	|	Should be replaced later on by GUI buttons and such, but for now these are good for testing and basic functionality.
	\=======================================================================/
*/

#UseHook
Pause::{ ;Panic button. Sometimes it's nice to just halt and catch fire.
	LogEvent("Event", "Pause key Pressed. Interrupting script, and waiting for resume.")
	Pause()
}
+F12::{ ;Restart the script, reloading settings from the .ini file.
	LogEvent("Event", "Shift+F12 Pressed. Restarting script.")
	Reload()
}
^+F12::{ ;Terminate the script immediately.
	LogEvent("Event", "Ctrl+Shift+F12 Pressed. Terminating script.")
	ExitApp()
}
F10::{ ;Open the .ini file used for settings.
	LogEvent("Event", "F10 Pressed. Opening settings file.")
	Run(scriptSettingsFile)
}

;Only allow the subsequent hotkeys to work when a Minecraft client is active.
;(This is a safety measure to prevent accidental activation outside the game.)
;If wanting to prototype them outside of the game, you can temporarily comment out these #HotIf lines.
GroupAdd "Minecraft", "Minecraft ahk_class GLFW30 ahk_exe javaw.exe"
GroupAdd "Minecraft", "Minecraft ahk_class Bedrock ahk_exe Minecraft.Windows.exe"
#HotIf WinActive("ahk_group Minecraft")

^NumpadDot::{ ;Teleport to spawn.
	LogEvent("Event", "NumpadDot pressed. Initiating Teleport(`"spawn`").")
	Teleport("spawn")
	return
}
^NumpadSub::{ ;Return to the "back" home.
	LogEvent("Event", "NumpadSub pressed. Initiating Teleport(`"back`").")
	Teleport("back")
	return
}
^NumpadAdd::{ ;Quickly create a new home for on-the-go use.
	LogEvent("Event", "NumpadAdd pressed. Initiating Teleport(`"setBack`").")
	Teleport("setBack")
	return
}
^Numpad0::{ ;Teleport to home 00.
	LogEvent("Event", "Numpad0 pressed. Initiating Teleport(`"" . home00Name . "`").")
	Teleport(home00Name)
	return
}
^Numpad1::{ ;Teleport to home 01.
	LogEvent("Event", "Numpad1 pressed. Initiating Teleport(`"" . home01Name . "`").")
	Teleport(home01Name)
	return
}
^Numpad2::{ ;Teleport to home 02.
	LogEvent("Event", "Numpad2 pressed. Initiating Teleport(`"" . home02Name . "`").")
	Teleport(home02Name)
	return
}
^Numpad3::{ ;Teleport to home 03.
	LogEvent("Event", "Numpad3 pressed. Initiating Teleport(`"" . home03Name . "`").")
	Teleport(home03Name)
	return
}
^Numpad4::{ ;Teleport to home 04.
	LogEvent("Event", "Numpad4 pressed. Initiating Teleport(`"" . home04Name . "`").")
	Teleport(home04Name)
	return
}
^Numpad5::{ ;Teleport to home 05.
	LogEvent("Event", "Numpad5 pressed. Initiating Teleport(`"" . home05Name . "`").")
	Teleport(home05Name)
	return
}
^Numpad6::{ ;Teleport to home 06.
	LogEvent(" Event", "Numpad6 pressed. Initiating Teleport(`"" . home06Name . "`").")
	Teleport(home06Name)
	return
}
^Numpad7::{ ;Teleport to home 07.
	LogEvent("Event", "Numpad7 pressed. Initiating Teleport(`"" . home07Name . "`").")
	Teleport(home07Name)
	return
}
^Numpad8::{ ;Teleport to home 08.
	LogEvent("Event", "Numpad8 pressed. Initiating Teleport(`"" . home08Name . "`").")
	Teleport(home08Name)
	return
}
^Numpad9::{ ;Teleport to home 09.
	LogEvent("Event", "Numpad9 pressed. Initiating Teleport(`"" . home09Name . "`").") 
	Teleport(home09Name) 
	return 
}
F11::{ ;Start sending chat messages line-by-line from the specified chat text file.
	LogEvent("Event", "F11 Pressed. Initializing Chatterbox()")
	Chatterbox(chatterboxTextFile, chatterBoxMode)
	return
}

/*
	/=======================================================================\
	|Library FunctionInclusions
	|	Modular functions that are more easily maintained in separate files, included here for calling in the main script.
	\=======================================================================/
*/

#Include Libraries/LogEvent.ahk ;LogEvent() is a simple function for appending diagnostic information to a log file, with timestamps and event types for easier debugging and analysis.
#Include Libraries/Teleporter.ahk ;Teleporter() is a function for handling teleportation logic within the game. (i.e.: /home <homeName>, /spawn, etc.)
#Include Libraries/Chatterbox.ahk ;Chatterbox() is a function for sending multiple chat messages loaded from a text file.
#Include Libraries/SetFolderIcons.ahk ;SetFolderIcons() is a function that configures the parent folder's icon to something a bit more apropos.