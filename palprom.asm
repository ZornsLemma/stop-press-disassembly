; Patch Stop Press ROMs into a 32K Computer Concepts-style PALPROM

osnewl = &ffe7
oswrch = &ffee
osbyte_osword_a = &ef
osbyte_osword_x = &f0
osbyte_osword_y = &f1
os_text_ptr = &f2

; Original ROM 1/2 becomes bank 1 in the PALPROM
org &8000
incbin "orig/stop-press-1.rom"
clear &8000, &c000

; We relocate the service handler to &8040 so it automatically triggers the switch point for bank 1 on entry.
; To avoid the switch point at &806x, we squeeze the code a bit, mainly by removing support for the auto-boot service entry, which just appears to print a vanity banner.

org &8003
    jmp service_handler_bank_1_switch

new_title = "AMX Stop Press 1.9 PAL"
COPYRIGHT_IN_HELP = FALSE
org &8007
    equb copyright - &8000
org &8009
.title
    equs new_title
.copyright
    equb 0, "(C) Tecnation 1984-1987"
    if COPYRIGHT_IN_HELP
        equb &0d, &0a
    endif
    equb 0
    ; Original service handler starts at &803b but ours has moved to &8040
    assert P% <= &8040

org &8040
l00f8 = &f8
service_handler_part_2 = &80ad
print_nul_terminated_string_at_yx = &b7c5
cb76b = &b76b
l0daa = &0daa
c808d = &808d
l0000 = 0
l0001 = 1
l0002 = 2
l0003 = 3
process_string = &be9f
.service_handler_bank_1_switch
    jsr &8060 ; chain to other bank service handler
    cmp #0
    beq rts
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
    jmp skip_8060
    assert P% <= &8060
    skipto &8060
    ; This code won't be used normally, but having this here might help testing. I think it means we can use this variant on ROM 1 in place of the original along with the original ROM 2, in order to test the new service handler is basically sound.
    rts
    skipto &8080
.skip_8060
    jsr print_nul_terminated_string_at_yx                             ; 8058: 20 c5 b7     ..
;    pla                                                               ; 805b: 68          h
;    pha                                                               ; 805c: 48          H
;    cmp #3                                                            ; 805d: c9 03       ..
;    beq c8076                                                         ; 805f: f0 15       ..
    ; TODO: This code could be removed (maybe not the jsr cb76b, but the code after it) now this is in a PALPROM and barring bugs you can't end up with only one of the ROMs installed.
    ldx #0                                                            ; 8061: a2 00       ..
    ldy #&5a ; 'Z'                                                    ; 8063: a0 5a       .Z
    jsr cb76b                                                         ; 8065: 20 6b b7     k.
    lda l0daa                                                         ; 8068: ad aa 0d    ...
    cmp #&a5                                                          ; 806b: c9 a5       ..
    beq c8076                                                         ; 806d: f0 07       ..
    ldx #<recheck                                                          ; 806f: a2 9a       ..
    ldy #>recheck                                                          ; 8071: a0 80       ..
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
     ;jmp c808d
    ;ldx #&20 ; ' '                                                    ; 808d: a2 20       .
    ;ldy #&80                                                          ; 808f: a0 80       ..
if COPYRIGHT_IN_HELP
    ldx #<(copyright+1)
    ldy #>(copyright+1)
    jsr print_nul_terminated_string_at_yx                             ; 8091: 20 c5 b7     ..
endif
.ply_plx_pla_rts
    pla                                                               ; 8094: 68          h
    tay                                                               ; 8095: a8          .
    pla                                                               ; 8096: 68          h
    tax                                                               ; 8097: aa          .
    pla                                                               ; 8098: 68          h
