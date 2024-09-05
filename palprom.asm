; Patch Stop Press ROMs into a 32K Computer Concepts-style PALPROM

title = &8009
osnewl = &ffe7
oswrch = &ffee
osbyte_osword_a = &ef
osbyte_osword_x = &f0
osbyte_osword_y = &f1

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
    ; This code won't be used normally, but having this here might help testing. I think it means we can use this variant on ROM 1 in place of the original along with the original ROM 2, in order to test the new service handler is basically sound.
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

copyblock &8000, &c000, &4000
clear &8000, &c000

; Original ROM 2/2 becomes bank 0 in the PALPROM
org &8000
incbin "orig/stop-press-2.rom"
clear &8000, &c000

; Both banks share the same service handler at a switch address for bank 1.
org &8003
    jmp service_handler

org &8060
    jmp rom_2_new_service_handler

org &b500
.pla_rts1
    pla                                                               ; 803f: 68          h
.rts1
    rts                                                               ; 8040: 60          `

service_handler_subroutine = &a800
jmp_a_minus_1_th_entry_in_table_at_yx = &8317
our_osword1 = &35
our_osword_1_x0_handler = &80a0
our_osword_1_x1_handler = &810f
our_osword_1_x2_handler = &817c
our_osword_1_x3_handler = &81d8
our_osword_1_x4_handler = &828f
our_osword_1_x5_handler = &8296
our_osword_1_x6_handler = &82cb
our_osword_1_x7_handler = &82e7
our_osword_1_x8_handler = &8392
our_osword_1_x9_handler = &8264
our_osword_1_x10_handler = &84ae
our_osword_1_x11_handler = &868b
our_osword_1_x12_handler = &875d
our_osword_1_x13_handler = &899d
our_osword_1_x14_handler = &8c89
our_osword_1_x15_handler = &8cb6
our_osword_1_x16_handler = &8cf0
our_osword_1_x17_handler = &8610
our_osword_1_x18_handler = &8da6
our_osword_1_x19_handler = &922d
our_osword_1_x20_handler = &92d9
our_osword_1_x21_handler = &944e
our_osword_1_x22_handler = &9555
our_osword_1_x23_handler = &8661
our_osword_1_x24_handler = &9578
our_osword_1_x25_handler = &9584
.rom_2_new_service_handler
    jsr service_handler_subroutine                                    ; 8041: 20 00 a8     ..
    cmp #8                                                            ; 8044: c9 08       ..
    bne rts1                                                          ; 8046: d0 f8       ..
    pha                                                               ; 8048: 48          H
    lda osbyte_osword_a                                               ; 8049: a5 ef       ..
    cmp #our_osword1                                                  ; 804b: c9 35       .5
    bne pla_rts1                                                      ; 804d: d0 f0       ..
    lda osbyte_osword_x                                               ; 804f: a5 f0       ..
    beq c8061                                                         ; 8051: f0 0e       ..
    pla                                                               ; 8053: 68          h
    cli                                                               ; 8054: 58          X
    lda osbyte_osword_x                                               ; 8055: a5 f0       ..
    ldx #<our_osword_1_x_handler_table                                ; 8057: a2 6c       .l
    ldy #>our_osword_1_x_handler_table                                ; 8059: a0 80       ..
    jsr jmp_a_minus_1_th_entry_in_table_at_yx                         ; 805b: 20 17 83     ..
    lda #0                                                            ; 805e: a9 00       ..
    rts                                                               ; 8060: 60          `

.c8061
    lda osbyte_osword_y                                               ; 8061: a5 f1       ..
    eor #&ff                                                          ; 8063: 49 ff       I.
    sta l0daa                                                         ; 8065: 8d aa 0d    ...
    pla                                                               ; 8068: 68          h
    lda #0                                                            ; 8069: a9 00       ..
    rts                                                               ; 806b: 60          `

.our_osword_1_x_handler_table
    equw our_osword_1_x0_handler                                      ; 806c: a0 80       ..
    equw our_osword_1_x1_handler                                      ; 806e: 0f 81       ..
    equw our_osword_1_x2_handler                                      ; 8070: 7c 81       |.
    equw our_osword_1_x3_handler                                      ; 8072: d8 81       ..
    equw our_osword_1_x4_handler                                      ; 8074: 8f 82       ..
    equw our_osword_1_x5_handler                                      ; 8076: 96 82       ..
    equw our_osword_1_x6_handler                                      ; 8078: cb 82       ..
    equw our_osword_1_x7_handler                                      ; 807a: e7 82       ..
    equw our_osword_1_x8_handler                                      ; 807c: 92 83       ..
    equw our_osword_1_x9_handler                                      ; 807e: 64 82       d.
    equw our_osword_1_x10_handler                                     ; 8080: ae 84       ..
    equw our_osword_1_x11_handler                                     ; 8082: 8b 86       ..
    equw our_osword_1_x12_handler                                     ; 8084: 5d 87       ].
    equw our_osword_1_x13_handler                                     ; 8086: 9d 89       ..
    equw our_osword_1_x14_handler                                     ; 8088: 89 8c       ..
    equw our_osword_1_x15_handler                                     ; 808a: b6 8c       ..
    equw our_osword_1_x16_handler                                     ; 808c: f0 8c       ..
    equw our_osword_1_x17_handler                                     ; 808e: 10 86       ..
    equw our_osword_1_x18_handler                                     ; 8090: a6 8d       ..
    equw our_osword_1_x19_handler                                     ; 8092: 2d 92       -.
    equw our_osword_1_x20_handler                                     ; 8094: d9 92       ..
    equw our_osword_1_x21_handler                                     ; 8096: 4e 94       N.
    equw our_osword_1_x22_handler                                     ; 8098: 55 95       U.
    equw our_osword_1_x23_handler                                     ; 809a: 61 86       a.
    equw our_osword_1_x24_handler                                     ; 809c: 78 95       x.
    equw our_osword_1_x25_handler                                     ; 809e: 84 95       ..
    assert P% <= &BFA0

copyblock &8000, &c000, &0000

save &0000, &8000
