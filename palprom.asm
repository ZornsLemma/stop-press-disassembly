; Patch Stop Press ROMs into a 32K Computer Concepts-style PALPROM

title = &8009
osnewl = &ffe7
oswrch = &ffee

; Original ROM 1/2 becomes bank 1 in the PALPROM
org &8000
incbin "orig/stop-press-1.rom"
clear &8000, &c000

; We relocate the service handler to &8040 so it automatically triggers the switch point for bank 1 on entry.
; To avoid the switch point at &806x, we squeeze the code a bit, mainly by removing support for the auto-boot service entry, which just appears to print a vanity banner.

org &8003
    jmp service_handler

org &8040
l00f8 = &f8
service_handler_part_2 = &80ad
print_nul_terminated_string_at_yx = &b7c5
cb76b = &b76b
l0daa = &0daa
c808d = &808d
.service_handler
    jsr &8060 ; chain to other bank service handler
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
;    tax                                                               ; 804c: aa          .
;    lda #&0a                                                          ; 804d: a9 0a       ..
;    jsr oswrch                                                        ; 804f: 20 ee ff     ..            ; Write character 10
;    txa                                                               ; 8052: 8a          .
    jsr osnewl
;.service_auto_boot
;    pha                                                               ; 8053: 48          H
    ldx #<title                                                       ; 8054: a2 09       ..
    ldy #>title                                                       ; 8056: a0 80       ..
    jsr print_nul_terminated_string_at_yx                             ; 8058: 20 c5 b7     ..
;    pla                                                               ; 805b: 68          h
;    pha                                                               ; 805c: 48          H
;    cmp #3                                                            ; 805d: c9 03       ..
;    beq c8076                                                         ; 805f: f0 15       ..
     jmp skip_8060
    assert P% <= &8060
    skipto &8060
    ; This code won't be used normally, but having this here might help testing.
    rts
    skipto &8070
.skip_8060
    ldx #0                                                            ; 8061: a2 00       ..
    ldy #&5a ; 'Z'                                                    ; 8063: a0 5a       .Z
    jsr cb76b                                                         ; 8065: 20 6b b7     k.
    lda l0daa                                                         ; 8068: ad aa 0d    ...
    cmp #&a5                                                          ; 806b: c9 a5       ..
    beq c8076                                                         ; 806d: f0 07       ..
    ldx #&9a                                                          ; 806f: a2 9a       ..
    ldy #&80                                                          ; 8071: a0 80       ..
    jsr print_nul_terminated_string_at_yx                             ; 8073: 20 c5 b7     ..
.c8076
;    lda #&0d                                                          ; 8076: a9 0d       ..
;    jsr oswrch                                                        ; 8078: 20 ee ff     ..            ; Write character 13
;    lda #&0a                                                          ; 807b: a9 0a       ..
;    jsr oswrch                                                        ; 807d: 20 ee ff     ..            ; Write character 10
    jsr osnewl
;    pla                                                               ; 8080: 68          h
;    cmp #9                                                            ; 8081: c9 09       ..
;    beq c808d                                                         ; 8083: f0 08       ..
;    lda #&0a                                                          ; 8085: a9 0a       ..
;    jsr oswrch                                                        ; 8087: 20 ee ff     ..            ; Write character 10
;    jmp ply_plx_pla_rts                                               ; 808a: 4c 94 80    L..
    jmp c808d
    assert P% <= c808d

; TODO: For now we assume that ROM 1's code will not touch the switch point at &BFCx which would switch in bank 0.

; TODO: WE NEED TO CHAIN THE TWO SERVICE HANDLERS TOGETHER!

copyblock &8000, &c000, &4000
clear &8000, &c000

; Original ROM 2/2 becomes bank 0 in the PALPROM
org &8000
incbin "orig/stop-press-2.rom"

copyblock &8000, &c000, &0000

save &0000, &8000
