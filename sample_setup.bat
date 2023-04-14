@echo off
REM Choose one of the following Redistributable files to install
::vc_redist.x86.exe    REM remove leading :: to install Redistributable for x86
::vc_redist.x64.exe    REM remove leading :: to install Redistributable for x64
::vc_redist.arm64.exe  REM remove leading :: to install Redistributable for ARM64
mkdir "C:\Program Files\CastFORM"
mkdir "C:\Program Files\CastFORM\data"
mkdir "C:\Program Files\CastFORM\data\flutter_assets"
mkdir "C:\Program Files\CastFORM\data\flutter_assets\assets"
mkdir "C:\Program Files\CastFORM\data\flutter_assets\assets\fonts"
mkdir "C:\Program Files\CastFORM\data\flutter_assets\assets\form_templates"
mkdir "C:\Program Files\CastFORM\data\flutter_assets\fonts"
mkdir "C:\Program Files\CastFORM\data\flutter_assets\shaders"

copy setup.bat "C:\Program Files\CastFORM"
copy pdfium.dll "C:\Program Files\CastFORM"
copy printing_plugin.dll "C:\Program Files\CastFORM"
copy url_launcher_windows_plugin.dll "C:\Program Files\CastFORM"
copy CastFORM.exe "C:\Program Files\CastFORM"
copy flutter_windows.dll "C:\Program Files\CastFORM"

copy app.so "C:\Program Files\CastFORM\data"
copy icudtl.dat "C:\Program Files\CastFORM\data"
copy AssetManifest.json "C:\Program Files\CastFORM\data\flutter_assets"
copy FontManifest.json "C:\Program Files\CastFORM\data\flutter_assets"
copy NOTICES.Z "C:\Program Files\CastFORM\data\flutter_assets"
copy fonts\RobotoSlab-Regular.ttf "C:\Program Files\CastFORM\data\flutter_assets\assets\fonts"
copy pokemon_decklist_a4.webp "C:\Program Files\CastFORM\data\flutter_assets\assets\form_templates"
copy pokemon_decklist_letter.webp "C:\Program Files\CastFORM\data\flutter_assets\assets\form_templates"
copy MaterialIcons-Regular.otf "C:\Program Files\CastFORM\data\flutter_assets\fonts"
copy ink_sparkle.frag "C:\Program Files\CastFORM\data\flutter_assets\shaders"

@REM copy .\data\app.so "C:\Program Files\CastFORM\data"
@REM copy .\data\icudtl.dat "C:\Program Files\CastFORM\data"
@REM copy .\data\flutter_assets\AssetManifest.json "C:\Program Files\CastFORM\data\flutter_assets"
@REM copy .\data\flutter_assets\FontManifest.json "C:\Program Files\CastFORM\data\flutter_assets"
@REM copy .\data\flutter_assets\NOTICES.Z "C:\Program Files\CastFORM\data\flutter_assets"
@REM copy .\data\flutter_assets\assets\fonts\RobotoSlab-Regular.ttf "C:\Program Files\CastFORM\data\flutter_assets\assets\fonts"
@REM copy .\data\flutter_assets\assets\form_templates\pokemon_decklist_a4.webp "C:\Program Files\CastFORM\data\flutter_assets\assets\form_templates"
@REM copy .\data\flutter_assets\assets\form_templates\pokemon_decklist_letter.webp "C:\Program Files\CastFORM\data\flutter_assets\assets\form_templates"
@REM copy .\data\flutter_assets\fonts\MaterialIcons-Regular.otf "C:\Program Files\CastFORM\data\flutter_assets\fonts"
@REM copy .\data\flutter_assets\shaders\ink_sparkle.frag "C:\Program Files\CastFORM\data\flutter_assets\shaders"

copy msvcp140.dll "C:\Program Files\CastFORM"
copy vcruntime140.dll "C:\Program Files\CastFORM"
copy vcruntime140_1.dll "C:\Program Files\CastFORM"
