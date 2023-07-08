## 1.2.0
- Add `PAL` to list of known sets
- Add support for PTCGL tokens
- Update included API docs in packages directory

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