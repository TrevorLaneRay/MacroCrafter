SetFolderIcons(folderIcon := "Icons\FolderIcon.ico", scriptFilesFolderIcon := "Icons\ScriptFilesFolderIcon.ico", logsFolderIcon := "Icons\LogsFolderIcon.ico", iconsFolderIcon := "IconsFolderIcon.ico"){
    ;Create a "desktop.ini" file in the parent folder.
    if FileExist("desktop.ini")
        FileDelete("desktop.ini")
    FileAppend("[.ShellClassInfo]`nIconResource=" . folderIcon . ",0`n[ViewState]`nMode=`nVid=`nFolderType=Generic`n", "desktop.ini")

    ;Create a "desktop.ini" file in the ScriptFiles folder.
    if FileExist("ScriptFiles\desktop.ini")
        FileDelete("ScriptFiles\desktop.ini")
    FileAppend("[.ShellClassInfo]`nIconResource=..\" . scriptFilesFolderIcon . ",0`n[ViewState]`nMode=`nVid=`nFolderType=Generic`n", "ScriptFiles\desktop.ini")

    ;Create a "desktop.ini" file in the Logs folder.
    if FileExist("Logs\desktop.ini")
        FileDelete("Logs\desktop.ini")
    FileAppend("[.ShellClassInfo]`nIconResource=..\" . logsFolderIcon . ",0`n[ViewState]`nMode=`nVid=`nFolderType=Generic`n", "Logs\desktop.ini")

    ;Create a "desktop.ini" file in the Icons folder.
    if FileExist("Icons\desktop.ini")
        FileDelete("Icons\desktop.ini")
    FileAppend("[.ShellClassInfo]`nIconResource=" . iconsFolderIcon . ",0`n[ViewState]`nMode=` nVid=`nFolderType=Generic`n", "Icons\desktop.ini")

    ;Hide desktop.ini files (it's not something we want cluttering the space).
    FileSetAttrib("+HS", "desktop.ini")
    FileSetAttrib("+HS", "ScriptFiles\desktop.ini")
    FileSetAttrib("+HS", "Logs\desktop.ini")
    FileSetAttrib("+HS", "Icons\desktop.ini")

    ;Set folders's System attribute (odd, but necessary).
    ;From MS Docs: "This sets the read-only bit on the folder to indicate that the special behavior reserved for Desktop.ini should be enabled."
    FileSetAttrib("S", A_ScriptDir)
    FileSetAttrib("S", "ScriptFiles")
    FileSetAttrib("S", "Logs")
    FileSetAttrib("S", "Icons")

    ;Refresh Explorer to reflect the changes made to the folder icon.
    DllCall("Shell32.dll\SHChangeNotify", "int",0x8000000, "int",0, "ptr",0, "ptr",0)
    return
}