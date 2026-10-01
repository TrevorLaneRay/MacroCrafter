Teleport(destination := "spawn", delay := 0){ ;Takes a destination, and an optional delay in milliseconds before executing the teleport command. The default destination is "spawn", and the default delay is 0 milliseconds.
    if destination = "" ;If the destination is empty, default to "spawn". (This shouldn't happen, but just in case...)
        destination := "spawn"
    else if destination = "spawn" ;If the destination is "spawn", we want to use the "/spawn" command.
        teleportCommand := "spawn{Enter}"
    else if destination = "back" ;If the destination is "back", we want to use the "/home back" command.
        teleportCommand := "home back{Enter}"
    else if destination = "setBack" ;If the destination is "setBack", we want to use the "/sethome back" command twice, overwriting the previous one, if any.
        teleportCommand := "sethome back{Enter}"
    else ;Otherwise, we want to use the "/home <homeName>" command.
        teleportCommand := "home " . destination . "{Enter}" ;The {Enter} at the end is a special command that will simulate pressing the Enter key after sending the command, so the game will execute it.
    LogEvent("Event", "Teleporting to destination: `"" . destination . "`" with a delay of " . delay . " milliseconds.") ;Log the teleportation event for diagnostic purposes.
    if delay > 0 ;If a delay is specified, we want to wait for that amount of time before executing the teleport command.
        Sleep(delay)
    SendInput("/") ;We send the / keystroke to the game client to open the chat window, so we can send the teleport command.
    Sleep(250 + additionalChatCommandDelay) ;We wait for 250 milliseconds to ensure the chat window is open. (May be increased if the game is running on a slower machine.)
    SendInput(teleportCommand) ;Send the teleport command to the game.
    if destination = "setBack"{
        ;If the destination is "setBack", we want to send the "/sethome back" command once more to overwrite the previous back home.
        SendInput("/")
        Sleep(1000 + additionalChatCommandDelay) ;This isn't just a wait for clientside interface. We have to wait for the server itself to process the first command, and then we send the command again to confirm.
        SendInput(teleportCommand) ;Send the "/sethome back" command to the game once more to overwrite previous.
    }
    return ;Done. The function will return to the caller, and the script will continue executing from where it left off.
}