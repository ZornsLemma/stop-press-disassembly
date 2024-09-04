#!/bin/bash
set -e
export PYTHONPATH+=:$HOME/src/py8dis/py8dis

python3 stop-press-1.py > source/stop-press-1.asm
beebasm -o build/stop-press-1.rom -i source/stop-press-1.asm -v > build/stop-press-1.lst
cmp orig/stop-press-1.rom build/stop-press-1.rom || (echo stop-press-1.rom not rebuilt correctly; exit 1)

python3 stop-press-2.py > source/stop-press-2.asm
beebasm -o build/stop-press-2.rom -i source/stop-press-2.asm -v > build/stop-press-2.lst
cmp orig/stop-press-2.rom build/stop-press-2.rom || (echo stop-press-2.rom not rebuilt correctly; exit 1)
