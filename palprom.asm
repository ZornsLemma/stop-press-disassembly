; Patch Stop Press ROMs into a 32K Computer Concepts-style PALPROM

title = &8009
oswrch = &ffee

; Original ROM 1/2 becomes bank 1 in the PALPROM
org &8000
incbin "orig/stop-press-1.rom"
clear &8000, &c000

org &8003
    jmp service_handler

org &8040
l00f8 = &f8
service_handler_part_2 = &80ad
print_nul_terminated_string_at_yx = &b7c5
.service_handler
    sta l00f8                                                         ; 803b: 85 f8       ..
    pha                                                               ; 803d: 48          H
    txa                                                               ; 803e: 8a          .
    pha                                                               ; 803f: 48          H
    tya                                                               ; 8040: 98          .
    pha                                                               ; 8041: 48          H
    lda l00f8                                                         ; 8042: a5 f8       ..
;    cmp #3                                                            ; 8044: c9 03       ..
;    beq service_auto_boot                                             ; 8046: f0 0b       ..
    cmp #9                                                            ; 8048: c9 09       ..
    bne service_handler_part_2                                        ; 804a: d0 61       .a
.service_help
    tax                                                               ; 804c: aa          .
    lda #&0a                                                          ; 804d: a9 0a       ..
    jsr oswrch                                                        ; 804f: 20 ee ff     ..            ; Write character 10
    txa                                                               ; 8052: 8a          .
.service_auto_boot
    pha                                                               ; 8053: 48          H
    ldx #<title                                                       ; 8054: a2 09       ..
    ldy #>title                                                       ; 8056: a0 80       ..
    jsr print_nul_terminated_string_at_yx                             ; 8058: 20 c5 b7     ..
    pla                                                               ; 805b: 68          h
    pha                                                               ; 805c: 48          H
;    cmp #3                                                            ; 805d: c9 03       ..
;    beq c8076                                                         ; 805f: f0 15       ..             ; always branch?
    jmp &8076
    print P%
    assert P% < &8060

copyblock &8000, &c000, &4000
clear &8000, &c000

; Original ROM 2/2 becomes bank 0 in the PALPROM
org &8000
incbin "orig/stop-press-2.rom"

copyblock &8000, &c000, &0000

save &0000, &8000
