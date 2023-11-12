## 2.0.0
- Upgrade environments
  - Flutter 3.13.9
  - Dart 3.1.5
- Update dependencies 
- Add support up to Pokemon Trading Card Game Classic
  -  Includes support for Paradox Rift
- Migrate to new [ForeCAST](https://github.com/KOOKIIEStudios/Forecast)-based tooling for set abbreviations
- Add age division selector
- Change aspect ratio to 16:10 on Windows

## 1.2.4
- Routine updating of form templates (Paradox Rift)
  - Generated using [new tooling](https://github.com/KOOKIIEStudios/Weather-Ball)

## 1.2.3
- Add support for trailing `PH` in PTCGL representation of full/alt art trainer cards' names
- Routine updating of form templates (Obsidian Flames)
  - Credits: community contributor [Gaardus](https://github.com/Gaardus)
- Merge similar energy cards into the same entry

## 1.2.2
- Routine updating of known set abbreviations
  - Includes the not yet released `OBF` and `MEW`
  - Re-ordered according to Bulbapedia's new formatting
  - Added comments in the set to make expansion series more searchable
- Routine updating of form templates
  - Credits: community contributor [Gaardus](https://github.com/Gaardus)

## 1.2.1
- Fix erroneous handling of letter-sized PDFs

## 1.2.0
- Add `PAL` to list of known sets
- Add support for PTCGL tokens
- Update included API docs directory

## 1.1.0
- Feedback via snackbar now provided on save
  - E.g. Tells you whether the PDF file was successfully exported
- **About** dialog now shows the app version number
- Minor efficiency improvements

## 1.0.1
- PDF live render previews now ignore invalid deck strings
  - Validation still performed on attempt to submit the form
  - This allows the preview to not show error screens if users manually input/edit the deck string
- Style changes
  - Migrate from Material 2 to Material 3 design (Experimental)
  - Addition of dark mode (automatically applied based on system settings)

## 1.0.0
- Minimum viable product

## 0.0.1
- Un-versioned rapid development
  - The core business logic are implemented in the `package` directory as individual Dart libraries
    - These have their own versioning and change logs
  - Rapid prototyping of UI elements
  - Quick and dirty state management using Providers