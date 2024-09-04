; Patch Stop Press ROMs into a 32K Computer Concepts-style PALPROM


; Original ROM 1/2 becomes bank 1 in the PALPROM
org &8000
incbin "orig/stop-press-1.rom"

copyblock &8000, &c000, &4000
clear &8000, &c000

; Original ROM 2/2 becomes bank 0 in the PALPROM
org &8000
incbin "orig/stop-press-2.rom"

copyblock &8000, &c000, &0000

save &0000, &8000
