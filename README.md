# CastFORM

![GitHub release (latest by date)](https://img.shields.io/github/v/release/BAA-Studios/CastFORM?display_name=tag&label=latest%20version)
[![Code Style: Google](https://img.shields.io/badge/code%20style-google-blueviolet.svg)](https://dart.dev/guides/language/effective-dart/style)
![platform | windows](https://img.shields.io/badge/platform-windows-lightgrey)
![MVP](https://progress-bar.dev/100/?title=Minimum%20Viable%20Product)
![GitHub search hit counter](https://img.shields.io/github/search/BAA-Studios/CastFORM/goto?label=search%20counter)
![GitHub all releases](https://img.shields.io/github/downloads/BAA-Studios/CastFORM/total)

**CastFORM** is an easy-to-use Pokémon TCG Deck Registration Sheet generator.  
**CastFORM** offers an elegant graphical interface for filling in Pokémon deck lists for tournaments, and creates
beautiful PDFs from user input. This reduces the likelihood of human errors associated with filling out of forms by
hand, and also integrates well with existing players' workflows, given the popularity of deck strings (of various
formats) in the Pokémon TCG community.

This project is based on [Brandon Nguyen's](https://github.com/Bratah123) CLI Python script that served a similar
purpose. **CastFORM** was spearheaded in response to the high demand for a user-friendly program in his local TCG
community, most of whom were not comfortable with CLI tools.

## Gallery

***Light mode:***
![light mode screenshot](https://user-images.githubusercontent.com/25145447/232040805-d48497e5-d709-487d-9646-342c0a441621.png)

***Dark mode***
![dark mode screenshot](https://user-images.githubusercontent.com/25145447/232040394-cb3da909-e51b-4736-9497-ee7be42641ce.png)

## Installation & Usage Instructions

*Note: Only 64-bit Windows 11 machines are officially supported.*

### ZIP Archive (Portable)

*This is the portable/standalone version that can be used immediately after unzipping*

1. Download `castform.zip` from the releases page
    - Note: actual file name may vary
2. Unzip it into your desired install location
3. Run `CastFORM.exe` from that location
    - You can hold `SHIFT` and right-click it, then under `Send to` select `Desktop` to create a desktop shortcut
    - Uninstall by deleting the folder

### Windows Installer - New (WiX)

1. Download `CastFORM_Installer_x64.msi` from the releases page
2. Double-click on the installer (installs to `C:\Program Files\CastFORM`)
3. CastFORM should now be available in the Start menu
    - Uninstall method 1: Open Start menu, and start typing "CastFORM", you should see the context menu for CastFORM, with the option to uninstall
    - Uninstall method 2: Go to `Settings > Apps > Installed Apps`, clicking on the ellipsis for CastFORM and selecting `Uninstall`

### Windows Installer - Old (IExpress)

1. Download `CastFORM_x64.exe` from the releases page
2. Run it **as administrator** to install CastFORM to `C:\Program Files\CastFORM`
3. Run `CastFORM.exe` from `C:\Program Files\CastFORM\CastFORM.exe`, and/or create a shortcut for it
    - Uninstall by deleting the folder with administrator permissions

### Video Instructions

- A video of the installation and usage steps: https://youtu.be/a4peYpnhHg0

---

## Technical Information

**CastFORM** is built with **Flutter 3.13.9** for **64-bit Windows 11**, and targets [**Google's Dart style guide
**](https://dart.dev/guides/language/effective-dart/style).  
For testing, we aim to provide complete coverage for API behaviour internally by release.

### Development Environment Set-up

1. [Install Flutter](https://docs.flutter.dev/get-started/install) and add it to PATH
2. Clone the repository
3. Open the repository in IntelliJ
    - You may use your IDE of choice, but we prefer IntelliJ here at BAA Studios
    - Make sure you install the Dart and Flutter Plugin for IntelliJ
4. Make sure `Windows (desktop)` is selected in the list of devices
    - The location of the button differs depending on IntelliJ version
    - For IntelliJ 2022.3 use the drop-down menu at the top right:
      ![illustration of where the menu is found](https://i.imgur.com/kqMsy3g.png)
5. Hit the `Run` button at the top right of the window
    - The location of the button differs depending on IntelliJ version
    - For IntelliJ 2022.3 click here:
      ![illustration of where to click](https://i.imgur.com/0FGpLNN.png)

### Internal Package API

API docs for the business logic are included as static HTML files in the repository.  
After cloning the repository, navigate to the respective package to open them:

- `packages/deck_string_parser/doc/api/index.html`
- `packages/pokemon_pdf_builder/doc/api/index.html`

### Toolchain

A number of standalone Python scripts have been make to automate metadata fetching and template creation:

- [ForeCAST](https://github.com/KOOKIIEStudios/Forecast)
    - Uses Bulbapedia's REST APIs to get all known set abbreviations
- [WEATHERBall](https://github.com/KOOKIIEStudios/Weather-Ball)
    - Remote mode: Scrapes the official Pokémon website for the registration form templates
    - Local mode: Converts PDF files to WebP
        - Added as a fallback option upon discovery that Pokémon uses Incapsula as an anti-scraping measure
- [SunnyFORM](https://github.com/BAA-Studios/SunnyFORM)
    - A WiX Toolset project for a custom Windows Installer for CastFORM
    - This is our new packaging method, intended for CastFORM v3 onwards
- [RainyFORM](https://github.com/KOOKIIEStudios/RainyFORM)
    - A new consolidated dependency generator for CastFORM that consolidates and replaces [ForeCAST](https://github.com/KOOKIIEStudios/Forecast) and [WEATHERBall](https://github.com/KOOKIIEStudios/Weather-Ball)
    - This is a work in progress, slated for CastFORM v3
    - Repository to be made public once we have completed migration of internal processes

### Build Instructions

1. Run `flutter build windows`
2. Navigate to the output folder `/build/windows/runner/Release`
3. Add the following `dlls` (which can be found in a Visual Studio 2022 installation folder,
   e.g. `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Redist\MSVC\14.32.31326\x64\Microsoft.VC143.CRT`)
    - msvcp140.dll
    - vcruntime140.dll
    - vcruntime140_1.dll
4. Package the contents of this folder as a ZIP file
    - Users can unzip to their desired location and run `CastFORM.exe` from there

### Bundle with Windows Installer (New - WiX Toolset)

A sample WiX-based project has been made to simplify this. Refer to SunnyFORM's [README](https://github.com/BAA-Studios/SunnyFORM) for instructions.
    
### Bundle with Windows Installer (Legacy)

*Note: This assumes you've already run through steps 1-4 of the build instructions*  
**First time bundling:**

1. Add a batch script `setup.bat` (refer to `/sample_setup.bat` for template)
2. Run `iexpress.exe` as administrator
3. Select `Create new Self Extraction Directive file`, and hit `Next`
4. Select `Extract files and run an installation command`, and hit `Next`
5. Input a title (e.g. `CastFORM Installer`), and hit `Next`
6. Select `No prompt`, and hit `Next`
7. Select `Do not display a license`, and hit `Next`
8. Use the `Add` button to add all the files in the output folder from above, and hit `Next`
    - The file picker dialog box allows `CTRL + A` to select all files
    - The file picker dialog box ignores folders, and does not add them recursively
    - You may use `CTRL + A` on the output folder and repeat for all nested folders to quickly add everything
9. In the `Install Program` field, click on it and manually replace with `cmd /c setup.bat`, and hit `Next`
    - You are able to type in this drop down box
    - The `cmd /c` part is **REQUIRED**
    - IExpress simply bundles/extracts as well as wrap around a batch script, so all installation logic should be
      written in `setup.bat`
10. Select `Default`, and hit `Next`
11. Input a message if you like, and hit `Next`
12. Click `Browse` and select an output folder for the resulting installer EXE, and give it a name
13. Check `Store files using Long File Name inside Package`, and hit `Next`
14. Select `No restart`, and hit `Next`
15. Select `Save Self Extraction Directive (SED) file`, and use `Browse` to choose a save location, then hit `Next`
    - The SED file contains all the configuration you've done up to this point
    - Importing this file will allow you to reuse the same configuration for future bundling attempts
16. On the `Create package` page, hit `Next` to start the bundling process, and then `Finish` once it's done

**For subsequent bundling:**

1. Run `iexpress.exe` as administrator
2. Select `Open existing Self Extraction Directive file`, and select the SED file with `Browse`
3. Select `Create Package`
4. On the `Create package` page, hit `Next` to start the bundling process, and then `Finish` once it's done

---

## Disclaimer

**CastFORM** is an open-source program for a generating a niche type of PDF documents. **CastFORM** is not affiliated
with Nintendo, The Pokémon Company, or any Pokémon-related organisations fan-driven or otherwise. **CastFORM** is
non-monetised, and provided as is. Every reasonable effort has been taken to ensure correctness and reliability of *
**CastFORM**. We will not be liable for any special, direct, indirect, or consequential damages or any damages whatsoever
resulting from loss of use, data or profits, whether in an action if contract, negligence or other tortious action,
arising out of or in connection with the use of **CastFORM** (in part or in whole).
