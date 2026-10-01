# MacroCrafter
Notice how the Minecraft Bedrock client has macros built in, and Java doesn't?  
Yeah, it was kinda disheartening.  
So here's a bit of a quality-of-life improvement: using the numpad to teleport between /sethome locations.  
It's designed from the ground up with flexibility in mind - yours to customize.  
Works with both the Bedrock and Java clients.

## How to use
There's two main ways to use this: running from source code, and launching it as an executable program.  
I'll not mince words - not everyone is willing to dive into scripting. That's fine.  
I designed it to be relatively straightforward enough for anyone to use, so long as they're willing to read.  
If you're exceptionally willing though, I encourage you to clone the repo, edit the source code yourself, and make it your own.

### Walkthrough of the compiled version:
1. Look in the [CompiledBinaries](CompiledBinaries) folder for the, well, compiled binaries. They're ready to use.

2. First, create a folder somewhere you can easily access it, like on your desktop.
    - This will be a folder solely for the program.
    - Don't just save the program to your desktop.
        - Put it in **its own folder** that you've created for it. (Here's an example [screenshot](Documentation/HowToInstall.png).)
        - Create a shortcut to it on your desktop, if you need easier access.
        - There is no actual "installation." This is wholly self-contained, and can be removed by simply deleting it.
        - It operates entirely within its own folder, and touches no files outside of it.
        - Updates are as simple as downloading the new version to the folder you created for it.

3. When you've saved the program to the folder you've created for it, you can then double-click to run it.
    - Some notes about macros, self-made software, and how Windows Security behaves:
        - When you make your own software, you have to pay Microsoft a fee to "sign" it with their certificate.
        - A certificate from Microsoft is "trusted," and software not signed by one is "not trusted."
        - Thus, me being a poor soul, can only give you my personal GPG signature, so you can at least know it's from me.
        - Windows Defender will probably throw a fit, wanting to scan it first. (It's fine, let it scan.)
            - Don't turn off your antivirus or firewall. Ever. There's no excuse for it.
            - No part of this script will ever ask to connect to the internet. It doesn't need it.
        - Once Defender verifies it's safe, you can then use it normally without a fuss.
        - Remember that because it's a macro that sends keyboard inputs, it needs to ask for Admin permission. Grant it.
            - (This is because it pretends to be a keyboard, in and of itself.)
            - If you're not the admin of your computer, go get an adult.

4. When first launched, the program will create three folders:
    - **ScriptFiles** (Where settings files are located)
    - **Logs** (Where the history is saved, detailing what the script did, and when, saved in the .log text file)
    - **Icons** (Where all the pretty icons are saved)

5. The program will then close, and you'll then be prompted to edit your settings file.
    - All of this could be done automatically, yes, but I want you to learn how this works. Roll them sleeves up and RTFM.
    - The script will try to open the DefaultSettingsFile.ini, which is where your settings are saved (at first).
        - If you've never opened a .ini file before, it'll probably ask what program you want to use.
        - Notepad is fine, though I personally recommend [Notepad++](https://notepad-plus-plus.org/). Sytax highlighting is awesome.
    - See the line that says "**SettingsFileLocation**"? Change the text "**DefaultSettingsFile.ini**" to something like "**CustomSettingsFile.ini**".
    - Once you've made this one change, save the DefaultSettingsFile.ini.
    - Then *Save As* a *separate file*.
        - This time, we'll save it with the **same name you just specified**, like "CustomSettingsFile.ini".
    - Close the file. Notice you now have **two** settings files - one is the *Default*, and one is *Custom*.
        - Whenever you make changes to settings, **use the *Custom* one**.
        - *If you mess up*, you can delete the broken Custom .ini, and create a new Custom .ini by copying the Default .ini.
        - Just be sure to name the Custom .ini with the **same name** you specified in the Default .ini.
    - Open your newly-saved Custom .ini settings file. Look through it. Change whatever settings you see fit.
        - (Let's be honest - the only ones you'll probably change for now are the HomeNames.)
        - Replace the "Home," and "Home01" - "Home09" names with the names of the ingame /sethome locations you've made.
            - These are for conveniently teleporting to each /home by using Ctrl+Numpad0, Ctrl+NumPad1, etc.
    - Save your Custom .ini settings file. We're done in there for now.

6. Open the program again, and grant it permission.
    - Look for a little dirt block in the taskbar's tray, on the bottom-right of your screen.
    - That's the script's icon, which allows a quick status indication (i.e.: active, busy, hung, or errored).
    - You can right-click this icon to terminate the program. (Or just hit Ctrl+Shift+F12 to exit as well.)

7. You're ready to go. Fire up your game, and load into your world or server.  
    Here's some shortcut keys you'll use ingame:
    - **Ctrl+Numpad0**, **Ctrl+Numpad1**, **Ctrl+Numpad2**, etc to teleport to each of the /sethome locations you've made ingame.
    - **Ctrl+NumpadDot** to teleport to /spawn.
    - **Ctrl+NumPadAdd** to save your current location with "/sethome back".
    - **Ctrl+NumPadSub** to teleport to the "/home back" location that you saved with Ctrl+NumPadAdd.  

    Some shortcut keys to control the script itself:
    - **Shift+F12**: Reloads the script. (Handy when making changes to your settings .ini file.)
    - **Ctrl+Shift+F12**: Exits the script entirely. (If you're done, or something's wonky, this is your way to close it easily.)
    - **F10**: Opens your settings file. (For when you're too lazy to open the folder.)
    - **Pause**: Pauses the script, halting it in its tracks. Also resumes the script if it's paused. (The "hol up" button.)
8. Research and experiment.
    - There are other useful features I'll likely add to this script, but with a modicum of caution, I'll refrain from mentioning them here.
    - Let's be real: trolls are out there. They'll take the opportunity to abuse anything however they can if given the chance, so I'll be a bit of a gatekeeper and force users to actually do their reading, in the hopes of staving off chat spammers and their ilk.
    - Eventually try downloading the source code, and **make it into your own personal version**, perhaps even distributing it as such.
    - Scripting is fun, and can very well translate into skills used in professional use cases at work, home, or school.

### Walkthrough of running from source code:
- No. Go do your research. (I'm serious, it's for your own benefit that you do so.)
- No, I'm not kidding. I love you. A good teacher makes you learn the stick-shift before you touch an automatic.
- [Here's the AHK v2.0 documentation](https://www.autohotkey.com/docs/v2/), in full, plain English.
- Once you've got the hang of it, you can compile it to a program to have it be self-contained.