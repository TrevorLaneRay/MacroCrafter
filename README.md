<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/TrevorLaneRay/MacroCrafter">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="Icons/SourceImages/ScriptIconWhite.png" width="128" height="128">
      <source media="(prefers-color-scheme: light)" srcset="Icons/SourceImages/ScriptIconBlack.png" width="128" height="128">
      <img alt="MacroCrafter Icon" src="Icons/SourceImages/OriginalMinecraftIcon.png" width="128" height="128">
    </picture>
  </a>

<h3 align="center">MacroCrafter</h3>

  <p align="center">
    A simple collection of AutoHotKey macros/shortcuts for Minecraft.
    <br />
    <a href="https://github.com/TrevorLaneRay/MacroCrafter/tree/main/Documentation"><strong>Explore the docs »</strong></a>
    <br />
    <a href="https://github.com/TrevorLaneRay/MacroCrafter/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/TrevorLaneRay/MacroCrafter/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
Needed some quality-of-life improvements ingame, but didn't want to install mods.  
Wanting to keep things as Vanilla as possible.  


### Tools used during development
* [![VSCode][VSCode]][VSCode-url]
* [AutoHotkey v2.0](https://www.autohotkey.com/)
* [Notepad++](https://notepad-plus-plus.org/)
* No AI 😉


<!-- GETTING STARTED -->
## Getting Started
If you're feeling lazy, you can download the pre-compiled binary and run it.  
It'll self-deploy to its current folder (so save it somewhere sensible, and maybe make a shortcut to it).  
(See the [example screenshot](Documentation/HowToInstall.png) in the [Documentation folder](Documentation) for reference.)  

If you want to customize the script itself, you can download the source code in its entirety.  
Either clone the repository as a whole, or download the packaged source code from the releases.  
Once you've got the source code, you can edit it with VS Code, SciTE4AutoHotkey, or Notepad++.  
(SciTE4AutoHotkey is the original editor, but I personally prefer VS Code.)  

To run the script directly from source code, there's two ways to go about it.  
You can directly launch MacroCrafter.ahk using the AutoHotkey v2.0 runtime.  
Or, if you've installed AutoHotkey v2.0, it comes with Ahk2Exe, which can compile your script to an executable binary.

## Prerequisites / Recommendations
### Pick an editor for changing the script:
* VS Code (What I've personally been using as of late.)
  ```sh
  https://www.autohotkey.com/
  ```
* SciTE4AHK (The original editor for AutoHotkey scripts)
  ```sh
  https://www.autohotkey.com/scite4ahk/
  ```
* Notepad++ (A bit less integrated, but a solid editor.)
  ```sh
  https://notepad-plus-plus.org/
  ```

### To run script source code directly or compile source code to a .exe:
* AutoHotkey v2.0
  ```sh
  https://www.autohotkey.com/
  ```  

<!-- DEPLOYMENT PROCEDURE -->
### Installation (The Easy Way)
1. Create a folder for the script. (On your desktop, or wherever makes sense.)  
2. Download and save MacroCrafter.exe to that folder.  
3. Launch it for the first time. It will create folders for its components, and set up default settings.  
4. In the ScriptFiles folder, there will be a DefaultSettingsFile.ini. Open this in Notepad.  
5. Modify the line where it says SettingsFileLocation. Change "DefaultSettingsFile.ini" to "CustomSettingsFile.ini"  
6. Save the file. Then, save as a copy to "CustomSettingsFile.ini"  
(This way, there's a separate .ini settings file for custom settings, instead of directly editing the default.)  
(The DefaultSettinsFile will reference the CustomSettingsFile, so you have a custom one, and one you can use for reference.)  
7. Edit your CustomSettingsFile to your taste.  
(Try changing the names of homes under the "HomesSettings" section, for example: home, nether, shop, outpost, etc.)  
8. Once you've saved your CustomSettingsFile, launch the script again for your settings to take effect.  
(If there's any syntax errors in your settings, it'll warn you about it.)  


<!-- USAGE CLARIFICATION -->
## Usage In-Game
1. Have a read through the [documentation](Documentation) folder. (Some useful info in there.)
2. By default, pressing Ctrl+NumPad0, Ctrl+NumPad1, etc. will use "/home home" and "/home home01" as specified in the settings.
3. Pressing Ctrl+NumPadDot (the decimal on your NumPad) will use /spawn to respawn you at, well, spawn.
4. Launch the script, or your compiled version.
5. Use the hotkeys to trigger the functions.
    * **Ctrl + NumPad0-9**: Teleport to your choice of 10 /home locations.
    * **Ctrl + NumPadDot**: Teleport to the /spawn location.
    * **Ctrl + NumPadAdd** to save your current location with "/sethome back".
    * **Ctrl + NumPadSub** to teleport to the "/home back" location that you saved with Ctrl+NumPadAdd.  
    * **Shift + F12**: Reload the script (handy if you've just made a change to the Settings .ini file).
    * **Ctrl + Shift + F12**: Terminate the script. (Can also be closed through the tray icon's context menu.)
    * **F10**: Opens your settings file. (For when you're too lazy to open the folder.)
    * **Pause**: Pauses the script, halting it in its tracks. Also resumes the script if it's paused. (The "hol up" button.)

_For some fun reading, please refer to the [Documentation](Documentation)._


<!-- ROADMAP -->
## Roadmap / Ideas
- [⏳] AttemptDepositAll()? Sweep across entirety of inventory, and attempt to deposit every item already in the chest?
Possibly too cheaty. Will need some sort of server rule enforcement.
- [⏳] Maybe a GUI for setting home names, instead of editing a .ini file?
Might be super convenient, but possibly too convenient.

See the [open issues](https://github.com/TrevorLaneRay/MacroCrafter/issues) for a full list of proposed features (and known issues).


<!-- CONTRIBUTING -->
## Contributing
Contributions of ideas would be **greatly appreciated**.  
I'm just doing this as a side project, so if you want to reproduce this as your own, I've licensed it so you can do so without worries. 😘  
If you've got a suggestion that would make this better, please fork the repo and create a pull request.  
You can also simply open an issue with the tag "enhancement".

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/CraftStuff`)
3. Commit your Changes (`git commit -m 'Craft more stuff.'`)
4. Push to the Branch (`git push origin feature/CraftStuff`)
5. Open a Pull Request

### Top contributors:

<a href="https://github.com/TrevorLaneRay/MacroCrafter/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=TrevorLaneRay/MacroCrafter" alt="contrib.rocks image" />
</a>


<!-- LICENSE -->
## License
<a href="https://github.com/TrevorLaneRay/MacroCrafter">MacroCrafter</a> by <a href="https://github.com/TrevorLaneRay">Trevor Ray</a> is marked <a href="https://creativecommons.org/publicdomain/zero/1.0/">CC0 1.0</a>

<img src="https://mirrors.creativecommons.org/presskit/icons/cc.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;"><img src="https://mirrors.creativecommons.org/presskit/icons/zero.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">

> [!IMPORTANT]  
> Obviously *NOT* an official Minecraft or Microsoft product.  
> This project is by no means official, approved, nor endorsed by Mojang or Microsoft.


<!-- CONTACT -->
## Contact
Trevor Ray - [@TrevorLaneRay](https://x.com/TrevorLaneRay) - trevorlaneray@gmail.com

Project Link: [https://github.com/TrevorLaneRay/MacroCrafter](https://github.com/TrevorLaneRay/MacroCrafter)


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
* [MineCraft](https://www.minecraft.net/) - We all diggy hole down here.
* [GroggyOtter](https://github.com/GroggyOtter/ahkv2_definition_rewrite) - Made my life so much better with AHK integration for VSCode.
* [othneildrew](https://github.com/othneildrew/Best-README-Template) - Definitely made creating this ReadMe easier.
* [dalps](https://github.com/dalps/minecraft11) - Awesome work on themed icons.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/TrevorLaneRay/MacroCrafter.svg?style=for-the-badge
[contributors-url]: https://github.com/TrevorLaneRay/MacroCrafter/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TrevorLaneRay/MacroCrafter.svg?style=for-the-badge
[forks-url]: https://github.com/TrevorLaneRay/MacroCrafter/network/members
[stars-shield]: https://img.shields.io/github/stars/TrevorLaneRay/MacroCrafter.svg?style=for-the-badge
[stars-url]: https://github.com/TrevorLaneRay/MacroCrafter/stargazers
[issues-shield]: https://img.shields.io/github/issues/TrevorLaneRay/MacroCrafter.svg?style=for-the-badge
[issues-url]: https://github.com/TrevorLaneRay/MacroCrafter/issues
[license-shield]: https://img.shields.io/github/license/TrevorLaneRay/MacroCrafter.svg?style=for-the-badge
[license-url]: https://github.com/TrevorLaneRay/MacroCrafter/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/trevorlaneray
<!-- Shields.io badges. -->
[VSCode]: https://custom-icon-badges.demolab.com/badge/Visual%20Studio%20Code-0078d7.svg?logo=vsc&logoColor=white
[VSCode-url]: https://code.visualstudio.com/