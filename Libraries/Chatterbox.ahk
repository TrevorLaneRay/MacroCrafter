Chatterbox(chatTextFile := "ScriptFiles\ChatText.txt", chatMode := "Auto"){ ;A bulk-chat function for sending multiple chat messages loaded from a text file.
    if FileExist(chatTextFile) {
        ChatLines := Array() ;Will hold each line from the chat text file in an array.
        chatText := FileRead(chatTextFile) ;Load the entirety of the chat text file into a single variable.

        ;Read the contents of the chat text, line by line, into the ChatLines array.
        Loop Parse chatText, "`n", "`r" {
            ChatLines.Push(A_LoopField)
        }

        ;If the text file exists, but only has one line, notify the user.
        ;(This is a bulk chat function, and doesn't make sense to just have one line.)
        if ChatLines.Length = 1 {
            LogEvent("Notice", "The chat text file only contains one line.`nJust checking.... is this right?`n`"" . ChatLines[1] . "`"`n`n(Just copy and paste, ya lazy bum. 😒)")
        }

        ;Check each line of text to make sure it doesn't exceed maximum chat length.
        for index, chatLine in ChatLines {
            if StrLen(chatLine) > 256 {
                LogEvent("Error", "Chat line " . A_Index . " exceeds maximum length:`n`"" . chatLine . "`"")
                Run(chatTextFile) ;Open the chat text file for correction.
                return
            }
        }

        LogEvent("Event", "Sending chat messages from: " . chatTextFile . "...")

        ;If in Loop mode, we will need to loop through the ChatLines array continuously.
        ;When doing so, we will jump to this LoopModeStartingPoint label to continuously send chat lines.
        LoopModeStartingPoint:

        ;Step through each index in the ChatLines array and send its string to the chat box.
        for index, chatLine in ChatLines {
            ;Open the chat box by pressing the 't' key.
            SendInput("t")
            ;Wait a bit for the chat box to open and, additionally, wait a bit more to ensure rate-limiting is respected.
            Sleep(250 + additionalChatCommandDelay + chatRateLimiterDelay)
            ;Send the chat line to the chat box and press Enter to send it.
            LogEvent("Event", "Sending chat line:`n`"" . chatLine . "`"")
            SendInput(chatLine . "{Enter}")
            if chatMode = "Auto" {
                ;Auto mode: automatically send the next chat line without waiting for user input.
                LogEvent("Event", "Sending chat line in Auto mode:`n`"" . chatLine . "`"")
                continue
            } else if chatMode = "SemiAuto" {
                ;Semi-auto mode: wait for the user to press Space before sending the next chat line.
                LogEvent("Event", "Waiting for user input in Semi-Auto mode before sending next chat line:`n`"" . ChatLines[A_Index + 1] . "`"")
                KeyWait("Space")
                continue
            } else if chatMode = "Loop" {
                ;Loop mode: continuously send chat lines in a sequential loop without stopping.
                ;To do so, we'll check if we've reached the last A_Index in the ChatLines array.
                ;If we're on the last index of the ChatLines array, we'll jump back to LoopModeStartingPoint to start again.
                ToolTip("Loop mode active. Sending chat lines continuously. (Line: " . A_Index . ")", A_ScreenWidth / 2, 0)
                if (A_Index = ChatLines.Length) {
                    ToolTip()
                    LogEvent("Event", "Reached the last chat line in Loop mode. Jumping back to the start of the loop.")
                    goto('LoopModeStartingPoint') ;Jump back to the start of the loop and do it all again..
                }
                continue
            } else {
                ;If for whatever reason the chat mode is not recognized, log an error and do nothing further.
                LogEvent("Error", "Invalid chat mode specified: " . chatMode)
                return
            }
        }
        return
    } else if !FileExist(chatTextFile) {
        ;If the specified chat text file does not exist, create a blank one at the intended location, open it for editing, and exit the function.
        FileAppend("", chatTextFile)
        LogEvent("Error", "The specified chat text file did not exist: " . chatTextFile . "`nWe'll start with a blank one. Go edit it first.")
        if FileExist(chatTextFile) {
            ;Open the newly created blank chat text file for editing.
            Run(chatTextFile)
        } else if !FileExist(chatTextFile) {
            ;Notify the user that the chat text file could not be created, and provide the location for manual inspection.
            LogEvent("Error", "Uhhhh. What?`nWe just tried to create a blank chat text file, but it still doesn't exist.`nCheck the following location to see what's going on:`n" . chatTextFile)
        }
        return
    }
    if chatTextFile = "" {
        ;Do nothing if a blank string is passed as the ChatText file's path.
        LogEvent("Error", "The chat text file path is blank. No action will be taken.")
        return
    }
    return
}