.rts
    rts                                                               ; 8099: 60          `
.recheck
    equs "RCR2", 0
    assert P% <= service_handler_part_2
    skipto service_handler_part_2
;.service_handler_part_2
    cmp #4                                                            ; 80ad: c9 04       ..
    bne ply_plx_pla_rts                                               ; 80af: d0 e3       ..
.service_command
    ldx #0                                                            ; 80b1: a2 00       ..
.loop_c80b3
    lda (os_text_ptr),y                                               ; 80b3: b1 f2       ..
    cmp process_string,x                                              ; 80b5: dd 9f be    ...
    bne ply_plx_pla_rts                                               ; 80b8: d0 da       ..
    iny                                                               ; 80ba: c8          .
    inx                                                               ; 80bb: e8          .
    cpx #8                                                            ; 80bc: e0 08       ..
    bne loop_c80b3                                                    ; 80be: d0 f3       ..
; Copy 10 pages from &8000 to &2600, which just fits in below mode 0 screen RAM at
; &3000.
    ;lda #&80                                                          ; 80c0: a9 80       ..
    lda #&81 ; we need to skip the &80xx switching zoe
    sta l0001                                                         ; 80c2: 85 01       ..
    ;lda #&26 ; '&'                                                    ; 80c4: a9 26       .&
    lda #&27 ; compensate for not copying page &80
    sta l0003                                                         ; 80c6: 85 03       ..
    lda #0                                                            ; 80c8: a9 00       ..
    sta l0000                                                         ; 80ca: 85 00       ..
    sta l0002                                                         ; 80cc: 85 02       ..
    ;ldx #&0a                                                          ; 80ce: a2 0a       ..
    ldx #9 ; compensate for not copying page &80
    assert P% == &80d0

; TODO: For now we assume that ROM 1's code will not touch the switch point at &BFCx which would switch in bank 0.

common_addresses_different_code = &bf90
org common_addresses_different_code
; TODO: Should prob use macros to simplify code and ensure these are "same" (except for bit address) in both banks
.xbrkv_handler_both_bank_1
    jmp xbrkv_handler_switch
.xevntv_handler_both_bank_1
    jmp xevntv_handler_bank_1
.xkeyv_handler_both_bank_1
    jmp xkeyv_handler_bank_1
    assert P% <= &bfa0
org &bfe0 ; bank 1 switching zone
.xevntv_handler_bank_1
    jsr xevntv_handler_switch
    rts
.xkeyv_handler_bank_1
    jsr xkeyv_handler_switch
    rts
xbrkv_handler = &b995
.xbrkv_handler_switch
    jmp xbrkv_handler
org &8137
    lda #<xbrkv_handler_both_bank_1
org &813c
    lda #>xbrkv_handler_both_bank_1

copyblock &8000, &c000, &4000
clear &8000, &c000

; Original ROM 2/2 becomes bank 0 in the PALPROM
org &8000
incbin "orig/stop-press-2.rom"
clear &8000, &c000

org &8003
    jmp service_handler_bank_0

; TODO: Factor this common block out into a macro?
org &8007
    equb copyright - &8000
org &8009
.title2
    equs new_title
.copyright2
    equb 0, "(C) Tecnation 1984-1987"
    ; equb &0d, &0a
    equb 0
    assert P% <= &803f

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

; We have some space here so let's identify this as a modern version to avoid any confusion.
    equs "Steve 2024 v0.0.1"
    assert P% <= &BFA0

org common_addresses_different_code
.xbrkv_handler_both_bank_0
    jmp xbrkv_handler_bank_0
.xevntv_handler_both_bank_0
    jmp xevntv_handler_switch
.xkeyv_handler_both_bank_0
    jmp xkeyv_handler_switch
    assert P% <= &bfa0
org &bfc0 ; bank 0 switching zone
.xbrkv_handler_bank_0
    jsr xbrkv_handler_switch
    rts
xkeyv_handler = &a9f9
xevntv_handler = &b1d1
.xkeyv_handler_switch
    jmp xkeyv_handler
.xevntv_handler_switch
    jmp xevntv_handler
.service_handler_bank_0
    jsr service_handler_bank_1_switch
    rts
org &aab7
    lda #<xkeyv_handler_both_bank_0
org &aabc
    lda #>xkeyv_handler_both_bank_0
org &ab1d
    lda #<xevntv_handler_both_bank_0
org &ab22
    lda #>xevntv_handler_both_bank_0

; TODO: Temporary hack to make the xevntv_handler a no-op
;org &b1d1
;    rts
if FALSE
; TODO: Temporary hack to never enable vsync event
org &ab2f
    nop:nop:nop
; TODO: Temporary hack to never install keyv handler
org &aa95
    rts
endif

copyblock &8000, &c000, &0000

; Make all the switching zones identical in both banks. This is probably over-zealous but it may be necessary where we start executing code in a switching zone for a few bytes, and it's simplest and safest just to do everything.
copyblock &4040, &4060, &0040
copyblock &7fa0, &7fc0, &3fa0
copyblock &7fe0, &8000, &3fe0
copyblock &0060, &0080, &4060
copyblock &3fc0, &3fe0, &7fc0

save &0000, &8000

; TODO: Should we tweak the headers so both banks have the same details? At the moment *ROMS tends to show the support ROM only, which is mildly confusing. While we're at it, it might be worth tweaking the name slightly to indicate this is a PALPROM release.

; TODO: Would this PALPROM work in a CC 64K or 128K bank? Would it be easy to make it work in one if not? We obviously don't need it, but this may increase flexibility. Looking at the MAME code, there are four switching zones (just one per bank) in a CC 64K PALPROM, at &BF80 onwards (32 bytes each). So it might be possible to do something like only use switching zones &BFC0 and &BFE0, and then a doubled-up 32K image of this PALPROM would probably work in a CC 64K bank. (We'd really only be using banks 2 and 3, but we'd need the doubling up so if bank 0 or 1 got selected by accident on power on, we'd have a valid ROM header etc until our service entry got called and triggered a switch to bank 2 or 3.)
