## 2.2.0

- Add age division marking
- Add unicode font for checkbox symbol

## 2.0.2

- Add title and author metadata
    - Experimental - API docs are poorly documented
- Update dependencies

## 2.0.1

- Tweak the coordinates for the `date` field in letter-sized documents

## 2.0.0

- Make the library take in `pdf/widget`-style arguments
    - e.g. `widget.Image` and `widget.font` instead of `ByteArray` and `Uint8List`
    - This allows these widgets to instantiated at start-up and kept in memory, rather than being converted from bytes
      to objects every pdf build/save
- Expose class constructors directly, instead of using a getter function
    - Unnecessary use of getter

## 1.0.0 - MVP

- Able to handle Letter-sized PDF
- Various bug fixes

## 0.0.2

- PDF document generation functionality
    - Uses types exposed in deck_string_parser
    - Able to handle empty/missing fields in forms
    - Able to handle A4-sized PDFs
    - Able to return a hydrated document as `Uint8List` for live preview in CastFORM
- Detailed example code provided

## 0.0.1

- Initialise package with Dart defaults
