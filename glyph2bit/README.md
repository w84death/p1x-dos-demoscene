# GLYPH-2-BIT

Converts 8x8 PNG images to bit representation for the engine.

## Fonts
* BIOS - recreated from [https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_bios](int10h.org/oldschool-pc-fonts)


## Install
```
$ python -m venv venv
$ source venv/bin/activate
$ pip install pillow
```

## Usage
```
$ python3 glyph2bit.py bitmaps/BIOS/
```

It will generate font.h file for you.

Images numbers coresponds to the INDEX characters in ASCII order: "!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ".
