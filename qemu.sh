#!/bin/bash
qemu-system-i386 -cpu 486 -m 32M -audiodev pa,id=audio0 -machine pcspk-audiodev=audio0 -hda freedos-dev.img -fda p1x-dos-intro-01.img 
