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
$ python3 glyph2bit.py bitmaps/BIOS/D.png


0xF8, 0x6C, 0x66, 0x66, 0x66, 0x6C, 0xF8, 0x00,
```

Copy values to the engine font.h file.

```
{0xF8, 0x6C, 0x66, 0x66, 0x66, 0x6C, 0xF8, 0x00}, /* D */
```
