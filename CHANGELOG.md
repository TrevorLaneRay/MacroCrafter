# Changelog
## v0.1.2b
### Added or Changed
- Added Ctrl+Alt combo as a modifier for homes accessed with the NumPad, bringing total homes usable to 20.
- Added settings file entries for new homes accessible with the Ctrl+Alt combo.
- Recompiled for v0.1.2b.

## v0.1.1b
### Added or Changed
- Changed Chatterbox()'s semi-auto mode to use the LCtrl key instead of Space.
- Added on-screen tooltip to indicate that Chatterbox() is waiting for the user to press a key in semi-auto mode.

## v0.1.0b
### Added or Changed
- Initial commit.
    - Tidied up code. Prepped for initial versioning via Git CVS.
    - Added grouping of windows for use of hotkeys in both Bedrock and Java clients.
- Recompiled ready-to-use v0.1.0b executable, tested, and working.
    - Will include GPG signatures with binaries, just for kicks 'n giggles.
### Removed
- Disposed of old executables. Will only commit beta/stable binaries from now on.

# Early Alpha Stages
## v0.0.8a
### Added or Changed
- Built out additional Chatterbox() functionality and edge case handling.
    - Should now be able to perform in semi-auto mode, waiting for the user to press the spacebar.
    - Also supports an infinite mode, where it will loop through the text file repeatedly.
    - Added settings file entry to specify which text file to use.
    - Added some sanity checks to handle missing, blank, or single-line files.
- Added check on startup to ensure that the user hasn't lazily dumped the script into a common location, like Downloads or Desktop.
    - Since the script makes separate folders for components, things should be kept tidy.
- Added SetFolderIcons(): changes the icon of the script's folders using desktop.ini. (We gettin' fancy!)
    - Added some fancy icons in the repo. (All credit to Federico Dal Pio "Dalps" Luogo - great work.)

## v0.0.7a
### Added or Changed
- Added logging to script control hotkeys, for better identifying when the script is halted, reloaded, paused, or terminated.
- Added Chatterbox(), a bulk chat message system.
    - Using a text file, it can send the lines within as chat messages, one after another. (Don't be evil. -_-)
    - Planning on adding functionality for infinitely looping the file, or randomly selecting lines from the file.
    - Will have to test ability to use ingame text formatting codes. Not all servers allow formatting in chat.
- Recompiled v.0.0.7a executable.

## v0.0.6a
### Added or Changed
- Added logging to ingame hotkeys, so we can see when they're pressed, rather than just logging in what they trigger.
- Added ability to extend the delay to wait for chat window popping up, to accomodate slower computers. (Default is 0 additional delay.)
- Recompiled with AHK v2.0.28, since that seems to be working properly.
### Removed
- Cleaned up repo filestructure (i.e.: logs and settings files) from source. (May add back as examples in Documentation.)
- Stripped out logic for human input entropy, since we'll never be using it.

## v0.0.5a
### Removed
- Removed copy of compiled .exe from root of repo (again, oops).
    - Will try to follow my own advice, and keep a working copy separate from source. :D

## v0.0.4a
### Added or Changed
- Swapped order of operations for a new settings file being created.
    - Before, the explanation would appear after opening the settings file.  
    However, this meant that if you didn't have a file association set for .ini files, the explanation would interrupt the prompt asking what program should be used to open the .ini file.  
    Now, the explanation should open first, and *then* allow the settings .ini file to be opened afterward, allowing proper selection of desired editor (i.e.: Notepad, Notepad++, etc.).  

## v0.0.3a
### Added or Changed
- Compiled v0.0.3a executable. (Tested, working on AHK v2.0.27.)
### Removed
- Expunged extraneous logging that was introduced during debug of AHK v2.0.28 compilation.
- Removed extra copy of v0.0.2a in root of repo.
    - Will try to keep compiled binaries in the aptly-named "CompiledBinaries" folder.
### Resolved Issues
- AHK v2.0.28 runtime was breaking compiled executables. Compiling with AHK v2.0.27 instead fixes this.
    - Will compile with working runtime for the time being, until an update fixes this.
    - Will continue to monitor this, and recompile executable with latest version once functional.

## v0.0.2a
### Added or Changed
- Implemented "set backLocation" and "return to backLocation" hotkeys for servers that disallow "/back."
    - This allows, in effect, the ability to easily "bookmark" one's coordinates for easy return.
- Added more verbose logging to track internal flow of script functions.
- Compiled v0.0.2a executable. (Tested, working.)
### Known Issues
- AHK v2.0.28 partially broke execution of compiled executable.
    - For some reason, inserting FileAppend() lines for debug logging allows the script to launch, but removing them regresses?
    - For now, we'll keep the additional debug logging, just to work with the latest AHK runtime.

## v0.0.1a
### Added or Changed
- Initial working prototype.
- Added this changelog.
- Added ReadMe.
- Added some basic icons for display in tray. (Probably will change later.)
- Added basic event logging with LogEvent().
- Added & tested basic functionality for /spawn and /home hotkeys.
- Compiled v0.0.1a executable. (Tested, working.)