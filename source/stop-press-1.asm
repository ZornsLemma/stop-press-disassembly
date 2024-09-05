; Constants
osbyte_acknowledge_escape               = 126
osbyte_flush_buffer_class               = 15
osbyte_inkey                            = 129
osbyte_read_rom_ptr_table_low           = 168
osbyte_read_write_escape_break_effect   = 200
osfind_close                            = 0
osword_read_char                        = 10
xbrkv_offset                            = 3

; Memory locations
l0000       = &0000
l0001       = &0001
l0002       = &0002
l0003       = &0003
l0004       = &0004
l0005       = &0005
l0006       = &0006
l0007       = &0007
l0008       = &0008
l0009       = &0009
l000a       = &000a
l000b       = &000b
l000c       = &000c
l000d       = &000d
l000e       = &000e
l000f       = &000f
l0010       = &0010
l0011       = &0011
l0012       = &0012
l0013       = &0013
l0014       = &0014
l0019       = &0019
l001a       = &001a
l001b       = &001b
l001c       = &001c
l001d       = &001d
l001e       = &001e
l001f       = &001f
l0023       = &0023
l0024       = &0024
l0025       = &0025
l0026       = &0026
l0027       = &0027
l0028       = &0028
l0029       = &0029
l002a       = &002a
l0033       = &0033
l0034       = &0034
l0035       = &0035
l0036       = &0036
l0037       = &0037
l0038       = &0038
l0043       = &0043
l0044       = &0044
l0045       = &0045
l0046       = &0046
l0047       = &0047
l0048       = &0048
l0049       = &0049
l004a       = &004a
l004b       = &004b
l004c       = &004c
l004d       = &004d
l004e       = &004e
l004f       = &004f
l0056       = &0056
l0057       = &0057
l0058       = &0058
l005b       = &005b
l005c       = &005c
l005d       = &005d
l005e       = &005e
l005f       = &005f
os_text_ptr = &00f2
romsel_copy = &00f4
l00f8       = &00f8
l00fd       = &00fd
l00fe       = &00fe
l0100       = &0100
brkv        = &0202
l05af       = &05af
l08ff       = &08ff
l0900       = &0900
l0901       = &0901
l09e0       = &09e0
l0a00       = &0a00
l0a01       = &0a01
l0a02       = &0a02
l0daa       = &0daa
xkeyv       = &0ddb
l1900       = &1900
l1901       = &1901
l1902       = &1902
l1903       = &1903
l1904       = &1904
l1905       = &1905
l1906       = &1906
l1907       = &1907
l1908       = &1908
l1909       = &1909
l1911       = &1911
l1912       = &1912
l1913       = &1913
l1915       = &1915
l1916       = &1916
l1917       = &1917
l1918       = &1918
l1919       = &1919
l191a       = &191a
l191b       = &191b
l191c       = &191c
l191d       = &191d
l191e       = &191e
l191f       = &191f
l1920       = &1920
l1921       = &1921
l1922       = &1922
l1923       = &1923
l1926       = &1926
l1927       = &1927
l1928       = &1928
l1929       = &1929
l192a       = &192a
l192b       = &192b
l192d       = &192d
l1940       = &1940
l1942       = &1942
l1944       = &1944
l194e       = &194e
l194f       = &194f
l1950       = &1950
l1951       = &1951
l1952       = &1952
l1953       = &1953
l1958       = &1958
l1959       = &1959
l195a       = &195a
l195b       = &195b
l195c       = &195c
l195d       = &195d
l195e       = &195e
l195f       = &195f
l1960       = &1960
l1961       = &1961
l1962       = &1962
l1966       = &1966
l1967       = &1967
l1969       = &1969
l196a       = &196a
l196b       = &196b
l196c       = &196c
l196d       = &196d
l196e       = &196e
l196f       = &196f
l1973       = &1973
l1976       = &1976
l1978       = &1978
l1979       = &1979
l197b       = &197b
l199d       = &199d
l1a00       = &1a00
l2600       = &2600
l2601       = &2601
l2707       = &2707
l2800       = &2800
l4885       = &4885
l4f60       = &4f60
ldbb2       = &dbb2
le2f1       = &e2f1
osfind      = &ffce
osbget      = &ffd7
oswrch      = &ffee
osword      = &fff1
osbyte      = &fff4
oscli       = &fff7

    org &8000

; Sideways ROM header
.rom_header
.language_entry
.pydis_start
    equb 0, 0, 0                                                      ; 8000: 00 00 00    ...

.service_entry
    jmp service_handler                                               ; 8003: 4c 3b 80    L;.

.rom_type
    equb &82                                                          ; 8006: 82          .
.copyright_offset
    equb copyright - rom_header                                       ; 8007: 1f          .
.binary_version
    equb 0                                                            ; 8008: 00          .
.title
    equs "AMX STOP PRESS 1.9    "                                     ; 8009: 41 4d 58... AMX
.copyright
    equb 0                                                            ; 801f: 00          .
.l8020
    equs "(C) Tecnation 1984-1987 ", &0d, &0a, 0                      ; 8020: 28 43 29... (C)

.service_handler
    sta l00f8                                                         ; 803b: 85 f8       ..
    pha                                                               ; 803d: 48          H
    txa                                                               ; 803e: 8a          .
    pha                                                               ; 803f: 48          H
    tya                                                               ; 8040: 98          .
    pha                                                               ; 8041: 48          H
    lda l00f8                                                         ; 8042: a5 f8       ..
    cmp #3                                                            ; 8044: c9 03       ..
    beq service_auto_boot_and_help                                    ; 8046: f0 0b       ..
    cmp #9                                                            ; 8048: c9 09       ..
    bne service_handler_part_2                                        ; 804a: d0 61       .a
.service_help
    tax                                                               ; 804c: aa          .
    lda #&0a                                                          ; 804d: a9 0a       ..
    jsr oswrch                                                        ; 804f: 20 ee ff     ..            ; Write character 10
    txa                                                               ; 8052: 8a          .
.service_auto_boot_and_help
    pha                                                               ; 8053: 48          H
    ldx #<(title)                                                     ; 8054: a2 09       ..
    ldy #>(title)                                                     ; 8056: a0 80       ..
    jsr print_nul_terminated_string_at_yx                             ; 8058: 20 c5 b7     ..
    pla                                                               ; 805b: 68          h
    pha                                                               ; 805c: 48          H
    cmp #3                                                            ; 805d: c9 03       ..
    beq c8076                                                         ; 805f: f0 15       ..
    ldx #0                                                            ; 8061: a2 00       ..
    ldy #&5a ; 'Z'                                                    ; 8063: a0 5a       .Z
    jsr do_our_osword_1                                               ; 8065: 20 6b b7     k.
    lda l0daa                                                         ; 8068: ad aa 0d    ...
    cmp #&a5                                                          ; 806b: c9 a5       ..
    beq c8076                                                         ; 806d: f0 07       ..
    ldx #<(string_nul_809a)                                           ; 806f: a2 9a       ..
    ldy #>(string_nul_809a)                                           ; 8071: a0 80       ..
    jsr print_nul_terminated_string_at_yx                             ; 8073: 20 c5 b7     ..
.c8076
    lda #&0d                                                          ; 8076: a9 0d       ..
    jsr oswrch                                                        ; 8078: 20 ee ff     ..            ; Write character 13
    lda #&0a                                                          ; 807b: a9 0a       ..
    jsr oswrch                                                        ; 807d: 20 ee ff     ..            ; Write character 10
    pla                                                               ; 8080: 68          h
    cmp #9                                                            ; 8081: c9 09       ..
    beq c808d                                                         ; 8083: f0 08       ..
    lda #&0a                                                          ; 8085: a9 0a       ..
    jsr oswrch                                                        ; 8087: 20 ee ff     ..            ; Write character 10
    jmp ply_plx_pla_rts                                               ; 808a: 4c 94 80    L..

.c808d
    ldx #<(l8020)                                                     ; 808d: a2 20       .
    ldy #>(l8020)                                                     ; 808f: a0 80       ..
    jsr print_nul_terminated_string_at_yx                             ; 8091: 20 c5 b7     ..
.ply_plx_pla_rts
    pla                                                               ; 8094: 68          h
    tay                                                               ; 8095: a8          .
    pla                                                               ; 8096: 68          h
    tax                                                               ; 8097: aa          .
    pla                                                               ; 8098: 68          h
    rts                                                               ; 8099: 60          `

.string_nul_809a
    equs " -", &81, &88, "Re-check ROM 2", 0                          ; 809a: 20 2d 81...  -.

.service_handler_part_2
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
    lda #&80                                                          ; 80c0: a9 80       ..
    sta l0001                                                         ; 80c2: 85 01       ..
    lda #&26 ; '&'                                                    ; 80c4: a9 26       .&
    sta l0003                                                         ; 80c6: 85 03       ..
    lda #0                                                            ; 80c8: a9 00       ..
    sta l0000                                                         ; 80ca: 85 00       ..
    sta l0002                                                         ; 80cc: 85 02       ..
    ldx #&0a                                                          ; 80ce: a2 0a       ..
    ldy #0                                                            ; 80d0: a0 00       ..
.c80d2
    lda (l0000),y                                                     ; 80d2: b1 00       ..
    sta (l0002),y                                                     ; 80d4: 91 02       ..
    dey                                                               ; 80d6: 88          .
    bne c80d2                                                         ; 80d7: d0 f9       ..
    inc l0001                                                         ; 80d9: e6 01       ..
    inc l0003                                                         ; 80db: e6 03       ..
    dex                                                               ; 80dd: ca          .
    bne c80d2                                                         ; 80de: d0 f2       ..
    ldx #&12                                                          ; 80e0: a2 12       ..
    jsr do_our_osword_1                                               ; 80e2: 20 6b b7     k.
    lda #&3a ; ':'                                                    ; 80e5: a9 3a       .:
    sta l1940                                                         ; 80e7: 8d 40 19    .@.
    lda #&2e ; '.'                                                    ; 80ea: a9 2e       ..
    sta l1942                                                         ; 80ec: 8d 42 19    .B.
    sta l1944                                                         ; 80ef: 8d 44 19    .D.
    lda #0                                                            ; 80f2: a9 00       ..
    sta l191a                                                         ; 80f4: 8d 1a 19    ...
    sta l191b                                                         ; 80f7: 8d 1b 19    ...
    ldy #&0a                                                          ; 80fa: a0 0a       ..
    lda #0                                                            ; 80fc: a9 00       ..
.loop_c80fe
    sta l1921,y                                                       ; 80fe: 99 21 19    .!.
    dey                                                               ; 8101: 88          .
    bpl loop_c80fe                                                    ; 8102: 10 fa       ..
    lda #&26 ; '&'                                                    ; 8104: a9 26       .&
    sta l1923                                                         ; 8106: 8d 23 19    .#.
    lda #0                                                            ; 8109: a9 00       ..
    sta l1922                                                         ; 810b: 8d 22 19    .".
    lda #3                                                            ; 810e: a9 03       ..
    sta l1926                                                         ; 8110: 8d 26 19    .&.
    ldy #&0a                                                          ; 8113: a0 0a       ..
    lda #0                                                            ; 8115: a9 00       ..
.loop_c8117
    sta l192d,y                                                       ; 8117: 99 2d 19    .-.
    dey                                                               ; 811a: 88          .
    bpl loop_c8117                                                    ; 811b: 10 fa       ..
    lda #&53 ; 'S'                                                    ; 811d: a9 53       .S
    sta l1927                                                         ; 811f: 8d 27 19    .'.
    jsr copy_data_to_1900_and_zero_l1911                              ; 8122: 20 4d b1     M.
    jsr do_our_osword_1_x_10                                          ; 8125: 20 19 a9     ..
    lda #osbyte_read_rom_ptr_table_low                                ; 8128: a9 a8       ..
    ldx #0                                                            ; 812a: a2 00       ..
    ldy #&ff                                                          ; 812c: a0 ff       ..
    jsr osbyte                                                        ; 812e: 20 f4 ff     ..            ; Read address of ROM pointer table
    stx l0047                                                         ; 8131: 86 47       .G             ; X=value of address of ROM pointer table (low byte)
    sty l0048                                                         ; 8133: 84 48       .H             ; Y=value of address of ROM pointer table (high byte)
    ldy #xbrkv_offset                                                 ; 8135: a0 03       ..
    lda #<xbrkv_handler                                               ; 8137: a9 95       ..
    sta (l0047),y                                                     ; 8139: 91 47       .G
    iny                                                               ; 813b: c8          .
    lda #>xbrkv_handler                                               ; 813c: a9 b9       ..
    sta (l0047),y                                                     ; 813e: 91 47       .G
    iny                                                               ; 8140: c8          .
    lda romsel_copy                                                   ; 8141: a5 f4       ..
    sta (l0047),y                                                     ; 8143: 91 47       .G
    lda #3                                                            ; 8145: a9 03       ..
    sta brkv                                                          ; 8147: 8d 02 02    ...
    lda #&ff                                                          ; 814a: a9 ff       ..
    sta brkv+1                                                        ; 814c: 8d 03 02    ...
    pla                                                               ; 814f: 68          h
    pla                                                               ; 8150: 68          h
    pla                                                               ; 8151: 68          h
    lda #&2a ; '*'                                                    ; 8152: a9 2a       .*
    sta l192a                                                         ; 8154: 8d 2a 19    .*.
    lda #1                                                            ; 8157: a9 01       ..
    sta l1979                                                         ; 8159: 8d 79 19    .y.
    ldy #&0c                                                          ; 815c: a0 0c       ..
    jsr sub_cbe18                                                     ; 815e: 20 18 be     ..
.loop_c8161
    jsr cb85c                                                         ; 8161: 20 5c b8     \.
    bcs loop_c8161                                                    ; 8164: b0 fb       ..
    jsr sub_cb854                                                     ; 8166: 20 54 b8     T.
    jsr sub_cbe1d                                                     ; 8169: 20 1d be     ..
.c816c
    ldx #<(stringnbf2d)                                               ; 816c: a2 2d       .-
    ldy #>(stringnbf2d)                                               ; 816e: a0 bf       ..
    jsr write_stringn_at_yx                                           ; 8170: 20 04 be     ..
    ldy #&12                                                          ; 8173: a0 12       ..
    jsr do_our_osword_1_x_4                                           ; 8175: 20 e3 bd     ..
.c8178
    jsr c830b                                                         ; 8178: 20 0b 83     ..
    cpy #1                                                            ; 817b: c0 01       ..
    bne c8178                                                         ; 817d: d0 f9       ..
    cpx #5                                                            ; 817f: e0 05       ..
    beq c8178                                                         ; 8181: f0 f5       ..
    txa                                                               ; 8183: 8a          .
    dex                                                               ; 8184: ca          .
    stx l191e                                                         ; 8185: 8e 1e 19    ...
    stx l1921                                                         ; 8188: 8e 21 19    .!.
    tay                                                               ; 818b: a8          .
    jsr do_our_osword_1_x_3                                           ; 818c: 20 de bd     ..
    lda #&53 ; 'S'                                                    ; 818f: a9 53       .S
    sta l1927                                                         ; 8191: 8d 27 19    .'.
    lda #0                                                            ; 8194: a9 00       ..
    sta l1928                                                         ; 8196: 8d 28 19    .(.
    sta l1929                                                         ; 8199: 8d 29 19    .).
    lda #&26 ; '&'                                                    ; 819c: a9 26       .&
    sta l1923                                                         ; 819e: 8d 23 19    .#.
    lda #0                                                            ; 81a1: a9 00       ..
    sta l1922                                                         ; 81a3: 8d 22 19    .".
    jsr sub_cb8d9                                                     ; 81a6: 20 d9 b8     ..
    lda l2600                                                         ; 81a9: ad 00 26    ..&
    cmp #&81                                                          ; 81ac: c9 81       ..
    bne c816c                                                         ; 81ae: d0 bc       ..
    lda l2601                                                         ; 81b0: ad 01 26    ..&
    cmp #&50 ; 'P'                                                    ; 81b3: c9 50       .P
    bne c816c                                                         ; 81b5: d0 b5       ..
    jsr sub_cb877                                                     ; 81b7: 20 77 b8     w.
    ldy #1                                                            ; 81ba: a0 01       ..
    jsr sub_cb754                                                     ; 81bc: 20 54 b7     T.
    lda l2707                                                         ; 81bf: ad 07 27    ..'
    and #&30 ; '0'                                                    ; 81c2: 29 30       )0
    lsr a                                                             ; 81c4: 4a          J
    lsr a                                                             ; 81c5: 4a          J
    lsr a                                                             ; 81c6: 4a          J
    sta l0023                                                         ; 81c7: 85 23       .#
    lda #1                                                            ; 81c9: a9 01       ..
    sta l001f                                                         ; 81cb: 85 1f       ..
    lda #0                                                            ; 81cd: a9 00       ..
    sta l0004                                                         ; 81cf: 85 04       ..
    lda #&28 ; '('                                                    ; 81d1: a9 28       .(
    sta l0005                                                         ; 81d3: 85 05       ..
.c81d5
    lda #&1f                                                          ; 81d5: a9 1f       ..
    jsr oswrch                                                        ; 81d7: 20 ee ff     ..            ; Write character 31
    lda #1                                                            ; 81da: a9 01       ..
    jsr oswrch                                                        ; 81dc: 20 ee ff     ..            ; Write character 1
    lda l001f                                                         ; 81df: a5 1f       ..
    jsr oswrch                                                        ; 81e1: 20 ee ff     ..            ; Write character
    ldx #&10                                                          ; 81e4: a2 10       ..
    ldy #0                                                            ; 81e6: a0 00       ..
    jsr cbe0e                                                         ; 81e8: 20 0e be     ..
    jsr sub_cbe5f                                                     ; 81eb: 20 5f be     _.
    lda #&2d ; '-'                                                    ; 81ee: a9 2d       .-
    jsr oswrch                                                        ; 81f0: 20 ee ff     ..            ; Write character 45
    jsr sub_cbe5f                                                     ; 81f3: 20 5f be     _.
    ldx #&10                                                          ; 81f6: a2 10       ..
    ldy #&10                                                          ; 81f8: a0 10       ..
    jsr cbe0e                                                         ; 81fa: 20 0e be     ..
    clc                                                               ; 81fd: 18          .
    lda l0004                                                         ; 81fe: a5 04       ..
    adc #&20 ; ' '                                                    ; 8200: 69 20       i
    sta l0004                                                         ; 8202: 85 04       ..
    inc l001f                                                         ; 8204: e6 1f       ..
    inc l001f                                                         ; 8206: e6 1f       ..
    dec l0023                                                         ; 8208: c6 23       .#
    bne c81d5                                                         ; 820a: d0 c9       ..
.c820c
    jsr sub_cbe32                                                     ; 820c: 20 32 be     2.
    jsr do_our_osword_2_yx_24_and_postprocess                         ; 820f: 20 26 b9     &.
    lda l002a                                                         ; 8212: a5 2a       .*
    and #&80                                                          ; 8214: 29 80       ).
    bne c821e                                                         ; 8216: d0 06       ..
    jsr sub_cbe1d                                                     ; 8218: 20 1d be     ..
    jmp c816c                                                         ; 821b: 4c 6c 81    Ll.

.c821e
    lda l002a                                                         ; 821e: a5 2a       .*
    and #&20 ; ' '                                                    ; 8220: 29 20       )
    bne c820c                                                         ; 8222: d0 e8       ..
    jsr sub_cbe1d                                                     ; 8224: 20 1d be     ..
    lda l0029                                                         ; 8227: a5 29       .)
    and #1                                                            ; 8229: 29 01       ).
    bne c820c                                                         ; 822b: d0 df       ..
    lda l0029                                                         ; 822d: a5 29       .)
    sec                                                               ; 822f: 38          8
    sbc #9                                                            ; 8230: e9 09       ..
    bcc c820c                                                         ; 8232: 90 d8       ..
    sta l0029                                                         ; 8234: 85 29       .)
    sbc #8                                                            ; 8236: e9 08       ..
    bcs c820c                                                         ; 8238: b0 d2       ..
    lsr l0029                                                         ; 823a: 46 29       F)
    lda #1                                                            ; 823c: a9 01       ..
    ldx l0029                                                         ; 823e: a6 29       .)
.loop_c8240
    clc                                                               ; 8240: 18          .
    adc #&13                                                          ; 8241: 69 13       i.
    dex                                                               ; 8243: ca          .
    bne loop_c8240                                                    ; 8244: d0 fa       ..
    sta l1920                                                         ; 8246: 8d 20 19    . .
    sta l191f                                                         ; 8249: 8d 1f 19    ...
    sta l1928                                                         ; 824c: 8d 28 19    .(.
    lda #0                                                            ; 824f: a9 00       ..
    sta l1979                                                         ; 8251: 8d 79 19    .y.
    lda l0029                                                         ; 8254: a5 29       .)
    asl a                                                             ; 8256: 0a          .
    asl a                                                             ; 8257: 0a          .
    asl a                                                             ; 8258: 0a          .
    asl a                                                             ; 8259: 0a          .
    asl a                                                             ; 825a: 0a          .
    tay                                                               ; 825b: a8          .
    ldx #0                                                            ; 825c: a2 00       ..
.loop_c825e
    lda l2800,y                                                       ; 825e: b9 00 28    ..(
    sta l199d,x                                                       ; 8261: 9d 9d 19    ...
    iny                                                               ; 8264: c8          .
    inx                                                               ; 8265: e8          .
    cpx #&20 ; ' '                                                    ; 8266: e0 20       .
    bne loop_c825e                                                    ; 8268: d0 f4       ..
    dex                                                               ; 826a: ca          .
    dex                                                               ; 826b: ca          .
    stx l005d                                                         ; 826c: 86 5d       .]
    jsr do_our_osword_1_x_5                                           ; 826e: 20 e8 bd     ..
    lda #7                                                            ; 8271: a9 07       ..
    sta l001f                                                         ; 8273: 85 1f       ..
    lda #&37 ; '7'                                                    ; 8275: a9 37       .7
    sta l0009                                                         ; 8277: 85 09       ..
    lda #&98                                                          ; 8279: a9 98       ..
    sta l0008                                                         ; 827b: 85 08       ..
.c827d
    lda #&26 ; '&'                                                    ; 827d: a9 26       .&
    sta l000d                                                         ; 827f: 85 0d       ..
    lda #&18                                                          ; 8281: a9 18       ..
    sta l000c                                                         ; 8283: 85 0c       ..
    jsr sub_cb8d9                                                     ; 8285: 20 d9 b8     ..
    lda #4                                                            ; 8288: a9 04       ..
    sta l0023                                                         ; 828a: 85 23       .#
.c828c
    ldx #&48 ; 'H'                                                    ; 828c: a2 48       .H
.c828e
    ldy #7                                                            ; 828e: a0 07       ..
.loop_c8290
    lda (l000c),y                                                     ; 8290: b1 0c       ..
    sta (l0008),y                                                     ; 8292: 91 08       ..
    dey                                                               ; 8294: 88          .
    bpl loop_c8290                                                    ; 8295: 10 f9       ..
    lda l0008                                                         ; 8297: a5 08       ..
    clc                                                               ; 8299: 18          .
    adc #8                                                            ; 829a: 69 08       i.
    sta l0008                                                         ; 829c: 85 08       ..
    bcc c82a2                                                         ; 829e: 90 02       ..
    inc l0009                                                         ; 82a0: e6 09       ..
.c82a2
    lda l000c                                                         ; 82a2: a5 0c       ..
    clc                                                               ; 82a4: 18          .
    adc #8                                                            ; 82a5: 69 08       i.
    sta l000c                                                         ; 82a7: 85 0c       ..
    bcc c82ad                                                         ; 82a9: 90 02       ..
    inc l000d                                                         ; 82ab: e6 0d       ..
.c82ad
    dex                                                               ; 82ad: ca          .
    bne c828e                                                         ; 82ae: d0 de       ..
    ldx #8                                                            ; 82b0: a2 08       ..
    lda #&40 ; '@'                                                    ; 82b2: a9 40       .@
    jsr sub_cbe72                                                     ; 82b4: 20 72 be     r.
    ldx #&0c                                                          ; 82b7: a2 0c       ..
    lda #&40 ; '@'                                                    ; 82b9: a9 40       .@
    jsr sub_cbe72                                                     ; 82bb: 20 72 be     r.
    dec l0023                                                         ; 82be: c6 23       .#
    bne c828c                                                         ; 82c0: d0 ca       ..
    inc l1928                                                         ; 82c2: ee 28 19    .(.
    dec l001f                                                         ; 82c5: c6 1f       ..
    bne c827d                                                         ; 82c7: d0 b4       ..
    lda l2600                                                         ; 82c9: ad 00 26    ..&
    sta l1915                                                         ; 82cc: 8d 15 19    ...
    lda l2601                                                         ; 82cf: ad 01 26    ..&
    sta l1916                                                         ; 82d2: 8d 16 19    ...
    ldx #&ff                                                          ; 82d5: a2 ff       ..
    txs                                                               ; 82d7: 9a          .
    dex                                                               ; 82d8: ca          .
    dex                                                               ; 82d9: ca          .
    dex                                                               ; 82da: ca          .
    dex                                                               ; 82db: ca          .
    stx l1908                                                         ; 82dc: 8e 08 19    ...
    lda l197b                                                         ; 82df: ad 7b 19    .{.
    beq c82ec                                                         ; 82e2: f0 08       ..
    lda l005b                                                         ; 82e4: a5 5b       .[
    eor l005c                                                         ; 82e6: 45 5c       E\
    cmp l005d                                                         ; 82e8: c5 5d       .]
.loop_c82ea
    bne loop_c82ea                                                    ; 82ea: d0 fe       ..
.c82ec
    jsr do_our_osword_2_yx_24_and_postprocess                         ; 82ec: 20 26 b9     &.
    lda l002a                                                         ; 82ef: a5 2a       .*
    and #&20 ; ' '                                                    ; 82f1: 29 20       )
    beq c82fa                                                         ; 82f3: f0 05       ..
    ldy #9                                                            ; 82f5: a0 09       ..
    jsr sub_cbe18                                                     ; 82f7: 20 18 be     ..
.c82fa
    jsr c830b                                                         ; 82fa: 20 0b 83     ..
    bcc c8308                                                         ; 82fd: 90 09       ..
    lda l002a                                                         ; 82ff: a5 2a       .*
    and #&20 ; ' '                                                    ; 8301: 29 20       )
    bne c8308                                                         ; 8303: d0 03       ..
    jsr c8470                                                         ; 8305: 20 70 84     p.
.c8308
    jmp c82ec                                                         ; 8308: 4c ec 82    L..

.c830b
    jsr do_our_osword_2_yx_24_and_postprocess                         ; 830b: 20 26 b9     &.
    ldx #&24 ; '$'                                                    ; 830e: a2 24       .$
    ldy #&2f ; '/'                                                    ; 8310: a0 2f       ./
    jsr cbd6e                                                         ; 8312: 20 6e bd     n.
    lda l002a                                                         ; 8315: a5 2a       .*
    and #&e0                                                          ; 8317: 29 e0       ).
    cmp #&e0                                                          ; 8319: c9 e0       ..
    beq c8320                                                         ; 831b: f0 03       ..
    jmp c83f1                                                         ; 831d: 4c f1 83    L..

.c8320
    jsr sub_c8335                                                     ; 8320: 20 35 83     5.
    bcs c834c                                                         ; 8323: b0 27       .'
    jsr sub_cbe4b                                                     ; 8325: 20 4b be     K.
    jsr sub_c8335                                                     ; 8328: 20 35 83     5.
    bcs c834c                                                         ; 832b: b0 1f       ..
    lda l191a                                                         ; 832d: ad 1a 19    ...
    beq c836d                                                         ; 8330: f0 3b       .;
    jmp c8383                                                         ; 8332: 4c 83 83    L..

.sub_c8335
    ldy #&24 ; '$'                                                    ; 8335: a0 24       .$
    jsr sub_cb881                                                     ; 8337: 20 81 b8     ..
    bcs c834b                                                         ; 833a: b0 0f       ..
    jsr sub_cb896                                                     ; 833c: 20 96 b8     ..
    bcs c834b                                                         ; 833f: b0 0a       ..
    ldy #&26 ; '&'                                                    ; 8341: a0 26       .&
    jsr sub_cb8c4                                                     ; 8343: 20 c4 b8     ..
    bcs c834b                                                         ; 8346: b0 03       ..
    jsr sub_cb8ad                                                     ; 8348: 20 ad b8     ..
.c834b
    rts                                                               ; 834b: 60          `

.c834c
    lda l191a                                                         ; 834c: ad 1a 19    ...
    beq c835e                                                         ; 834f: f0 0d       ..
    lda #0                                                            ; 8351: a9 00       ..
    sta l191a                                                         ; 8353: 8d 1a 19    ...
    sta l191b                                                         ; 8356: 8d 1b 19    ...
    ldy #&2b ; '+'                                                    ; 8359: a0 2b       .+
    jsr cbd4b                                                         ; 835b: 20 4b bd     K.
.c835e
    jsr sub_cbe32                                                     ; 835e: 20 32 be     2.
    lda l002a                                                         ; 8361: a5 2a       .*
    and #&20 ; ' '                                                    ; 8363: 29 20       )
    bne c836a                                                         ; 8365: d0 03       ..
    jmp c8470                                                         ; 8367: 4c 70 84    Lp.

.c836a
    jmp c830b                                                         ; 836a: 4c 0b 83    L..

.c836d
    jsr sub_cbe1d                                                     ; 836d: 20 1d be     ..
    ldy #&24 ; '$'                                                    ; 8370: a0 24       .$
    jsr cbd4b                                                         ; 8372: 20 4b bd     K.
    lda #1                                                            ; 8375: a9 01       ..
    sta l191a                                                         ; 8377: 8d 1a 19    ...
    sta l191b                                                         ; 837a: 8d 1b 19    ...
    jsr sub_cbe6b                                                     ; 837d: 20 6b be     k.
    jmp c830b                                                         ; 8380: 4c 0b 83    L..

.c8383
    ldx #&24 ; '$'                                                    ; 8383: a2 24       .$
    ldy #&2b ; '+'                                                    ; 8385: a0 2b       .+
    jsr sub_cb803                                                     ; 8387: 20 03 b8     ..
    bne c838f                                                         ; 838a: d0 03       ..
    jmp c830b                                                         ; 838c: 4c 0b 83    L..

.c838f
    ldy #&24 ; '$'                                                    ; 838f: a0 24       .$
    jsr cbd4b                                                         ; 8391: 20 4b bd     K.
    ldy #&2b ; '+'                                                    ; 8394: a0 2b       .+
    jsr cbd4b                                                         ; 8396: 20 4b bd     K.
    jsr sub_cbe6b                                                     ; 8399: 20 6b be     k.
    jmp c830b                                                         ; 839c: 4c 0b 83    L..

.sub_c839f
    lda #&30 ; '0'                                                    ; 839f: a9 30       .0
    sta l0008                                                         ; 83a1: 85 08       ..
    lda #0                                                            ; 83a3: a9 00       ..
    sta l0009                                                         ; 83a5: 85 09       ..
    jsr sub_cb617                                                     ; 83a7: 20 17 b6     ..
    ldx #0                                                            ; 83aa: a2 00       ..
    jsr sub_cb64f                                                     ; 83ac: 20 4f b6     O.
    ldx #&48 ; 'H'                                                    ; 83af: a2 48       .H
    ldy #0                                                            ; 83b1: a0 00       ..
.loop_c83b3
    lda (l001c),y                                                     ; 83b3: b1 1c       ..
    eor #&ff                                                          ; 83b5: 49 ff       I.
    sta (l001c),y                                                     ; 83b7: 91 1c       ..
    lda l001c                                                         ; 83b9: a5 1c       ..
    clc                                                               ; 83bb: 18          .
    adc #8                                                            ; 83bc: 69 08       i.
    sta l001c                                                         ; 83be: 85 1c       ..
    lda l001d                                                         ; 83c0: a5 1d       ..
    adc #0                                                            ; 83c2: 69 00       i.
    sta l001d                                                         ; 83c4: 85 1d       ..
    dex                                                               ; 83c6: ca          .
    bne loop_c83b3                                                    ; 83c7: d0 ea       ..
    rts                                                               ; 83c9: 60          `

.sub_c83ca
    lda #&20 ; ' '                                                    ; 83ca: a9 20       .
    sta l000a                                                         ; 83cc: 85 0a       ..
    lda #0                                                            ; 83ce: a9 00       ..
    sta l000b                                                         ; 83d0: 85 0b       ..
    jsr sub_cb617                                                     ; 83d2: 20 17 b6     ..
    ldx #0                                                            ; 83d5: a2 00       ..
    jsr sub_cb64f                                                     ; 83d7: 20 4f b6     O.
    ldy #0                                                            ; 83da: a0 00       ..
    ldx #&e0                                                          ; 83dc: a2 e0       ..
.loop_c83de
    lda (l001c),y                                                     ; 83de: b1 1c       ..
    eor l001e                                                         ; 83e0: 45 1e       E.
    sta (l001c),y                                                     ; 83e2: 91 1c       ..
    stx l001f                                                         ; 83e4: 86 1f       ..
    ldx #0                                                            ; 83e6: a2 00       ..
    jsr sub_cb6e7                                                     ; 83e8: 20 e7 b6     ..
    ldx l001f                                                         ; 83eb: a6 1f       ..
    dex                                                               ; 83ed: ca          .
    bne loop_c83de                                                    ; 83ee: d0 ee       ..
    rts                                                               ; 83f0: 60          `

.c83f1
    jsr sub_cbe4b                                                     ; 83f1: 20 4b be     K.
    lda l191a                                                         ; 83f4: ad 1a 19    ...
    beq c8403                                                         ; 83f7: f0 0a       ..
    lda #0                                                            ; 83f9: a9 00       ..
    sta l191a                                                         ; 83fb: 8d 1a 19    ...
    ldy #&2b ; '+'                                                    ; 83fe: a0 2b       .+
    jsr cbd4b                                                         ; 8400: 20 4b bd     K.
.c8403
    jsr sub_cbe1d                                                     ; 8403: 20 1d be     ..
    lda l0028                                                         ; 8406: a5 28       .(
    and #&fe                                                          ; 8408: 29 fe       ).
    bne c8414                                                         ; 840a: d0 08       ..
    ldx #9                                                            ; 840c: a2 09       ..
    jsr do_our_osword_1                                               ; 840e: 20 6b b7     k.
    jmp c830b                                                         ; 8411: 4c 0b 83    L..

.c8414
    lda l002a                                                         ; 8414: a5 2a       .*
    and #&20 ; ' '                                                    ; 8416: 29 20       )
    bne c8453                                                         ; 8418: d0 39       .9
    ldy #1                                                            ; 841a: a0 01       ..
    lda l0029                                                         ; 841c: a5 29       .)
    and #&fe                                                          ; 841e: 29 fe       ).
    bne c8449                                                         ; 8420: d0 27       .'
    lda l0028                                                         ; 8422: a5 28       .(
    sec                                                               ; 8424: 38          8
    sbc #&10                                                          ; 8425: e9 10       ..
    bcc c8449                                                         ; 8427: 90 20       .
    ldx #0                                                            ; 8429: a2 00       ..
.loop_c842b
    inx                                                               ; 842b: e8          .
    sec                                                               ; 842c: 38          8
    sbc #&0c                                                          ; 842d: e9 0c       ..
    bcs loop_c842b                                                    ; 842f: b0 fa       ..
    cmp #&ff                                                          ; 8431: c9 ff       ..
    beq c8449                                                         ; 8433: f0 14       ..
    cpx #6                                                            ; 8435: e0 06       ..
    beq c8449                                                         ; 8437: f0 10       ..
    txa                                                               ; 8439: 8a          .
    pha                                                               ; 843a: 48          H
    ldx #&2f ; '/'                                                    ; 843b: a2 2f       ./
    ldy #&24 ; '$'                                                    ; 843d: a0 24       .$
    jsr cbd6e                                                         ; 843f: 20 6e bd     n.
    pla                                                               ; 8442: 68          h
    tax                                                               ; 8443: aa          .
    ldy #1                                                            ; 8444: a0 01       ..
    jmp c845c                                                         ; 8446: 4c 5c 84    L\.

.c8449
    ldy #2                                                            ; 8449: a0 02       ..
    lda l0028                                                         ; 844b: a5 28       .(
    and #&4c ; 'L'                                                    ; 844d: 29 4c       )L
    cmp #&4c ; 'L'                                                    ; 844f: c9 4c       .L
    beq c845c                                                         ; 8451: f0 09       ..
.c8453
    ldy #&ff                                                          ; 8453: a0 ff       ..
    lda l191b                                                         ; 8455: ad 1b 19    ...
    bne c845c                                                         ; 8458: d0 02       ..
    ldy #&80                                                          ; 845a: a0 80       ..
.c845c
    cpy #2                                                            ; 845c: c0 02       ..
    clc                                                               ; 845e: 18          .
    bne c846f                                                         ; 845f: d0 0e       ..
    txa                                                               ; 8461: 8a          .
    pha                                                               ; 8462: 48          H
    ldx #&2f ; '/'                                                    ; 8463: a2 2f       ./
    ldy #&24 ; '$'                                                    ; 8465: a0 24       .$
    jsr cbd6e                                                         ; 8467: 20 6e bd     n.
    pla                                                               ; 846a: 68          h
    tax                                                               ; 846b: aa          .
    ldy #2                                                            ; 846c: a0 02       ..
    sec                                                               ; 846e: 38          8
.c846f
    rts                                                               ; 846f: 60          `

.c8470
    jsr sub_cb854                                                     ; 8470: 20 54 b8     T.
    ror l0027                                                         ; 8473: 66 27       f'
    ror l0026                                                         ; 8475: 66 26       f&
    ror l0027                                                         ; 8477: 66 27       f'
    ror l0026                                                         ; 8479: 66 26       f&
    lda l0026                                                         ; 847b: a5 26       .&
    eor #&ff                                                          ; 847d: 49 ff       I.
    sta l0026                                                         ; 847f: 85 26       .&
    ldx #9                                                            ; 8481: a2 09       ..
    ldy #0                                                            ; 8483: a0 00       ..
    sty l197b                                                         ; 8485: 8c 7b 19    .{.
.c8488
    lda lbecb,y                                                       ; 8488: b9 cb be    ...
    sec                                                               ; 848b: 38          8
    sbc l0026                                                         ; 848c: e5 26       .&
    bcs c84cf                                                         ; 848e: b0 3f       .?
    lda jump_table,y                                                  ; 8490: b9 cc be    ...
    cmp l0026                                                         ; 8493: c5 26       .&
    bcc c84cf                                                         ; 8495: 90 38       .8
    lda jump_table + 2,y                                              ; 8497: b9 ce be    ...
    sta l191c                                                         ; 849a: 8d 1c 19    ...
    lda jump_table + 1,y                                              ; 849d: b9 cd be    ...
    sta l191d                                                         ; 84a0: 8d 1d 19    ...
    lda jump_table,y                                                  ; 84a3: b9 cc be    ...
    clc                                                               ; 84a6: 18          .
    adc #1                                                            ; 84a7: 69 01       i.
    eor #&ff                                                          ; 84a9: 49 ff       I.
    asl a                                                             ; 84ab: 0a          .
    rol l1950                                                         ; 84ac: 2e 50 19    .P.
    asl a                                                             ; 84af: 0a          .
    rol l1950                                                         ; 84b0: 2e 50 19    .P.
    sta l194f                                                         ; 84b3: 8d 4f 19    .O.
    lda lbecb,y                                                       ; 84b6: b9 cb be    ...
    clc                                                               ; 84b9: 18          .
    adc #1                                                            ; 84ba: 69 01       i.
    eor #&ff                                                          ; 84bc: 49 ff       I.
    asl a                                                             ; 84be: 0a          .
    rol l1952                                                         ; 84bf: 2e 52 19    .R.
    asl a                                                             ; 84c2: 0a          .
    rol l1952                                                         ; 84c3: 2e 52 19    .R.
    sta l1951                                                         ; 84c6: 8d 51 19    .Q.
    jsr do_our_osword_1_x_5                                           ; 84c9: 20 e8 bd     ..
    jmp c84e4                                                         ; 84cc: 4c e4 84    L..

.c84cf
    iny                                                               ; 84cf: c8          .
    iny                                                               ; 84d0: c8          .
    iny                                                               ; 84d1: c8          .
    iny                                                               ; 84d2: c8          .
    dex                                                               ; 84d3: ca          .
    beq c84d9                                                         ; 84d4: f0 03       ..
    jmp c8488                                                         ; 84d6: 4c 88 84    L..

.c84d9
    jsr do_our_osword_1_x_5                                           ; 84d9: 20 e8 bd     ..
    ldy #9                                                            ; 84dc: a0 09       ..
    jsr sub_cbe18                                                     ; 84de: 20 18 be     ..
    jmp c830b                                                         ; 84e1: 4c 0b 83    L..

.c84e4
    jsr sub_c84f9                                                     ; 84e4: 20 f9 84     ..
    jsr sub_cb877                                                     ; 84e7: 20 77 b8     w.
    lda #4                                                            ; 84ea: a9 04       ..
    jsr oswrch                                                        ; 84ec: 20 ee ff     ..            ; Write character 4
    jsr jmp_indirect_l191c                                            ; 84ef: 20 f6 84     ..
    jsr sub_c84f9                                                     ; 84f2: 20 f9 84     ..
    rts                                                               ; 84f5: 60          `

.jmp_indirect_l191c
    jmp (l191c)                                                       ; 84f6: 6c 1c 19    l..

.sub_c84f9
    lda #&18                                                          ; 84f9: a9 18       ..
    jsr oswrch                                                        ; 84fb: 20 ee ff     ..            ; Write character 24
    lda #&cc                                                          ; 84fe: a9 cc       ..
    jsr oswrch                                                        ; 8500: 20 ee ff     ..            ; Write character 204
    lda #4                                                            ; 8503: a9 04       ..
    jsr oswrch                                                        ; 8505: 20 ee ff     ..            ; Write character 4
    lda l194f                                                         ; 8508: ad 4f 19    .O.
    jsr oswrch                                                        ; 850b: 20 ee ff     ..            ; Write character
    lda l1950                                                         ; 850e: ad 50 19    .P.
    and #3                                                            ; 8511: 29 03       ).
    jsr oswrch                                                        ; 8513: 20 ee ff     ..            ; Write character
    lda #&f2                                                          ; 8516: a9 f2       ..
    jsr oswrch                                                        ; 8518: 20 ee ff     ..            ; Write character 242
    lda #4                                                            ; 851b: a9 04       ..
    jsr oswrch                                                        ; 851d: 20 ee ff     ..            ; Write character 4
    lda l1951                                                         ; 8520: ad 51 19    .Q.
    jsr oswrch                                                        ; 8523: 20 ee ff     ..            ; Write character
    lda l1952                                                         ; 8526: ad 52 19    .R.
    and #3                                                            ; 8529: 29 03       ).
    jsr oswrch                                                        ; 852b: 20 ee ff     ..            ; Write character
    ldx #<(stringn8535)                                               ; 852e: a2 35       .5
    ldy #>(stringn8535)                                               ; 8530: a0 85       ..
    jmp write_stringn_at_yx                                           ; 8532: 4c 04 be    L..

.stringn8535
    equb sub_c853e - l8536                                            ; 8535: 08          .
.l8536
    equs &12, 3, &81, &10, &12, 0, &80, &1a                           ; 8536: 12 03 81... ...

.sub_c853e
    ldx #&0c                                                          ; 853e: a2 0c       ..
    jmp c8545                                                         ; 8540: 4c 45 85    LE.

.sub_c8543
    ldx #&0d                                                          ; 8543: a2 0d       ..
.c8545
    jsr do_our_osword_1                                               ; 8545: 20 6b b7     k.
    lda l192b                                                         ; 8548: ad 2b 19    .+.
    cmp #1                                                            ; 854b: c9 01       ..
    beq c8564                                                         ; 854d: f0 15       ..
    cmp #&80                                                          ; 854f: c9 80       ..
    bcc c8565                                                         ; 8551: 90 12       ..
    ldy #&1f                                                          ; 8553: a0 1f       ..
    jsr sub_cbe18                                                     ; 8555: 20 18 be     ..
    jsr long_delay                                                    ; 8558: 20 1f a9     ..
    jsr long_delay                                                    ; 855b: 20 1f a9     ..
    jsr long_delay                                                    ; 855e: 20 1f a9     ..
    jsr long_delay                                                    ; 8561: 20 1f a9     ..
.c8564
    sec                                                               ; 8564: 38          8
.c8565
    rts                                                               ; 8565: 60          `

    equb &9b, &85, &83, &87, &a7, &88, &7b, &85, &7b, &85             ; 8566: 9b 85 83... ...
    equs "` n"                                                        ; 8570: 60 20 6e    ` n
    equb &b1, &b0, &fa, &a0, &0f, &20, &e3, &bd, &20, &0b, &83, &b0   ; 8573: b1 b0 fa... ...
    equb &10, &a5, &2a, &10, &0c, &c0,   1, &d0, &f3, &8a, &a2, &66   ; 857f: 10 a5 2a... ..*
    equb &a0, &85, &4c, &7e, &b7, &60, &1c, &86, &ba, &85, &a5, &85   ; 858b: a0 85 4c... ..L
    equb &79, &86, &a5, &85, &a9,   0, &8d, &4e, &19, &a0, &13, &20   ; 8597: 79 86 a5... y..
    equb &e3, &bd, &20, &0b, &83, &b0, &e6, &a5, &2a, &10, &c3, &c0   ; 85a3: e3 bd 20... ..
    equb   1, &d0, &f3, &8a, &a2, &91, &a0, &85, &4c, &7e, &b7, &ad   ; 85af: 01 d0 f3... ...
    equb &4e, &19, &d0, &14, &a0,   7, &20, &18, &be, &20, &26, &b9   ; 85bb: 4e 19 d0... N..
    equb &a5, &2a, &29, &80, &f0, &ce, &a5                            ; 85c7: a5 2a 29... .*)
    equs "*) "                                                        ; 85ce: 2a 29 20    *)
    equb &d0, &f1, &a2, &2d, &a0, &bf, &20,   4, &be, &ad, &1f, &19   ; 85d1: d0 f1 a2... ...
    equb &38, &ed, &20, &19, &8d, &1f, &19, &f0, &2d, &a9,   4, &20   ; 85dd: 38 ed 20... 8.
    equb &21, &bc, &a9, &d0, &20, &ee, &ff, &a9,   4, &20, &ee, &ff   ; 85e9: 21 bc a9... !..
    equb &ad, &1f, &19, &0a, &0a, &49, &ff, &38, &e9, &20, &20, &ee   ; 85f5: ad 1f 19... ...
    equb &ff, &a9,   0, &20, &ee, &ff, &a2, &b8, &a0, &be, &20,   4   ; 8601: ff a9 00... ...
    equb &be, &ce, &1f, &19, &d0, &d3, &20, &f9, &84, &4c, &50, &81   ; 860d: be ce 1f... ...
    equb &4c, &71, &85, &a0, &0c, &20, &18, &be, &20, &5c, &b8, &b0   ; 8619: 4c 71 85... Lq.
    equb &f3, &ad, &20, &19                                           ; 8625: f3 ad 20... ..
    equs "JJJJ"                                                       ; 8629: 4a 4a 4a... JJJ
    equb &a8, &20,   0, &8b, &b0, &e6, &a0,   5, &20, &18, &be, &ad   ; 862d: a8 20 00... . .
    equb &20, &19, &18, &69,   8, &cd, &1f, &19, &f0,   6, &20, &3e   ; 8639: 20 19 18...  ..
    equb &85, &4c, &38, &86, &ad, &1f, &19, &cd, &20, &19, &f0,   6   ; 8645: 85 4c 38... .L8
    equb &20, &43, &85, &4c, &49, &86, &4c, &70, &86, &a9,   7, &85   ; 8651: 20 43 85...  C.
    equb &1f, &20, &3e, &85, &c6, &1f, &d0, &f9, &a9,   7, &85, &1f   ; 865d: 1f 20 3e... . >
    equb &20, &43, &85, &c6, &1f, &d0, &f9, &a9,   1, &8d, &4e, &19   ; 8669: 20 43 85...  C.
    equb &4c, &a0, &85, &60, &a0, &0c, &20, &18, &be, &20, &5c, &b8   ; 8675: 4c a0 85... L..
    equb &b0, &f5, &20, &41, &bd, &20, &77, &b8, &a0,   8, &20, &54   ; 8681: b0 f5 20... ..
    equb &b7, &ad, &1e, &19, &8d, &21, &19, &a9, &21, &8d, &2a, &19   ; 868d: b7 ad 1e... ...
    equb &a9,   0, &8d, &28, &19, &8d, &22, &19, &a9,   2, &8d, &29   ; 8699: a9 00 8d... ...
    equb &19, &a9, &0a, &8d, &23, &19, &a9, &53, &8d, &27, &19, &20   ; 86a5: 19 a9 0a... ...
    equb &d9, &b8, &a9,   0, &85,   4, &a9, &0a, &85,   5, &a9,   8   ; 86b1: d9 b8 a9... ...
    equb &85, &1f, &a9, &0a, &20, &ee, &ff, &a5,   4, &29, &10, &d0   ; 86bd: 85 1f a9... ...
    equb   5, &a9, &0a, &20, &ee, &ff, &a2,   3, &20, &64, &be, &a2   ; 86c9: 05 a9 0a... ...
    equb &10, &a0,   0, &20, &0e, &be, &a9, &0d, &20, &ee, &ff, &a5   ; 86d5: 10 a0 00... ...
    equb   4, &18, &69, &10, &85,   4, &c6, &1f, &d0, &d4, &a0, &17   ; 86e1: 04 18 69... ..i
    equb &20, &18, &be, &20, &32, &be, &20, &26, &b9, &a5, &2a, &29   ; 86ed: 20 18 be...  ..
    equb &80, &d0,   6, &20, &46, &bd, &4c, &9b, &85, &a5             ; 86f9: 80 d0 06... ...
    equs "*) "                                                        ; 8703: 2a 29 20    *)
    equb &d0, &e8, &20, &46, &bd, &a5, &29, &38, &e9,   8, &4a, &4a   ; 8706: d0 e8 20... ..
    equb &85, &1f, &29, &fc, &d0, &d8, &a5, &1f, &48, &a8, &20,   0   ; 8712: 85 1f 29... ..)
    equb &8b, &68, &85, &1f, &90,   3, &4c, &9b, &85, &0a, &0a, &0a   ; 871e: 8b 68 85... .h.
    equb &18, &65, &1f, &0a, &18, &65, &1f, &85, &23, &e6, &23, &a0   ; 872a: 18 65 1f... .e.
    equb &1a, &20, &18, &be, &ad, &20, &19, &85, &1f, &ad, &1e, &19   ; 8736: 1a 20 18... . .
    equb &8d, &21, &19, &a9, &2a, &8d, &2a, &19, &a9,   0, &8d, &29   ; 8742: 8d 21 19... .!.
    equb &19, &8d, &22, &19, &a9, &26, &8d, &23, &19, &a9, &0f, &85   ; 874e: 19 8d 22... .."
    equb &47, &a5, &1f, &8d, &28, &19, &a9, &53, &8d, &27, &19, &20   ; 875a: 47 a5 1f... G..
    equb &d9, &b8, &a5, &23, &8d, &28, &19, &a9, &4b, &8d, &27, &19   ; 8766: d9 b8 a5... ...
    equb &20, &d9, &b8, &e6, &1f, &e6, &23, &c6, &47, &d0, &de, &4c   ; 8772: 20 d9 b8...  ..
    equb &9b, &85, &4c, &71, &85, &a0, &0b, &20, &18, &be, &20, &26   ; 877e: 9b 85 4c... ..L
    equb &b9, &a5, &2a, &29, &80, &f0, &ef, &a5                       ; 878a: b9 a5 2a... ..*
    equs "*) "                                                        ; 8792: 2a 29 20    *)
    equb &d0, &f1, &20, &ee, &b9, &90,   3, &4c, &71, &85, &a0, &10   ; 8795: d0 f1 20... ..
    equb &20, &e3, &bd, &20, &0b, &83, &90,   4                       ; 87a1: 20 e3 bd...  ..
    equs "`Lq"                                                        ; 87a9: 60 4c 71    `Lq
    equb &85, &a5, &2a, &29, &80, &f0, &f7, &c0,   1, &d0, &ed, &e0   ; 87ac: 85 a5 2a... ..*
    equb   4, &d0, &0b, &a9, &24, &8d, &43, &19, &20, &2b, &bc, &4c   ; 87b8: 04 d0 0b... ...
    equb &71, &85, &e0,   1, &f0,   7, &e0,   2, &d0, &d6, &4c, &47   ; 87c4: 71 85 e0... q..
    equb &88, &a0,   1, &20, &de, &bd, &20, &6d, &bc, &b0,   5, &20   ; 87d0: 88 a0 01... ...
    equb &7e, &be, &90,   3, &4c, &71, &85, &a9, &98, &8d, &2e, &19   ; 87dc: 7e be 90... ~..
    equb &8d, &36, &19, &a9, &37, &8d, &2f, &19, &a9,   7, &8d, &37   ; 87e8: 8d 36 19... .6.
    equb &19, &a9,   0, &8d, &38, &19, &8d, &39, &19, &a9, &1c, &85   ; 87f4: 19 a9 00... ...
    equb &47, &a9, &40, &8d, &32, &19, &a9,   2, &8d, &33, &19, &a9   ; 8800: 47 a9 40... G.@
    equb   0, &8d, &34, &19, &8d, &35, &19, &a9,   3, &a2, &2d, &a0   ; 880c: 00 8d 34... ..4
    equb &19, &20, &d1, &ff, &b0, &c2, &ad, &2e, &19, &18, &69, &40   ; 8818: 19 20 d1... . .
    equb &8d, &2e, &19, &90,   3, &ee, &2f, &19, &ad, &36, &19, &18   ; 8824: 8d 2e 19... ...
    equb &69, &40, &8d, &36, &19, &90,   3, &ee, &37, &19, &c6, &47   ; 8830: 69 40 8d... i@.
    equb &d0, &c3, &a9,   0, &ac, &2d, &19, &20, &ce, &ff, &60, &a0   ; 883c: d0 c3 a9... ...
    equb &11, &20, &18, &be, &20, &5c, &b8,   8, &20, &e8, &bd, &20   ; 8848: 11 20 18... . .
    equb &6d, &bc, &90,   4                                           ; 8854: 6d bc 90... m..
    equs "(Lq"                                                        ; 8858: 28 4c 71    (Lq
    equb &85, &28,   8, &b0,   7, &a2, &a7, &a0, &be, &20,   4, &be   ; 885b: 85 28 08... .(.
    equb &a9, &40, &8d, &2c, &19, &a9, &19, &8d, &2d, &19, &a2, &10   ; 8867: a9 40 8d... .@.
    equb &a9,   0, &9d, &2d, &19, &ca, &d0, &fa, &a9, &30, &8d, &2f   ; 8873: a9 00 9d... ...
    equb &19, &8d, &33, &19, &8d, &37, &19, &a9, &ff, &8d, &30, &19   ; 887f: 19 8d 33... ..3
    equb &a9, &80, &8d, &3b, &19, &a9,   0, &a2, &2c, &a0, &19, &20   ; 888b: a9 80 8d... ...
    equb &dd, &ff, &28, &b0,   7, &a2, &a7, &a0, &be, &20,   4, &be   ; 8897: dd ff 28... ..(
    equs "`Lq"                                                        ; 88a3: 60 4c 71    `Lq
    equb &85, &a0, &0a, &20, &18, &be, &20, &26, &b9, &a5, &2a, &29   ; 88a6: 85 a0 0a... ...
    equb &80, &f0, &ef, &a5                                           ; 88b2: 80 f0 ef... ...
    equs "*) "                                                        ; 88b6: 2a 29 20    *)
    equb &d0, &f1, &20, &ee, &b9, &90,   3, &4c, &71, &85, &a9, &43   ; 88b9: d0 f1 20... ..
    equb &8d, &43, &19, &a0, &11, &20, &e3, &bd, &20, &0b, &83, &90   ; 88c5: 8d 43 19... .C.
    equb   4                                                          ; 88d1: 04          .
    equs "`Lq"                                                        ; 88d2: 60 4c 71    `Lq
    equb &85, &a5, &2a, &29, &80, &f0, &f7, &c0,   1, &d0, &ed, &e0   ; 88d5: 85 a5 2a... ..*
    equb   4, &d0,   6, &20, &2b, &bc, &4c, &71, &85, &e0,   1, &d0   ; 88e1: 04 d0 06... ...
    equb   3, &4c, &dc, &89, &e0,   2, &d0, &d8, &4c, &f8, &88, &a0   ; 88ed: 03 4c dc... .L.
    equb &10, &20, &18, &be, &ad, &19, &19, &48, &ad, &18, &19, &48   ; 88f9: 10 20 18... . .
    equb &29, &f0, &8d, &18, &19, &ad, &17, &19, &48, &d0, &0a, &a9   ; 8905: 29 f0 8d... )..
    equb &f0, &8d, &18, &19, &a9, &ff, &8d, &19, &19, &a9,   1, &8d   ; 8911: f0 8d 18... ...
    equb &17, &19, &20, &1b, &ba, &68, &8d, &17, &19, &68, &8d, &18   ; 891d: 17 19 20... ..
    equb &19, &68, &8d, &19, &19, &c0, &ff, &d0,   3, &4c, &a7, &88   ; 8929: 19 68 8d... .h.
    equb &a2,   8, &a0                                                ; 8935: a2 08 a0    ...
    equs "; n"                                                        ; 8938: 3b 20 6e    ; n
    equb &bd, &a2, &10, &a0                                           ; 893b: bd a2 10... ...
    equs "? n"                                                        ; 893f: 3f 20 6e    ? n
    equb &bd, &20, &b1, &bb, &20, &59, &bc, &90,   3, &4c, &71, &85   ; 8942: bd 20 b1... . .
    equb &a2, &3b, &a0,   8, &20, &6e, &bd, &a2, &3f, &a0, &10, &20   ; 894e: a2 3b a0... .;.
    equb &6e, &bd, &a9, &80, &a2, &40, &a0, &19, &20, &ce, &ff, &8d   ; 895a: 6e bd a9... n..
    equb &2d, &19, &ac, &2d, &19, &a5, &43, &85, &10, &20, &d4, &ff   ; 8966: 2d 19 ac... -..
    equb &a5, &44, &85, &11, &20, &d4, &ff, &a5, &45, &85, &12, &20   ; 8972: a5 44 85... .D.
    equb &d4, &ff, &a5, &46, &85, &13, &20, &d4, &ff, &46, &11, &66   ; 897e: d4 ff a5... ...
    equb &10, &a5, &10, &29, &f8, &85, &10, &46, &13, &66, &12, &46   ; 898a: 10 a5 10... ...
    equb &13, &66, &12, &a0,   5, &20, &18, &be, &20, &44, &b6, &a0   ; 8996: 13 66 12... .f.
    equb   0, &b1, &1c, &ac, &2d, &19, &20, &d4, &ff, &a2,   0, &20   ; 89a2: 00 b1 1c... ...
    equb &cd, &b6, &c6, &14, &d0, &ed, &a5,   8, &18, &69,   8, &85   ; 89ae: cd b6 c6... ...
    equb   8, &90,   2, &e6,   9, &a5, &10, &38, &e9,   8, &85, &10   ; 89ba: 08 90 02... ...
    equb &b0,   2, &c6, &11, &a5, &11,   5, &10, &d0, &ce, &a9,   0   ; 89c6: b0 02 c6... ...
    equb &ac, &2d, &19, &20, &ce, &ff, &60, &4c, &a7, &88, &a0, &18   ; 89d2: ac 2d 19... .-.
    equb &20, &e3, &bd, &a9,   0, &8d, &54, &19, &8d, &55, &19, &20   ; 89de: 20 e3 bd...  ..
    equb &0b, &83, &b0, &ea, &a5, &2a, &29, &80, &f0, &e5, &c0,   1   ; 89ea: 0b 83 b0... ...
    equb &d0, &f1, &e0,   1, &d0, &10, &a0,   1, &20, &de, &bd, &ad   ; 89f6: d0 f1 e0... ...
    equb &54, &19, &49,   1, &8d, &54, &19, &4c, &e9, &89, &e0,   2   ; 8a02: 54 19 49... T.I
    equb &d0, &10, &a0,   2, &20, &de, &bd, &ad, &55, &19, &49,   1   ; 8a0e: d0 10 a0... ...
    equb &8d, &55, &19, &4c, &e9, &89, &e0,   4, &d0, &c5, &a0,   4   ; 8a1a: 8d 55 19... .U.
    equb &20, &de, &bd, &20, &59, &bc, &90,   3, &4c, &71, &85, &20   ; 8a26: 20 de bd...  ..
    equb &7e, &be, &90,   1, &60, &ac, &2d, &19, &20, &d7, &ff, &85   ; 8a32: 7e be 90... ~..
    equb &43, &85, &10, &20, &d7, &ff, &85, &44, &85, &11, &20, &d7   ; 8a3e: 43 85 10... C..
    equb &ff, &85, &45, &85, &12, &20, &d7, &ff, &85, &46, &85, &13   ; 8a4a: ff 85 45... ..E
    equb &ad, &19, &19, &48, &ad, &18, &19, &48, &29, &f0, &8d, &18   ; 8a56: ad 19 19... ...
    equb &19, &ad, &17, &19, &48, &d0, &0a, &a9, &f0, &8d, &18, &19   ; 8a62: 19 ad 17... ...
    equb &a9, &ff, &8d, &19, &19, &a9,   1, &8d, &17, &19, &20, &f9   ; 8a6e: a9 ff 8d... ...
    equb &ba, &68, &8d, &17, &19, &68, &8d, &18, &19, &68, &8d, &19   ; 8a7a: ba 68 8d... .h.
    equb &19, &c0, &ff, &f0, &6c, &a2, &24, &a0,   8, &20, &6e, &bd   ; 8a86: 19 c0 ff... ...
    equb &20, &17, &b6, &a0,   5, &20, &18, &be, &20, &44, &b6, &ac   ; 8a92: 20 17 b6...  ..
    equb &2d, &19, &20, &d7, &ff, &a0,   0, &ae, &54, &19, &f0, &18   ; 8a9e: 2d 19 20... -.
    equb &ae, &55, &19, &f0, &11, &49, &ff, &48, &b1, &1c, &49, &ff   ; 8aaa: ae 55 19... .U.
    equb &85, &1f, &68,   5, &1f, &49, &ff, &4c, &c2, &8a, &11, &1c   ; 8ab6: 85 1f 68... ..h
    equb &91, &1c, &a2,   0, &20, &cd, &b6, &c6, &14, &d0, &d0, &a5   ; 8ac2: 91 1c a2... ...
    equb   8, &18, &69,   8, &85,   8, &90,   2, &e6,   9, &a5, &10   ; 8ace: 08 18 69... ..i
    equb &38, &e9,   8, &85, &10, &b0,   2, &c6, &11, &a5, &11,   5   ; 8ada: 38 e9 08... 8..
    equb &10, &d0, &b1, &a9,   0, &ac, &2d, &19, &20, &ce, &ff, &20   ; 8ae6: 10 d0 b1... ...
    equb &e8, &bd, &4c, &31, &8a, &a9,   0, &ac, &2d, &19, &20, &ce   ; 8af2: e8 bd 4c... ..L
    equb &ff, &60, &98                                                ; 8afe: ff 60 98    .`.
    equs "H A"                                                        ; 8b01: 48 20 41    H A
    equb &bd, &20, &77, &b8, &ad, &1e, &19, &8d, &21, &19, &a9, &21   ; 8b04: bd 20 77... . w
    equb &8d, &2a, &19, &a9,   0, &8d, &22, &19, &8d, &28, &19, &a9   ; 8b10: 8d 2a 19... .*.
    equb   2, &8d, &29, &19, &a9, &0a, &8d, &23, &19, &a9, &53, &8d   ; 8b1c: 02 8d 29... ..)
    equb &27, &19, &20, &d9, &b8, &a0, &13, &20, &18, &be, &20, &77   ; 8b28: 27 19 20... '.
    equb &b8, &a0,   6, &20, &54, &b7, &a2, &4f, &a0, &bf, &20,   4   ; 8b34: b8 a0 06... ...
    equb &be, &a9,   0, &85, &47, &a9, &0a, &85, &48, &68, &aa, &e8   ; 8b40: be a9 00... ...
    equb &ca, &f0, &0f, &a5, &47, &18, &69, &20, &85                  ; 8b4c: ca f0 0f... ...
    equs "GLL"                                                        ; 8b55: 47 4c 4c    GLL
    equb &8b, &20, &46, &bd                                           ; 8b58: 8b 20 46... . F
    equs "8` "                                                        ; 8b5c: 38 60 20    8`
    equb &db, &bc, &b0, &f6, &a5, &47, &18, &69, &10, &85, &47, &a2   ; 8b5f: db bc b0... ...
    equb &5c, &a0, &bf, &20,   4, &be, &20, &db, &bc, &b0, &e3, &20   ; 8b6b: 5c a0 bf... \..
    equb &46, &bd, &a9, &4b, &8d, &27, &19, &20, &d9, &b8, &18, &60   ; 8b77: 46 bd a9... F..
    equb &ef, &8b,   6, &91, &5d, &8f, &af, &8d, &b5, &8b             ; 8b83: ef 8b 06... ...

.loop_c8b8d
    rts                                                               ; 8b8d: 60          `

.c8b8e
    jsr sub_cb16e                                                     ; 8b8e: 20 6e b1     n.
    bcs loop_c8b8d                                                    ; 8b91: b0 fa       ..
    ldy #&0c                                                          ; 8b93: a0 0c       ..
    lda l1958                                                         ; 8b95: ad 58 19    .X.
    beq c8b9c                                                         ; 8b98: f0 02       ..
    ldy #&22 ; '"'                                                    ; 8b9a: a0 22       ."
.c8b9c
    jsr do_our_osword_1_x_4                                           ; 8b9c: 20 e3 bd     ..
.loop_c8b9f
    jsr c830b                                                         ; 8b9f: 20 0b 83     ..
    bcs c8bb4                                                         ; 8ba2: b0 10       ..
    lda l002a                                                         ; 8ba4: a5 2a       .*
    bpl c8bb4                                                         ; 8ba6: 10 0c       ..
    cpy #1                                                            ; 8ba8: c0 01       ..
    bne loop_c8b9f                                                    ; 8baa: d0 f3       ..
    txa                                                               ; 8bac: 8a          .
    ldx #&83                                                          ; 8bad: a2 83       ..
    ldy #&8b                                                          ; 8baf: a0 8b       ..
    jmp cb77e                                                         ; 8bb1: 4c 7e b7    L~.

.c8bb4
    rts                                                               ; 8bb4: 60          `

    equb &a0, &1e, &20, &e3, &bd, &20, &0b, &83, &b0, &f5, &a5, &2a   ; 8bb5: a0 1e 20... ..
    equb &10, &23, &c0,   1, &d0, &f3, &ca, &ca, &ca, &f0, &ee, &30   ; 8bc1: 10 23 c0... .#.
    equb &ec, &86, &4f, &a9, &80, &85,   8, &a9,   2, &85,   9, &85   ; 8bcd: ec 86 4f... ..O
    equb &0b, &a9,   0, &85, &0a, &a0, &0e, &20, &e3, &bd, &20, &e9   ; 8bd9: 0b a9 00... ...
    equb &8b, &4c, &8e, &8b, &a2, &13, &4c, &6b, &b7, &60, &a0, &14   ; 8be5: 8b 4c 8e... .L.
    equb &ad, &58, &19, &f0,   2, &a0, &23, &20, &e3, &bd, &a9,   0   ; 8bf1: ad 58 19... .X.
    equb &8d, &54, &19, &a9,   1, &8d, &55, &19, &20, &0b, &83, &b0   ; 8bfd: 8d 54 19... .T.
    equb &e4, &c0,   1, &d0, &28, &e0,   3, &b0, &24, &e0,   1, &f0   ; 8c09: e4 c0 01... ...
    equb &10, &ad, &55, &19, &49,   1, &8d, &55, &19, &a0,   2, &20   ; 8c15: 10 ad 55... ..U
    equb &de, &bd, &4c,   5, &8c, &ad, &54, &19, &49,   1, &8d, &54   ; 8c21: de bd 4c... ..L
    equb &19, &a0,   1, &20, &de, &bd, &4c,   5, &8c, &c0, &ff, &d0   ; 8c2d: 19 a0 01... ...
    equb &cb, &20, &1b, &ba, &c0, &ff, &d0,   9, &4c, &8e, &8b, &20   ; 8c39: cb 20 1b... . .
    equb &b1, &bb, &20, &b1, &bb, &20, &f9, &ba, &98, &48, &20, &b1   ; 8c45: b1 bb 20... ..
    equb &bb, &68, &a8, &c0, &ff, &d0,   3, &4c, &ef, &8b, &a5, &33   ; 8c51: bb 68 a8... .h.
    equb &85,   8, &a5, &34, &85,   9, &a5, &39, &85, &0a, &a5, &3a   ; 8c5d: 85 08 a5... ...
    equb &85, &0b, &a2, &43, &a0, &10, &20, &6e, &bd, &a2, &24, &a0   ; 8c69: 85 0b a2... ...
    equb &0c, &20, &6e, &bd, &20, &5c, &8d, &20, &87, &8c, &ad, &58   ; 8c75: 0c 20 6e... . n
    equb &19, &f0, &c3, &4c, &ef, &8b, &20, &17, &b6, &a9,   1, &85   ; 8c81: 19 f0 c3... ...
    equb &17, &a5, &0c, &38, &e5,   8, &a5, &0d, &e5,   9, &90, &36   ; 8c8d: 17 a5 0c... ...
    equb &a5,   8, &18, &65, &10, &85,   8, &a5,   9, &65, &11, &85   ; 8c99: a5 08 18... ...
    equb   9, &a5,   8, &d0,   2, &c6,   9, &c6,   8, &a5,   8,   5   ; 8ca5: 09 a5 08... ...
    equb   9, &a5, &0c, &18, &65, &10, &85, &0c, &a5, &0d, &65, &11   ; 8cb1: 09 a5 0c... ...
    equb &85, &0d, &a5, &0c, &d0,   2, &c6, &0d, &c6, &0c, &a5, &0c   ; 8cbd: 85 0d a5... ...
    equb   5, &0d, &a9,   0, &85, &17, &a9,   1, &85, &18, &a5, &0e   ; 8cc9: 05 0d a9... ...
    equb &38, &e5, &0a, &90, &16, &a5, &0a, &18, &65, &12, &85, &0a   ; 8cd5: 38 e5 0a... 8..
    equb &c6, &0a, &a5, &0e, &18, &65, &12, &85, &0e, &c6, &0e, &a9   ; 8ce1: c6 0a a5... ...
    equb   0, &85, &18, &20, &44, &b6, &a2,   0, &20, &9e, &b6, &20   ; 8ced: 00 85 18... ...
    equb &97, &8d, &ad, &54, &19, &f0, &0b, &a5, &1b, &f0,   2, &a9   ; 8cf9: 97 8d ad... ...
    equb   1, &4d, &55, &19, &d0,   5, &a2,   4, &20, &ac, &b6, &c6   ; 8d05: 01 4d 55... .MU
    equb &14, &f0, &1e, &a5, &18, &d0, &0d, &a2,   0, &20, &e7, &b6   ; 8d11: 14 f0 1e... ...
    equb &a2,   4, &20, &e7, &b6, &4c, &f3, &8c, &a2,   0, &20, &cd   ; 8d1d: a2 04 20... ..
    equb &b6, &a2,   4, &20, &cd, &b6, &4c, &f3, &8c, &a2, &10, &20   ; 8d29: b6 a2 04... ...
    equb &47, &b8, &d0,   3, &4c, &43, &b6, &a5, &17, &d0, &0d, &a2   ; 8d35: 47 b8 d0... G..
    equb   8, &20, &47, &b8, &a2, &0c, &20, &47, &b8, &4c, &f0, &8c   ; 8d41: 08 20 47... . G
    equb &e6,   8, &d0,   2, &e6,   9, &e6, &0c, &d0,   2, &e6, &0d   ; 8d4d: e6 08 d0... ...
    equb &4c, &f0, &8c, &a2,   8, &a9,   2, &20, &72, &be, &a5, &0a   ; 8d59: 4c f0 8c... L..
    equb &38, &e9,   4, &85, &0a, &b0,   2, &c6, &0b, &a5, &10, &38   ; 8d65: 38 e9 04... 8..
    equb &e9,   2, &85, &10, &b0,   2, &c6, &11, &a5, &12, &38, &e9   ; 8d71: e9 02 85... ...
    equb   4, &85, &12, &b0,   2, &c6, &13, &a9,   2, &a2, &0c, &20   ; 8d7d: 04 85 12... ...
    equb &72, &be, &a5, &0e, &38, &e9,   4, &85, &0e, &b0,   2, &c6   ; 8d89: 72 be a5... r..
    equb &0f, &60                                                     ; 8d95: 0f 60       .`

.sub_c8d97
    lda l1958                                                         ; 8d97: ad 58 19    .X.
    beq c8dae                                                         ; 8d9a: f0 12       ..
    lda l001b                                                         ; 8d9c: a5 1b       ..
    pha                                                               ; 8d9e: 48          H
    lda l1913                                                         ; 8d9f: ad 13 19    ...
    eor #1                                                            ; 8da2: 49 01       I.
    sta l001b                                                         ; 8da4: 85 1b       ..
    ldx #0                                                            ; 8da6: a2 00       ..
    jsr sub_cb6ac                                                     ; 8da8: 20 ac b6     ..
    pla                                                               ; 8dab: 68          h
    sta l001b                                                         ; 8dac: 85 1b       ..
.c8dae
    rts                                                               ; 8dae: 60          `

    equb &a0, &0d, &20, &e3, &bd, &a0,   1, &8c, &4e, &19, &20, &de   ; 8daf: a0 0d 20... ..
    equb &bd, &20, &0b, &83, &90,   3, &4c, &b9, &8e, &a5, &2a, &10   ; 8dbb: bd 20 0b... . .
    equb &f9, &c0,   1, &d0, &f0, &e0,   4, &b0, &ec, &e0,   1, &d0   ; 8dc7: f9 c0 01... ...
    equb &10, &a0,   1, &20, &de, &bd, &ad, &4e, &19, &49,   1, &8d   ; 8dd3: 10 a0 01... ...
    equb &4e, &19, &4c, &bc, &8d, &ca, &8e, &3f, &19, &e8, &8a, &a8   ; 8ddf: 4e 19 4c... N.L
    equb &20, &de, &bd, &20, &1b, &ba, &c0, &ff, &d0,   3, &4c, &b9   ; 8deb: 20 de bd...  ..
    equb &8e, &ad, &4e, &19, &f0,   3, &4c, &7f, &8e, &a2,   8, &a0   ; 8df7: 8e ad 4e... ..N
    equs "; n"                                                        ; 8e03: 3b 20 6e    ; n
    equb &bd, &a2, &10, &a0                                           ; 8e06: bd a2 10... ...
    equs "? n"                                                        ; 8e0a: 3f 20 6e    ? n
    equb &bd, &20, &f9, &ba, &c0, &ff, &d0,   6, &20, &b1, &bb, &4c   ; 8e0d: bd 20 f9... . .
    equb &af, &8d, &20, &b1, &bb, &a2, &3b, &a0,   8, &20, &6e, &bd   ; 8e19: af 8d 20... ..
    equb &e6,   8, &d0,   2, &e6,   9, &e6, &0a, &a5, &25, &4a, &85   ; 8e25: e6 08 d0... ...
    equb &0d, &a5, &24, &6a, &85, &0c, &e6, &0c, &d0,   2, &e6, &0d   ; 8e31: 0d a5 24... ..$
    equs "F'f&F'f&"                                                   ; 8e3d: 46 27 66... F'f
    equb &a5, &26, &49, &ff, &85, &0e, &e6, &0e, &a2, &3f, &a0, &10   ; 8e45: a5 26 49... .&I
    equb &20, &6e, &bd, &a5, &10, &d0,   2, &c6, &11, &c6, &10, &a5   ; 8e51: 20 6e bd...  n.
    equb &10,   5, &11, &c6, &12, &a2, &0c, &a0, &3b, &20             ; 8e5d: 10 05 11... ...

.sub_c8e67
    ror la9bd                                                         ; 8e67: 6e bd a9    n..
    brk                                                               ; 8e6a: 00          .

    equb &8d, &54, &19, &20, &8a, &8c, &a2, &3b, &a0,   8, &20, &6e   ; 8e6b: 8d 54 19... .T.
    equb &bd, &a2, &3f, &a0, &10, &20, &6e, &bd, &ad, &4e, &19, &f0   ; 8e77: bd a2 3f... ..?
    equb &1f, &a2,   8, &a0                                           ; 8e83: 1f a2 08... ...
    equs "G n"                                                        ; 8e87: 47 20 6e    G n
    equb &bd, &a2, &10, &a0                                           ; 8e8a: bd a2 10... ...
    equs "J n"                                                        ; 8e8e: 4a 20 6e    J n
    equb &bd, &20, &b1, &bb, &a2, &47, &a0,   8, &20, &6e, &bd, &a2   ; 8e91: bd 20 b1... . .
    equb &4a, &a0, &10, &20, &6e, &bd, &ad, &3f, &19, &c9,   2, &f0   ; 8e9d: 4a a0 10... J..
    equb   6, &20, &bc, &8e, &4c, &b3, &8e, &20, &10, &8f, &4c, &af   ; 8ea9: 06 20 bc... . .
    equb &8d, &20, &b1, &bb, &4c, &8e, &8b, &a5, &0a, &85, &0e, &a5   ; 8eb5: 8d 20 b1... . .
    equb   8, &18, &65, &10, &85, &0c, &a5,   9, &65, &11, &85, &0d   ; 8ec1: 08 18 65... ..e
    equb &46, &11, &66, &10, &e6, &10, &d0,   2, &e6, &11, &20, &44   ; 8ecd: 46 11 66... F.f
    equb &b6, &a2,   4, &20, &9e, &b6, &a5, &1b, &48, &20, &a5, &b6   ; 8ed9: b6 a2 04... ...
    equb &68, &85, &1b, &a2,   0, &20, &ac, &b6, &a2,   0, &20, &cd   ; 8ee5: 68 85 1b... h..
    equb &b6, &a2,   4, &20, &cd, &b6, &c6, &14, &d0, &df, &e6,   8   ; 8ef1: b6 a2 04... ...
    equb &d0,   2, &e6,   9, &a2, &0c, &20, &47, &b8, &a2, &10, &20   ; 8efd: d0 02 e6... ...
    equb &47, &b8, &d0, &ca, &4c, &43, &b6, &a5,   8, &85, &0c, &a5   ; 8f09: 47 b8 d0... G..
    equb   9, &85, &0d, &a5, &0a, &18, &65, &12, &85, &0e, &46, &12   ; 8f15: 09 85 0d... ...
    equb &e6, &12, &20, &44, &b6, &a5, &10, &85, &47, &a5, &11, &85   ; 8f21: e6 12 20... ..
    equb &48, &a2,   4, &20, &9e, &b6, &a5, &1b, &48, &20, &a5, &b6   ; 8f2d: 48 a2 04... H..
    equb &68, &85, &1b, &a2,   0, &20, &ac, &b6, &a2,   0, &20,   8   ; 8f39: 68 85 1b... h..
    equb &b7, &a2,   4, &20,   8, &b7, &a2                            ; 8f45: b7 a2 04... ...
    equs "G G"                                                        ; 8f4c: 47 20 47    G G
    equb &b8, &d0, &dc, &e6, &0a, &c6, &0e, &c6, &12, &d0, &c9, &4c   ; 8f4f: b8 d0 dc... ...
    equb &43, &b6                                                     ; 8f5b: 43 b6       C.

.c8f5d
    ldy #7                                                            ; 8f5d: a0 07       ..
    jsr do_our_osword_1_x_4                                           ; 8f5f: 20 e3 bd     ..
.c8f62
    jsr c830b                                                         ; 8f62: 20 0b 83     ..
    bcc c8f68                                                         ; 8f65: 90 01       ..
    rts                                                               ; 8f67: 60          `

.c8f68
    lda l002a                                                         ; 8f68: a5 2a       .*
    bmi c8f6f                                                         ; 8f6a: 30 03       0.
    jmp c8b8e                                                         ; 8f6c: 4c 8e 8b    L..

.c8f6f
    cpy #1                                                            ; 8f6f: c0 01       ..
    bne c8f62                                                         ; 8f71: d0 ef       ..
    cpx #4                                                            ; 8f73: e0 04       ..
    bcs c8f62                                                         ; 8f75: b0 eb       ..
    txa                                                               ; 8f77: 8a          .
    sta l1953                                                         ; 8f78: 8d 53 19    .S.
    tay                                                               ; 8f7b: a8          .
    jsr do_our_osword_1_x_3                                           ; 8f7c: 20 de bd     ..
    jsr cba1b                                                         ; 8f7f: 20 1b ba     ..
    cpy #&ff                                                          ; 8f82: c0 ff       ..
    beq c8f5d                                                         ; 8f84: f0 d7       ..
    lda l1953                                                         ; 8f86: ad 53 19    .S.
    cmp #2                                                            ; 8f89: c9 02       ..
    beq c8f9f                                                         ; 8f8b: f0 12       ..
    ldx #&43 ; 'C'                                                    ; 8f8d: a2 43       .C
    ldy #&45 ; 'E'                                                    ; 8f8f: a0 45       .E
    jsr sub_cb7e3                                                     ; 8f91: 20 e3 b7     ..
    jmp c8f9f                                                         ; 8f94: 4c 9f 8f    L..

.c8f97
    lda l1958                                                         ; 8f97: ad 58 19    .X.
    bne c8f5d                                                         ; 8f9a: d0 c1       ..
    jsr sub_cbbb1                                                     ; 8f9c: 20 b1 bb     ..
.c8f9f
    jsr sub_cbaf9                                                     ; 8f9f: 20 f9 ba     ..
    tya                                                               ; 8fa2: 98          .
    pha                                                               ; 8fa3: 48          H
    jsr sub_cbbb1                                                     ; 8fa4: 20 b1 bb     ..
    pla                                                               ; 8fa7: 68          h
    tay                                                               ; 8fa8: a8          .
    cpy #&ff                                                          ; 8fa9: c0 ff       ..
    beq c8f5d                                                         ; 8fab: f0 b0       ..
    ldx #&33 ; '3'                                                    ; 8fad: a2 33       .3
    ldy #8                                                            ; 8faf: a0 08       ..
    jsr cbd6e                                                         ; 8fb1: 20 6e bd     n.
    ldx #&37 ; '7'                                                    ; 8fb4: a2 37       .7
    ldy #&0c                                                          ; 8fb6: a0 0c       ..
    jsr cbd6e                                                         ; 8fb8: 20 6e bd     n.
    ldx #8                                                            ; 8fbb: a2 08       ..
    ldy #&0c                                                          ; 8fbd: a0 0c       ..
    jsr sub_cbae2                                                     ; 8fbf: 20 e2 ba     ..
    ldx #&0e                                                          ; 8fc2: a2 0e       ..
    ldy #&0a                                                          ; 8fc4: a0 0a       ..
    jsr sub_cbae2                                                     ; 8fc6: 20 e2 ba     ..
    lda l000c                                                         ; 8fc9: a5 0c       ..
    sec                                                               ; 8fcb: 38          8
    sbc l0008                                                         ; 8fcc: e5 08       ..
    sta l0010                                                         ; 8fce: 85 10       ..
    lda l000d                                                         ; 8fd0: a5 0d       ..
    sbc l0009                                                         ; 8fd2: e5 09       ..
    sta l0011                                                         ; 8fd4: 85 11       ..
    lda l000a                                                         ; 8fd6: a5 0a       ..
    sec                                                               ; 8fd8: 38          8
    sbc l000e                                                         ; 8fd9: e5 0e       ..
    sta l0012                                                         ; 8fdb: 85 12       ..
    lda l000b                                                         ; 8fdd: a5 0b       ..
    sbc l000f                                                         ; 8fdf: e5 0f       ..
    sta l0013                                                         ; 8fe1: 85 13       ..
    ldx #&24 ; '$'                                                    ; 8fe3: a2 24       .$
    ldy #&0c                                                          ; 8fe5: a0 0c       ..
    jsr cbd6e                                                         ; 8fe7: 20 6e bd     n.
    lda l1953                                                         ; 8fea: ad 53 19    .S.
    cmp #1                                                            ; 8fed: c9 01       ..
    beq c8ffb                                                         ; 8fef: f0 0a       ..
    cmp #3                                                            ; 8ff1: c9 03       ..
    bne c8ff8                                                         ; 8ff3: d0 03       ..
    jmp c9059                                                         ; 8ff5: 4c 59 90    LY.

.c8ff8
    jmp c90b7                                                         ; 8ff8: 4c b7 90    L..

.c8ffb
    lda l000c                                                         ; 8ffb: a5 0c       ..
    clc                                                               ; 8ffd: 18          .
    adc l0012                                                         ; 8ffe: 65 12       e.
    sta l000c                                                         ; 9000: 85 0c       ..
    lda l000d                                                         ; 9002: a5 0d       ..
    adc l0013                                                         ; 9004: 65 13       e.
    sta l000d                                                         ; 9006: 85 0d       ..
    jsr sub_cb617                                                     ; 9008: 20 17 b6     ..
    lda l0010                                                         ; 900b: a5 10       ..
    and #&fe                                                          ; 900d: 29 fe       ).
    sta l0010                                                         ; 900f: 85 10       ..
.c9011
    jsr sub_cb644                                                     ; 9011: 20 44 b6     D.
.c9014
    jsr sub_cb6a5                                                     ; 9014: 20 a5 b6     ..
    jsr sub_c8d97                                                     ; 9017: 20 97 8d     ..
    ldx #0                                                            ; 901a: a2 00       ..
    jsr sub_cb708                                                     ; 901c: 20 08 b7     ..
    jsr sub_c8d97                                                     ; 901f: 20 97 8d     ..
    jsr sub_cb71c                                                     ; 9022: 20 1c b7     ..
    ldx #4                                                            ; 9025: a2 04       ..
    jsr sub_cb71c                                                     ; 9027: 20 1c b7     ..
    ldx #4                                                            ; 902a: a2 04       ..
    jsr sub_cb6ac                                                     ; 902c: 20 ac b6     ..
    dec l0014                                                         ; 902f: c6 14       ..
    beq c9040                                                         ; 9031: f0 0d       ..
    ldx #0                                                            ; 9033: a2 00       ..
    jsr sub_cb6cd                                                     ; 9035: 20 cd b6     ..
    ldx #4                                                            ; 9038: a2 04       ..
    jsr sub_cb71c                                                     ; 903a: 20 1c b7     ..
    jmp c9014                                                         ; 903d: 4c 14 90    L..

.c9040
    ldx #&10                                                          ; 9040: a2 10       ..
    jsr sub_cb847                                                     ; 9042: 20 47 b8     G.
    jsr sub_cb847                                                     ; 9045: 20 47 b8     G.
    bne c904d                                                         ; 9048: d0 03       ..
    jmp c8f97                                                         ; 904a: 4c 97 8f    L..

.c904d
    ldx #8                                                            ; 904d: a2 08       ..
    lda #2                                                            ; 904f: a9 02       ..
    jsr sub_cbe72                                                     ; 9051: 20 72 be     r.
    inc l000e                                                         ; 9054: e6 0e       ..
    jmp c9011                                                         ; 9056: 4c 11 90    L..

.c9059
    lda l000e                                                         ; 9059: a5 0e       ..
    sec                                                               ; 905b: 38          8
    sbc l0010                                                         ; 905c: e5 10       ..
    sta l000e                                                         ; 905e: 85 0e       ..
    lda l000f                                                         ; 9060: a5 0f       ..
    sbc l0011                                                         ; 9062: e5 11       ..
    sta l000f                                                         ; 9064: 85 0f       ..
    jsr sub_cb617                                                     ; 9066: 20 17 b6     ..
    lda l0010                                                         ; 9069: a5 10       ..
    and #&fe                                                          ; 906b: 29 fe       ).
    sta l0010                                                         ; 906d: 85 10       ..
.c906f
    jsr sub_cb644                                                     ; 906f: 20 44 b6     D.
.c9072
    jsr sub_cb6a5                                                     ; 9072: 20 a5 b6     ..
    jsr sub_c8d97                                                     ; 9075: 20 97 8d     ..
    ldx #0                                                            ; 9078: a2 00       ..
    jsr sub_cb708                                                     ; 907a: 20 08 b7     ..
    jsr sub_c8d97                                                     ; 907d: 20 97 8d     ..
    jsr sub_cb71c                                                     ; 9080: 20 1c b7     ..
    ldx #4                                                            ; 9083: a2 04       ..
    jsr sub_cb708                                                     ; 9085: 20 08 b7     ..
    ldx #4                                                            ; 9088: a2 04       ..
    jsr sub_cb6ac                                                     ; 908a: 20 ac b6     ..
    dec l0014                                                         ; 908d: c6 14       ..
    beq c909e                                                         ; 908f: f0 0d       ..
    ldx #0                                                            ; 9091: a2 00       ..
    jsr sub_cb6cd                                                     ; 9093: 20 cd b6     ..
    ldx #4                                                            ; 9096: a2 04       ..
    jsr sub_cb708                                                     ; 9098: 20 08 b7     ..
    jmp c9072                                                         ; 909b: 4c 72 90    Lr.

.c909e
    ldx #&10                                                          ; 909e: a2 10       ..
.sub_c90a0
    jsr sub_cb847                                                     ; 90a0: 20 47 b8     G.
    jsr sub_cb847                                                     ; 90a3: 20 47 b8     G.
    bne c90ab                                                         ; 90a6: d0 03       ..
    jmp c8f97                                                         ; 90a8: 4c 97 8f    L..

.c90ab
    lda #2                                                            ; 90ab: a9 02       ..
    ldx #8                                                            ; 90ad: a2 08       ..
    jsr sub_cbe72                                                     ; 90af: 20 72 be     r.
    dec l000e                                                         ; 90b2: c6 0e       ..
    jmp c906f                                                         ; 90b4: 4c 6f 90    Lo.

.c90b7
    lda l000e                                                         ; 90b7: a5 0e       ..
    sec                                                               ; 90b9: 38          8
    sbc l0012                                                         ; 90ba: e5 12       ..
    sta l000e                                                         ; 90bc: 85 0e       ..
    lda l000f                                                         ; 90be: a5 0f       ..
    sbc l0013                                                         ; 90c0: e5 13       ..
    sta l000f                                                         ; 90c2: 85 0f       ..
    lda l000c                                                         ; 90c4: a5 0c       ..
    clc                                                               ; 90c6: 18          .
    adc l0010                                                         ; 90c7: 65 10       e.
    sta l000c                                                         ; 90c9: 85 0c       ..
    lda l000d                                                         ; 90cb: a5 0d       ..
    adc l0011                                                         ; 90cd: 65 11       e.
    sta l000d                                                         ; 90cf: 85 0d       ..
    jsr sub_cb617                                                     ; 90d1: 20 17 b6     ..
.c90d4
    jsr sub_cb644                                                     ; 90d4: 20 44 b6     D.
.loop_c90d7
    jsr sub_cb6a5                                                     ; 90d7: 20 a5 b6     ..
    jsr sub_c8d97                                                     ; 90da: 20 97 8d     ..
    dec l0014                                                         ; 90dd: c6 14       ..
    beq c90ee                                                         ; 90df: f0 0d       ..
    ldx #0                                                            ; 90e1: a2 00       ..
    jsr sub_cb6cd                                                     ; 90e3: 20 cd b6     ..
    ldx #4                                                            ; 90e6: a2 04       ..
    jsr sub_cb6e7                                                     ; 90e8: 20 e7 b6     ..
    jmp loop_c90d7                                                    ; 90eb: 4c d7 90    L..

.c90ee
    ldx #&10                                                          ; 90ee: a2 10       ..
    jsr sub_cb847                                                     ; 90f0: 20 47 b8     G.
    bne c90f8                                                         ; 90f3: d0 03       ..
    jmp c8f97                                                         ; 90f5: 4c 97 8f    L..

.c90f8
    inc l0008                                                         ; 90f8: e6 08       ..
    bne c90fe                                                         ; 90fa: d0 02       ..
    inc l0009                                                         ; 90fc: e6 09       ..
.c90fe
    ldx #&0c                                                          ; 90fe: a2 0c       ..
    jsr sub_cb847                                                     ; 9100: 20 47 b8     G.
    jmp c90d4                                                         ; 9103: 4c d4 90    L..

    equb &a0, &15, &20, &e3, &bd, &a0,   1, &8c, &4e, &19, &20, &de   ; 9106: a0 15 20... ..
    equb &bd, &a9,   0, &85, &23, &20, &0b, &83, &b0, &54, &a5, &2a   ; 9112: bd a9 00... ...
    equb &10, &51, &c0, &ff, &f0, &56, &c0,   1, &d0, &ef, &e0,   1   ; 911e: 10 51 c0... .Q.
    equb &f0, &34, &e0,   3, &d0, &16, &a0,   3, &20, &de, &bd, &a5   ; 912a: f0 34 e0... .4.
    equb &23, &a2,   3, &86, &23, &c9,   0, &f0, &d8, &a8, &20, &de   ; 9136: 23 a2 03... #..
    equb &bd, &4c, &17, &91, &e0,   4, &d0, &cd, &a0,   4, &20, &de   ; 9142: bd 4c 17... .L.
    equb &bd, &a5, &23, &a2,   4, &86, &23, &c9,   0, &f0, &be, &a8   ; 914e: bd a5 23... ..#
    equb &20, &de, &bd, &4c, &17, &91, &a0,   1, &20, &de, &bd, &ad   ; 915a: 20 de bd...  ..
    equb &4e, &19, &49,   1, &8d, &4e, &19, &4c, &17, &91, &60, &4c   ; 9166: 4e 19 49... N.I
    equb &8e, &8b, &20, &b1, &bb, &4c, &8e, &8b, &20, &1b, &ba, &c0   ; 9172: 8e 8b 20... ..
    equb &ff, &f0, &f0, &ad, &4e, &19, &d0, &66, &a2, &33, &a0        ; 917e: ff f0 f0... ...
    equs "; n"                                                        ; 9189: 3b 20 6e    ; n
    equb &bd, &a2, &37, &a0                                           ; 918c: bd a2 37... ..7
    equs "? n"                                                        ; 9190: 3f 20 6e    ? n
    equb &bd, &a2, &43, &a0                                           ; 9193: bd a2 43... ..C
    equs "K n"                                                        ; 9197: 4b 20 6e    K n
    equb &bd, &a0, &0d, &20, &18, &be, &20, &1b, &ba, &c0, &ff, &d0   ; 919a: bd a0 0d... ...
    equb &0d, &a0                                                     ; 91a6: 0d a0       ..
    equs "; K"                                                        ; 91a8: 3b 20 4b    ; K
    equb &bd, &a0                                                     ; 91ab: bd a0       ..
    equs "? K"                                                        ; 91ad: 3f 20 4b    ? K
    equb &bd, &4c, &8e, &8b, &20, &b1, &bb, &a0                       ; 91b0: bd 4c 8e... .L.
    equs "; K"                                                        ; 91b8: 3b 20 4b    ; K
    equb &bd, &a0                                                     ; 91bb: bd a0       ..
    equs "? K"                                                        ; 91bd: 3f 20 4b    ? K
    equb &bd, &a5, &43, &85, &47, &a5, &44, &85, &48, &a5, &4b, &85   ; 91c0: bd a5 43... ..C
    equb &49, &a5, &4c, &85, &4a, &a5, &3b, &85,   8, &a5, &3c, &85   ; 91cc: 49 a5 4c... I.L
    equb   9, &a5, &33, &85, &0c, &a5, &34, &85, &0d, &a5, &4b, &85   ; 91d8: 09 a5 33... ..3
    equb &10, &a5, &4c, &85, &11, &4c, &db, &92, &a5, &23, &d0,   3   ; 91e4: 10 a5 4c... ..L
    equb &4c, &7f, &92, &20, &b1, &bb, &a2, &43, &a0, &10, &20, &6e   ; 91f0: 4c 7f 92... L..
    equb &bd, &a5, &33, &85,   8, &a5, &34, &85,   9, &a5, &39, &85   ; 91fc: bd a5 33... ..3
    equb &0a, &a5, &3a, &85, &0b, &a2,   8, &a0, &0c, &20, &6e, &bd   ; 9208: 0a a5 3a... ..:
    equb &a9, &80, &85, &15, &85, &16, &a2,   0, &a5, &23, &c9,   3   ; 9214: a9 80 85... ...
    equb &f0, &53, &a2,   1, &a5,   8, &18, &65, &43, &85,   8, &a5   ; 9220: f0 53 a2... .S.
    equb   9, &65, &44, &85,   9, &a5, &0a, &38, &e5, &45, &85, &0a   ; 922c: 09 65 44... .eD
    equb &a5, &0b, &e5, &46, &85, &0b,   6                            ; 9238: a5 0b e5... ...
    equs "C&D"                                                        ; 923f: 43 26 44    C&D
    equb 6                                                            ; 9242: 06          .
    equs "E&F"                                                        ; 9243: 45 26 46    E&F
    equb &a5, &0c, &18, &65, &43, &85, &0c, &a5, &0d, &65, &44, &85   ; 9246: a5 0c 18... ...
    equb &0d, &a5, &0e, &38, &e5, &45, &85, &0e, &a5, &0f, &e5, &46   ; 9252: 0d a5 0e... ...
    equb &85, &0f, &a0, &0c, &20, &96, &b8, &b0, &15, &a0, &0e, &20   ; 925e: 85 0f a0... ...
    equb &c4, &b8, &b0, &0e, &a0, &0e, &20, &ad, &b8, &b0,   7, &86   ; 926a: c4 b8 b0... ...
    equb &17, &86, &18, &4c, &d9, &93, &4c, &8e, &8b, &20, &0b, &83   ; 9276: 17 86 18... ...
    equb &a5, &2a, &30,   6, &4c, &74, &91, &4c, &ec, &91, &a5        ; 9282: a5 2a 30... .*0
    equs "*) "                                                        ; 928d: 2a 29 20    *)
    equb &d0, &f7, &c0, &ff, &d0, &f3, &a5, &33, &38, &e5, &24, &a5   ; 9290: d0 f7 c0... ...
    equb &34, &e5, &25, &b0, &e8, &a5, &26, &38, &e5, &39, &a5, &27   ; 929c: 34 e5 25... 4.%
    equb &e5, &3a, &90,   3, &4c, &ec, &91, &20, &b1, &bb, &a5, &24   ; 92a8: e5 3a 90... .:.
    equb &38, &e5, &33, &85, &47, &a5, &25, &e5, &34, &85, &48, &a5   ; 92b4: 38 e5 33... 8.3
    equb &43, &85, &49, &a5, &44, &85, &4a, &a5, &33, &85,   8, &85   ; 92c0: 43 85 49... C.I
    equb &0c, &a5, &34, &85,   9, &85, &0d, &a5, &43, &85, &10, &a5   ; 92cc: 0c a5 34... ..4
    equb &44, &85, &11, &a9,   0, &85, &17, &85, &18, &ad, &4e, &19   ; 92d8: 44 85 11... D..
    equb &d0, &0e, &a5, &43, &38, &e5, &4b, &a5, &44, &e5, &4c, &90   ; 92e4: d0 0e a5... ...
    equb &3e, &4c, &ff, &92, &a5, &47, &38, &e5, &43, &a5, &48, &e5   ; 92f0: 3e 4c ff... >L.
    equb &44, &90, &30, &a9,   1, &85, &17, &a5, &37, &85,   8, &a5   ; 92fc: 44 90 30... D.0
    equb &38, &85,   9, &a5, &24, &85, &0c, &a5, &25, &85, &0d, &ad   ; 9308: 38 85 09... 8..
    equb &4e, &19, &d0, &10, &a5, &3f, &85,   8, &a5, &40, &85,   9   ; 9314: 4e 19 d0... N..
    equb &a5, &37, &85, &0c, &a5, &38, &85, &0d, &a2, &47, &a0, &49   ; 9320: a5 37 85... .7.
    equb &20, &e3, &b7, &20, &af, &ab, &a5, &4f, &85, &15, &a5, &39   ; 932c: 20 e3 b7...  ..
    equb &38, &e5, &26, &85, &47, &a5, &3a, &e5, &27, &85, &48, &a5   ; 9338: 38 e5 26... 8.&
    equb &45, &85, &49, &a5, &46, &85, &4a, &a5, &39, &85, &0a, &85   ; 9344: 45 85 49... E.I
    equb &0e, &a5, &3a, &85, &0b, &85, &0f, &a5, &45, &85, &12, &a5   ; 9350: 0e a5 3a... ..:
    equb &46, &85, &13, &ad, &4e, &19, &d0, &20, &a5, &45, &85, &47   ; 935c: 46 85 13... F..
    equb &a5, &46, &85, &48, &a5, &4d, &85, &49, &a5, &4e, &85, &4a   ; 9368: a5 46 85... .F.
    equb &a5, &41, &85, &0a, &a5, &42, &85, &0b, &a5, &4d, &85, &12   ; 9374: a5 41 85... .A.
    equb &a5, &4e, &85, &13, &ad, &4e, &19, &d0, &0e, &a5, &47, &38   ; 9380: a5 4e 85... .N.
    equb &e5, &4d, &a5, &48, &e5, &4e, &90, &3e, &4c, &a2, &93, &a5   ; 938c: e5 4d a5... .M.
    equb &47, &38, &e5, &45, &a5, &48, &e5, &46, &90, &30, &a9,   1   ; 9398: 47 38 e5... G8.
    equb &85, &18, &a5, &35, &85, &0a, &a5, &36, &85, &0b, &a5, &26   ; 93a4: 85 18 a5... ...
    equb &85, &0e, &a5, &27, &85, &0f, &ad, &4e, &19, &d0, &10, &a5   ; 93b0: 85 0e a5... ...
    equb &3d, &85, &0a, &a5, &3e, &85, &0b, &a5, &35, &85, &0e, &a5   ; 93bc: 3d 85 0a... =..
    equb &36, &85, &0f, &a2, &47, &a0, &49, &20, &e3, &b7, &20, &af   ; 93c8: 36 85 0f... 6..
    equb &ab, &a5, &4f, &85, &16, &20, &17, &b6, &a2,   8, &20, &47   ; 93d4: ab a5 4f... ..O
    equb &b8, &a5, &15, &85, &19, &a5, &16, &85, &1a, &20, &44, &b6   ; 93e0: b8 a5 15... ...
    equb &20, &a5, &b6, &a5, &15, &c9, &80, &d0, &3f, &a5, &17, &d0   ; 93ec: 20 a5 b6...  ..
    equb &3b, &a5, &1b, &85, &47, &a2,   0, &20,   8, &b7, &20, &9e   ; 93f8: 3b a5 1b... ;..
    equb &b6, &a5, &1b,   5, &47, &f0, &24, &a5, &1b, &f0,   4, &a5   ; 9404: b6 a5 1b... ...
    equb &47, &d0, &1c, &a2,   4, &20, &1c, &b7, &20, &9e, &b6, &a5   ; 9410: 47 d0 1c... G..
    equb &1b,   8, &a9,   0, &28, &d0,   2, &a9,   1, &85, &1b, &a2   ; 941c: 1b 08 a9... ...
    equb   4, &20,   8, &b7, &20, &ac, &b6, &a2,   0, &20, &1c, &b7   ; 9428: 04 20 08... . .
    equb &a5, &18, &d0, &1c, &a5, &15, &c6, &14, &f0, &46, &a2,   0   ; 9434: a5 18 d0... ...
    equb &20, &cd, &b6, &a5, &1a, &18, &65, &16, &85, &1a, &90, &e8   ; 9440: 20 cd b6...  ..
    equb &a2,   4, &20, &cd, &b6, &4c, &ec, &93, &a2,   4, &20, &e7   ; 944c: a2 04 20... ..
    equb &b6, &a5, &20, &29,   7, &c9,   7, &d0,   8, &a5, &21, &29   ; 9458: b6 a5 20... ..
    equb &f8, &c9, &34, &f0, &1b, &a5, &1a, &18, &65, &16, &85, &1a   ; 9464: f8 c9 34... ..4
    equb &b0,   3, &4c, &ec, &93, &c6, &14, &f0, &0b, &a2,   0, &20   ; 9470: b0 03 4c... ..L
    equb &e7, &b6, &4c, &ec, &93, &4c, &e5, &93, &a5, &17, &d0, &1f   ; 947c: e7 b6 4c... ..L
    equb &a2, &10, &20, &47, &b8, &f0, &41, &e6,   8, &d0,   2, &e6   ; 9488: a2 10 20... ..
    equb   9, &a5, &19, &18, &65, &15, &85, &19, &90, &e6, &e6, &0c   ; 9494: 09 a5 19... ...
    equb &d0,   2, &e6, &0d, &4c, &e5, &93, &a2, &0c, &20, &47, &b8   ; 94a0: d0 02 e6... ...
    equb &a5, &0d, &c9,   0, &d0,   6, &a5, &0c, &c9, &17, &f0, &18   ; 94ac: a5 0d c9... ...
    equb &a5, &19, &18, &65, &15, &85, &19, &90, &c0, &a2, &10, &20   ; 94b8: a5 19 18... ...
    equb &47, &b8, &f0,   8, &a2,   8, &20, &47, &b8, &4c, &e5, &93   ; 94c4: 47 b8 f0... G..
    equb &4c, &8e, &8b, &1c, &95, &ab, &9d, &90, &95, &76, &96, &2d   ; 94d0: 4c 8e 8b... L..
    equb &96                                                          ; 94dc: 96          .

.sub_c94dd
    lda l1917                                                         ; 94dd: ad 17 19    ...
    pha                                                               ; 94e0: 48          H
    lda #1                                                            ; 94e1: a9 01       ..
    sta l1917                                                         ; 94e3: 8d 17 19    ...
    dec l1908                                                         ; 94e6: ce 08 19    ...
    dec l1908                                                         ; 94e9: ce 08 19    ...
    dec l1908                                                         ; 94ec: ce 08 19    ...
    jsr c9500                                                         ; 94ef: 20 00 95     ..
    inc l1908                                                         ; 94f2: ee 08 19    ...
    inc l1908                                                         ; 94f5: ee 08 19    ...
    inc l1908                                                         ; 94f8: ee 08 19    ...
    pla                                                               ; 94fb: 68          h
    sta l1917                                                         ; 94fc: 8d 17 19    ...
.c94ff
    rts                                                               ; 94ff: 60          `

.c9500
    ldy #2                                                            ; 9500: a0 02       ..
    jsr do_our_osword_1_x_4                                           ; 9502: 20 e3 bd     ..
.loop_c9505
    jsr c830b                                                         ; 9505: 20 0b 83     ..
    cpy #2                                                            ; 9508: c0 02       ..
    beq c94ff                                                         ; 950a: f0 f3       ..
    lda l002a                                                         ; 950c: a5 2a       .*
    bpl c94ff                                                         ; 950e: 10 ef       ..
    cpy #1                                                            ; 9510: c0 01       ..
    bne loop_c9505                                                    ; 9512: d0 f1       ..
    txa                                                               ; 9514: 8a          .
    ldx #&d3                                                          ; 9515: a2 d3       ..
    ldy #&94                                                          ; 9517: a0 94       ..
    jmp cb77e                                                         ; 9519: 4c 7e b7    L~.

    equb &a0,   3, &20, &e3, &bd, &ac, &6b, &19, &20, &de, &bd, &ad   ; 951c: a0 03 20... ..
    equb &6a, &19, &f0,   5, &a0,   5, &20, &de, &bd, &20, &0b, &83   ; 9528: 6a 19 f0... j..
    equb &a5, &2a, &10, &c8, &c0,   2, &f0, &53, &c0,   1, &d0, &f1   ; 9534: a5 2a 10... .*.
    equb &e0,   5, &f0, &13, &8a, &48, &ac, &6b, &19, &20, &de, &bd   ; 9540: e0 05 f0... ...
    equb &68, &a8, &8c, &6b, &19, &20, &de, &bd, &4c, &31, &95, &a0   ; 954c: 68 a8 8c... h..
    equb   5, &20, &de, &bd, &a0,   7, &ad, &6a, &19, &49,   1, &8d   ; 9558: 05 20 de... . .
    equb &6a, &19, &f0, &0c, &b9, &bd, &19, &99, &59, &19, &88, &10   ; 9564: 6a 19 f0... j..
    equb &f7, &4c, &8c, &95, &b9, &59, &19, &99, &bd, &19, &88, &10   ; 9570: f7 4c 8c... .L.
    equb &f7, &a2, &17, &20, &6b, &b7, &a9, &10, &8d, &5d, &19, &a9   ; 957c: f7 a2 17... ...
    equb &20, &8d, &5f, &19, &4c, &31, &95, &60, &20, &ee, &b9, &90   ; 9588: 20 8d 5f...  ._
    equb   3, &4c,   0, &95, &a0,   6, &20, &e3, &bd, &20, &0b, &83   ; 9594: 03 4c 00... .L.
    equb &c0,   2, &f0, &eb, &a5, &2a, &30,   3, &4c,   0, &95, &c0   ; 95a0: c0 02 f0... ...
    equb   1, &d0, &ee, &e0,   1, &d0,   3, &4c, &ef, &95, &e0,   2   ; 95ac: 01 d0 ee... ...
    equb &d0, &0b, &a9, &46, &8d, &43, &19, &20, &2b, &bc, &4c, &90   ; 95b8: d0 0b a9... ...
    equb &95, &e0,   3, &d0,   8, &a9,   0, &8d, &6e, &19, &4c, &38   ; 95c4: 95 e0 03... ...
    equb &96, &e0,   4, &d0,   8, &a9,   1, &8d, &6e, &19, &4c, &38   ; 95d0: 96 e0 04... ...
    equb &96, &e0,   5, &d0, &0b, &a9, &24, &8d, &43, &19, &20, &2b   ; 95dc: 96 e0 05... ...
    equb &bc, &4c, &90, &95, &4c, &9d, &95, &a0,   1, &20, &de, &bd   ; 95e8: bc 4c 90... .L.
    equb &a9, &46, &8d, &43, &19, &20, &59, &bc, &90,   3, &4c,   0   ; 95f4: a9 46 8d... .F.
    equb &95, &a9, &40, &8d, &2c, &19, &a9, &19, &8d, &2d, &19, &a2   ; 9600: 95 a9 40... ..@
    equb &10, &a9,   0, &9d, &2d, &19, &ca, &d0, &fa, &a9, &da, &8d   ; 960c: 10 a9 00... ...
    equb &2e, &19, &a9, &19, &8d, &2f, &19, &a9,   0, &8d, &32, &19   ; 9618: 2e 19 a9... ...
    equb &a9, &ff, &a2, &2c, &a0, &19, &20, &dd, &ff, &a2, &15, &20   ; 9624: a9 ff a2... ...
    equb &6b, &b7, &20, &46, &bd, &4c,   0, &95, &ad, &6e, &19, &18   ; 9630: 6b b7 20... k.
    equb &69,   3, &a8, &20, &de, &bd, &20, &6d, &bc, &b0, &ee, &20   ; 963c: 69 03 a8... i..
    equb &7e, &be, &90,   3, &4c, &90, &95, &a9,   1, &8d, &6f, &19   ; 9648: 7e be 90... ~..
    equb &4c, &7b, &96, &60, &a0,   0, &a2,   8, &a9, &17, &20, &ee   ; 9654: 4c 7b 96... L{.
    equb &ff, &a9, &e0, &20, &ee, &ff, &b1,   8, &20, &ee, &ff, &c8   ; 9660: ff a9 e0... ...
    equb &c8, &ca, &d0, &f6, &a9, &e0, &20, &ee, &ff, &60, &a9,   0   ; 966c: c8 ca d0... ...
    equb &8d, &6f, &19                                                ; 9678: 8d 6f 19    .o.

.c967b
    jsr sub_cb739                                                     ; 967b: 20 39 b7     9.
    lda #0                                                            ; 967e: a9 00       ..
    sta l1969                                                         ; 9680: 8d 69 19    .i.
.c9683
    lda #0                                                            ; 9683: a9 00       ..
    sta l004d                                                         ; 9685: 85 4d       .M
    jsr do_our_osword_1_x_5                                           ; 9687: 20 e8 bd     ..
    ldy #3                                                            ; 968a: a0 03       ..
    jsr sub_cbe18                                                     ; 968c: 20 18 be     ..
    lda l195d                                                         ; 968f: ad 5d 19    .].
    sta l0043                                                         ; 9692: 85 43       .C
    lda #0                                                            ; 9694: a9 00       ..
    sta l0044                                                         ; 9696: 85 44       .D
    lda l195f                                                         ; 9698: ad 5f 19    ._.
    sta l0045                                                         ; 969b: 85 45       .E
    lda l1960                                                         ; 969d: ad 60 19    .`.
    sta l0046                                                         ; 96a0: 85 46       .F
    jsr sub_cbaf9                                                     ; 96a2: 20 f9 ba     ..
    cpy #&ff                                                          ; 96a5: c0 ff       ..
    bne c96ac                                                         ; 96a7: d0 03       ..
    jmp c9500                                                         ; 96a9: 4c 00 95    L..

.c96ac
    jsr sub_cb854                                                     ; 96ac: 20 54 b8     T.
    jsr sub_cb7fc                                                     ; 96af: 20 fc b7     ..
    ldx #&24 ; '$'                                                    ; 96b2: a2 24       .$
    ldy #&33 ; '3'                                                    ; 96b4: a0 33       .3
    jsr cbd6e                                                         ; 96b6: 20 6e bd     n.
    ldx #&33 ; '3'                                                    ; 96b9: a2 33       .3
    ldy #&37 ; '7'                                                    ; 96bb: a0 37       .7
    jsr cbd6e                                                         ; 96bd: 20 6e bd     n.
    lda #0                                                            ; 96c0: a9 00       ..
    sta l1967                                                         ; 96c2: 8d 67 19    .g.
.loop_c96c5
    lda l0033                                                         ; 96c5: a5 33       .3
    clc                                                               ; 96c7: 18          .
    adc l195d                                                         ; 96c8: 6d 5d 19    m].
    sta l0033                                                         ; 96cb: 85 33       .3
    lda l0034                                                         ; 96cd: a5 34       .4
    adc l195e                                                         ; 96cf: 6d 5e 19    m^.
    sta l0034                                                         ; 96d2: 85 34       .4
    inc l1967                                                         ; 96d4: ee 67 19    .g.
    lda l0033                                                         ; 96d7: a5 33       .3
    sec                                                               ; 96d9: 38          8
    sbc l1904                                                         ; 96da: ed 04 19    ...
    lda l0034                                                         ; 96dd: a5 34       .4
    sbc l1905                                                         ; 96df: ed 05 19    ...
    bcc loop_c96c5                                                    ; 96e2: 90 e1       ..
    lda l1967                                                         ; 96e4: ad 67 19    .g.
    cmp #3                                                            ; 96e7: c9 03       ..
    bcs c96ee                                                         ; 96e9: b0 03       ..
    jmp c967b                                                         ; 96eb: 4c 7b 96    L{.

.c96ee
    ldx #&37 ; '7'                                                    ; 96ee: a2 37       .7
    ldy #&33 ; '3'                                                    ; 96f0: a0 33       .3
    jsr cbd6e                                                         ; 96f2: 20 6e bd     n.
    ldy #&18                                                          ; 96f5: a0 18       ..
    jsr sub_cbe18                                                     ; 96f7: 20 18 be     ..
.c96fa
    lda #0                                                            ; 96fa: a9 00       ..
    sta l196d                                                         ; 96fc: 8d 6d 19    .m.
    lda l1969                                                         ; 96ff: ad 69 19    .i.
    beq c9715                                                         ; 9702: f0 11       ..
    ldy l004f                                                         ; 9704: a4 4f       .O
    lda l0900,y                                                       ; 9706: b9 00 09    ...
    cmp #&20 ; ' '                                                    ; 9709: c9 20       .
    bne c9715                                                         ; 970b: d0 08       ..
    inc l004f                                                         ; 970d: e6 4f       .O
    dec l1969                                                         ; 970f: ce 69 19    .i.
    jmp c96fa                                                         ; 9712: 4c fa 96    L..

.c9715
    lda #0                                                            ; 9715: a9 00       ..
    sta l1961                                                         ; 9717: 8d 61 19    .a.
    lda #1                                                            ; 971a: a9 01       ..
    sta l1966                                                         ; 971c: 8d 66 19    .f.
.c971f
    ldy #&33 ; '3'                                                    ; 971f: a0 33       .3
    jsr sub_cbbbb                                                     ; 9721: 20 bb bb     ..
.c9724
    lda l1969                                                         ; 9724: ad 69 19    .i.
    beq c974b                                                         ; 9727: f0 22       ."
    ldy l004f                                                         ; 9729: a4 4f       .O
    dec l1969                                                         ; 972b: ce 69 19    .i.
    lda l0900,y                                                       ; 972e: b9 00 09    ...
    inc l004f                                                         ; 9731: e6 4f       .O
    cmp #&0d                                                          ; 9733: c9 0d       ..
    beq c973b                                                         ; 9735: f0 04       ..
    cmp #&20 ; ' '                                                    ; 9737: c9 20       .
    bcc c9724                                                         ; 9739: 90 e9       ..
.c973b
    ldx l1961                                                         ; 973b: ae 61 19    .a.
    bne c9743                                                         ; 973e: d0 03       ..
    jmp c97d9                                                         ; 9740: 4c d9 97    L..

.c9743
    cmp #&20 ; ' '                                                    ; 9743: c9 20       .
    beq c9724                                                         ; 9745: f0 dd       ..
    clc                                                               ; 9747: 18          .
    jmp c97f9                                                         ; 9748: 4c f9 97    L..

.c974b
    lda l196f                                                         ; 974b: ad 6f 19    .o.
    bne c9787                                                         ; 974e: d0 37       .7
.loop_c9750
    jsr do_our_osword_2_yx_24_and_postprocess                         ; 9750: 20 26 b9     &.
    lda l002a                                                         ; 9753: a5 2a       .*
    bmi c9760                                                         ; 9755: 30 09       0.
    jsr long_delay                                                    ; 9757: 20 1f a9     ..
    lda #&ff                                                          ; 975a: a9 ff       ..
    sec                                                               ; 975c: 38          8
    jmp c97f9                                                         ; 975d: 4c f9 97    L..

.c9760
    lda #osbyte_inkey                                                 ; 9760: a9 81       ..
    ldx #0                                                            ; 9762: a2 00       ..
    ldy #0                                                            ; 9764: a0 00       ..
    jsr osbyte                                                        ; 9766: 20 f4 ff     ..            ; Wait for a key press within 0 centiseconds
    cpy #&ff                                                          ; 9769: c0 ff       ..             ; Y is zero if key pressed; &ff if no key pressed; &1b if ESCAPE pressed
    beq loop_c9750                                                    ; 976b: f0 e3       ..
; X is the ASCII value of the key pressed (assuming Y=0)
    txa                                                               ; 976d: 8a          .
    cpy #&1b                                                          ; 976e: c0 1b       ..
    beq c977f                                                         ; 9770: f0 0d       ..
    cmp #&0d                                                          ; 9772: c9 0d       ..
    clc                                                               ; 9774: 18          .
    beq c977c                                                         ; 9775: f0 05       ..
    cmp #&20 ; ' '                                                    ; 9777: c9 20       .
    bcc c9760                                                         ; 9779: 90 e5       ..
    clc                                                               ; 977b: 18          .
.c977c
    jmp c97f9                                                         ; 977c: 4c f9 97    L..

.c977f
    jsr sub_cb854                                                     ; 977f: 20 54 b8     T.
    lda #&1b                                                          ; 9782: a9 1b       ..
    jmp c97f9                                                         ; 9784: 4c f9 97    L..

.c9787
    jsr sub_cb854                                                     ; 9787: 20 54 b8     T.
    bcc c9791                                                         ; 978a: 90 05       ..
    lda #&1b                                                          ; 978c: a9 1b       ..
    jmp c97f9                                                         ; 978e: 4c f9 97    L..

.c9791
    lda l196e                                                         ; 9791: ad 6e 19    .n.
    beq c97dd                                                         ; 9794: f0 47       .G
.c9796
    ldy l192d                                                         ; 9796: ac 2d 19    .-.            ; Y=file handle
    jsr osbget                                                        ; 9799: 20 d7 ff     ..            ; Read a single byte from an open file Y
    bcs c97f9                                                         ; 979c: b0 5b       .[
    cmp #&7f                                                          ; 979e: c9 7f       ..
    bcc c97b1                                                         ; 97a0: 90 0f       ..
.c97a2
    ldy l192d                                                         ; 97a2: ac 2d 19    .-.            ; Y=file handle
    jsr osbget                                                        ; 97a5: 20 d7 ff     ..            ; Read a single byte from an open file Y
.sub_c97a8
    bcs c97f9                                                         ; 97a8: b0 4f       .O
    cmp #&0d                                                          ; 97aa: c9 0d       ..
    bne c97a2                                                         ; 97ac: d0 f4       ..
    jmp c9796                                                         ; 97ae: 4c 96 97    L..

.c97b1
    cmp #&0d                                                          ; 97b1: c9 0d       ..
    bne c97d5                                                         ; 97b3: d0 20       .
    ldy l192d                                                         ; 97b5: ac 2d 19    .-.            ; Y=file handle
    jsr osbget                                                        ; 97b8: 20 d7 ff     ..            ; Read a single byte from an open file Y
    bcs c97f9                                                         ; 97bb: b0 3c       .<
    cmp #&7f                                                          ; 97bd: c9 7f       ..
    bcs c97a2                                                         ; 97bf: b0 e1       ..
    sta l09e0                                                         ; 97c1: 8d e0 09    ...
    pha                                                               ; 97c4: 48          H
    lda #1                                                            ; 97c5: a9 01       ..
    sta l1969                                                         ; 97c7: 8d 69 19    .i.
    lda #&e0                                                          ; 97ca: a9 e0       ..
    sta l004f                                                         ; 97cc: 85 4f       .O
    pla                                                               ; 97ce: 68          h
    cmp #&0d                                                          ; 97cf: c9 0d       ..
    beq c97d9                                                         ; 97d1: f0 06       ..
    lda #&20 ; ' '                                                    ; 97d3: a9 20       .
.c97d5
    cmp #&20 ; ' '                                                    ; 97d5: c9 20       .
    bcc c9796                                                         ; 97d7: 90 bd       ..
.c97d9
    clc                                                               ; 97d9: 18          .
    jmp c97f9                                                         ; 97da: 4c f9 97    L..

.c97dd
    ldy l192d                                                         ; 97dd: ac 2d 19    .-.            ; Y=file handle
    jsr osbget                                                        ; 97e0: 20 d7 ff     ..            ; Read a single byte from an open file Y
    bcs c97f9                                                         ; 97e3: b0 14       ..
    cmp #2                                                            ; 97e5: c9 02       ..
    clc                                                               ; 97e7: 18          .
    bne c97f9                                                         ; 97e8: d0 0f       ..
.loop_c97ea
    ldy l192d                                                         ; 97ea: ac 2d 19    .-.            ; Y=file handle
    jsr osbget                                                        ; 97ed: 20 d7 ff     ..            ; Read a single byte from an open file Y
    bcs c97f9                                                         ; 97f0: b0 07       ..
    cmp #7                                                            ; 97f2: c9 07       ..
    bne loop_c97ea                                                    ; 97f4: d0 f4       ..
    jmp c97dd                                                         ; 97f6: 4c dd 97    L..

.c97f9
    pha                                                               ; 97f9: 48          H
    php                                                               ; 97fa: 08          .
    ldy #&33 ; '3'                                                    ; 97fb: a0 33       .3
    jsr sub_cbbbb                                                     ; 97fd: 20 bb bb     ..
    plp                                                               ; 9800: 28          (
    pla                                                               ; 9801: 68          h
    sta l194e                                                         ; 9802: 8d 4e 19    .N.
    bcs c9814                                                         ; 9805: b0 0d       ..
    jsr do_our_osword_2_yx_24_and_postprocess                         ; 9807: 20 26 b9     &.
    lda l002a                                                         ; 980a: a5 2a       .*
    bpl c9814                                                         ; 980c: 10 06       ..
    lda l194e                                                         ; 980e: ad 4e 19    .N.
    jmp c983a                                                         ; 9811: 4c 3a 98    L:.

.c9814
    cmp #&1b                                                          ; 9814: c9 1b       ..
    beq c9827                                                         ; 9816: f0 0f       ..
    cmp #&ff                                                          ; 9818: c9 ff       ..
    bne c9827                                                         ; 981a: d0 0b       ..
.loop_c981c
    lda l1961                                                         ; 981c: ad 61 19    .a.
    beq c9827                                                         ; 981f: f0 06       ..
    jsr sub_c984c                                                     ; 9821: 20 4c 98     L.
    jmp loop_c981c                                                    ; 9824: 4c 1c 98    L..

.c9827
    lda l196f                                                         ; 9827: ad 6f 19    .o.
    beq c9837                                                         ; 982a: f0 0b       ..
    lda #osfind_close                                                 ; 982c: a9 00       ..
    sta l196f                                                         ; 982e: 8d 6f 19    .o.
    ldy l192d                                                         ; 9831: ac 2d 19    .-.
    jsr osfind                                                        ; 9834: 20 ce ff     ..            ; Close one or all files
.c9837
    jmp c967b                                                         ; 9837: 4c 7b 96    L{.

.c983a
    cmp #&7f                                                          ; 983a: c9 7f       ..
    bne c985f                                                         ; 983c: d0 21       .!
    ldy l1961                                                         ; 983e: ac 61 19    .a.
    bne c9846                                                         ; 9841: d0 03       ..
    jmp c971f                                                         ; 9843: 4c 1f 97    L..

.c9846
    jsr sub_c984c                                                     ; 9846: 20 4c 98     L.
    jmp c971f                                                         ; 9849: 4c 1f 97    L..

.sub_c984c
    jsr c9aa8                                                         ; 984c: 20 a8 9a     ..
    jsr sub_ca00f                                                     ; 984f: 20 0f a0     ..
    ldy l1961                                                         ; 9852: ac 61 19    .a.
    lda l0900,y                                                       ; 9855: b9 00 09    ...
    jsr sub_c9c36                                                     ; 9858: 20 36 9c     6.
    dec l1961                                                         ; 985b: ce 61 19    .a.
    rts                                                               ; 985e: 60          `

.c985f
    cmp #&0d                                                          ; 985f: c9 0d       ..
    bne c98d7                                                         ; 9861: d0 74       .t
    lda l1961                                                         ; 9863: ad 61 19    .a.
    beq c98cc                                                         ; 9866: f0 64       .d
    lda l196b                                                         ; 9868: ad 6b 19    .k.
    cmp #1                                                            ; 986b: c9 01       ..
    bne c98b6                                                         ; 986d: d0 47       .G
    inc l1961                                                         ; 986f: ee 61 19    .a.
    jsr sub_c98f3                                                     ; 9872: 20 f3 98     ..
.c9875
    lda l1961                                                         ; 9875: ad 61 19    .a.
    sta l004e                                                         ; 9878: 85 4e       .N
    lda l1904                                                         ; 987a: ad 04 19    ...
    sec                                                               ; 987d: 38          8
    sbc l0037                                                         ; 987e: e5 37       .7
    sta l0033                                                         ; 9880: 85 33       .3
    lda l1905                                                         ; 9882: ad 05 19    ...
    sbc l0038                                                         ; 9885: e5 38       .8
    sta l0034                                                         ; 9887: 85 34       .4
.loop_c9889
    dec l004e                                                         ; 9889: c6 4e       .N
    beq c989f                                                         ; 988b: f0 12       ..
    lda l0033                                                         ; 988d: a5 33       .3
    sec                                                               ; 988f: 38          8
    sbc l195d                                                         ; 9890: ed 5d 19    .].
    sta l0033                                                         ; 9893: 85 33       .3
    lda l0034                                                         ; 9895: a5 34       .4
    sbc l195e                                                         ; 9897: ed 5e 19    .^.
    sta l0034                                                         ; 989a: 85 34       .4
    jmp loop_c9889                                                    ; 989c: 4c 89 98    L..

.c989f
    lsr l0034                                                         ; 989f: 46 34       F4
    ror l0033                                                         ; 98a1: 66 33       f3
    lda l0033                                                         ; 98a3: a5 33       .3
    clc                                                               ; 98a5: 18          .
    adc l0037                                                         ; 98a6: 65 37       e7
    sta l0033                                                         ; 98a8: 85 33       .3
    lda l0034                                                         ; 98aa: a5 34       .4
    adc l0038                                                         ; 98ac: 65 38       e8
    sta l0034                                                         ; 98ae: 85 34       .4
    jsr sub_c9a48                                                     ; 98b0: 20 48 9a     H.
    jmp c96fa                                                         ; 98b3: 4c fa 96    L..

.c98b6
    inc l1961                                                         ; 98b6: ee 61 19    .a.
    lda l1913                                                         ; 98b9: ad 13 19    ...
    cmp #2                                                            ; 98bc: c9 02       ..
    bne c98c6                                                         ; 98be: d0 06       ..
    jsr sub_c9c26                                                     ; 98c0: 20 26 9c     &.
    jmp c96fa                                                         ; 98c3: 4c fa 96    L..

.c98c6
    jsr sub_c9a45                                                     ; 98c6: 20 45 9a     E.
    jmp c96fa                                                         ; 98c9: 4c fa 96    L..

.c98cc
    jsr sub_c9c26                                                     ; 98cc: 20 26 9c     &.
    bcc c98d4                                                         ; 98cf: 90 03       ..
    jmp c9827                                                         ; 98d1: 4c 27 98    L'.

.c98d4
    jmp c96fa                                                         ; 98d4: 4c fa 96    L..

.c98d7
    inc l1961                                                         ; 98d7: ee 61 19    .a.
    ldy l1961                                                         ; 98da: ac 61 19    .a.
    sta l0900,y                                                       ; 98dd: 99 00 09    ...
    cpy l1967                                                         ; 98e0: cc 67 19    .g.
    beq c9916                                                         ; 98e3: f0 31       .1
    pha                                                               ; 98e5: 48          H
    jsr sub_ca00f                                                     ; 98e6: 20 0f a0     ..
    pla                                                               ; 98e9: 68          h
    jsr sub_c9c36                                                     ; 98ea: 20 36 9c     6.
    jsr c9c0c                                                         ; 98ed: 20 0c 9c     ..
    jmp c971f                                                         ; 98f0: 4c 1f 97    L..

.sub_c98f3
    jsr sub_c9c2d                                                     ; 98f3: 20 2d 9c     -.
    lda #1                                                            ; 98f6: a9 01       ..
    sta l1962                                                         ; 98f8: 8d 62 19    .b.
.loop_c98fb
    jsr sub_ca00f                                                     ; 98fb: 20 0f a0     ..
    ldy l1962                                                         ; 98fe: ac 62 19    .b.
    lda l0900,y                                                       ; 9901: b9 00 09    ...
    jsr sub_c9c36                                                     ; 9904: 20 36 9c     6.
    inc l1962                                                         ; 9907: ee 62 19    .b.
    jsr c9c0c                                                         ; 990a: 20 0c 9c     ..
    ldy l1962                                                         ; 990d: ac 62 19    .b.
    cpy l1961                                                         ; 9910: cc 61 19    .a.
    bne loop_c98fb                                                    ; 9913: d0 e6       ..
    rts                                                               ; 9915: 60          `

.c9916
    lda #0                                                            ; 9916: a9 00       ..
    sta l1969                                                         ; 9918: 8d 69 19    .i.
    jsr sub_c98f3                                                     ; 991b: 20 f3 98     ..
    lda l196b                                                         ; 991e: ad 6b 19    .k.
    cmp #4                                                            ; 9921: c9 04       ..
    beq c994d                                                         ; 9923: f0 28       .(
    ldx #&ff                                                          ; 9925: a2 ff       ..
    ldy l1961                                                         ; 9927: ac 61 19    .a.
.c992a
    lda l0900,y                                                       ; 992a: b9 00 09    ...
    inx                                                               ; 992d: e8          .
    dey                                                               ; 992e: 88          .
    bne c995d                                                         ; 992f: d0 2c       .,
    ldy l1961                                                         ; 9931: ac 61 19    .a.
    lda l0900,y                                                       ; 9934: b9 00 09    ...
    sta l0901,y                                                       ; 9937: 99 01 09    ...
    lda l08ff,y                                                       ; 993a: b9 ff 08    ...
    sta l0900,y                                                       ; 993d: 99 00 09    ...
    dey                                                               ; 9940: 88          .
    lda #&2d ; '-'                                                    ; 9941: a9 2d       .-
    sta l0900,y                                                       ; 9943: 99 00 09    ...
    iny                                                               ; 9946: c8          .
    sty l004f                                                         ; 9947: 84 4f       .O
    lda #2                                                            ; 9949: a9 02       ..
    bne c9954                                                         ; 994b: d0 07       ..
.c994d
    lda l1967                                                         ; 994d: ad 67 19    .g.
    sta l004f                                                         ; 9950: 85 4f       .O
    lda #1                                                            ; 9952: a9 01       ..
.c9954
    sta l1969                                                         ; 9954: 8d 69 19    .i.
.c9957
    jsr sub_c9a45                                                     ; 9957: 20 45 9a     E.
    jmp c96fa                                                         ; 995a: 4c fa 96    L..

.c995d
    cmp #&20 ; ' '                                                    ; 995d: c9 20       .
    bne c992a                                                         ; 995f: d0 c9       ..
    cpx #0                                                            ; 9961: e0 00       ..
    bne c9968                                                         ; 9963: d0 03       ..
    jmp c994d                                                         ; 9965: 4c 4d 99    LM.

.c9968
    stx l004c                                                         ; 9968: 86 4c       .L
    lda l196b                                                         ; 996a: ad 6b 19    .k.
    cmp #1                                                            ; 996d: c9 01       ..
    bne c998d                                                         ; 996f: d0 1c       ..
    tya                                                               ; 9971: 98          .
    pha                                                               ; 9972: 48          H
    lda l004c                                                         ; 9973: a5 4c       .L
    sta l1969                                                         ; 9975: 8d 69 19    .i.
    inc l1969                                                         ; 9978: ee 69 19    .i.
    lda l1961                                                         ; 997b: ad 61 19    .a.
    sec                                                               ; 997e: 38          8
    sbc l004c                                                         ; 997f: e5 4c       .L
    sta l004f                                                         ; 9981: 85 4f       .O
    pla                                                               ; 9983: 68          h
    sta l1961                                                         ; 9984: 8d 61 19    .a.
    inc l1961                                                         ; 9987: ee 61 19    .a.
    jmp c9875                                                         ; 998a: 4c 75 98    Lu.

.c998d
    lda l196b                                                         ; 998d: ad 6b 19    .k.
    cmp #2                                                            ; 9990: c9 02       ..
    bne c999c                                                         ; 9992: d0 08       ..
    lda l196c                                                         ; 9994: ad 6c 19    .l.
    beq c999c                                                         ; 9997: f0 03       ..
    jsr sub_c9fa1                                                     ; 9999: 20 a1 9f     ..
.c999c
    dey                                                               ; 999c: 88          .
    beq c99a9                                                         ; 999d: f0 0a       ..
    lda l0900,y                                                       ; 999f: b9 00 09    ...
    cmp #&20 ; ' '                                                    ; 99a2: c9 20       .
    bne c999c                                                         ; 99a4: d0 f6       ..
    jmp c99b7                                                         ; 99a6: 4c b7 99    L..

.c99a9
    lda l196b                                                         ; 99a9: ad 6b 19    .k.
    cmp #3                                                            ; 99ac: c9 03       ..
    beq c99b7                                                         ; 99ae: f0 07       ..
    dec l004c                                                         ; 99b0: c6 4c       .L
    lda #1                                                            ; 99b2: a9 01       ..
    sta l1969                                                         ; 99b4: 8d 69 19    .i.
.c99b7
    lda l1961                                                         ; 99b7: ad 61 19    .a.
    sec                                                               ; 99ba: 38          8
    sbc l004c                                                         ; 99bb: e5 4c       .L
    sta l1962                                                         ; 99bd: 8d 62 19    .b.
    ldy l1967                                                         ; 99c0: ac 67 19    .g.
    iny                                                               ; 99c3: c8          .
    sty l004f                                                         ; 99c4: 84 4f       .O
    lda l196b                                                         ; 99c6: ad 6b 19    .k.
    cmp #3                                                            ; 99c9: c9 03       ..
    bne c99d0                                                         ; 99cb: d0 03       ..
    inc l1962                                                         ; 99cd: ee 62 19    .b.
.c99d0
    lda l196b                                                         ; 99d0: ad 6b 19    .k.
    ldy #1                                                            ; 99d3: a0 01       ..
    cmp #3                                                            ; 99d5: c9 03       ..
    bne c99dd                                                         ; 99d7: d0 04       ..
    ldy l1962                                                         ; 99d9: ac 62 19    .b.
    dey                                                               ; 99dc: 88          .
.c99dd
    lda l0900,y                                                       ; 99dd: b9 00 09    ...
    cmp #&20 ; ' '                                                    ; 99e0: c9 20       .
    beq c99f3                                                         ; 99e2: f0 0f       ..
    iny                                                               ; 99e4: c8          .
.c99e5
    cpy l1962                                                         ; 99e5: cc 62 19    .b.
    bcc c99dd                                                         ; 99e8: 90 f3       ..
    cpx #0                                                            ; 99ea: e0 00       ..
    beq c9a39                                                         ; 99ec: f0 4b       .K
    bmi c9a39                                                         ; 99ee: 30 49       0I
    jmp c99d0                                                         ; 99f0: 4c d0 99    L..

.c99f3
    sty l004b                                                         ; 99f3: 84 4b       .K
    tya                                                               ; 99f5: 98          .
    clc                                                               ; 99f6: 18          .
    adc #0                                                            ; 99f7: 69 00       i.
    sta l0047                                                         ; 99f9: 85 47       .G
    sta l0049                                                         ; 99fb: 85 49       .I
    lda #9                                                            ; 99fd: a9 09       ..
    adc #0                                                            ; 99ff: 69 00       i.
    sta l0048                                                         ; 9a01: 85 48       .H
    sta l004a                                                         ; 9a03: 85 4a       .J
    inc l0049                                                         ; 9a05: e6 49       .I
    bne c9a0b                                                         ; 9a07: d0 02       ..
    inc l004a                                                         ; 9a09: e6 4a       .J
.c9a0b
    lda #&78 ; 'x'                                                    ; 9a0b: a9 78       .x
    clc                                                               ; 9a0d: 18          .
    sbc l004b                                                         ; 9a0e: e5 4b       .K
    tay                                                               ; 9a10: a8          .
.loop_c9a11
    lda (l0047),y                                                     ; 9a11: b1 47       .G
    sta (l0049),y                                                     ; 9a13: 91 49       .I
    dey                                                               ; 9a15: 88          .
    bpl loop_c9a11                                                    ; 9a16: 10 f9       ..
    dex                                                               ; 9a18: ca          .
    inc l1962                                                         ; 9a19: ee 62 19    .b.
    cpx #0                                                            ; 9a1c: e0 00       ..
    beq c9a39                                                         ; 9a1e: f0 19       ..
    bmi c9a39                                                         ; 9a20: 30 17       0.
    ldy l004b                                                         ; 9a22: a4 4b       .K
.loop_c9a24
    iny                                                               ; 9a24: c8          .
    lda l0900,y                                                       ; 9a25: b9 00 09    ...
    cmp #&20 ; ' '                                                    ; 9a28: c9 20       .
    beq loop_c9a24                                                    ; 9a2a: f0 f8       ..
    sty l004e                                                         ; 9a2c: 84 4e       .N
    lda l1967                                                         ; 9a2e: ad 67 19    .g.
    sec                                                               ; 9a31: 38          8
    sbc l004e                                                         ; 9a32: e5 4e       .N
    bcc c99d0                                                         ; 9a34: 90 9a       ..
    jmp c99e5                                                         ; 9a36: 4c e5 99    L..

.c9a39
    lda l004c                                                         ; 9a39: a5 4c       .L
    clc                                                               ; 9a3b: 18          .
    adc l1969                                                         ; 9a3c: 6d 69 19    mi.
    sta l1969                                                         ; 9a3f: 8d 69 19    .i.
    jmp c9957                                                         ; 9a42: 4c 57 99    LW.

.sub_c9a45
    jsr sub_c9c2d                                                     ; 9a45: 20 2d 9c     -.
.sub_c9a48
    lda #1                                                            ; 9a48: a9 01       ..
    sta l1962                                                         ; 9a4a: 8d 62 19    .b.
.c9a4d
    lda l1913                                                         ; 9a4d: ad 13 19    ...
    sta l001b                                                         ; 9a50: 85 1b       ..
    and #2                                                            ; 9a52: 29 02       ).
    lsr a                                                             ; 9a54: 4a          J
    sta l1966                                                         ; 9a55: 8d 66 19    .f.
    jsr sub_ca00f                                                     ; 9a58: 20 0f a0     ..
    ldy l1962                                                         ; 9a5b: ac 62 19    .b.
    lda l0900,y                                                       ; 9a5e: b9 00 09    ...
    jsr sub_c9c36                                                     ; 9a61: 20 36 9c     6.
    inc l1962                                                         ; 9a64: ee 62 19    .b.
    jsr c9c0c                                                         ; 9a67: 20 0c 9c     ..
    lda l196d                                                         ; 9a6a: ad 6d 19    .m.
    beq c9a81                                                         ; 9a6d: f0 12       ..
    dec l0058                                                         ; 9a6f: c6 58       .X
    bne c9a81                                                         ; 9a71: d0 0e       ..
    lda l195d                                                         ; 9a73: ad 5d 19    .].
    sec                                                               ; 9a76: 38          8
    sbc #1                                                            ; 9a77: e9 01       ..
    sta l195d                                                         ; 9a79: 8d 5d 19    .].
    bcs c9a81                                                         ; 9a7c: b0 03       ..
    dec l195e                                                         ; 9a7e: ce 5e 19    .^.
.c9a81
    ldy l1962                                                         ; 9a81: ac 62 19    .b.
    cpy l1961                                                         ; 9a84: cc 61 19    .a.
    bne c9a4d                                                         ; 9a87: d0 c4       ..
    lda l196d                                                         ; 9a89: ad 6d 19    .m.
    beq c9a9d                                                         ; 9a8c: f0 0f       ..
    lda l0056                                                         ; 9a8e: a5 56       .V
    sta l195d                                                         ; 9a90: 8d 5d 19    .].
    lda l0057                                                         ; 9a93: a5 57       .W
    sta l195e                                                         ; 9a95: 8d 5e 19    .^.
    lda #2                                                            ; 9a98: a9 02       ..
    sta l196b                                                         ; 9a9a: 8d 6b 19    .k.
.c9a9d
    jsr sub_c9c26                                                     ; 9a9d: 20 26 9c     &.
    bcc c9aa7                                                         ; 9aa0: 90 05       ..
    pla                                                               ; 9aa2: 68          h
    pla                                                               ; 9aa3: 68          h
    jmp c9827                                                         ; 9aa4: 4c 27 98    L'.

.c9aa7
    rts                                                               ; 9aa7: 60          `

.c9aa8
    lda l0033                                                         ; 9aa8: a5 33       .3
    sec                                                               ; 9aaa: 38          8
    sbc l195d                                                         ; 9aab: ed 5d 19    .].
    sta l0033                                                         ; 9aae: 85 33       .3
    lda l0034                                                         ; 9ab0: a5 34       .4
    sbc l195e                                                         ; 9ab2: ed 5e 19    .^.
    sta l0034                                                         ; 9ab5: 85 34       .4
    ldy #&33 ; '3'                                                    ; 9ab7: a0 33       .3
    jsr sub_cb881                                                     ; 9ab9: 20 81 b8     ..
    bcc c9ac1                                                         ; 9abc: 90 03       ..
    jmp c9c0c                                                         ; 9abe: 4c 0c 9c    L..

.c9ac1
    rts                                                               ; 9ac1: 60          `

.c9ac2
    jsr sub_c9bec                                                     ; 9ac2: 20 ec 9b     ..
    jsr sub_c9bec                                                     ; 9ac5: 20 ec 9b     ..
    lda l1911                                                         ; 9ac8: ad 11 19    ...
    bne c9ae1                                                         ; 9acb: d0 14       ..
    lda l0036                                                         ; 9acd: a5 36       .6
    bmi c9ade                                                         ; 9acf: 30 0d       0.
    bne c9ad9                                                         ; 9ad1: d0 06       ..
    lda l0035                                                         ; 9ad3: a5 35       .5
    cmp #&20 ; ' '                                                    ; 9ad5: c9 20       .
    bcc c9ade                                                         ; 9ad7: 90 05       ..
.c9ad9
    jsr sub_c9bfc                                                     ; 9ad9: 20 fc 9b     ..
    clc                                                               ; 9adc: 18          .
    rts                                                               ; 9add: 60          `

.c9ade
    jmp c9b73                                                         ; 9ade: 4c 73 9b    Ls.

.c9ae1
    lda l0035                                                         ; 9ae1: a5 35       .5
    sec                                                               ; 9ae3: 38          8
    sbc l1902                                                         ; 9ae4: ed 02 19    ...
    lda l0036                                                         ; 9ae7: a5 36       .6
    sbc l1903                                                         ; 9ae9: ed 03 19    ...
    bpl c9ad9                                                         ; 9aec: 10 eb       ..
    jsr sub_cb193                                                     ; 9aee: 20 93 b1     ..
    jsr copy_data_to_1900_and_zero_l1911                              ; 9af1: 20 4d b1     M.
    lda l196f                                                         ; 9af4: ad 6f 19    .o.
    bne c9b0a                                                         ; 9af7: d0 11       ..
    ldy #&1e                                                          ; 9af9: a0 1e       ..
    jsr sub_cbe18                                                     ; 9afb: 20 18 be     ..
    jsr cb85c                                                         ; 9afe: 20 5c b8     \.
    php                                                               ; 9b01: 08          .
    jsr do_our_osword_1_x_5                                           ; 9b02: 20 e8 bd     ..
    plp                                                               ; 9b05: 28          (
    bcc c9b14                                                         ; 9b06: 90 0c       ..
    sec                                                               ; 9b08: 38          8
    rts                                                               ; 9b09: 60          `

.c9b0a
    ldy #&14                                                          ; 9b0a: a0 14       ..
    jsr sub_cbe18                                                     ; 9b0c: 20 18 be     ..
    jsr cb85c                                                         ; 9b0f: 20 5c b8     \.
    bcs c9b1d                                                         ; 9b12: b0 09       ..
.c9b14
    jsr sub_c9bfc                                                     ; 9b14: 20 fc 9b     ..
    jsr sub_c9bfc                                                     ; 9b17: 20 fc 9b     ..
    jmp c9ac2                                                         ; 9b1a: 4c c2 9a    L..

.c9b1d
    ldy #&1d                                                          ; 9b1d: a0 1d       ..
    jsr do_our_osword_1_x_4                                           ; 9b1f: 20 e3 bd     ..
.c9b22
    jsr c830b                                                         ; 9b22: 20 0b 83     ..
    cpy #1                                                            ; 9b25: c0 01       ..
    bne c9b22                                                         ; 9b27: d0 f9       ..
    cpx #1                                                            ; 9b29: e0 01       ..
    bne c9b35                                                         ; 9b2b: d0 08       ..
    jsr sub_c853e                                                     ; 9b2d: 20 3e 85     >.
    bcc c9b22                                                         ; 9b30: 90 f0       ..
    jmp c9b1d                                                         ; 9b32: 4c 1d 9b    L..

.c9b35
    cpx #2                                                            ; 9b35: e0 02       ..
    bne c9b41                                                         ; 9b37: d0 08       ..
    jsr sub_c8543                                                     ; 9b39: 20 43 85     C.
    bcc c9b22                                                         ; 9b3c: 90 e4       ..
    jmp c9b1d                                                         ; 9b3e: 4c 1d 9b    L..

.c9b41
    cpx #3                                                            ; 9b41: e0 03       ..
    bne c9b60                                                         ; 9b43: d0 1b       ..
    lda l1911                                                         ; 9b45: ad 11 19    ...
    beq c9b50                                                         ; 9b48: f0 06       ..
    jsr sub_cb193                                                     ; 9b4a: 20 93 b1     ..
    jsr copy_data_to_1900_and_zero_l1911                              ; 9b4d: 20 4d b1     M.
.c9b50
    ldy #3                                                            ; 9b50: a0 03       ..
    jsr do_our_osword_1_x_3                                           ; 9b52: 20 de bd     ..
    jsr sub_cb0a3                                                     ; 9b55: 20 a3 b0     ..
    ldy #3                                                            ; 9b58: a0 03       ..
    jsr do_our_osword_1_x_3                                           ; 9b5a: 20 de bd     ..
    jmp c9b1d                                                         ; 9b5d: 4c 1d 9b    L..

.c9b60
    cpx #4                                                            ; 9b60: e0 04       ..
    bne c9b6a                                                         ; 9b62: d0 06       ..
    jsr sub_cb739                                                     ; 9b64: 20 39 b7     9.
    jmp c9683                                                         ; 9b67: 4c 83 96    L..

.c9b6a
    cpx #5                                                            ; 9b6a: e0 05       ..
    bne c9b70                                                         ; 9b6c: d0 02       ..
    sec                                                               ; 9b6e: 38          8
    rts                                                               ; 9b6f: 60          `

.c9b70
    jmp c9b22                                                         ; 9b70: 4c 22 9b    L".

.c9b73
    lda l196f                                                         ; 9b73: ad 6f 19    .o.
    beq c9b86                                                         ; 9b76: f0 0e       ..
    lda l191f                                                         ; 9b78: ad 1f 19    ...
    sec                                                               ; 9b7b: 38          8
    sbc l1920                                                         ; 9b7c: ed 20 19    . .
    cmp #8                                                            ; 9b7f: c9 08       ..
    beq c9be9                                                         ; 9b81: f0 66       .f
    jmp c9b9d                                                         ; 9b83: 4c 9d 9b    L..

.c9b86
    lda l191f                                                         ; 9b86: ad 1f 19    ...
    sec                                                               ; 9b89: 38          8
    sbc l1920                                                         ; 9b8a: ed 20 19    . .
    cmp #8                                                            ; 9b8d: c9 08       ..
    beq c9b9b                                                         ; 9b8f: f0 0a       ..
    ldy #&1e                                                          ; 9b91: a0 1e       ..
    jsr sub_cbe18                                                     ; 9b93: 20 18 be     ..
    jsr cb85c                                                         ; 9b96: 20 5c b8     \.
    bcc c9ba7                                                         ; 9b99: 90 0c       ..
.c9b9b
    sec                                                               ; 9b9b: 38          8
    rts                                                               ; 9b9c: 60          `

.c9b9d
    ldy #&14                                                          ; 9b9d: a0 14       ..
    jsr sub_cbe18                                                     ; 9b9f: 20 18 be     ..
    jsr cb85c                                                         ; 9ba2: 20 5c b8     \.
    bcs c9be9                                                         ; 9ba5: b0 42       .B
.c9ba7
    ldy #&0c                                                          ; 9ba7: a0 0c       ..
    jsr sub_cbe18                                                     ; 9ba9: 20 18 be     ..
    jsr cb85c                                                         ; 9bac: 20 5c b8     \.
    bcs c9be9                                                         ; 9baf: b0 38       .8
    lda #4                                                            ; 9bb1: a9 04       ..
    sta l194e                                                         ; 9bb3: 8d 4e 19    .N.
.loop_c9bb6
    jsr sub_c853e                                                     ; 9bb6: 20 3e 85     >.
    bcs c9bcb                                                         ; 9bb9: b0 10       ..
    lda l0035                                                         ; 9bbb: a5 35       .5
    clc                                                               ; 9bbd: 18          .
    adc #&80                                                          ; 9bbe: 69 80       i.
    sta l0035                                                         ; 9bc0: 85 35       .5
    bcc c9bc6                                                         ; 9bc2: 90 02       ..
    inc l0036                                                         ; 9bc4: e6 36       .6
.c9bc6
    dec l194e                                                         ; 9bc6: ce 4e 19    .N.
    bne loop_c9bb6                                                    ; 9bc9: d0 eb       ..
.c9bcb
    lda l196f                                                         ; 9bcb: ad 6f 19    .o.
    beq c9bda                                                         ; 9bce: f0 0a       ..
    ldy #&15                                                          ; 9bd0: a0 15       ..
    jsr sub_cbe18                                                     ; 9bd2: 20 18 be     ..
    jsr cb85c                                                         ; 9bd5: 20 5c b8     \.
    bcs c9be9                                                         ; 9bd8: b0 0f       ..
.c9bda
    jsr do_our_osword_1_x_5                                           ; 9bda: 20 e8 bd     ..
    ldy #&35 ; '5'                                                    ; 9bdd: a0 35       .5
    jsr sub_cb8c4                                                     ; 9bdf: 20 c4 b8     ..
    bcs c9be9                                                         ; 9be2: b0 05       ..
    jsr sub_c9bfc                                                     ; 9be4: 20 fc 9b     ..
    clc                                                               ; 9be7: 18          .
    rts                                                               ; 9be8: 60          `

.c9be9
    jmp c9b1d                                                         ; 9be9: 4c 1d 9b    L..

.sub_c9bec
    lda l0035                                                         ; 9bec: a5 35       .5
    sec                                                               ; 9bee: 38          8
    sbc l195f                                                         ; 9bef: ed 5f 19    ._.
    sta l0035                                                         ; 9bf2: 85 35       .5
    lda l0036                                                         ; 9bf4: a5 36       .6
    sbc l1960                                                         ; 9bf6: ed 60 19    .`.
    sta l0036                                                         ; 9bf9: 85 36       .6
    rts                                                               ; 9bfb: 60          `

.sub_c9bfc
    lda l0035                                                         ; 9bfc: a5 35       .5
    clc                                                               ; 9bfe: 18          .
    adc l195f                                                         ; 9bff: 6d 5f 19    m_.
    sta l0035                                                         ; 9c02: 85 35       .5
    lda l0036                                                         ; 9c04: a5 36       .6
    adc l1960                                                         ; 9c06: 6d 60 19    m`.
    sta l0036                                                         ; 9c09: 85 36       .6
    rts                                                               ; 9c0b: 60          `

.c9c0c
    lda l0033                                                         ; 9c0c: a5 33       .3
    clc                                                               ; 9c0e: 18          .
    adc l195d                                                         ; 9c0f: 6d 5d 19    m].
    sta l0033                                                         ; 9c12: 85 33       .3
    lda l0034                                                         ; 9c14: a5 34       .4
    adc l195e                                                         ; 9c16: 6d 5e 19    m^.
    sta l0034                                                         ; 9c19: 85 34       .4
    ldy #&33 ; '3'                                                    ; 9c1b: a0 33       .3
    jsr sub_cb896                                                     ; 9c1d: 20 96 b8     ..
    bcc c9c25                                                         ; 9c20: 90 03       ..
    jmp c9aa8                                                         ; 9c22: 4c a8 9a    L..

.c9c25
    rts                                                               ; 9c25: 60          `

.sub_c9c26
    jsr sub_c9c2d                                                     ; 9c26: 20 2d 9c     -.
    jsr c9ac2                                                         ; 9c29: 20 c2 9a     ..
    rts                                                               ; 9c2c: 60          `

.sub_c9c2d
    lda l0037                                                         ; 9c2d: a5 37       .7
    sta l0033                                                         ; 9c2f: 85 33       .3
    lda l0038                                                         ; 9c31: a5 38       .8
    sta l0034                                                         ; 9c33: 85 34       .4
    rts                                                               ; 9c35: 60          `

.sub_c9c36
    cmp #0                                                            ; 9c36: c9 00       ..
    beq c9c3f                                                         ; 9c38: f0 05       ..
    cmp #&20 ; ' '                                                    ; 9c3a: c9 20       .
    bne c9c4d                                                         ; 9c3c: d0 0f       ..
    rts                                                               ; 9c3e: 60          `

.c9c3f
    lda #&7d ; '}'                                                    ; 9c3f: a9 7d       .}
    sta l005e                                                         ; 9c41: 85 5e       .^
    lda #&19                                                          ; 9c43: a9 19       ..
    sta l005f                                                         ; 9c45: 85 5f       ._
    jsr sub_cb617                                                     ; 9c47: 20 17 b6     ..
    jmp c9cd3                                                         ; 9c4a: 4c d3 9c    L..

.c9c4d
    pha                                                               ; 9c4d: 48          H
    lda l196a                                                         ; 9c4e: ad 6a 19    .j.
    bne c9c84                                                         ; 9c51: d0 31       .1
    lda l1959                                                         ; 9c53: ad 59 19    .Y.
    cmp #&10                                                          ; 9c56: c9 10       ..
    bne c9c84                                                         ; 9c58: d0 2a       .*
    lda l195a                                                         ; 9c5a: ad 5a 19    .Z.
    cmp #&10                                                          ; 9c5d: c9 10       ..
    bne c9c84                                                         ; 9c5f: d0 23       .#
    ldx #4                                                            ; 9c61: a2 04       ..
    lda l1966                                                         ; 9c63: ad 66 19    .f.
    bne c9c70                                                         ; 9c66: d0 08       ..
    ldx #0                                                            ; 9c68: a2 00       ..
    ldy l001b                                                         ; 9c6a: a4 1b       ..
    beq c9c70                                                         ; 9c6c: f0 02       ..
    ldy #1                                                            ; 9c6e: a0 01       ..
.c9c70
    jsr sub_cbd83                                                     ; 9c70: 20 83 bd     ..
    lda #5                                                            ; 9c73: a9 05       ..
    jsr oswrch                                                        ; 9c75: 20 ee ff     ..            ; Write character 5
    lda #4                                                            ; 9c78: a9 04       ..
    ldy #8                                                            ; 9c7a: a0 08       ..
    jsr sub_cb79d                                                     ; 9c7c: 20 9d b7     ..
    pla                                                               ; 9c7f: 68          h
    jsr oswrch                                                        ; 9c80: 20 ee ff     ..            ; Write character
    rts                                                               ; 9c83: 60          `

.c9c84
    jsr sub_cb617                                                     ; 9c84: 20 17 b6     ..
    pla                                                               ; 9c87: 68          h
    ldx l196a                                                         ; 9c88: ae 6a 19    .j.
    bne c9cba                                                         ; 9c8b: d0 2d       .-
    sta l0a00                                                         ; 9c8d: 8d 00 0a    ...
    lda #1                                                            ; 9c90: a9 01       ..
    sta l005e                                                         ; 9c92: 85 5e       .^
    lda #osword_read_char                                             ; 9c94: a9 0a       ..
    sta l005f                                                         ; 9c96: 85 5f       ._
    ldx #<(l0a00)                                                     ; 9c98: a2 00       ..
    tay                                                               ; 9c9a: a8          .
    jsr osword                                                        ; 9c9b: 20 f1 ff     ..            ; Read character definition
    ldx #7                                                            ; 9c9e: a2 07       ..
    ldy #&0f                                                          ; 9ca0: a0 0f       ..
.loop_c9ca2
    lda #0                                                            ; 9ca2: a9 00       ..
    sta l0a01,y                                                       ; 9ca4: 99 01 0a    ...
    dey                                                               ; 9ca7: 88          .
    lda l0a01,x                                                       ; 9ca8: bd 01 0a    ...
    sta l0a01,y                                                       ; 9cab: 99 01 0a    ...
    dey                                                               ; 9cae: 88          .
    dex                                                               ; 9caf: ca          .
    bpl loop_c9ca2                                                    ; 9cb0: 10 f0       ..
    lda #8                                                            ; 9cb2: a9 08       ..
    sta l194e                                                         ; 9cb4: 8d 4e 19    .N.
    jmp c9cd8                                                         ; 9cb7: 4c d8 9c    L..

.c9cba
    sec                                                               ; 9cba: 38          8
    sbc #&21 ; '!'                                                    ; 9cbb: e9 21       .!
    sta l005e                                                         ; 9cbd: 85 5e       .^
    lda #0                                                            ; 9cbf: a9 00       ..
    sta l005f                                                         ; 9cc1: 85 5f       ._
    ldx #5                                                            ; 9cc3: a2 05       ..
.loop_c9cc5
    asl l005e                                                         ; 9cc5: 06 5e       .^
    rol l005f                                                         ; 9cc7: 26 5f       &_
    dex                                                               ; 9cc9: ca          .
    bne loop_c9cc5                                                    ; 9cca: d0 f9       ..
    lda l005f                                                         ; 9ccc: a5 5f       ._
    clc                                                               ; 9cce: 18          .
    adc #&1a                                                          ; 9ccf: 69 1a       i.
    sta l005f                                                         ; 9cd1: 85 5f       ._
.c9cd3
    lda #&10                                                          ; 9cd3: a9 10       ..
    sta l194e                                                         ; 9cd5: 8d 4e 19    .N.
.c9cd8
    lda l195c                                                         ; 9cd8: ad 5c 19    .\.
    sta l001a                                                         ; 9cdb: 85 1a       ..
.c9cdd
    ldx #7                                                            ; 9cdd: a2 07       ..
    lda #0                                                            ; 9cdf: a9 00       ..
.loop_c9ce1
    sta l1909,x                                                       ; 9ce1: 9d 09 19    ...
    dex                                                               ; 9ce4: ca          .
    bpl loop_c9ce1                                                    ; 9ce5: 10 fa       ..
    ldy #0                                                            ; 9ce7: a0 00       ..
    lda (l005e),y                                                     ; 9ce9: b1 5e       .^
    sta l001f                                                         ; 9ceb: 85 1f       ..
    lda #8                                                            ; 9ced: a9 08       ..
    sta l0023                                                         ; 9cef: 85 23       .#
    lda l195b                                                         ; 9cf1: ad 5b 19    .[.
    sta l0019                                                         ; 9cf4: 85 19       ..
    ldy #0                                                            ; 9cf6: a0 00       ..
    ldx #8                                                            ; 9cf8: a2 08       ..
.c9cfa
    dec l0023                                                         ; 9cfa: c6 23       .#
    asl l001f                                                         ; 9cfc: 06 1f       ..
    php                                                               ; 9cfe: 08          .
.c9cff
    plp                                                               ; 9cff: 28          (
    php                                                               ; 9d00: 08          .
    lda l1909,y                                                       ; 9d01: b9 09 19    ...
    rol a                                                             ; 9d04: 2a          *
    sta l1909,y                                                       ; 9d05: 99 09 19    ...
    lda l0023                                                         ; 9d08: a5 23       .#
    cmp #&f7                                                          ; 9d0a: c9 f7       ..
    beq c9d30                                                         ; 9d0c: f0 22       ."
    lda l0023                                                         ; 9d0e: a5 23       .#
    bne c9d1c                                                         ; 9d10: d0 0a       ..
    tya                                                               ; 9d12: 98          .
    pha                                                               ; 9d13: 48          H
    ldy #1                                                            ; 9d14: a0 01       ..
    lda (l005e),y                                                     ; 9d16: b1 5e       .^
    sta l001f                                                         ; 9d18: 85 1f       ..
    pla                                                               ; 9d1a: 68          h
    tay                                                               ; 9d1b: a8          .
.c9d1c
    dex                                                               ; 9d1c: ca          .
    bne c9d22                                                         ; 9d1d: d0 03       ..
    iny                                                               ; 9d1f: c8          .
    ldx #8                                                            ; 9d20: a2 08       ..
.c9d22
    lda l0019                                                         ; 9d22: a5 19       ..
    clc                                                               ; 9d24: 18          .
    adc l195b                                                         ; 9d25: 6d 5b 19    m[.
    sta l0019                                                         ; 9d28: 85 19       ..
    bcc c9cff                                                         ; 9d2a: 90 d3       ..
    plp                                                               ; 9d2c: 28          (
    jmp c9cfa                                                         ; 9d2d: 4c fa 9c    L..

.c9d30
    cpx #8                                                            ; 9d30: e0 08       ..
    beq c9d43                                                         ; 9d32: f0 0f       ..
    cpx #1                                                            ; 9d34: e0 01       ..
    beq c9d43                                                         ; 9d36: f0 0b       ..
    lda l1909,y                                                       ; 9d38: b9 09 19    ...
    asl a                                                             ; 9d3b: 0a          .
    sta l1909,y                                                       ; 9d3c: 99 09 19    ...
    dex                                                               ; 9d3f: ca          .
    jmp c9d30                                                         ; 9d40: 4c 30 9d    L0.

.c9d43
    plp                                                               ; 9d43: 28          (
    ldx #7                                                            ; 9d44: a2 07       ..
.loop_c9d46
    lda l1909,x                                                       ; 9d46: bd 09 19    ...
    sta l0047,x                                                       ; 9d49: 95 47       .G
    dex                                                               ; 9d4b: ca          .
    bpl loop_c9d46                                                    ; 9d4c: 10 f8       ..
.c9d4e
    jsr sub_cb644                                                     ; 9d4e: 20 44 b6     D.
    lda #0                                                            ; 9d51: a9 00       ..
    sta l001f                                                         ; 9d53: 85 1f       ..
.c9d55
    ldy #8                                                            ; 9d55: a0 08       ..
.loop_c9d57
    ldx l001f                                                         ; 9d57: a6 1f       ..
    rol l1909,x                                                       ; 9d59: 3e 09 19    >..
    bcc c9d6e                                                         ; 9d5c: 90 10       ..
    ldx #0                                                            ; 9d5e: a2 00       ..
    lda l1966                                                         ; 9d60: ad 66 19    .f.
    bne c9d6b                                                         ; 9d63: d0 06       ..
    jsr sub_cb6ac                                                     ; 9d65: 20 ac b6     ..
    jmp c9d6e                                                         ; 9d68: 4c 6e 9d    Ln.

.c9d6b
    jsr sub_cb6c3                                                     ; 9d6b: 20 c3 b6     ..
.c9d6e
    ldx #0                                                            ; 9d6e: a2 00       ..
    jsr sub_cb708                                                     ; 9d70: 20 08 b7     ..
    dey                                                               ; 9d73: 88          .
    bne loop_c9d57                                                    ; 9d74: d0 e1       ..
    inc l001f                                                         ; 9d76: e6 1f       ..
    lda l001f                                                         ; 9d78: a5 1f       ..
    cmp #8                                                            ; 9d7a: c9 08       ..
    bne c9d55                                                         ; 9d7c: d0 d7       ..
    inc l000a                                                         ; 9d7e: e6 0a       ..
    lda l001a                                                         ; 9d80: a5 1a       ..
    clc                                                               ; 9d82: 18          .
    adc l195c                                                         ; 9d83: 6d 5c 19    m\.
    sta l001a                                                         ; 9d86: 85 1a       ..
    bcs c9d97                                                         ; 9d88: b0 0d       ..
    ldx #7                                                            ; 9d8a: a2 07       ..
.loop_c9d8c
    lda l0047,x                                                       ; 9d8c: b5 47       .G
    sta l1909,x                                                       ; 9d8e: 9d 09 19    ...
    dex                                                               ; 9d91: ca          .
    bpl loop_c9d8c                                                    ; 9d92: 10 f8       ..
    jmp c9d4e                                                         ; 9d94: 4c 4e 9d    LN.

.c9d97
    lda l005e                                                         ; 9d97: a5 5e       .^
    clc                                                               ; 9d99: 18          .
    adc #2                                                            ; 9d9a: 69 02       i.
    sta l005e                                                         ; 9d9c: 85 5e       .^
    bcc c9da2                                                         ; 9d9e: 90 02       ..
    inc l005f                                                         ; 9da0: e6 5f       ._
.c9da2
    dec l194e                                                         ; 9da2: ce 4e 19    .N.
    beq c9daa                                                         ; 9da5: f0 03       ..
    jmp c9cdd                                                         ; 9da7: 4c dd 9c    L..

.c9daa
    rts                                                               ; 9daa: 60          `

    equb &a0,   4, &20, &e3, &bd, &20, &41, &bd, &a9,   4, &20, &ee   ; 9dab: a0 04 20... ..
    equb &ff, &a0,   5, &20, &54, &b7, &20, &79, &9f, &20, &0b, &83   ; 9db7: ff a0 05... ...
    equb &a5, &2a, &30,   3, &4c, &14, &9f, &c0,   1, &d0, &f2, &e0   ; 9dc3: a5 2a 30... .*0
    equb   1, &d0, &0a, &ad, &59, &19, &c9, &40, &f0, &e7, &ee, &59   ; 9dcf: 01 d0 0a... ...
    equb &19, &e0,   2, &d0, &0a, &ad, &59, &19, &c9, &10, &f0, &d9   ; 9ddb: 19 e0 02... ...
    equb &ce, &59, &19, &e0,   3, &d0, &0a, &ad, &5a, &19, &c9, &40   ; 9de7: ce 59 19... .Y.
    equb &f0, &cb, &ee, &5a, &19, &e0,   4, &d0, &0a, &ad, &5a, &19   ; 9df3: f0 cb ee... ...
    equb &c9, &10, &f0, &bd, &ce, &5a, &19, &e0,   5, &d0,   3, &4c   ; 9dff: c9 10 f0... ...
    equb &18, &9e, &a9, &0c, &20, &ee, &ff, &20, &df, &9e, &4c, &c0   ; 9e0b: 18 9e a9... ...
    equb &9d, &a0,   5, &20, &e3, &bd, &20, &0b, &83, &b0, &0b, &a5   ; 9e17: 9d a0 05... ...
    equb &2a, &10, &0b, &c0,   1, &d0, &f3, &4c, &37, &9e, &20, &46   ; 9e23: 2a 10 0b... *..
    equb &bd                                                          ; 9e2f: bd          .
    equs "` F"                                                        ; 9e30: 60 20 46    ` F
    equb &bd, &4c, &ab, &9d, &8a, &48, &a2,   0, &a0,   0, &20, &83   ; 9e33: bd 4c ab... .L.
    equb &bd, &20, &1e, &9f, &68, &aa, &e0,   1, &d0, &15, &ad, &5d   ; 9e3f: bd 20 1e... . .
    equb &19, &c9, &b0, &f0, &0e, &ad, &5d, &19, &18, &69,   2, &8d   ; 9e4b: 19 c9 b0... ...
    equb &5d, &19, &90,   3, &ee, &5e, &19, &e0,   2, &d0, &15, &ad   ; 9e57: 5d 19 90... ]..
    equb &5d, &19, &c9,   2, &f0, &0e, &ad, &5d, &19, &38, &e9,   2   ; 9e63: 5d 19 c9... ]..
    equb &8d, &5d, &19, &b0,   3, &ce, &5e, &19, &e0,   3, &d0, &1c   ; 9e6f: 8d 5d 19... .].
    equb &ad, &60, &19, &c9,   1, &d0,   7, &ad, &5f, &19, &c9, &18   ; 9e7b: ad 60 19... .`.
    equb &f0, &0e, &ad, &5f, &19, &18, &69,   4, &8d, &5f, &19, &90   ; 9e87: f0 0e ad... ...
    equb   3, &ee, &60, &19, &e0,   4, &d0, &1a, &ad, &60, &19, &d0   ; 9e93: 03 ee 60... ..`
    equb   7, &ad, &5f, &19, &c9,   4, &f0, &0e, &ad, &5f, &19, &38   ; 9e9f: 07 ad 5f... .._
    equb &e9,   4, &8d, &5f, &19, &b0,   3, &ce, &60, &19, &e0,   5   ; 9eab: e9 04 8d... ...
    equb &d0, &19, &a0,   5, &20, &de, &bd, &20, &ff, &ae, &20, &41   ; 9eb7: d0 19 a0... ...
    equb &bd, &20, &77, &b8, &a0,   5, &20, &54, &b7, &20, &79, &9f   ; 9ec3: bd 20 77... . w
    equb &4c, &18, &9e, &a2,   0, &a0,   1, &20, &83, &bd, &20, &1e   ; 9ecf: 4c 18 9e... L..
    equb &9f, &4c, &1d, &9e, &a0,   1, &b9, &59, &19, &85, &23, &a9   ; 9edb: 9f 4c 1d... .L.
    equb &10, &85, &1f, &a2,   9, &a5, &1f, &c5, &23, &90,   5, &e5   ; 9ee7: 10 85 1f... ...
    equb &23, &85, &1f, &38, &b9, &5b, &19, &2a, &99, &5b, &19,   6   ; 9ef3: 23 85 1f... #..
    equb &1f, &ca, &d0, &e9, &b9, &5b, &19, &d0,   5, &a9, &ff, &99   ; 9eff: 1f ca d0... ...
    equb &5b, &19, &88, &10, &d1, &20, &79, &9f                       ; 9f0b: 5b 19 88... [..
    equs "` F"                                                        ; 9f13: 60 20 46    ` F
    equb &bd, &4c,   0, &95, &0e,   2, &84,   2, &a2,   4, &20, &83   ; 9f16: bd 4c 00... .L.
    equb &bd, &bd, &5d, &19, &95, &43, &bd, &1a, &9f, &95, &33, &ca   ; 9f22: bd bd 5d... ..]
    equb &10, &f3, &a0, &33, &20, &bb, &bb, &a2,   0, &bd, &70, &9f   ; 9f2e: 10 f3 a0... ...
    equb &20, &ee, &ff, &e8, &c9, &0a, &d0, &f5, &ad, &59, &19, &20   ; 9f3a: 20 ee ff...  ..
    equb &3e, &be, &20, &5f, &be, &ad, &5a, &19, &20, &3e, &be, &20   ; 9f46: 3e be 20... >.
    equb &5f, &be, &ad, &5d, &19                                      ; 9f52: 5f be ad... _..
    equs "J >"                                                        ; 9f57: 4a 20 3e    J >
    equb &be, &20, &5f, &be, &ad, &60, &19, &85, &47, &ad, &5f, &19   ; 9f5a: be 20 5f... . _
    equs "FGjFGj >"                                                   ; 9f66: 46 47 6a... FGj
    equb &be, &60,   4, &1c, &1f, &15, &2c, &0b, &1f,   2, &0a, &a9   ; 9f6e: be 60 04... .`.
    equb &10, &85,   8, &a9,   2, &85, &0b, &85,   9, &a9, &80, &85   ; 9f7a: 10 85 08... ...
    equb &0a, &a9,   1, &85, &1b, &a9,   0, &ae, &6a, &19, &d0,   2   ; 9f86: 0a a9 01... ...
    equb &a9                                                          ; 9f92: a9          .
    equs "E 6"                                                        ; 9f93: 45 20 36    E 6
    equb &9c, &a2,   0, &a0,   1, &20, &83, &bd, &4c, &1e, &9f        ; 9f96: 9c a2 00... ...

.sub_c9fa1
    txa                                                               ; 9fa1: 8a          .
    pha                                                               ; 9fa2: 48          H
    dey                                                               ; 9fa3: 88          .
    sty l004b                                                         ; 9fa4: 84 4b       .K
    lda l1967                                                         ; 9fa6: ad 67 19    .g.
    sec                                                               ; 9fa9: 38          8
    sbc l004b                                                         ; 9faa: e5 4b       .K
    tax                                                               ; 9fac: aa          .
    dex                                                               ; 9fad: ca          .
    dex                                                               ; 9fae: ca          .
    lda #0                                                            ; 9faf: a9 00       ..
    sta l0047                                                         ; 9fb1: 85 47       .G
    sta l0048                                                         ; 9fb3: 85 48       .H
    sta l0049                                                         ; 9fb5: 85 49       .I
    sta l004a                                                         ; 9fb7: 85 4a       .J
.loop_c9fb9
    lda l0047                                                         ; 9fb9: a5 47       .G
    clc                                                               ; 9fbb: 18          .
    adc l195d                                                         ; 9fbc: 6d 5d 19    m].
    sta l0047                                                         ; 9fbf: 85 47       .G
    lda l0048                                                         ; 9fc1: a5 48       .H
    adc l195e                                                         ; 9fc3: 6d 5e 19    m^.
    sta l0048                                                         ; 9fc6: 85 48       .H
    dex                                                               ; 9fc8: ca          .
    bne loop_c9fb9                                                    ; 9fc9: d0 ee       ..
.loop_c9fcb
    lda l0047                                                         ; 9fcb: a5 47       .G
    sec                                                               ; 9fcd: 38          8
    sbc l004b                                                         ; 9fce: e5 4b       .K
    sta l0047                                                         ; 9fd0: 85 47       .G
    lda l0048                                                         ; 9fd2: a5 48       .H
    sbc #0                                                            ; 9fd4: e9 00       ..
    sta l0048                                                         ; 9fd6: 85 48       .H
    bcc c9fe3                                                         ; 9fd8: 90 09       ..
    inc l0049                                                         ; 9fda: e6 49       .I
    bne c9fe0                                                         ; 9fdc: d0 02       ..
    inc l004a                                                         ; 9fde: e6 4a       .J
.c9fe0
    jmp loop_c9fcb                                                    ; 9fe0: 4c cb 9f    L..

.c9fe3
    lda l0047                                                         ; 9fe3: a5 47       .G
    sec                                                               ; 9fe5: 38          8
    adc l004b                                                         ; 9fe6: 65 4b       eK
    sta l0058                                                         ; 9fe8: 85 58       .X
    lda l195d                                                         ; 9fea: ad 5d 19    .].
    sta l0056                                                         ; 9fed: 85 56       .V
    sec                                                               ; 9fef: 38          8
    adc l0049                                                         ; 9ff0: 65 49       eI
    sta l195d                                                         ; 9ff2: 8d 5d 19    .].
    lda l195e                                                         ; 9ff5: ad 5e 19    .^.
    sta l0057                                                         ; 9ff8: 85 57       .W
    adc l004a                                                         ; 9ffa: 65 4a       eJ
    sta l195e                                                         ; 9ffc: 8d 5e 19    .^.
    lda #1                                                            ; 9fff: a9 01       ..
    sta l196d                                                         ; a001: 8d 6d 19    .m.
    ldy l004b                                                         ; a004: a4 4b       .K
    iny                                                               ; a006: c8          .
    pla                                                               ; a007: 68          h
    tax                                                               ; a008: aa          .
    lda #3                                                            ; a009: a9 03       ..
    sta l196b                                                         ; a00b: 8d 6b 19    .k.
    rts                                                               ; a00e: 60          `

.sub_ca00f
    ldx #&33 ; '3'                                                    ; a00f: a2 33       .3
    ldy #8                                                            ; a011: a0 08       ..
    jmp cbd6e                                                         ; a013: 4c 6e bd    Ln.

    equb &d9, &a6, &3b, &a0, &e7, &a3, &0d, &a7, &37, &a9, &60, &a0   ; a016: d9 a6 3b... ..;
    equb   8, &20, &e3, &bd, &20, &0b, &83, &b0, &f5, &a5, &2a, &10   ; a022: 08 20 e3... . .
    equb &f1, &c0,   1, &d0, &f3, &8a, &a2, &16, &a0, &a0, &4c, &7e   ; a02e: f1 c0 01... ...
    equb &b7, &a0, &0a, &20, &e3, &bd, &ad, &56, &19, &f0,   5, &a0   ; a03a: b7 a0 0a... ...
    equb   3, &20, &de, &bd, &ad, &57, &19, &f0,   5, &a0,   4, &20   ; a046: 03 20 de... . .
    equb &de, &bd, &20, &0b, &83, &b0, &37, &a5, &2a, &30,   3, &4c   ; a052: de bd 20... ..
    equb &21, &a0, &c0,   1, &d0, &f0, &e0,   2, &f0, &29, &e0,   3   ; a05e: 21 a0 c0... !..
    equb &d0, &10, &ad, &56, &19, &49,   1, &8d, &56, &19, &a0,   3   ; a06a: d0 10 ad... ...
    equb &20, &de, &bd, &4c, &54, &a0, &e0,   4, &d0, &d4, &ad, &57   ; a076: 20 de bd...  ..
    equb &19, &49,   1, &8d, &57, &19, &a0,   4, &20, &de, &bd, &4c   ; a082: 19 49 01... .I.
    equb &54, &a0, &60, &a0,   2, &20, &de, &bd, &ad, &63, &19, &f0   ; a08e: 54 a0 60... T.`
    equb   3, &4c, &36, &a2, &20, &7e, &b1, &a2                       ; a09a: 03 4c 36... .L6
    equs "+ _"                                                        ; a0a2: 2b 20 5f    + _
    equb &a3, &20, &26, &b9, &a2, &24, &a0, &2b, &20,   3, &b8, &f0   ; a0a5: a3 20 26... . &
    equb &0d, &a2                                                     ; a0b1: 0d a2       ..
    equs "+ _"                                                        ; a0b3: 2b 20 5f    + _
    equb &a3, &20, &6b, &be, &a2                                      ; a0b6: a3 20 6b... . k
    equs "$ _"                                                        ; a0bb: 24 20 5f    $ _
    equb &a3, &ad, &63, &19, &f0,   8, &a2                            ; a0be: a3 ad 63... ..c
    equs "+ _"                                                        ; a0c5: 2b 20 5f    + _
    equb &a3, &4c, &36, &a2, &a5, &2a, &30,   8, &a2                  ; a0c8: a3 4c 36... .L6
    equs "+ _"                                                        ; a0d1: 2b 20 5f    + _
    equb &a3, &4c, &21, &a0, &a5                                      ; a0d4: a3 4c 21... .L!
    equs "*) "                                                        ; a0d9: 2a 29 20    *)
    equb &d0, &c8, &a5, &24, &38, &e9,   8, &85, &24, &b0,   2, &c6   ; a0dc: d0 c8 a5... ...
    equb &25, &a5, &26, &18, &69, &10, &85, &26, &90,   2, &e6, &27   ; a0e8: 25 a5 26... %.&
    equb &a9,   8, &85, &1f, &a5                                      ; a0f4: a9 08 85... ...
    equs "&)<JI"                                                      ; a0f9: 26 29 3c... &)<
    equb &1e, &85, &4a, &a9,   0, &85, &4b, &a4, &4a, &b9, &7d, &19   ; a0fe: 1e 85 4a... ..J
    equb &85, &47, &85, &49, &b9, &7e, &19, &85, &48, &a5, &24, &29   ; a10a: 85 47 85... .G.
    equb &1e, &4a, &aa, &e0,   0, &f0, &0a,   6                       ; a116: 1e 4a aa... .J.
    equs "I&H&G"                                                      ; a11e: 49 26 48... I&H
    equb &ca, &4c, &19, &a1, &a4, &4b, &a5, &47, &48, &84, &4f, &ad   ; a123: ca 4c 19... .L.
    equb &64, &19, &0a, &0a, &0a,   5, &4f, &a8                       ; a12f: 64 19 0a... d..
    equs "hH9"                                                        ; a137: 68 48 39    hH9
    equb &1e, &a2, &85, &4f, &98, &48, &29,   7, &a8, &a5, &4f, &99   ; a13a: 1e a2 85... ...
    equb &80, &26, &68, &a8, &68, &49, &ff, &39, &1e, &a2, &85, &4f   ; a146: 80 26 68... .&h
    equb &98, &29,   7, &a8, &a5, &4f, &99, &88, &26, &e6, &4b, &e6   ; a152: 98 29 07... .).
    equb &4a, &e6, &4a, &a5, &4a, &c9, &20, &d0,   4, &a9,   0, &85   ; a15e: 4a e6 4a... J.J
    equb &4a, &c6, &1f, &d0, &96, &ad, &56, &19, &f0, &14, &ad, &57   ; a16a: 4a c6 1f... J..
    equb &19, &0a, &0a, &0a, &49,   8, &a8, &a2,   8, &a9,   0, &99   ; a176: 19 0a 0a... ...
    equb &80, &26, &c8, &ca, &d0, &f9, &a2,   7, &bd, &80, &26, &1d   ; a182: 80 26 c8... .&.
    equb &88, &26, &29,   8, &f0, &10, &bd, &80, &26, &49,   8, &9d   ; a18e: 88 26 29... .&)
    equb &80, &26, &bd, &88, &26, &49,   8, &9d, &88, &26, &ca, &10   ; a19a: 80 26 bd... .&.
    equb &e3, &ad, &84, &26, &0d, &8c, &26, &85, &47, &ad, &84        ; a1a6: e3 ad 84... ...
    equs "&EG"                                                        ; a1b1: 26 45 47    &EG
    equb &8d, &84, &26, &ad, &8c                                      ; a1b4: 8d 84 26... ..&
    equs "&EG"                                                        ; a1b9: 26 45 47    &EG
    equb &8d, &8c, &26, &a9, &17, &20, &ee, &ff, &a9, &f0, &20, &ee   ; a1bc: 8d 8c 26... ..&
    equb &ff, &a0,   0, &b9, &80, &26, &20, &ee, &ff, &c8, &c0,   8   ; a1c8: ff a0 00... ...
    equb &d0, &f5, &a9, &17, &20, &ee, &ff, &a9, &f1, &20, &ee, &ff   ; a1d4: d0 f5 a9... ...
    equb &b9, &80, &26, &20, &ee, &ff, &c8, &c0, &10, &d0, &f5, &a2   ; a1e0: b9 80 26... ..&
    equb   0, &a0,   1, &20, &83, &bd, &a9,   5, &20, &ee, &ff, &a9   ; a1ec: 00 a0 01... ...
    equb   4, &a0, &24, &20, &9d, &b7, &a9, &f0, &20, &ee, &ff, &a2   ; a1f8: 04 a0 24... ..$
    equb   0, &a0,   0, &20, &83, &bd, &a9,   5, &20, &ee, &ff, &a9   ; a204: 00 a0 00... ...
    equb   4, &a0, &24, &20, &9d, &b7, &a9, &f1, &20, &ee, &ff, &4c   ; a210: 04 a0 24... ..$
    equb &a6, &a0,   0,   0,   0,   0,   8,   0,   0,   0,   0,   0   ; a21c: a6 a0 00... ...
    equb &18, &3c, &3c, &18,   0,   0                                 ; a228: 18 3c 3c... .<<
    equs "<~~"                                                        ; a22e: 3c 7e 7e    <~~
    equb &ff, &ff                                                     ; a231: ff ff       ..
    equs "~~< ~"                                                      ; a233: 7e 7e 3c... ~~<
    equb &b1, &a2                                                     ; a238: b1 a2       ..
    equs "+ _"                                                        ; a23a: 2b 20 5f    + _
    equb &a3, &20, &26, &b9, &a2, &24, &a0, &2b, &20,   3, &b8, &f0   ; a23d: a3 20 26... . &
    equb &0d, &a2                                                     ; a249: 0d a2       ..
    equs "+ _"                                                        ; a24b: 2b 20 5f    + _
    equb &a3, &20, &6b, &be, &a2                                      ; a24e: a3 20 6b... . k
    equs "$ _"                                                        ; a253: 24 20 5f    $ _
    equb &a3, &ad, &63, &19, &d0,   3, &4c, &a6, &a0, &a5, &2a, &30   ; a256: a3 ad 63... ..c
    equb   8, &a2                                                     ; a262: 08 a2       ..
    equs "+ _"                                                        ; a264: 2b 20 5f    + _
    equb &a3, &4c, &21, &a0, &a5                                      ; a267: a3 4c 21... .L!
    equs "*) "                                                        ; a26c: 2a 29 20    *)
    equb &d0, &cd, &a9,   5, &85, &1f, &a2, &24, &a0                  ; a26f: d0 cd a9... ...
    equs "; n"                                                        ; a278: 3b 20 6e    ; n
    equb &bd, &a2, &3b, &a0                                           ; a27b: bd a2 3b... ..;
    equs "$ n"                                                        ; a27f: 24 20 6e    $ n
    equb &bd, &a5, &24, &38, &e9, &0e, &85, &24, &b0,   2, &c6, &25   ; a282: bd a5 24... ..$
    equb &a5, &26, &38, &e9, &10, &85, &26, &b0,   2, &c6, &27, &ad   ; a28e: a5 26 38... .&8
    equb &44, &fe, &29, &70, &85, &47, &ad, &44, &fe, &29, &0f, &85   ; a29a: 44 fe 29... D.)
    equb &48, &a5                                                     ; a2a6: 48 a5       H.
    equs "GJJJJH"                                                     ; a2a8: 47 4a 4a... GJJ
    equb &a5, &48, &aa, &68, &49, &0f, &85, &4f, &ad, &64, &19, &0a   ; a2ae: a5 48 aa... .H.
    equb &0a, &0a, &0a,   5, &4f, &a8, &b9, &a3, &a3, &e0,   8, &90   ; a2ba: 0a 0a 0a... ...
    equb   8, &8a, &38, &e9,   8, &aa, &b9, &ab, &a3, &e0,   0, &f0   ; a2c6: 08 8a 38... ..8
    equb   5, &0a, &ca, &4c, &cf, &a2, &29, &80, &d0,   3, &4c, &55   ; a2d2: 05 0a ca... ...
    equb &a3, &a5                                                     ; a2de: a3 a5       ..
    equs "GJJe&"                                                      ; a2e0: 47 4a 4a... GJJ
    equb &85, &26, &a5, &27, &69,   0, &85, &27, &a5                  ; a2e5: 85 26 a5... .&.
    equs "&)<JJH"                                                     ; a2ee: 26 29 3c... &)<
    equb &a5, &48, &0a, &65, &24, &85, &24, &a5, &25, &69,   0, &85   ; a2f4: a5 48 0a... .H.
    equb &25, &a5, &24, &29, &1e, &4a, &aa, &68, &49, &0f, &0a, &a8   ; a300: 25 a5 24... %.$
    equb &b9, &7d, &19, &e0,   8, &90,   8, &8a, &38, &e9,   8, &aa   ; a30c: b9 7d 19... .}.
    equb &b9, &7e, &19, &e0,   0, &f0,   5, &0a, &ca, &4c, &1b, &a3   ; a318: b9 7e 19... .~.
    equb &29, &80, &18, &2a, &2a, &a8, &ad, &56, &19, &f0,   6, &98   ; a324: 29 80 18... )..
    equb &cd, &57, &19, &f0, &20, &a2,   0, &a5, &24, &c5, &2b, &d0   ; a330: cd 57 19... .W.
    equb   4, &98, &49,   1, &a8, &a5, &26, &c5, &2d, &d0,   4, &98   ; a33c: 04 98 49... ..I
    equb &49,   1, &a8, &20, &83, &bd, &a9, &45, &a0, &24, &20, &9d   ; a348: 49 01 a8... I..
    equb &b7, &c6, &1f, &f0,   3, &4c, &7c, &a2, &4c, &3e, &a2, &a0   ; a354: b7 c6 1f... ...
    equb   8, &20, &6e, &bd, &20, &17, &b6, &a5,   8, &38, &e9,   8   ; a360: 08 20 6e... . n
    equb &85,   8, &b0,   2, &c6,   9, &a5,   9, &30, &13, &20, &44   ; a36c: 85 08 b0... ...
    equb &b6, &a9, &11, &85, &47, &a2,   0, &20, &c3, &b6, &20,   8   ; a378: b6 a9 11... ...
    equb &b7, &c6, &47, &d0, &f6, &a2,   8, &a9,   8, &20, &72, &be   ; a384: b7 c6 47... ..G
    equb &a2, &0a, &a9,   4, &20, &72, &be, &20, &44, &b6, &a9,   9   ; a390: a2 0a a9... ...
    equb &85, &47, &a2,   0, &20, &c3, &b6, &20, &e7, &b6, &c6, &47   ; a39c: 85 47 a2... .G.
    equb &d0, &f6, &60,   0,   0,   0,   1,   0,   0,   0,   0,   0   ; a3a8: d0 f6 60... ..`
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   3, &0f, &0f   ; a3b4: 00 00 00... ...
    equb   3,   0,   0,   0,   0, &c0, &f0, &f0, &c0,   0,   0, &0f   ; a3c0: 03 00 00... ...
    equb &3f, &7f, &ff, &ff, &7f, &3f, &0f, &f0, &fc, &fe, &ff, &ff   ; a3cc: 3f 7f ff... ?..
    equb &fe, &fc, &f0, &68, &8d, &17, &19, &60, &68, &8d, &17, &19   ; a3d8: fe fc f0... ...
    equb &4c, &21, &a0, &ad, &17, &19, &48, &a9,   0, &8d, &17, &19   ; a3e4: 4c 21 a0... L!.
    equb &4c, &f8, &a3, &a0,   8, &20, &e3, &bd, &a0,   3, &20, &de   ; a3f0: 4c f8 a3... L..
    equb &bd, &20, &1f, &a9, &20, &7e, &b1, &20, &0b, &83, &b0, &d3   ; a3fc: bd 20 1f... . .
    equb &a5, &2a, &10, &d4, &c0, &ff, &d0, &f3, &a2, &24, &a0,   0   ; a408: a5 2a 10... .*.
    equb &a9,   9, &20, &f1, &ff, &a5, &28, &30, &e6, &29,   1, &85   ; a414: a9 09 20... ..
    equb &1b, &20, &b4, &a5, &a9, &ff, &a2,   0, &8e,   0, &2f, &9d   ; a420: 1b 20 b4... . .
    equb   0, &27, &9d,   0,   5, &ca, &d0, &f7, &a9,   0, &85, &1f   ; a42c: 00 27 9d... .'.
    equb &85, &23, &85, &4f, &a9, &4c, &a0, &24, &20, &9d, &b7, &a9   ; a438: 85 23 85... .#.
    equb &0d, &a2, &47, &a0,   0, &20, &f1, &ff, &a5, &47, &8d,   0   ; a444: 0d a2 47... ..G
    equb &26, &a5, &48, &8d,   0, &27, &a5, &49, &8d,   0, &28, &a5   ; a450: 26 a5 48... &.H
    equb &4a, &8d,   0, &29, &a5, &4b, &8d,   0, &2a, &a5, &4c, &8d   ; a45c: 4a 8d 00... J..
    equb   0                                                          ; a468: 00          .
    equs "+ &"                                                        ; a469: 2b 20 26    + &
    equb &b9, &a5, &2a, &10, &0e, &20, &54, &b8, &b0,   9, &a6, &1f   ; a46c: b9 a5 2a... ..*
    equb &bd,   0, &27, &c9, &ff, &d0, &1e, &ad,   0, &2f, &d0,   8   ; a478: bd 00 27... ..'
    equb &20, &7d, &a5, &90,   3, &4c, &74, &a6, &a9,   0, &85, &1f   ; a484: 20 7d a5...  }.
    equb &20, &ca, &a5, &c6, &1f, &d0, &f9, &20, &70, &b7, &4c, &f3   ; a490: 20 ca a5...  ..
    equb &a3, &e6, &1f, &85, &34, &bd,   0, &26, &85, &33, &bd,   0   ; a49c: a3 e6 1f... ...
    equb &28, &85, &35, &bd,   0, &29, &85, &36, &bd,   0, &2a, &85   ; a4a8: 28 85 35... (.5
    equb &49, &bd,   0, &2b, &85, &4a, &a9, &ff, &9d,   0, &27, &20   ; a4b4: 49 bd 00... I..
    equb &c6, &a4, &4c, &6a, &a4, &60, &a9,   9, &a2, &33, &a0,   0   ; a4c0: c6 a4 4c... ..L
    equb &20, &f1, &ff, &a5, &37, &10,   1, &60, &29,   1, &c5, &1b   ; a4cc: 20 f1 ff...  ..
    equb &f0, &2e, &a9, &5c, &a0, &33, &20, &9d, &b7, &a9, &0d, &a2   ; a4d8: f0 2e a9... ...
    equb &3b, &a0,   0, &20, &f1, &ff, &a5, &3f, &85, &33, &a5, &40   ; a4e4: 3b a0 00... ;..
    equb &85, &34, &a5, &33, &18, &69,   2, &85, &33, &90,   2, &e6   ; a4f0: 85 34 a5... .4.
    equb &34, &a5, &33, &e5, &49, &a5, &34, &e5, &4a, &30, &bf, &60   ; a4fc: 34 a5 33... 4.3
    equb &a9, &4d, &a0, &33, &20, &9d, &b7, &a2, &3b, &a0,   0, &a9   ; a508: a9 4d a0... .M.
    equb &0d, &20, &f1, &ff, &a5, &3f, &18, &69,   2, &85, &33, &a5   ; a514: 0d 20 f1... . .
    equb &40, &69,   0, &85, &34, &a5, &3d, &38, &e9,   4, &85, &3d   ; a520: 40 69 00... @i.
    equb &b0,   2, &c6, &3e, &20, &91, &a5, &a5, &3d, &18, &69,   8   ; a52c: b0 02 c6... ...
    equb &85, &3d, &90,   2, &e6, &3e, &20, &91, &a5, &20, &ca, &a5   ; a538: 85 3d 90... .=.
    equb &a5, &3b, &9d,   0,   4, &a5, &3c, &9d,   0,   5, &a5, &35   ; a544: a5 3b 9d... .;.
    equb &9d,   0,   6, &a5, &36, &9d,   0,   7, &a5, &3f, &9d,   0   ; a550: 9d 00 06... ...
    equb &2d, &a5, &40, &9d,   0, &2e, &ad,   0, &2f, &d0, &13, &e0   ; a55c: 2d a5 40... -.@
    equb &ff, &d0, &0f, &a9,   1, &8d,   0                            ; a568: ff d0 0f... ...
    equs "/ }"                                                        ; a56f: 2f 20 7d    / }
    equb &a5, &90,   5                                                ; a572: a5 90 05    ...
    equs "hhLt"                                                       ; a575: 68 68 4c... hhL
    equb &a6, &4c, &fd, &a4, &a0,   1, &20, &18, &be, &20, &5c, &b8   ; a579: a6 4c fd... .L.
    equb   8, &20, &e8, &bd, &20, &b4, &a5, &20, &7e, &b1, &28, &60   ; a585: 08 20 e8... . .
    equb &e6, &23, &a6, &23, &a5, &3b, &9d,   0, &26, &a5, &3c, &9d   ; a591: e6 23 a6... .#.
    equb   0, &27, &a5, &3d, &9d,   0, &28, &a5, &3e, &9d,   0, &29   ; a59d: 00 27 a5... .'.
    equb &a5, &3f, &9d,   0, &2a, &a5, &40, &9d,   0, &2b, &60, &a0   ; a5a9: a5 3f 9d... .?.
    equb   1, &a6, &1b, &f0,   2, &a0,   0, &a2,   0, &20, &83, &bd   ; a5b5: 01 a6 1b... ...
    equb &a9, &80,   5, &1b, &a8, &20, &83, &bd, &60, &e6, &4f, &a6   ; a5c1: a9 80 05... ...
    equb &4f, &bd,   0,   5, &c9, &ff, &f0, &f4, &bd,   0,   4, &85   ; a5cd: 4f bd 00... O..
    equb   8, &bd,   0,   5, &85,   9, &bd,   0,   6, &85, &0a, &85   ; a5d9: 08 bd 00... ...
    equb &0e, &bd,   0,   7, &85, &0b, &85, &0f, &bd,   0, &2d, &85   ; a5e5: 0e bd 00... ...
    equb &0c, &bd,   0, &2e, &85, &0d, &a2,   8, &a0, &0c, &20, &e2   ; a5f1: 0c bd 00... ...
    equb &ba, &20, &17, &b6, &20, &44, &b6, &a5, &1b, &48, &a5, &0a   ; a5fd: ba 20 17... . .
    equb &29, &0f, &2a, &85, &37, &a5,   8, &29, &0f, &85, &38, &a4   ; a609: 29 0f 2a... ).*
    equb &37, &b9, &7d, &19, &85, &3d, &85, &39, &c8, &b9, &7d, &19   ; a615: 37 b9 7d... 7.}
    equb &85, &3e, &85, &3a, &a6, &38, &f0,   8,   6                  ; a621: 85 3e 85... .>.
    equs ">&="                                                        ; a62a: 3e 26 3d    >&=
    equb &ca, &4c, &27, &a6, &a5, &3d, &29, &80, &85, &1b, &a2,   0   ; a62d: ca 4c 27... .L'
    equb &20, &ac, &b6, &a5, &1e, &c5, &22, &d0, &0c, &a5, &1c, &c5   ; a639: 20 ac b6...  ..
    equb &20, &d0,   6, &a5, &1d, &c5, &21, &f0, &20, &a2,   0, &20   ; a645: 20 d0 06...  ..
    equb   8, &b7,   6                                                ; a651: 08 b7 06    ...
    equs ">&="                                                        ; a654: 3e 26 3d    >&=
    equb &e6, &38, &a6, &38, &e0, &10, &d0, &d2, &a5, &39, &85, &3d   ; a657: e6 38 a6... .8.
    equb &a5, &3a, &85, &3e, &a9,   0, &85                            ; a663: a5 3a 85... .:.
    equs "8L1"                                                        ; a66a: 38 4c 31    8L1
    equb &a6, &68, &85, &1b, &a6, &4f, &60, &a2,   0, &a4, &1b, &20   ; a66d: a6 68 85... .h.
    equb &83, &bd, &a9,   0, &85, &1f, &a6, &1f, &bd,   0,   5, &c9   ; a679: 83 bd a9... ...
    equb &ff, &f0, &44, &a9, &19, &20, &ee, &ff, &a9,   4, &20, &ee   ; a685: ff f0 44... ..D
    equb &ff, &bd,   0,   4, &20, &ee, &ff, &bd,   0,   5, &20, &ee   ; a691: ff bd 00... ...
    equb &ff, &bd,   0,   6, &20, &ee, &ff, &bd,   0,   7, &20, &ee   ; a69d: ff bd 00... ...
    equb &ff, &a9, &19, &20, &ee, &ff, &a9,   5, &20, &ee, &ff, &bd   ; a6a9: ff a9 19... ...
    equb   0, &2d, &20, &ee, &ff, &bd,   0, &2e, &20, &ee, &ff, &bd   ; a6b5: 00 2d 20... .-
    equb   0,   6, &20, &ee, &ff, &bd,   0,   7, &20, &ee, &ff, &c6   ; a6c1: 00 06 20... ..
    equb &1f, &f0,   3, &4c, &7f, &a6, &20, &70, &b7, &4c, &f3, &a3   ; a6cd: 1f f0 03... ...
    equb &a0,   1, &20, &de, &bd, &20, &ff, &ae, &4c, &21, &a0, &4c   ; a6d9: a0 01 20... ..
    equb &21, &a0, &a0,   3, &20, &de, &bd, &a9, &22, &85, &43, &a9   ; a6e5: 21 a0 a0... !..
    equb &44, &85, &45, &a9,   0, &85, &44, &85, &46, &20, &f9, &ba   ; a6f1: 44 85 45... D.E
    equb &c0, &ff, &f0, &e3, &a2, &14, &20, &6b, &b7, &20, &19, &a9   ; a6fd: c0 ff f0... ...
    equb &4c, &ec, &a6, &60, &a0, &1a, &20, &e3, &bd, &20, &0b, &83   ; a709: 4c ec a6... L..
    equb &b0, &f5, &a5                                                ; a715: b0 f5 a5    ...
    equs "*0!L!"                                                      ; a718: 2a 30 21... *0!
    equb &a0, &a0, &0f, &b9, &e8, &34, &49, &ff, &99, &e8, &34, &b9   ; a71d: a0 a0 0f... ...
    equs "h7I"                                                        ; a729: 68 37 49    h7I
    equb &ff, &99, &68, &37, &88, &10, &ed, &20, &19, &a9, &20, &1f   ; a72c: ff 99 68... ..h
    equb &a9, &4c, &12, &a7, &c0,   1, &d0, &d2, &e0,   5, &f0, &da   ; a738: a9 4c 12... .L.
    equb &e0,   4, &f0, &39, &e0,   3, &f0, &9b, &e0,   1, &d0, &0b   ; a744: e0 04 f0... ...
    equb &a2, &11, &20, &6b, &b7, &20, &19, &a9, &4c, &21, &a0, &e0   ; a750: a2 11 20... ..
    equb   2, &d0, &b3, &a9,   0, &85, &4f, &a9, &d0, &85,   8, &a9   ; a75c: 02 d0 b3... ...
    equb   4, &85,   9, &a9, &a0, &85, &0a, &a9,   3, &85, &0b, &a0   ; a768: 04 85 09... ...
    equb &1c, &20, &e3, &bd, &20, &e9, &8b, &20, &19, &a9, &4c, &21   ; a774: 1c 20 e3... . .
    equb &a0, &a2, &19, &20, &6b, &b7, &20, &41, &bd, &a9,   4, &20   ; a780: a0 a2 19... ...
    equb &ee, &ff, &a0,   4, &20, &54, &b7, &a9,   0, &85,   8, &a9   ; a78c: ee ff a0... ...
    equb   7, &85,   9, &a9,   4, &85, &23, &4c, &a7, &a7, &a9, &0a   ; a798: 07 85 09... ...
    equb &20, &ee, &ff, &a9, &0d, &20, &ee, &ff, &a9, &0a, &20, &ee   ; a7a4: 20 ee ff...  ..
    equb &ff, &20, &5f, &be, &20, &ee, &ff, &20, &ee, &ff, &a9,   8   ; a7b0: ff 20 5f... . _
    equb &85, &1f, &a9,   0, &85, &49, &20, &b4, &a8, &a9,   1, &85   ; a7bc: 85 1f a9... ...
    equb &49, &20, &b4, &a8, &a9,   0, &85, &49, &20, &b4, &a8, &a5   ; a7c8: 49 20 b4... I .
    equb   8, &18, &69,   8, &85,   8, &90,   2, &e6,   9, &c6, &1f   ; a7d4: 08 18 69... ..i
    equb &d0, &dc, &c6, &23, &d0, &bc, &a0, &12, &20, &18, &be, &20   ; a7e0: d0 dc c6... ...
    equb &fc, &b7, &20, &32, &be, &20, &26, &b9, &a5, &2a, &30,   3   ; a7ec: fc b7 20... ..
    equb &4c, &a8, &a8, &a5                                           ; a7f8: 4c a8 a8... L..
    equs "*)@"                                                        ; a7fc: 2a 29 40    *)@
    equb &d0,   3, &4c,   2, &a9, &a5                                 ; a7ff: d0 03 4c... ..L
    equs "*) "                                                        ; a805: 2a 29 20    *)
    equb &f0, &2e, &4c, &ee, &a7, &0a, &85,   8, &a9,   0, &85,   9   ; a808: f0 2e 4c... ..L
    equb   6,   8, &26,   9,   6,   8, &26,   9,   6,   8, &26,   9   ; a814: 06 08 26... ..&
    equb   6,   8, &26,   9, &a5,   9, &18, &69, &1a, &85,   9, &a0   ; a820: 06 08 26... ..&
    equb &1f, &b1,   8, &99, &7d, &19, &88, &10, &f8, &4c, &a8, &a8   ; a82c: 1f b1 08... ...
    equb &a5, &28, &38, &e9, &18, &90, &af, &a5, &29, &38, &e9, &0c   ; a838: a5 28 38... .(8
    equb &90, &a8, &a9, &31, &38, &e5, &28, &90, &a1, &a9, &13, &38   ; a844: 90 a8 a9... ...
    equb &e5, &29, &90, &9a, &a5, &29, &38, &e9, &0c, &29, &fe, &0a   ; a850: e5 29 90... .).
    equb &0a, &85, &1f, &a5, &28, &38, &e9, &19, &a2, &ff, &e8, &38   ; a85c: 0a 85 1f... ...
    equb &e9,   3, &b0, &fa, &8a, &18, &65, &1f, &0a, &0a, &0a, &85   ; a868: e9 03 b0... ...
    equb &1f, &a4, &1f, &a2,   0, &a9,   8, &85, &23, &b9,   0,   7   ; a874: 1f a4 1f... ...
    equb &0a,   8, &3e, &7e, &19, &3e, &7d, &19                       ; a880: 0a 08 3e... ..>
    equs "(>~"                                                        ; a888: 28 3e 7e    (>~
    equb &19, &3e, &7d, &19, &c6, &23, &d0, &ed, &bd, &7d, &19, &9d   ; a88b: 19 3e 7d... .>}
    equb &8d, &19, &bd, &7e, &19, &9d, &8e, &19, &95, &47, &c8, &e8   ; a897: 8d 19 bd... ...
    equb &e8, &e0, &10, &d0, &d1, &20, &1d, &be, &20, &46, &bd, &20   ; a8a3: e8 e0 10... ...
    equb &13, &a9, &4c, &21, &a0, &a9, &17, &20, &ee, &ff, &a9, &f0   ; a8af: 13 a9 4c... ..L
    equb &20, &ee, &ff, &a0,   0, &a9,   4, &85, &48, &a9,   0, &85   ; a8bb: 20 ee ff...  ..
    equb &47, &b1,   8, &a6, &49, &f0,   4, &0a, &0a, &0a, &0a, &0a   ; a8c7: 47 b1 08... G..
    equs "&G&G"                                                       ; a8d3: 26 47 26... &G&
    equb &c6, &48, &d0, &f7, &a5, &47, &4a,   5, &47, &20, &ee, &ff   ; a8d7: c6 48 d0... .H.
    equb &c8, &c0,   8, &d0, &d8, &a9, &f0, &20, &ee, &ff, &a9, &0a   ; a8e3: c8 c0 08... ...
    equb &20, &ee, &ff, &a9,   8, &20, &ee, &ff, &a9, &f0, &20, &ee   ; a8ef: 20 ee ff...  ..
    equb &ff, &a9, &0b, &20, &ee, &ff, &60, &a2, &15, &20, &6b, &b7   ; a8fb: ff a9 0b... ...
    equb &a5, &1f, &c9, &ff, &f0,   3, &4c, &0d, &a8, &4c, &21, &a0   ; a907: a5 1f c9... ...
    equb &a2, &0f, &20, &6b, &b7, &60                                 ; a913: a2 0f 20... ..

.do_our_osword_1_x_10
    ldx #&10                                                          ; a919: a2 10       ..
    jsr do_our_osword_1                                               ; a91b: 20 6b b7     k.
    rts                                                               ; a91e: 60          `

.long_delay
    ldx #0                                                            ; a91f: a2 00       ..
    ldy #0                                                            ; a921: a0 00       ..
.ca923
    iny                                                               ; a923: c8          .
    dey                                                               ; a924: 88          .
    dey                                                               ; a925: 88          .
    bne ca923                                                         ; a926: d0 fb       ..
    dex                                                               ; a928: ca          .
    bne ca923                                                         ; a929: d0 f8       ..
    rts                                                               ; a92b: 60          `

    equb &3c, &a9, &c4, &aa, &25, &ad, &eb, &ab, &55, &a9, &60, &a0   ; a92c: 3c a9 c4... <..
    equb &0b, &20, &e3, &bd, &20, &0b, &83, &b0, &f5, &a5, &2a, &30   ; a938: 0b 20 e3... . .
    equb   3, &4c, &21, &a0, &c0,   1, &d0, &f0, &8a, &a2, &2c, &a0   ; a944: 03 4c 21... .L!
    equb &a9, &4c, &7e, &b7, &60, &a0, &1b, &20, &e3, &bd, &ad, &7a   ; a950: a9 4c 7e... .L~
    equb &19, &f0,   5, &a0,   3, &20, &de, &bd, &20, &0b, &83, &b0   ; a95c: 19 f0 05... ...
    equb &eb, &a5, &2a, &30,   3, &4c, &37, &a9, &c0,   1, &d0, &f0   ; a968: eb a5 2a... ..*
    equb &e0,   3, &d0, &10, &a0,   3, &20, &de, &bd, &ad, &7a, &19   ; a974: e0 03 d0... ...
    equb &49,   1, &8d, &7a, &19, &4c, &64, &a9, &a9,   1, &8d, &74   ; a980: 49 01 8d... I..
    equb &19, &e0,   4, &f0,   9, &a9,   0, &8d, &74, &19, &e0,   5   ; a98c: 19 e0 04... ...
    equb &d0, &ca, &8a, &a8, &20, &de, &bd, &20, &7e, &b1, &a9, &80   ; a998: d0 ca 8a... ...
    equb &85, &33, &a9,   2, &85, &34, &a9,   0, &85, &35, &a9,   2   ; a9a4: 85 33 a9... .3.
    equb &85                                                          ; a9b0: 85          .
    equs "6 k"                                                        ; a9b1: 36 20 6b    6 k
    equb &be, &20, &99, &aa, &20, &26, &b9, &20, &4b                  ; a9b4: be 20 99... . .
.la9bd
    equb &be, &a5, &2a, &29, &e0, &c9, &e0, &d0, &0c, &a5, &24, &c5   ; a9bd: be a5 2a... ..*
    equb &2b, &d0,   6, &a5, &26, &c5, &2d, &f0, &e6, &20, &99, &aa   ; a9c9: 2b d0 06... +..
    equb &a2,   4, &20, &83, &bd, &a9,   4, &a0, &33, &20, &9d, &b7   ; a9d5: a2 04 20... ..
    equb &a9,   5, &a0, &2b, &20, &9d, &b7, &a2, &33, &20, &f2, &ae   ; a9e1: a9 05 a0... ...
    equb &a2, &2b, &20, &f2, &ae, &20, &6b, &be, &a5, &2a, &29, &80   ; a9ed: a2 2b 20... .+
    equb &f0, &14, &a5                                                ; a9f9: f0 14 a5    ...
    equs "*)@"                                                        ; a9fc: 2a 29 40    *)@
    equb &f0                                                          ; a9ff: f0          .
    equs "* 5"                                                        ; aa00: 2a 20 35    * 5
    equb &83, &b0, &b2, &a5                                           ; aa03: 83 b0 b2... ...
    equs "*) "                                                        ; aa07: 2a 29 20    *)
    equb &f0, &28, &4c, &b8, &a9, &20, &99, &aa, &ad, &74, &19, &c9   ; aa0a: f0 28 4c... .(L
    equb   2, &d0, &0f, &a9,   4, &a0, &3b, &20, &9d, &b7, &20, &e7   ; aa16: 02 d0 0f... ...
    equb &ae, &a0, &3f, &20, &9d, &b7, &4c, &55, &a9, &20, &99, &aa   ; aa22: ae a0 3f... ..?
    equb &20, &b7, &aa, &4c, &b5, &a9, &20, &99, &aa, &20, &db, &ab   ; aa2e: 20 b7 aa...  ..
    equb &ad, &74, &19, &f0, &2b, &a2,   4, &20, &83, &bd, &20, &1f   ; aa3a: ad 74 19... .t.
    equb &a9, &ad, &74, &19, &ee, &74, &19, &c9,   1, &f0, &19, &a9   ; aa46: a9 ad 74... ..t
    equb   4, &a0, &3b, &20, &9d, &b7, &20, &e7, &ae, &a0, &3f, &20   ; aa52: 04 a0 3b... ..;
    equb &9d, &b7, &a2, &33, &a0                                      ; aa5e: 9d b7 a2... ...
    equs "7 n"                                                        ; aa63: 37 20 6e    7 n
    equb &bd, &20, &db, &ab, &a9,   4, &a0, &33, &20, &9d, &b7, &20   ; aa66: bd 20 db... . .
    equb &e7, &ae, &a0, &24, &20, &9d, &b7, &a2, &33, &a0             ; aa72: e7 ae a0... ...
    equs "; n"                                                        ; aa7c: 3b 20 6e    ; n
    equb &bd, &a2, &24, &a0                                           ; aa7f: bd a2 24... ..$
    equs "? n"                                                        ; aa83: 3f 20 6e    ? n
    equb &bd, &20, &b7, &aa, &ad, &74, &19, &c9,   3, &d0,   5, &a9   ; aa86: bd 20 b7... . .
    equb   1, &8d, &74, &19, &4c, &b5, &a9, &a2,   4, &20, &83, &bd   ; aa92: 01 8d 74... ..t
    equb &a9,   4, &a0, &33, &20, &9d, &b7, &a9,   5, &a0, &24, &20   ; aa9e: a9 04 a0... ...
    equb &9d, &b7, &a2, &33, &20, &f2, &ae, &a2, &24, &20, &f2, &ae   ; aaaa: 9d b7 a2... ...
    equb &60, &a2, &24, &a0                                           ; aab6: 60 a2 24... `.$
    equs "3 n"                                                        ; aaba: 33 20 6e    3 n
    equb &bd, &60, &a0, &0b, &20, &e3, &bd, &a0,   2, &20, &de, &bd   ; aabd: bd 60 a0... .`.
    equb &20, &7e, &b1, &20, &1b, &ba, &c0, &ff, &d0,   3, &4c, &37   ; aac9: 20 7e b1...  ~.
    equb &a9, &20, &b1, &bb, &a5, &43, &48, &a5, &44, &48, &a5, &45   ; aad5: a9 20 b1... . .
    equb &48, &a5, &46, &48, &a5, &45, &85, &47, &a5, &46, &85, &48   ; aae1: 48 a5 46... H.F
    equb &a9,   0, &85, &49, &a9,   4, &85, &4a, &20, &af, &ab, &a5   ; aaed: a9 00 85... ...
    equb &4f, &85, &16, &a5, &43, &85, &47, &a5, &44, &85, &48, &a9   ; aaf9: 4f 85 16... O..
    equb   0, &85, &49, &a9,   4, &85, &4a, &20, &af, &ab, &a5, &4f   ; ab05: 00 85 49... ..I
    equb &85, &15                                                     ; ab11: 85 15       ..
    equs "FDfC"                                                       ; ab13: 46 44 66... FDf
    equb &a5, &35, &85, &39, &a5, &36, &85, &3a, &18, &a5             ; ab17: a5 35 85... .5.
    equs "Ce3"                                                        ; ab21: 43 65 33    Ce3
    equb &85, &33, &85, &37, &a5                                      ; ab24: 85 33 85... .3.
    equs "De4"                                                        ; ab29: 44 65 34    De4
    equb &85, &34, &85, &38, &a5, &37, &38, &e9,   2, &85, &37, &b0   ; ab2c: 85 34 85... .4.
    equb   2, &c6, &38, &a2, &33, &a0                                 ; ab38: 02 c6 38... ..8
    equs "J n"                                                        ; ab3e: 4a 20 6e    J n
    equb &bd, &a2, &37, &a0                                           ; ab41: bd a2 37... ..7
    equs "? n"                                                        ; ab45: 3f 20 6e    ? n
    equb &bd, &20, &7e, &b1, &a2,   4, &20, &83, &bd, &a2, &0b, &20   ; ab48: bd 20 7e... . ~
    equb &6b, &b7, &a0,   1, &20, &18, &be, &20, &5c, &b8,   8, &20   ; ab54: 6b b7 a0... k..
    equb &e8, &bd, &a2,   4, &20, &83, &bd, &28, &b0, &10, &20, &db   ; ab60: e8 bd a2... ...
    equb &ab, &ad, &13, &19, &29,   2, &f0,   6, &20, &1f, &a9, &4c   ; ab6c: ab ad 13... ...
    equb &82, &ab, &20, &7e, &b1, &a2, &0b, &20, &6b, &b7, &68, &85   ; ab78: 82 ab 20... ..
    equb &46, &68, &85, &45, &68, &85, &44, &68, &85, &43, &20, &f9   ; ab84: 46 68 85... Fh.
    equb &ba, &c0, &ff, &f0, &17, &a2, &24, &a0                       ; ab90: ba c0 ff... ...
    equs "3 n"                                                        ; ab98: 33 20 6e    3 n
    equb &bd, &a5, &35, &38, &e5, &45, &85, &35, &a5, &36, &e5, &46   ; ab9b: bd a5 35... ..5
    equb &85, &36, &4c, &d9, &aa, &4c, &bf, &aa, &a2,   8,   6, &4f   ; aba7: 85 36 4c... .6L
    equb   6                                                          ; abb3: 06          .
    equs "G&H"                                                        ; abb4: 47 26 48    G&H
    equb &a5, &47, &38, &e5, &49, &a5, &48, &e5, &4a, &90, &15, &a5   ; abb7: a5 47 38... .G8
    equb &47, &38, &e5, &49, &85, &47, &a5, &48, &e5, &4a, &85, &48   ; abc3: 47 38 e5... G8.
    equb &a5, &4f, &29, &fe,   9,   1, &85, &4f, &ca, &d0, &d7, &60   ; abcf: a5 4f 29... .O)
    equb &a2,   4, &ad, &13, &19, &c9,   2, &f0,   2, &a2,   0, &a8   ; abdb: a2 04 ad... ...
    equb &20, &83, &bd, &60, &a0,   4, &20, &de, &bd, &20, &77, &b8   ; abe7: 20 83 bd...  ..
    equb &20, &1b, &ba, &c0, &ff, &d0,   3, &4c, &37, &a9, &a2, &43   ; abf3: 20 1b ba...  ..
    equb &a0                                                          ; abff: a0          .
    equs "? n"                                                        ; ac00: 3f 20 6e    ? n
    equb &bd, &20, &b1, &bb, &a2,   4, &a0, &80, &ad, &13, &19, &c9   ; ac03: bd 20 b1... . .
    equb   2, &f0,   8, &a2,   0, &a9, &80, &0d, &13, &19, &a8, &20   ; ac0f: 02 f0 08... ...
    equb &83, &bd, &ad, &70, &19, &d0,   3, &4c, &fb, &ac, &a5, &33   ; ac1b: 83 bd ad... ...
    equb &38, &ed,   0, &19, &a5, &34, &ed,   1, &19, &b0, &0a, &ad   ; ac27: 38 ed 00... 8..
    equb   0, &19, &85, &33, &ad,   1, &19, &85, &34, &a5, &37, &38   ; ac33: 00 19 85... ...
    equb &ed,   4, &19, &a5, &38, &ed,   5, &19, &90, &0a, &ad,   4   ; ac3f: ed 04 19... ...
    equb &19, &85, &37, &ad,   5, &19, &85, &38, &a5, &35, &38, &ed   ; ac4b: 19 85 37... ..7
    equb   2, &19, &a5, &36, &ed,   3, &19, &b0, &0a, &ad,   2, &19   ; ac57: 02 19 a5... ...
    equb &85, &35, &ad,   3, &19, &85, &36, &a5, &39, &38, &ed,   6   ; ac63: 85 35 ad... .5.
    equb &19, &a5, &3a, &ed,   7, &19, &90, &0a, &ad,   6, &19, &85   ; ac6f: 19 a5 3a... ..:
    equb &39, &ad,   7, &19, &85, &3a, &a2, &33, &a0, &37, &20, &e2   ; ac7b: 39 ad 07... 9..
    equb &ba, &b0, &12, &a2, &35, &a0, &39, &20, &e2, &ba, &b0,   9   ; ac87: ba b0 12... ...
    equb &a2, &33, &a0                                                ; ac93: a2 33 a0    .3.
    equs "7 '"                                                        ; ac96: 37 20 27    7 '
    equb &b8, &d0,   3, &4c, &b6, &ac, &a9, &18, &20, &ee, &ff, &a0   ; ac99: b8 d0 03... ...
    equb &33, &20, &cf, &bd, &a0, &37, &20, &cf, &bd, &a9, &10, &20   ; aca5: 33 20 cf... 3 .
    equb &ee, &ff, &20, &70, &b7, &a2, &3f, &a0                       ; acb1: ee ff 20... ..
    equs "C n"                                                        ; acb9: 43 20 6e    C n
    equb &bd, &a9, &1a, &20, &ee, &ff, &20, &f9, &ba, &c0, &ff, &f0   ; acbc: bd a9 1a... ...
    equb &2c, &a2, &24, &a0                                           ; acc8: 2c a2 24... ,.$
    equs "3 n"                                                        ; accc: 33 20 6e    3 n
    equb &bd, &a5, &35, &85, &39, &a5, &36, &85, &3a, &a5, &33, &18   ; accf: bd a5 35... ..5
    equb &65, &43, &85, &37, &a5                                      ; acdb: 65 43 85... eC.
    equs "4eD"                                                        ; ace0: 34 65 44    4eD
    equb &85, &38, &a5, &39, &38, &e5, &45, &85, &35, &a5, &3a, &e5   ; ace3: 85 38 a5... .8.
    equb &46, &85, &36, &4c,   7, &ac, &20, &1f, &a9, &4c, &f0, &ab   ; acef: 46 85 36... F.6
    equb &20, &7e, &b1, &20, &db, &ab, &a9,   4, &a2, &33, &a0, &35   ; acfb: 20 7e b1...  ~.
    equb &20, &a9, &b7, &a2, &37, &20, &e7, &ae, &20, &a9, &b7, &a0   ; ad07: 20 a9 b7...  ..
    equb &39, &20, &a9, &b7, &a2, &33, &20, &a9, &b7, &a0, &35, &20   ; ad13: 39 20 a9... 9 .
    equb &a9, &b7, &4c, &b3, &ac, &60, &a0,   3, &20, &de, &bd, &20   ; ad1f: a9 b7 4c... ..L
    equb &7e, &b1, &a9, &80, &85, &33, &a9,   2, &85, &34, &a9,   0   ; ad2b: 7e b1 a9... ~..
    equb &85, &35, &a9,   2, &85                                      ; ad37: 85 35 a9... .5.
    equs "6 k"                                                        ; ad3c: 36 20 6b    6 k
    equb &be, &20, &99, &aa, &20, &26, &b9, &20, &4b, &be, &a5, &2a   ; ad3f: be 20 99... . .
    equb &29, &e0, &c9, &e0, &d0, &0c, &a5, &24, &c5, &2b, &d0,   6   ; ad4b: 29 e0 c9... )..
    equb &a5, &26, &c5, &2d, &f0, &e6, &20, &99, &aa, &a2,   4, &20   ; ad57: a5 26 c5... .&.
    equb &83, &bd, &a9,   4, &a0, &33, &20, &9d, &b7, &a9,   5, &a0   ; ad63: 83 bd a9... ...
    equb &2b, &20, &9d, &b7, &a2, &33, &20, &f2, &ae, &a2, &2b, &20   ; ad6f: 2b 20 9d... + .
    equb &f2, &ae, &20, &6b, &be, &a5, &2a, &29, &80, &f0, &0f, &a5   ; ad7b: f2 ae 20... ..
    equs "*)@"                                                        ; ad87: 2a 29 40    *)@
    equb &f0, &0f, &a5                                                ; ad8a: f0 0f a5    ...
    equs "*) "                                                        ; ad8d: 2a 29 20    *)
    equb &f0, &12, &4c, &43, &ad, &20, &99, &aa, &4c, &37, &a9, &20   ; ad90: f0 12 4c... ..L
    equb &99, &aa, &20, &b7, &aa, &4c, &40, &ad, &a2, &24, &a0        ; ad9c: 99 aa 20... ..
    equs "7 n"                                                        ; ada7: 37 20 6e    7 n
    equb &bd, &a2, &33, &20, &f2, &ae, &a2, &37, &20, &f2, &ae, &a0   ; adaa: bd a2 33... ..3
    equb &24, &20, &c1, &ae, &20, &6b, &be, &20, &26, &b9, &20, &4b   ; adb6: 24 20 c1... $ .
    equb &be, &a5, &2a, &29, &e0, &c9, &e0, &d0, &0c, &a5, &24, &c5   ; adc2: be a5 2a... ..*
    equb &2b, &d0,   6, &a5, &26, &c5, &2d, &f0, &e6, &a0, &2b, &20   ; adce: 2b d0 06... +..
    equb &c1, &ae, &a0, &24, &20, &c1, &ae, &20, &6b, &be, &a5, &2a   ; adda: c1 ae a0... ...
    equb &29, &80, &f0,   9, &a5                                      ; ade6: 29 80 f0... )..
    equs "*)@"                                                        ; adeb: 2a 29 40    *)@
    equb &f0, &2b, &4c, &bd, &ad, &a2,   4, &20, &83, &bd, &a9,   4   ; adee: f0 2b 4c... .+L
    equb &a0, &33, &20, &9d, &b7, &a9,   5, &a0, &37, &20, &9d, &b7   ; adfa: a0 33 20... .3
    equb &a0, &24, &20, &9d, &b7, &a0, &33, &20, &9d, &b7, &a2, &24   ; ae06: a0 24 20... .$
    equb &20, &f2, &ae, &20, &1f, &a9, &4c, &2a, &ad, &a2,   4, &20   ; ae12: 20 f2 ae...  ..
    equb &83, &bd, &a9,   4, &a0, &33, &20, &9d, &b7, &a9,   5, &a0   ; ae1e: 83 bd a9... ...
    equb &37, &20, &9d, &b7, &a0, &2b, &20, &c1, &ae, &a9,   4, &a0   ; ae2a: 37 20 9d... 7 .
    equb &33, &20, &9d, &b7, &20, &db, &ab, &20, &e7, &ae, &ae, &70   ; ae36: 33 20 9d... 3 .
    equb &19, &f0,   2, &a9,   4, &a0, &37, &20, &9d, &b7, &20, &e7   ; ae42: 19 f0 02... ...
    equb &ae, &ae, &70, &19, &f0,   2, &a9, &55, &a0, &24, &20, &9d   ; ae4e: ae ae 70... ..p
    equb &b7, &20, &e7, &ae, &ae, &70, &19, &d0,   5, &a0, &33, &20   ; ae5a: b7 20 e7... . .
    equb &9d, &b7, &a5, &24, &38, &e5, &37, &85, &3b, &a5, &25, &e5   ; ae66: 9d b7 a5... ...
    equb &38, &85, &3c, &a5, &26, &38, &e5, &39, &85, &3d, &a5, &27   ; ae72: 38 85 3c... 8.<
    equb &e5, &3a, &85, &3e, &a5, &37, &38, &e5, &33, &85, &37, &a5   ; ae7e: e5 3a 85... .:.
    equb &38, &e5, &34, &85, &38, &a5, &39, &38, &e5, &35, &85, &39   ; ae8a: 38 e5 34... 8.4
    equb &a5, &3a, &e5, &36, &85, &3a, &a5, &33, &38, &e5, &24, &85   ; ae96: a5 3a e5... .:.
    equb &33, &a5, &34, &e5, &25, &85, &34, &a5, &35, &38, &e5, &26   ; aea2: 33 a5 34... 3.4
    equb &85, &35, &a5, &36, &e5, &27, &85, &36, &a2, &16, &20, &6b   ; aeae: 85 35 a5... .5.
    equb &b7, &20, &1f, &a9, &4c, &2a, &ad, &98, &48, &a2,   4, &20   ; aeba: b7 20 1f... . .
    equb &83, &bd, &a9,   4, &a0, &33, &20, &9d, &b7, &68, &a8, &aa   ; aec6: 83 bd a9... ...
    equb &48, &c8, &c8, &a9,   5, &20, &a9, &b7, &a9,   5, &a0, &37   ; aed2: 48 c8 c8... H..
    equb &20, &9d, &b7, &68, &aa, &20, &f2, &ae, &60, &ad, &72, &19   ; aede: 20 9d b7...  ..
    equb &f0,   3, &a9, &15, &60, &a9, &0d, &60, &ad, &7a, &19, &f0   ; aeea: f0 03 a9... ...
    equb   5, &8a, &a8, &4c, &4b, &bd, &4c, &5f, &a3, &20, &46, &bd   ; aef6: 05 8a a8... ...
    equb &a9, &80, &85, &2b, &a9,   2, &85, &2c, &85, &2e, &a9,   0   ; af02: a9 80 85... ...
    equb &85, &2d, &a9,   1, &8d, &66, &19, &a2, &2b, &a0,   8, &20   ; af0e: 85 2d a9... .-.
    equb &6e, &bd, &a9,   0, &20, &36, &9c, &20, &26, &b9, &20, &4b   ; af1a: 6e bd a9... n..
    equb &be, &a5, &2a, &29, &80, &d0, &12, &a9,   1, &8d, &66, &19   ; af26: be a5 2a... ..*
    equb &a2, &2b, &a0,   8, &20, &6e, &bd, &a9,   0, &20, &36, &9c   ; af32: a2 2b a0... .+.
    equb &60, &a5                                                     ; af3e: 60 a5       `.
    equs "*) "                                                        ; af40: 2a 29 20    *)
    equb &d0, &3c, &20, &bf, &af, &b0, &d7, &a9,   1, &8d, &66, &19   ; af43: d0 3c 20... .<
    equb &a2, &2b, &a0,   8, &20, &6e, &bd, &a9,   0, &20, &36, &9c   ; af4f: a2 2b a0... .+.
    equb &ad, &13, &19, &29,   2, &4a, &8d, &66, &19, &ad, &13, &19   ; af5b: ad 13 19... ...
    equb &29,   1, &85, &1b, &a2, &24, &a0,   8, &20, &6e, &bd, &a9   ; af67: 29 01 85... )..
    equb   0, &20, &36, &9c, &a2, &24, &a0                            ; af73: 00 20 36... . 6
    equs "+ n"                                                        ; af7a: 2b 20 6e    + n
    equb &bd, &4c, &10, &af, &20, &bf, &af, &90,   6, &20, &32, &be   ; af7d: bd 4c 10... .L.
    equb &4c, &21, &af, &20, &1d, &be, &a2, &2b, &a0, &24, &20,   3   ; af89: 4c 21 af... L!.
    equb &b8, &f0, &89, &a2, &2b, &a0,   8, &20, &6e, &bd, &a9,   1   ; af95: b8 f0 89... ...
    equb &8d, &66, &19, &a9,   0, &20, &36, &9c, &a2, &24, &a0,   8   ; afa1: 8d 66 19... .f.
    equb &20, &6e, &bd, &a9,   0, &20, &36, &9c, &a2, &24, &a0        ; afad: 20 6e bd...  n.
    equs "+ n"                                                        ; afb8: 2b 20 6e    + n
    equb &bd, &4c, &21, &af, &a0, &24, &20, &81, &b8, &b0, &3e, &a0   ; afbb: bd 4c 21... .L!
    equb &26, &20, &ad, &b8, &b0, &37, &ad, &59, &19, &0a, &18, &65   ; afc7: 26 20 ad... & .
    equb &24, &85, &47, &a5, &25, &69,   0, &85, &48, &a0, &47, &20   ; afd3: 24 85 47... $.G
    equb &96, &b8, &b0, &21, &ad, &5a, &19, &0a, &0a, &85, &47, &a9   ; afdf: 96 b8 b0... ...
    equb   0, &69,   0, &85, &48, &a5, &26, &38, &e5, &47, &85, &47   ; afeb: 00 69 00... .i.
    equb &a5, &27, &e5, &48, &85, &48, &a0, &47, &20, &c4, &b8, &b0   ; aff7: a5 27 e5... .'.
    equb   0, &60, &a0,   1, &20, &e3, &bd, &ad, &65, &19, &f0,   5   ; b003: 00 60 a0... .`.
    equb &a0,   2, &20, &de, &bd, &ad, &11, &19, &f0,   5, &a0,   1   ; b00f: a0 02 20... ..
    equb &20, &de, &bd, &20, &0b, &83, &b0, &23, &a5, &2a, &29, &80   ; b01b: 20 de bd...  ..
    equb &f0, &1d, &c0,   1, &d0, &f1, &e0,   1, &f0, &16, &e0,   2   ; b027: f0 1d c0... ...
    equb &d0,   3, &4c, &5e, &b1, &e0,   3, &d0,   3, &4c, &11, &b1   ; b033: d0 03 4c... ..L
    equb &e0,   4, &d0, &db, &4c, &f8, &b0, &60, &ad, &11, &19, &d0   ; b03f: e0 04 d0... ...
    equb &0b, &a0,   1, &20, &de, &bd, &20, &a3, &b0, &4c,   5, &b0   ; b04b: 0b a0 01... ...
    equb &20, &93, &b1, &ad, &65, &19, &f0, &3e, &a2,   0, &a0,   1   ; b057: 20 93 b1...  ..
    equb &20, &83, &bd, &a9                                           ; b063: 20 83 bd...  ..
    equs "E !"                                                        ; b067: 45 20 21    E !
    equb &bc, &20, &ea, &b1, &20,   2, &b2, &a9,   5, &20, &21, &bc   ; b06a: bc 20 ea... . .
    equb &20, &ea, &b1, &20, &0e, &b2, &a9,   5, &20, &21, &bc, &20   ; b076: 20 ea b1...  ..
    equb &f6, &b1, &20, &0e, &b2, &a9,   5, &20, &21, &bc, &20, &f6   ; b082: f6 b1 20... ..
    equb &b1, &20,   2, &b2, &a9,   5, &20, &21, &bc, &20, &ea, &b1   ; b08e: b1 20 02... . .
    equb &20,   2, &b2, &20, &4d, &b1, &4c,   5, &b0                  ; b09a: 20 02 b2...  ..

.sub_cb0a3
    lda #1                                                            ; b0a3: a9 01       ..
    sta l1911                                                         ; b0a5: 8d 11 19    ...
    jsr cba1b                                                         ; b0a8: 20 1b ba     ..
    cpy #&ff                                                          ; b0ab: c0 ff       ..
    bne cb0b5                                                         ; b0ad: d0 06       ..
    lda #0                                                            ; b0af: a9 00       ..
    sta l1911                                                         ; b0b1: 8d 11 19    ...
    rts                                                               ; b0b4: 60          `

.cb0b5
    ldx #7                                                            ; b0b5: a2 07       ..
.loop_cb0b7
    lda l0033,x                                                       ; b0b7: b5 33       .3
    sta l1900,x                                                       ; b0b9: 9d 00 19    ...
    dex                                                               ; b0bc: ca          .
    bpl loop_cb0b7                                                    ; b0bd: 10 f8       ..
    lda l1900                                                         ; b0bf: ad 00 19    ...
    clc                                                               ; b0c2: 18          .
    adc #2                                                            ; b0c3: 69 02       i.
    sta l1900                                                         ; b0c5: 8d 00 19    ...
    bcc cb0cd                                                         ; b0c8: 90 03       ..
    inc l1901                                                         ; b0ca: ee 01 19    ...
.cb0cd
    lda l1902                                                         ; b0cd: ad 02 19    ...
    clc                                                               ; b0d0: 18          .
    adc #4                                                            ; b0d1: 69 04       i.
    sta l1902                                                         ; b0d3: 8d 02 19    ...
    bcc cb0db                                                         ; b0d6: 90 03       ..
    inc l1903                                                         ; b0d8: ee 03 19    ...
.cb0db
    lda l1904                                                         ; b0db: ad 04 19    ...
    sec                                                               ; b0de: 38          8
    sbc #2                                                            ; b0df: e9 02       ..
    sta l1904                                                         ; b0e1: 8d 04 19    ...
    bcs cb0e9                                                         ; b0e4: b0 03       ..
    dec l1905                                                         ; b0e6: ce 05 19    ...
.cb0e9
    lda l1906                                                         ; b0e9: ad 06 19    ...
    sec                                                               ; b0ec: 38          8
    sbc #4                                                            ; b0ed: e9 04       ..
    sta l1906                                                         ; b0ef: 8d 06 19    ...
    bcs cb0f7                                                         ; b0f2: b0 03       ..
    dec l1907                                                         ; b0f4: ce 07 19    ...
.cb0f7
    rts                                                               ; b0f7: 60          `

    equb &a2,   4, &a0, &80, &20, &83, &bd, &20, &7e, &b1, &a9, &10   ; b0f8: a2 04 a0... ...
    equb &20, &ee, &ff, &a2,   0, &a0, &80, &20, &83, &bd, &4c,   5   ; b104: 20 ee ff...  ..
    equb &b0, &a0, &0e, &20, &18, &be, &a2,   4, &a0, &80, &20, &83   ; b110: b0 a0 0e... ...
    equb &bd, &20, &7e, &b1, &a9, &10, &20, &ee, &ff, &a2,   0, &a0   ; b11c: bd 20 7e... . ~
    equb &80, &20, &83, &bd, &20, &5c, &b8, &90, &12, &a2,   4, &a0   ; b128: 80 20 83... . .
    equb &80, &20, &83, &bd, &20, &7e, &b1, &a9, &10, &20, &ee, &ff   ; b134: 80 20 83... . .
    equb &4c,   5, &b0, &a2,   0, &a0, &80, &20, &83, &bd, &4c, &ff   ; b140: 4c 05 b0... L..
    equb &b0                                                          ; b14c: b0          .

.copy_data_to_1900_and_zero_l1911
    ldx #7                                                            ; b14d: a2 07       ..
.loop_cb14f
    lda data_copied_to_1900,x                                         ; b14f: bd a9 be    ...
    sta l1900,x                                                       ; b152: 9d 00 19    ...
    dex                                                               ; b155: ca          .
    bpl loop_cb14f                                                    ; b156: 10 f7       ..
    lda #0                                                            ; b158: a9 00       ..
    sta l1911                                                         ; b15a: 8d 11 19    ...
    rts                                                               ; b15d: 60          `

    equb &ad, &65, &19, &49,   1, &8d, &65, &19, &a0,   2, &20, &de   ; b15e: ad 65 19... .e.
    equb &bd, &4c, &1e, &b0                                           ; b16a: bd 4c 1e... .L.

.sub_cb16e
    lda l1911                                                         ; b16e: ad 11 19    ...
    clc                                                               ; b171: 18          .
    beq cb17d                                                         ; b172: f0 09       ..
    ldy #&0f                                                          ; b174: a0 0f       ..
    jsr sub_cbe18                                                     ; b176: 20 18 be     ..
    jsr sub_cb759                                                     ; b179: 20 59 b7     Y.
    sec                                                               ; b17c: 38          8
.cb17d
    rts                                                               ; b17d: 60          `

.sub_cb17e
    jsr sub_cb877                                                     ; b17e: 20 77 b8     w.
    lda #&18                                                          ; b181: a9 18       ..
    jsr oswrch                                                        ; b183: 20 ee ff     ..            ; Write character 24
    jsr sub_cb1ea                                                     ; b186: 20 ea b1     ..
    jsr sub_cb202                                                     ; b189: 20 02 b2     ..
    jsr sub_cb1f6                                                     ; b18c: 20 f6 b1     ..
    jsr sub_cb20e                                                     ; b18f: 20 0e b2     ..
    rts                                                               ; b192: 60          `

.sub_cb193
    lda l1911                                                         ; b193: ad 11 19    ...
    beq cb1e9                                                         ; b196: f0 51       .Q
    lda #0                                                            ; b198: a9 00       ..
    sta l1911                                                         ; b19a: 8d 11 19    ...
    lda l1900                                                         ; b19d: ad 00 19    ...
    sec                                                               ; b1a0: 38          8
    sbc #2                                                            ; b1a1: e9 02       ..
    sta l1900                                                         ; b1a3: 8d 00 19    ...
    bcs cb1ab                                                         ; b1a6: b0 03       ..
    dec l1901                                                         ; b1a8: ce 01 19    ...
.cb1ab
    lda l1902                                                         ; b1ab: ad 02 19    ...
    sec                                                               ; b1ae: 38          8
    sbc #4                                                            ; b1af: e9 04       ..
    sta l1902                                                         ; b1b1: 8d 02 19    ...
    bcs cb1b9                                                         ; b1b4: b0 03       ..
    dec l1903                                                         ; b1b6: ce 03 19    ...
.cb1b9
    lda l1904                                                         ; b1b9: ad 04 19    ...
    clc                                                               ; b1bc: 18          .
    adc #2                                                            ; b1bd: 69 02       i.
    sta l1904                                                         ; b1bf: 8d 04 19    ...
    bcc cb1c7                                                         ; b1c2: 90 03       ..
    inc l1905                                                         ; b1c4: ee 05 19    ...
.cb1c7
    lda l1906                                                         ; b1c7: ad 06 19    ...
    clc                                                               ; b1ca: 18          .
    adc #4                                                            ; b1cb: 69 04       i.
    sta l1906                                                         ; b1cd: 8d 06 19    ...
    bcc cb1d5                                                         ; b1d0: 90 03       ..
    inc l1907                                                         ; b1d2: ee 07 19    ...
.cb1d5
    ldx #7                                                            ; b1d5: a2 07       ..
.loop_cb1d7
    lda l1900,x                                                       ; b1d7: bd 00 19    ...
    sta l0056,x                                                       ; b1da: 95 56       .V
    dex                                                               ; b1dc: ca          .
    bpl loop_cb1d7                                                    ; b1dd: 10 f8       ..
    ldy #&56 ; 'V'                                                    ; b1df: a0 56       .V
    jsr cbd4b                                                         ; b1e1: 20 4b bd     K.
    ldy #&5a ; 'Z'                                                    ; b1e4: a0 5a       .Z
    jsr cbd4b                                                         ; b1e6: 20 4b bd     K.
.cb1e9
    rts                                                               ; b1e9: 60          `

.sub_cb1ea
    lda l1900                                                         ; b1ea: ad 00 19    ...
    jsr oswrch                                                        ; b1ed: 20 ee ff     ..            ; Write character
    lda l1901                                                         ; b1f0: ad 01 19    ...
    jmp oswrch                                                        ; b1f3: 4c ee ff    L..            ; Write character

.sub_cb1f6
    lda l1904                                                         ; b1f6: ad 04 19    ...
    jsr oswrch                                                        ; b1f9: 20 ee ff     ..            ; Write character
    lda l1905                                                         ; b1fc: ad 05 19    ...
    jmp oswrch                                                        ; b1ff: 4c ee ff    L..            ; Write character

.sub_cb202
    lda l1902                                                         ; b202: ad 02 19    ...
    jsr oswrch                                                        ; b205: 20 ee ff     ..            ; Write character
    lda l1903                                                         ; b208: ad 03 19    ...
    jmp oswrch                                                        ; b20b: 4c ee ff    L..            ; Write character

.sub_cb20e
    lda l1906                                                         ; b20e: ad 06 19    ...
    jsr oswrch                                                        ; b211: 20 ee ff     ..            ; Write character
    lda l1907                                                         ; b214: ad 07 19    ...
    jmp oswrch                                                        ; b217: 4c ee ff    L..            ; Write character

.cb21a
    rts                                                               ; b21a: 60          `

.cb21b
    ldy #&19                                                          ; b21b: a0 19       ..
    jsr do_our_osword_1_x_4                                           ; b21d: 20 e3 bd     ..
.cb220
    jsr c830b                                                         ; b220: 20 0b 83     ..
    bcs cb21a                                                         ; b223: b0 f5       ..
    lda l002a                                                         ; b225: a5 2a       .*
    and #&80                                                          ; b227: 29 80       ).
    beq cb21a                                                         ; b229: f0 ef       ..
    cpy #2                                                            ; b22b: c0 02       ..
    beq cb21a                                                         ; b22d: f0 eb       ..
    cpy #1                                                            ; b22f: c0 01       ..
    bne cb220                                                         ; b231: d0 ed       ..
    cpx #4                                                            ; b233: e0 04       ..
    bcs cb220                                                         ; b235: b0 e9       ..
    txa                                                               ; b237: 8a          .
    asl a                                                             ; b238: 0a          .
    asl a                                                             ; b239: 0a          .
    asl a                                                             ; b23a: 0a          .
    asl a                                                             ; b23b: 0a          .
    sta l0019                                                         ; b23c: 85 19       ..
    ldy #&1f                                                          ; b23e: a0 1f       ..
    jsr do_our_osword_1_x_4                                           ; b240: 20 e3 bd     ..
.loop_cb243
    jsr c830b                                                         ; b243: 20 0b 83     ..
    bcs cb21a                                                         ; b246: b0 d2       ..
    lda l002a                                                         ; b248: a5 2a       .*
    and #&80                                                          ; b24a: 29 80       ).
    beq cb21b                                                         ; b24c: f0 cd       ..
    cpy #1                                                            ; b24e: c0 01       ..
    bne loop_cb243                                                    ; b250: d0 f1       ..
    txa                                                               ; b252: 8a          .
    ora l0019                                                         ; b253: 05 19       ..
    sta l0019                                                         ; b255: 85 19       ..
    and #&f0                                                          ; b257: 29 f0       ).
    cmp #&30 ; '0'                                                    ; b259: c9 30       .0
    beq cb263                                                         ; b25b: f0 06       ..
    jsr sub_cb193                                                     ; b25d: 20 93 b1     ..
    jsr copy_data_to_1900_and_zero_l1911                              ; b260: 20 4d b1     M.
.cb263
    ldy #&1b                                                          ; b263: a0 1b       ..
    jsr sub_cbe18                                                     ; b265: 20 18 be     ..
    jsr cb85c                                                         ; b268: 20 5c b8     \.
    bcs cb21a                                                         ; b26b: b0 ad       ..
    ldx #&e0                                                          ; b26d: a2 e0       ..
    ldy #8                                                            ; b26f: a0 08       ..
    jsr cbded                                                         ; b271: 20 ed bd     ..
    lda l0019                                                         ; b274: a5 19       ..
    and #&f0                                                          ; b276: 29 f0       ).
    cmp #&10                                                          ; b278: c9 10       ..
    bne cb297                                                         ; b27a: d0 1b       ..
    ldy #&0c                                                          ; b27c: a0 0c       ..
    jsr sub_cbe18                                                     ; b27e: 20 18 be     ..
    jsr cb85c                                                         ; b281: 20 5c b8     \.
    bcs cb21a                                                         ; b284: b0 94       ..
.loop_cb286
    lda l191f                                                         ; b286: ad 1f 19    ...
    cmp l1920                                                         ; b289: cd 20 19    . .
    beq cb297                                                         ; b28c: f0 09       ..
    jsr sub_c8543                                                     ; b28e: 20 43 85     C.
    jmp loop_cb286                                                    ; b291: 4c 86 b2    L..

    equb &20, &77, &b8                                                ; b294: 20 77 b8     w.

.cb297
    jsr do_our_osword_1_x_5                                           ; b297: 20 e8 bd     ..
    ldy #&19                                                          ; b29a: a0 19       ..
    jsr sub_cbe18                                                     ; b29c: 20 18 be     ..
    jsr sub_cb17e                                                     ; b29f: 20 7e b1     ~.
    lda #&4c ; 'L'                                                    ; b2a2: a9 4c       .L
    sta l0a00                                                         ; b2a4: 8d 00 0a    ...
    lda #&3e ; '>'                                                    ; b2a7: a9 3e       .>
    sta l0a01                                                         ; b2a9: 8d 01 0a    ...
    lda #&85                                                          ; b2ac: a9 85       ..
    sta l0a02                                                         ; b2ae: 8d 02 0a    ...
    lda #osbyte_read_write_escape_break_effect                        ; b2b1: a9 c8       ..
    ldx #1                                                            ; b2b3: a2 01       ..
    ldy #0                                                            ; b2b5: a0 00       ..
    jsr osbyte                                                        ; b2b7: 20 f4 ff     ..            ; Write Disable ESCAPE action, set normal BREAK action, value X=1
    lda l0019                                                         ; b2ba: a5 19       ..
    jsr l1a00                                                         ; b2bc: 20 00 1a     ..
    lda #osbyte_read_write_escape_break_effect                        ; b2bf: a9 c8       ..
    ldx #0                                                            ; b2c1: a2 00       ..
    ldy #0                                                            ; b2c3: a0 00       ..
    jsr osbyte                                                        ; b2c5: 20 f4 ff     ..            ; Write Set normal ESCAPE action, set normal BREAK action, value X=0
    rts                                                               ; b2c8: 60          `

    equb &f7, &b4, &19, &b3, &29, &b3, &64, &b4, &58, &b3, &a0, &16   ; b2c9: f7 b4 19... ...
    equb &20, &e3, &bd, &ad, &17, &19, &f0,   5, &a0,   1, &20, &de   ; b2d5: 20 e3 bd...  ..
    equb &bd, &ad, &76, &19, &f0,   5, &a0,   2, &20, &de, &bd, &ad   ; b2e1: bd ad 76... ..v
    equb &75, &19, &f0,   5, &a0,   3, &20, &de, &bd, &ad, &77, &19   ; b2ed: 75 19 f0... u..
    equb &f0,   5, &a0,   4, &20, &de, &bd, &4c,   4, &b3, &60, &20   ; b2f9: f0 05 a0... ...
    equb &0b, &83, &b0, &fa, &a5, &2a, &10, &f6, &c0,   1, &d0, &f3   ; b305: 0b 83 b0... ...
    equb &8a, &a2, &c9, &a0, &b2, &4c, &7e, &b7, &a0,   2, &20, &de   ; b311: 8a a2 c9... ...
    equb &bd, &ad, &76, &19, &49,   1, &8d, &76, &19, &4c,   4, &b3   ; b31d: bd ad 76... ..v
    equb &a0,   3, &20, &de, &bd, &a9, &17, &20, &ee, &ff, &a9,   0   ; b329: a0 03 20... ..
    equb &20, &ee, &ff, &a9,   8, &20, &ee, &ff, &ad, &75, &19, &20   ; b335: 20 ee ff...  ..
    equb &ee, &ff, &20, &19, &bc, &20, &19, &bc, &20, &19, &bc, &ad   ; b341: ee ff 20... ..
    equb &75, &19, &49,   1, &8d, &75, &19, &4c,   4, &b3, &60, &a0   ; b34d: 75 19 49... u.I
    equb &20, &20, &e3, &bd, &ad, &58, &19, &f0,   5, &a0,   2, &20   ; b359: 20 20 e3...   .
    equb &de, &bd, &ad, &6c, &19, &f0,   5, &a0,   4, &20, &de, &bd   ; b365: de bd ad... ...
    equb &20, &0b, &83, &b0, &e1, &a5, &2a, &30,   3, &4c, &d3, &b2   ; b371: 20 0b 83...  ..
    equb &c0,   1, &d0, &f0, &e0,   1, &f0, &2f, &e0,   2, &f0, &0b   ; b37d: c0 01 d0... ...
    equb &e0,   3, &f0, &61, &e0,   4, &f0, &13, &4c, &71, &b3, &a0   ; b389: e0 03 f0... ...
    equb   2, &20, &de, &bd, &ad, &58, &19, &49,   1, &8d, &58, &19   ; b395: 02 20 de... . .
    equb &4c, &71, &b3, &a0,   4, &20, &de, &bd, &ad, &6c, &19, &49   ; b3a1: 4c 71 b3... Lq.
    equb   1, &8d, &6c, &19, &4c, &71, &b3, &a0,   7, &20, &18, &be   ; b3ad: 01 8d 6c... ..l
    equb &20, &5c, &b8, &b0, &9a, &a0, &16, &20, &18, &be, &20, &5c   ; b3b9: 20 5c b8...  \.
    equb &b8, &b0, &90, &a9, &c8, &a2,   0, &20, &f4, &ff, &a9, &4d   ; b3c5: b8 b0 90... ...
    equb &85, &70, &a0, &f7, &a2,   0, &a9, &ff, &20, &f4, &ff, &20   ; b3d1: 85 70 a0... .p.
    equb &26, &b9, &a5, &2a, &29, &e0, &c9, &e0, &d0, &f5, &6c, &fc   ; b3dd: 26 b9 a5... &..
    equb &ff, &4c, &58, &b3, &60, &20, &ee, &b9, &b0, &f7, &a0, &21   ; b3e9: ff 4c 58... .LX
    equb &20, &e3, &bd, &20, &0b, &83, &b0, &f0, &a5, &2a, &10, &e9   ; b3f5: 20 e3 bd...  ..
    equb &c0,   1, &d0, &f3, &e0,   2, &f0, &4b, &e0,   1, &d0, &eb   ; b401: c0 01 d0... ...
    equb &a0, &1d, &20, &18, &be, &20, &59, &bc, &b0, &d3, &a9, &53   ; b40d: a0 1d 20... ..
    equb &8d, &43, &19, &20, &7e, &be, &b0, &d2, &ad, &2d, &19, &48   ; b419: 8d 43 19... .C.
    equb &a9, &24, &8d, &43, &19, &20, &7e, &b1, &20, &db, &ab, &68   ; b425: a9 24 8d... .$.
    equb &a8, &20, &d7, &ff, &b0,   6, &20, &ee, &ff, &4c, &32, &b4   ; b431: a8 20 d7... . .
    equb &a9,   0, &20, &ce, &ff, &a9, &1d, &20, &ee, &ff, &a2,   4   ; b43d: a9 00 20... ..
    equb &a9,   0, &20, &ee, &ff, &ca, &d0, &fa, &4c, &f3, &b3, &a9   ; b449: a9 00 20... ..
    equb &53, &8d, &43, &19, &20, &2b, &bc, &a9, &24, &8d, &43, &19   ; b455: 53 8d 43... S.C
    equb &4c, &f3, &b3, &a0, &1c, &20, &18, &be, &20, &41, &bd, &20   ; b461: 4c f3 b3... L..
    equb &77, &b8, &a0,   7, &20, &54, &b7, &a9, &0d, &20, &ee, &ff   ; b46d: 77 b8 a0... w..
    equb &a9, &0a, &20, &ee, &ff, &a9, &20, &20, &ee, &ff, &a9, &2a   ; b479: a9 0a 20... ..
    equb &20, &ee, &ff, &a0,   0, &8c, &4e, &19, &20, &81, &b9, &ac   ; b485: 20 ee ff...  ..
    equb &4e, &19, &90,   6, &20, &46, &bd, &4c, &d3, &b2, &c9, &7f   ; b491: 4e 19 90... N..
    equb &f0, &16, &c9, &0d, &f0, &1d, &c9, &20, &90, &e3, &c0, &ff   ; b49d: f0 16 c9... ...
    equb &f0, &df, &20, &ee, &ff, &99,   0, &0a, &c8, &4c, &8a, &b4   ; b4a9: f0 df 20... ..
    equb &c0,   0, &f0, &d1, &20, &ee, &ff, &88, &4c, &8a, &b4, &c0   ; b4b5: c0 00 f0... ...
    equb   0, &f0, &d1, &99,   0, &0a, &ad,   0, &0a, &c9, &23, &f0   ; b4c1: 00 f0 d1... ...
    equb &0a, &a2,   0, &a0, &0a, &20, &f7, &ff, &4c, &74, &b4, &a9   ; b4cd: 0a a2 00... ...
    equb &2a, &8d,   0, &0a, &20, &46, &bd, &20, &7e, &b1, &a2,   0   ; b4d9: 2a 8d 00... *..
    equb &a0, &0a, &20, &f7, &ff, &4c, &d3, &b2, &20, &46, &bd, &4c   ; b4e5: a0 0a 20... ..
    equb &d3, &b2, &20, &46, &bd                                      ; b4f1: d3 b2 20... ..
    equs "` A"                                                        ; b4f6: 60 20 41    ` A
    equb &bd, &a0, &17, &20, &e3, &bd, &ad, &17, &19, &f0,   5, &a0   ; b4f9: bd a0 17... ...
    equb   5, &20, &de, &bd, &20, &77, &b8, &a0,   7, &20, &54, &b7   ; b505: 05 20 de... . .
    equb &a9, &0c, &20, &ee, &ff, &20, &83, &b5, &20, &0b, &83, &b0   ; b511: a9 0c 20... ..
    equb &d5, &a5, &2a, &10, &cb, &a5                                 ; b51d: d5 a5 2a... ..*
    equs "*) "                                                        ; b523: 2a 29 20    *)
    equb &d0, &f1, &c0,   1, &d0, &ed, &e0,   5, &d0, &10, &a0,   5   ; b526: d0 f1 c0... ...
    equb &20, &de, &bd, &ad, &17, &19, &49,   1, &8d, &17, &19, &4c   ; b532: 20 de bd...  ..
    equb   9, &b5, &e0,   1, &d0,   8, &ad, &18, &19, &f0,   3, &0e   ; b53e: 09 b5 e0... ...
    equb &18, &19, &e0,   2, &d0, &0b, &ad, &18, &19, &c9, &ff, &f0   ; b54a: 18 19 e0... ...
    equb   4, &38, &6e, &18, &19, &e0,   3, &d0,   8, &ad, &19, &19   ; b556: 04 38 6e... .8n
    equb &f0,   3, &0e, &19, &19, &e0,   4, &d0, &0b, &ad, &19, &19   ; b562: f0 03 0e... ...
    equb &c9, &ff, &f0,   4, &38, &6e, &19, &19, &a0,   0, &a2,   0   ; b56e: c9 ff f0... ...
    equb &ca, &d0, &fd, &88, &d0, &fa, &4c, &11, &b5, &a9             ; b57a: ca d0 fd... ...
    equs "E !"                                                        ; b584: 45 20 21    E !
    equb &bc, &a9, &10, &20, &ee, &ff, &a9,   2, &20, &ee, &ff, &a9   ; b587: bc a9 10... ...
    equb &8c, &20, &ee, &ff, &a9,   2, &20, &ee, &ff, &a9             ; b593: 8c 20 ee... . .
    equs "A !"                                                        ; b59d: 41 20 21    A !
    equb &bc, &ad, &18, &19, &49, &ff, &29, &fe, &20, &ee, &ff, &a9   ; b5a0: bc ad 18... ...
    equb   0, &20, &ee, &ff, &20, &19, &bc, &a9                       ; b5ac: 00 20 ee... . .
    equs "A !"                                                        ; b5b4: 41 20 21    A !
    equb &bc, &20, &19, &bc, &ad, &19, &19, &20, &ee, &ff, &a9, &ff   ; b5b7: bc 20 19... . .
    equb &20, &ee, &ff, &a9,   0, &20, &21, &bc, &a9,   2, &20, &ee   ; b5c3: 20 ee ff...  ..
    equb &ff, &a9,   0, &20, &ee, &ff, &20, &19, &bc, &a9             ; b5cf: ff a9 00... ...
    equs "A !"                                                        ; b5d9: 41 20 21    A !
    equb &bc, &ad, &18, &19, &20, &ee, &ff, &a9, &ff, &20, &ee, &ff   ; b5dc: bc ad 18... ...
    equb &20, &19, &bc, &a9, &0d, &20, &ee, &ff, &a2,   9, &a9, &0a   ; b5e8: 20 19 bc...  ..
    equb &20, &ee, &ff, &ca, &d0, &fa, &20, &5f, &be, &ad, &18, &19   ; b5f4: 20 ee ff...  ..
    equb &49, &ff, &4a, &69,   0, &20, &44, &be, &20, &5f, &be, &ad   ; b600: 49 ff 4a... I.J
    equb &19, &19, &49, &ff, &4a, &69,   0, &20, &44, &be, &60        ; b60c: 19 19 49... ..I

.sub_cb617
    lsr l0009                                                         ; b617: 46 09       F.
    ror l0008                                                         ; b619: 66 08       f.
    lda l000a                                                         ; b61b: a5 0a       ..
    lsr l000b                                                         ; b61d: 46 0b       F.
    ror a                                                             ; b61f: 6a          j
    lsr l000b                                                         ; b620: 46 0b       F.
    ror a                                                             ; b622: 6a          j
    eor #&ff                                                          ; b623: 49 ff       I.
    sta l000a                                                         ; b625: 85 0a       ..
    lsr l000d                                                         ; b627: 46 0d       F.
    ror l000c                                                         ; b629: 66 0c       f.
    lda l000e                                                         ; b62b: a5 0e       ..
    lsr l000f                                                         ; b62d: 46 0f       F.
    ror a                                                             ; b62f: 6a          j
    lsr l000f                                                         ; b630: 46 0f       F.
    ror a                                                             ; b632: 6a          j
    eor #&ff                                                          ; b633: 49 ff       I.
    sta l000e                                                         ; b635: 85 0e       ..
    lsr l0011                                                         ; b637: 46 11       F.
    ror l0010                                                         ; b639: 66 10       f.
    lsr l0013                                                         ; b63b: 46 13       F.
    ror l0012                                                         ; b63d: 66 12       f.
    lsr l0013                                                         ; b63f: 46 13       F.
    ror l0012                                                         ; b641: 66 12       f.
    rts                                                               ; b643: 60          `

.sub_cb644
    lda l0012                                                         ; b644: a5 12       ..
    sta l0014                                                         ; b646: 85 14       ..
    ldx #0                                                            ; b648: a2 00       ..
    jsr sub_cb64f                                                     ; b64a: 20 4f b6     O.
    ldx #4                                                            ; b64d: a2 04       ..
.sub_cb64f
    lda l000a,x                                                       ; b64f: b5 0a       ..
    and #7                                                            ; b651: 29 07       ).
    sta l001c,x                                                       ; b653: 95 1c       ..
    lda l000a,x                                                       ; b655: b5 0a       ..
    and #&f8                                                          ; b657: 29 f8       ).
    lsr a                                                             ; b659: 4a          J
    lsr a                                                             ; b65a: 4a          J
    clc                                                               ; b65b: 18          .
    adc #&30 ; '0'                                                    ; b65c: 69 30       i0
    sta l001d,x                                                       ; b65e: 95 1d       ..
    lda l000a,x                                                       ; b660: b5 0a       ..
    lsr a                                                             ; b662: 4a          J
    lsr a                                                             ; b663: 4a          J
    lsr a                                                             ; b664: 4a          J
    lsr a                                                             ; b665: 4a          J
    php                                                               ; b666: 08          .
    clc                                                               ; b667: 18          .
    adc l001d,x                                                       ; b668: 75 1d       u.
    sta l001d,x                                                       ; b66a: 95 1d       ..
    lda #0                                                            ; b66c: a9 00       ..
    plp                                                               ; b66e: 28          (
    ror a                                                             ; b66f: 6a          j
    adc l001c,x                                                       ; b670: 75 1c       u.
    sta l001c,x                                                       ; b672: 95 1c       ..
    lda l0009,x                                                       ; b674: b5 09       ..
    and #3                                                            ; b676: 29 03       ).
    clc                                                               ; b678: 18          .
    adc l001d,x                                                       ; b679: 75 1d       u.
    sta l001d,x                                                       ; b67b: 95 1d       ..
    lda l0008,x                                                       ; b67d: b5 08       ..
    and #&f8                                                          ; b67f: 29 f8       ).
    clc                                                               ; b681: 18          .
    adc l001c,x                                                       ; b682: 75 1c       u.
    sta l001c,x                                                       ; b684: 95 1c       ..
    lda l001d,x                                                       ; b686: b5 1d       ..
    adc #0                                                            ; b688: 69 00       i.
    sta l001d,x                                                       ; b68a: 95 1d       ..
    lda l0008,x                                                       ; b68c: b5 08       ..
    and #7                                                            ; b68e: 29 07       ).
    tay                                                               ; b690: a8          .
    iny                                                               ; b691: c8          .
    lda #&80                                                          ; b692: a9 80       ..
.loop_cb694
    dey                                                               ; b694: 88          .
    beq cb69b                                                         ; b695: f0 04       ..
    lsr a                                                             ; b697: 4a          J
    jmp loop_cb694                                                    ; b698: 4c 94 b6    L..

.cb69b
    sta l001e,x                                                       ; b69b: 95 1e       ..
    rts                                                               ; b69d: 60          `

.sub_cb69e
    lda l001e,x                                                       ; b69e: b5 1e       ..
    and (l001c,x)                                                     ; b6a0: 21 1c       !.
    sta l001b                                                         ; b6a2: 85 1b       ..
    rts                                                               ; b6a4: 60          `

.sub_cb6a5
    ldx #0                                                            ; b6a5: a2 00       ..
    jsr sub_cb69e                                                     ; b6a7: 20 9e b6     ..
    ldx #4                                                            ; b6aa: a2 04       ..
.sub_cb6ac
    jsr sub_cb730                                                     ; b6ac: 20 30 b7     0.
    lda l001b                                                         ; b6af: a5 1b       ..
    beq cb6ba                                                         ; b6b1: f0 07       ..
    lda l001e,x                                                       ; b6b3: b5 1e       ..
    ora (l001c,x)                                                     ; b6b5: 01 1c       ..
    sta (l001c,x)                                                     ; b6b7: 81 1c       ..
    rts                                                               ; b6b9: 60          `

.cb6ba
    lda l001e,x                                                       ; b6ba: b5 1e       ..
    eor #&ff                                                          ; b6bc: 49 ff       I.
    and (l001c,x)                                                     ; b6be: 21 1c       !.
    sta (l001c,x)                                                     ; b6c0: 81 1c       ..
    rts                                                               ; b6c2: 60          `

.sub_cb6c3
    jsr sub_cb730                                                     ; b6c3: 20 30 b7     0.
    lda l001e,x                                                       ; b6c6: b5 1e       ..
    eor (l001c,x)                                                     ; b6c8: 41 1c       A.
    sta (l001c,x)                                                     ; b6ca: 81 1c       ..
    rts                                                               ; b6cc: 60          `

.sub_cb6cd
    inc l001c,x                                                       ; b6cd: f6 1c       ..
    bne cb6d3                                                         ; b6cf: d0 02       ..
    inc l001d,x                                                       ; b6d1: f6 1d       ..
.cb6d3
    lda l001c,x                                                       ; b6d3: b5 1c       ..
    and #7                                                            ; b6d5: 29 07       ).
    bne cb6e6                                                         ; b6d7: d0 0d       ..
    lda l001c,x                                                       ; b6d9: b5 1c       ..
    clc                                                               ; b6db: 18          .
    adc #&78 ; 'x'                                                    ; b6dc: 69 78       ix
    sta l001c,x                                                       ; b6de: 95 1c       ..
    lda l001d,x                                                       ; b6e0: b5 1d       ..
    adc #2                                                            ; b6e2: 69 02       i.
    sta l001d,x                                                       ; b6e4: 95 1d       ..
.cb6e6
    rts                                                               ; b6e6: 60          `

.sub_cb6e7
    lda l001c,x                                                       ; b6e7: b5 1c       ..
    sec                                                               ; b6e9: 38          8
    sbc #1                                                            ; b6ea: e9 01       ..
    sta l001c,x                                                       ; b6ec: 95 1c       ..
    bcs cb6f2                                                         ; b6ee: b0 02       ..
    dec l001d,x                                                       ; b6f0: d6 1d       ..
.cb6f2
    lda l001c,x                                                       ; b6f2: b5 1c       ..
    and #7                                                            ; b6f4: 29 07       ).
    cmp #7                                                            ; b6f6: c9 07       ..
    bne cb707                                                         ; b6f8: d0 0d       ..
    lda l001c,x                                                       ; b6fa: b5 1c       ..
    sec                                                               ; b6fc: 38          8
    sbc #&78 ; 'x'                                                    ; b6fd: e9 78       .x
    sta l001c,x                                                       ; b6ff: 95 1c       ..
    lda l001d,x                                                       ; b701: b5 1d       ..
    sbc #2                                                            ; b703: e9 02       ..
    sta l001d,x                                                       ; b705: 95 1d       ..
.cb707
    rts                                                               ; b707: 60          `

.sub_cb708
    lsr l001e,x                                                       ; b708: 56 1e       V.
    bne cb71b                                                         ; b70a: d0 0f       ..
    lda #&80                                                          ; b70c: a9 80       ..
    sta l001e,x                                                       ; b70e: 95 1e       ..
    lda l001c,x                                                       ; b710: b5 1c       ..
    clc                                                               ; b712: 18          .
    adc #8                                                            ; b713: 69 08       i.
    sta l001c,x                                                       ; b715: 95 1c       ..
    bcc cb71b                                                         ; b717: 90 02       ..
    inc l001d,x                                                       ; b719: f6 1d       ..
.cb71b
    rts                                                               ; b71b: 60          `

.sub_cb71c
    asl l001e,x                                                       ; b71c: 16 1e       ..
    bne cb72f                                                         ; b71e: d0 0f       ..
    lda #1                                                            ; b720: a9 01       ..
    sta l001e,x                                                       ; b722: 95 1e       ..
    lda l001c,x                                                       ; b724: b5 1c       ..
    sec                                                               ; b726: 38          8
    sbc #8                                                            ; b727: e9 08       ..
    sta l001c,x                                                       ; b729: 95 1c       ..
    bcs cb72f                                                         ; b72b: b0 02       ..
    dec l001d,x                                                       ; b72d: d6 1d       ..
.cb72f
    rts                                                               ; b72f: 60          `

.sub_cb730
    lda l001d,x                                                       ; b730: b5 1d       ..
    and #&80                                                          ; b732: 29 80       ).
    beq cb738                                                         ; b734: f0 02       ..
    pla                                                               ; b736: 68          h
    pla                                                               ; b737: 68          h
.cb738
    rts                                                               ; b738: 60          `

.sub_cb739
    pla                                                               ; b739: 68          h
    sta l0047                                                         ; b73a: 85 47       .G
    pla                                                               ; b73c: 68          h
    sta l0048                                                         ; b73d: 85 48       .H
    pha                                                               ; b73f: 48          H
    pha                                                               ; b740: 48          H
    pha                                                               ; b741: 48          H
    pha                                                               ; b742: 48          H
.loop_cb743
    tsx                                                               ; b743: ba          .
    cpx l1908                                                         ; b744: ec 08 19    ...
    beq cb74d                                                         ; b747: f0 04       ..
    pla                                                               ; b749: 68          h
    jmp loop_cb743                                                    ; b74a: 4c 43 b7    LC.

.cb74d
    lda l0048                                                         ; b74d: a5 48       .H
    pha                                                               ; b74f: 48          H
    lda l0047                                                         ; b750: a5 47       .G
    pha                                                               ; b752: 48          H
    rts                                                               ; b753: 60          `

.sub_cb754
    ldx #&0a                                                          ; b754: a2 0a       ..
    jmp do_our_osword_1                                               ; b756: 4c 6b b7    Lk.

.sub_cb759
    lda #8                                                            ; b759: a9 08       ..
    ldx #0                                                            ; b75b: a2 00       ..
    ldy #0                                                            ; b75d: a0 00       ..
.cb75f
    dey                                                               ; b75f: 88          .
    bne cb75f                                                         ; b760: d0 fd       ..
    dex                                                               ; b762: ca          .
    bne cb75f                                                         ; b763: d0 fa       ..
    sec                                                               ; b765: 38          8
    sbc #1                                                            ; b766: e9 01       ..
    bne cb75f                                                         ; b768: d0 f5       ..
    rts                                                               ; b76a: 60          `

.do_our_osword_1
    lda #&35 ; '5'                                                    ; b76b: a9 35       .5
    jmp osword                                                        ; b76d: 4c f1 ff    L..

    equb &a2,   0, &a0,   1, &20, &83, &bd, &a2,   0, &a0, &80, &4c   ; b770: a2 00 a0... ...
    equb &83, &bd                                                     ; b77c: 83 bd       ..

.cb77e
    stx l0047                                                         ; b77e: 86 47       .G
    sty l0048                                                         ; b780: 84 48       .H
    sec                                                               ; b782: 38          8
    sbc #1                                                            ; b783: e9 01       ..
    asl a                                                             ; b785: 0a          .
    clc                                                               ; b786: 18          .
    adc l0047                                                         ; b787: 65 47       eG
    sta l0047                                                         ; b789: 85 47       .G
    bcc cb78f                                                         ; b78b: 90 02       ..
    inc l0048                                                         ; b78d: e6 48       .H
.cb78f
    ldy #0                                                            ; b78f: a0 00       ..
    lda (l0047),y                                                     ; b791: b1 47       .G
    sta l0006                                                         ; b793: 85 06       ..
    iny                                                               ; b795: c8          .
    lda (l0047),y                                                     ; b796: b1 47       .G
    sta l0007                                                         ; b798: 85 07       ..
    jmp (l0006)                                                       ; b79a: 6c 06 00    l..

.sub_cb79d
    pha                                                               ; b79d: 48          H
    tya                                                               ; b79e: 98          .
    tax                                                               ; b79f: aa          .
    iny                                                               ; b7a0: c8          .
    iny                                                               ; b7a1: c8          .
    pla                                                               ; b7a2: 68          h
    jsr sub_cb7a9                                                     ; b7a3: 20 a9 b7     ..
    dey                                                               ; b7a6: 88          .
    dey                                                               ; b7a7: 88          .
    rts                                                               ; b7a8: 60          `

.sub_cb7a9
    jsr sub_cbc21                                                     ; b7a9: 20 21 bc     !.
    pha                                                               ; b7ac: 48          H
    lda l0000,x                                                       ; b7ad: b5 00       ..
    jsr oswrch                                                        ; b7af: 20 ee ff     ..            ; Write character
    lda l0001,x                                                       ; b7b2: b5 01       ..
    jsr oswrch                                                        ; b7b4: 20 ee ff     ..            ; Write character
    lda l0000,y                                                       ; b7b7: b9 00 00    ...
    jsr oswrch                                                        ; b7ba: 20 ee ff     ..            ; Write character
    lda l0001,y                                                       ; b7bd: b9 01 00    ...
    jsr oswrch                                                        ; b7c0: 20 ee ff     ..            ; Write character
    pla                                                               ; b7c3: 68          h
    rts                                                               ; b7c4: 60          `

; ***************************************************************************************
.print_nul_terminated_string_at_yx
    lda l0004                                                         ; b7c5: a5 04       ..
    pha                                                               ; b7c7: 48          H
    stx l0004                                                         ; b7c8: 86 04       ..
    lda l0005                                                         ; b7ca: a5 05       ..
    pha                                                               ; b7cc: 48          H
    sty l0005                                                         ; b7cd: 84 05       ..
    ldy #0                                                            ; b7cf: a0 00       ..
.loop_cb7d1
    lda (l0004),y                                                     ; b7d1: b1 04       ..
    beq cb7dc                                                         ; b7d3: f0 07       ..
    iny                                                               ; b7d5: c8          .
    jsr oswrch                                                        ; b7d6: 20 ee ff     ..            ; Write character
    jmp loop_cb7d1                                                    ; b7d9: 4c d1 b7    L..

.cb7dc
    pla                                                               ; b7dc: 68          h
    sta l0005                                                         ; b7dd: 85 05       ..
    pla                                                               ; b7df: 68          h
    sta l0004                                                         ; b7e0: 85 04       ..
    rts                                                               ; b7e2: 60          `

.sub_cb7e3
    lda l0000,x                                                       ; b7e3: b5 00       ..
    pha                                                               ; b7e5: 48          H
    lda l0000,y                                                       ; b7e6: b9 00 00    ...
    sta l0000,x                                                       ; b7e9: 95 00       ..
    pla                                                               ; b7eb: 68          h
    sta l0000,y                                                       ; b7ec: 99 00 00    ...
    lda l0001,x                                                       ; b7ef: b5 01       ..
    pha                                                               ; b7f1: 48          H
    lda l0001,y                                                       ; b7f2: b9 01 00    ...
    sta l0001,x                                                       ; b7f5: 95 01       ..
    pla                                                               ; b7f7: 68          h
    sta l0001,y                                                       ; b7f8: 99 01 00    ...
    rts                                                               ; b7fb: 60          `

.sub_cb7fc
    lda #osbyte_flush_buffer_class                                    ; b7fc: a9 0f       ..
    ldx #0                                                            ; b7fe: a2 00       ..
    jmp osbyte                                                        ; b800: 4c f4 ff    L..            ; Flush all buffers (X=0)

.sub_cb803
    lda l0000,x                                                       ; b803: b5 00       ..
    cmp l0000,y                                                       ; b805: d9 00 00    ...
    bne cb823                                                         ; b808: d0 19       ..
    lda l0001,x                                                       ; b80a: b5 01       ..
    cmp l0001,y                                                       ; b80c: d9 01 00    ...
    bne cb823                                                         ; b80f: d0 12       ..
    lda l0002,x                                                       ; b811: b5 02       ..
    cmp l0002,y                                                       ; b813: d9 02 00    ...
    bne cb823                                                         ; b816: d0 0b       ..
    lda l0003,x                                                       ; b818: b5 03       ..
    cmp l0003,y                                                       ; b81a: d9 03 00    ...
    bne cb823                                                         ; b81d: d0 04       ..
    lda #0                                                            ; b81f: a9 00       ..
    clc                                                               ; b821: 18          .
    rts                                                               ; b822: 60          `

.cb823
    lda #&ff                                                          ; b823: a9 ff       ..
    sec                                                               ; b825: 38          8
    rts                                                               ; b826: 60          `

    equb &b5,   0, &d9,   0,   0, &d0,   7, &b5,   1, &d9,   1,   0   ; b827: b5 00 d9... ...
    equb &f0, &0e, &b5,   2, &d9,   2,   0, &d0,   7, &b5,   3, &d9   ; b833: f0 0e b5... ...
    equb   3,   0, &f0,   2, &18                                      ; b83f: 03 00 f0... ...
    equs "`8`"                                                        ; b844: 60 38 60    `8`

.sub_cb847
    lda l0000,x                                                       ; b847: b5 00       ..
    bne cb84d                                                         ; b849: d0 02       ..
    dec l0001,x                                                       ; b84b: d6 01       ..
.cb84d
    dec l0000,x                                                       ; b84d: d6 00       ..
    lda l0000,x                                                       ; b84f: b5 00       ..
    ora l0001,x                                                       ; b851: 15 01       ..
    rts                                                               ; b853: 60          `

.sub_cb854
    lda #osbyte_acknowledge_escape                                    ; b854: a9 7e       .~
    jsr osbyte                                                        ; b856: 20 f4 ff     ..            ; Clear escape condition and perform escape effects
    cpx #&80                                                          ; b859: e0 80       ..             ; X=&ff if there was an ESCAPE condition to clear, or zero otherwise
    rts                                                               ; b85b: 60          `

.cb85c
    jsr do_our_osword_2_yx_24_and_postprocess                         ; b85c: 20 26 b9     &.
    lda l002a                                                         ; b85f: a5 2a       .*
    and #&e0                                                          ; b861: 29 e0       ).
    cmp #&e0                                                          ; b863: c9 e0       ..
    bne cb85c                                                         ; b865: d0 f5       ..
.loop_cb867
    jsr do_our_osword_2_yx_24_and_postprocess                         ; b867: 20 26 b9     &.
    lda l002a                                                         ; b86a: a5 2a       .*
    and #&20 ; ' '                                                    ; b86c: 29 20       )
    clc                                                               ; b86e: 18          .
    beq cb876                                                         ; b86f: f0 05       ..
    lda l002a                                                         ; b871: a5 2a       .*
    bmi loop_cb867                                                    ; b873: 30 f2       0.
    sec                                                               ; b875: 38          8
.cb876
    rts                                                               ; b876: 60          `

.sub_cb877
    lda #&1a                                                          ; b877: a9 1a       ..
    jsr oswrch                                                        ; b879: 20 ee ff     ..            ; Write character 26
    lda #4                                                            ; b87c: a9 04       ..
    jmp oswrch                                                        ; b87e: 4c ee ff    L..            ; Write character 4

.sub_cb881
    lda l0001,y                                                       ; b881: b9 01 00    ...
    bmi cb892                                                         ; b884: 30 0c       0.
    cmp #0                                                            ; b886: c9 00       ..
    bne cb894                                                         ; b888: d0 0a       ..
    lda l0000,y                                                       ; b88a: b9 00 00    ...
    sec                                                               ; b88d: 38          8
    sbc #&30 ; '0'                                                    ; b88e: e9 30       .0
    bcs cb894                                                         ; b890: b0 02       ..
.cb892
    sec                                                               ; b892: 38          8
    rts                                                               ; b893: 60          `

.cb894
    clc                                                               ; b894: 18          .
    rts                                                               ; b895: 60          `

.sub_cb896
    lda l0001,y                                                       ; b896: b9 01 00    ...
    cmp #5                                                            ; b899: c9 05       ..
    bcs cb8a9                                                         ; b89b: b0 0c       ..
    cmp #4                                                            ; b89d: c9 04       ..
    bne cb8ab                                                         ; b89f: d0 0a       ..
    lda l0000,y                                                       ; b8a1: b9 00 00    ...
    sec                                                               ; b8a4: 38          8
    sbc #&b0                                                          ; b8a5: e9 b0       ..
    bcc cb8ab                                                         ; b8a7: 90 02       ..
.cb8a9
    sec                                                               ; b8a9: 38          8
    rts                                                               ; b8aa: 60          `

.cb8ab
    clc                                                               ; b8ab: 18          .
    rts                                                               ; b8ac: 60          `

.sub_cb8ad
    lda l0001,y                                                       ; b8ad: b9 01 00    ...
    cmp #4                                                            ; b8b0: c9 04       ..
    bcs cb8c0                                                         ; b8b2: b0 0c       ..
    cmp #3                                                            ; b8b4: c9 03       ..
    bne cb8c2                                                         ; b8b6: d0 0a       ..
    lda l0000,y                                                       ; b8b8: b9 00 00    ...
    sec                                                               ; b8bb: 38          8
    sbc #&a0                                                          ; b8bc: e9 a0       ..
    bcc cb8c2                                                         ; b8be: 90 02       ..
.cb8c0
    sec                                                               ; b8c0: 38          8
    rts                                                               ; b8c1: 60          `

.cb8c2
    clc                                                               ; b8c2: 18          .
    rts                                                               ; b8c3: 60          `

.sub_cb8c4
    lda l0001,y                                                       ; b8c4: b9 01 00    ...
    bmi cb8d5                                                         ; b8c7: 30 0c       0.
    cmp #0                                                            ; b8c9: c9 00       ..
    bne cb8d7                                                         ; b8cb: d0 0a       ..
    lda l0000,y                                                       ; b8cd: b9 00 00    ...
    sec                                                               ; b8d0: 38          8
    sbc #&20 ; ' '                                                    ; b8d1: e9 20       .
    bcs cb8d7                                                         ; b8d3: b0 02       ..
.cb8d5
    sec                                                               ; b8d5: 38          8
    rts                                                               ; b8d6: 60          `

.cb8d7
    clc                                                               ; b8d7: 18          .
    rts                                                               ; b8d8: 60          `

.sub_cb8d9
    lda #&0a                                                          ; b8d9: a9 0a       ..
    sta l1912                                                         ; b8db: 8d 12 19    ...
.cb8de
    ldx #<(l1921)                                                     ; b8de: a2 21       .!
    ldy #>(l1921)                                                     ; b8e0: a0 19       ..
    lda #&7f                                                          ; b8e2: a9 7f       ..
    jsr osword                                                        ; b8e4: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    lda l192b                                                         ; b8e7: ad 2b 19    .+.
    beq cb925                                                         ; b8ea: f0 39       .9
    lda l1929                                                         ; b8ec: ad 29 19    .).
    pha                                                               ; b8ef: 48          H
    lda l1927                                                         ; b8f0: ad 27 19    .'.
    pha                                                               ; b8f3: 48          H
    lda l1928                                                         ; b8f4: ad 28 19    .(.
    pha                                                               ; b8f7: 48          H
    lda l1926                                                         ; b8f8: ad 26 19    .&.
    pha                                                               ; b8fb: 48          H
    lda #1                                                            ; b8fc: a9 01       ..
    sta l1926                                                         ; b8fe: 8d 26 19    .&.
    lda #&69 ; 'i'                                                    ; b901: a9 69       .i
    sta l1927                                                         ; b903: 8d 27 19    .'.
    lda #0                                                            ; b906: a9 00       ..
    sta l1928                                                         ; b908: 8d 28 19    .(.
    lda #&7f                                                          ; b90b: a9 7f       ..
    jsr osword                                                        ; b90d: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    pla                                                               ; b910: 68          h
    sta l1926                                                         ; b911: 8d 26 19    .&.
    pla                                                               ; b914: 68          h
    sta l1928                                                         ; b915: 8d 28 19    .(.
    pla                                                               ; b918: 68          h
    sta l1927                                                         ; b919: 8d 27 19    .'.
    pla                                                               ; b91c: 68          h
    sta l1929                                                         ; b91d: 8d 29 19    .).
    dec l1912                                                         ; b920: ce 12 19    ...
    bne cb8de                                                         ; b923: d0 b9       ..
.cb925
    rts                                                               ; b925: 60          `

.do_our_osword_2_yx_24_and_postprocess
    lda #&36 ; '6'                                                    ; b926: a9 36       .6
    ldx #<(l0024)                                                     ; b928: a2 24       .$
    ldy #>(l0024)                                                     ; b92a: a0 00       ..
    jsr osword                                                        ; b92c: 20 f1 ff     ..            ; Stop Press Routines (see https://beebwiki.mdfs.net/OSWORDs)
    lda l002a                                                         ; b92f: a5 2a       .*
    and #&20 ; ' '                                                    ; b931: 29 20       )
    bne cb951                                                         ; b933: d0 1c       ..
    lda l0028                                                         ; b935: a5 28       .(
    cmp #&4c ; 'L'                                                    ; b937: c9 4c       .L
    bcc cb951                                                         ; b939: 90 16       ..
    lda l0029                                                         ; b93b: a5 29       .)
    cmp #4                                                            ; b93d: c9 04       ..
    bcs cb951                                                         ; b93f: b0 10       ..
    lda l1979                                                         ; b941: ad 79 19    .y.
    bne cb951                                                         ; b944: d0 0b       ..
    ldx #&0e                                                          ; b946: a2 0e       ..
    jsr do_our_osword_1                                               ; b948: 20 6b b7     k.
    jsr long_delay                                                    ; b94b: 20 1f a9     ..
    jmp do_our_osword_2_yx_24_and_postprocess                         ; b94e: 4c 26 b9    L&.

.cb951
    lda l0024                                                         ; b951: a5 24       .$
    and #&fe                                                          ; b953: 29 fe       ).
    sta l0024                                                         ; b955: 85 24       .$
    lda l0026                                                         ; b957: a5 26       .&
    and #&fc                                                          ; b959: 29 fc       ).
    sta l0026                                                         ; b95b: 85 26       .&
    lda l002a                                                         ; b95d: a5 2a       .*
    and #&e0                                                          ; b95f: 29 e0       ).
    cmp #&e0                                                          ; b961: c9 e0       ..
    beq cb97b                                                         ; b963: f0 16       ..
    cmp l1973                                                         ; b965: cd 73 19    .s.
    beq cb97a                                                         ; b968: f0 10       ..
    sta l1973                                                         ; b96a: 8d 73 19    .s.
    lda l1976                                                         ; b96d: ad 76 19    .v.
    beq cb97a                                                         ; b970: f0 08       ..
    jsr sub_cb7fc                                                     ; b972: 20 fc b7     ..
    lda #7                                                            ; b975: a9 07       ..
    jsr oswrch                                                        ; b977: 20 ee ff     ..            ; Write character 7
.cb97a
    rts                                                               ; b97a: 60          `

.cb97b
    lda #&e0                                                          ; b97b: a9 e0       ..
    sta l1973                                                         ; b97d: 8d 73 19    .s.
    rts                                                               ; b980: 60          `

    equb &20, &e0, &ff                                                ; b981: 20 e0 ff     ..
    equs "H T"                                                        ; b984: 48 20 54    H T
    equb &b8, &68, &b0,   9, &c9, &0d, &f0,   4, &c9, &20, &90, &ee   ; b987: b8 68 b0... .h.
    equb &18, &60                                                     ; b993: 18 60       .`

.xbrkv_handler
    lda l00fd                                                         ; b995: a5 fd       ..
    sta l0049                                                         ; b997: 85 49       .I
    lda l00fe                                                         ; b999: a5 fe       ..
    sta l004a                                                         ; b99b: 85 4a       .J
    jsr sub_cb739                                                     ; b99d: 20 39 b7     9.
    jsr sub_cbd41                                                     ; b9a0: 20 41 bd     A.
    jsr sub_cb877                                                     ; b9a3: 20 77 b8     w.
    ldy #0                                                            ; b9a6: a0 00       ..
.loop_cb9a8
    lda command_copied_to_a00,y                                       ; b9a8: b9 ef be    ...
    sta l0a00,y                                                       ; b9ab: 99 00 0a    ...
    iny                                                               ; b9ae: c8          .
    cmp #&0d                                                          ; b9af: c9 0d       ..
    bne loop_cb9a8                                                    ; b9b1: d0 f5       ..
    ldx #<(l0a00)                                                     ; b9b3: a2 00       ..
    ldy #>(l0a00)                                                     ; b9b5: a0 0a       ..
    jsr oscli                                                         ; b9b7: 20 f7 ff     ..
    lda #&0a                                                          ; b9ba: a9 0a       ..
    jsr oswrch                                                        ; b9bc: 20 ee ff     ..            ; Write character 10
    ldx #4                                                            ; b9bf: a2 04       ..
    jsr cbe64                                                         ; b9c1: 20 64 be     d.
    ldy #1                                                            ; b9c4: a0 01       ..
    lda l0049                                                         ; b9c6: a5 49       .I
    sta l00fd                                                         ; b9c8: 85 fd       ..
    lda l004a                                                         ; b9ca: a5 4a       .J
    sta l00fe                                                         ; b9cc: 85 fe       ..
.loop_cb9ce
    lda (l00fd),y                                                     ; b9ce: b1 fd       ..
    beq cb9de                                                         ; b9d0: f0 0c       ..
    cmp #&1f                                                          ; b9d2: c9 1f       ..
    bcc cb9d9                                                         ; b9d4: 90 03       ..
    jsr oswrch                                                        ; b9d6: 20 ee ff     ..            ; Write character
.cb9d9
    iny                                                               ; b9d9: c8          .
    cpy #&18                                                          ; b9da: c0 18       ..
    bne loop_cb9ce                                                    ; b9dc: d0 f0       ..
.cb9de
    ldx #&18                                                          ; b9de: a2 18       ..
    jsr do_our_osword_1                                               ; b9e0: 20 6b b7     k.
.loop_cb9e3
    jsr do_our_osword_2_yx_24_and_postprocess                         ; b9e3: 20 26 b9     &.
    lda l002a                                                         ; b9e6: a5 2a       .*
    bmi loop_cb9e3                                                    ; b9e8: 30 f9       0.
    jsr sub_cbd46                                                     ; b9ea: 20 46 bd     F.
    rts                                                               ; b9ed: 60          `

    equb &a0, &12, &20, &e3, &bd, &20, &0b, &83, &b0, &21, &a5, &2a   ; b9ee: a0 12 20... ..
    equb &10, &1d, &a5                                                ; b9fa: 10 1d a5    ...
    equs "*) "                                                        ; b9fd: 2a 29 20    *)
    equb &d0, &f1, &c0,   1, &d0, &ed, &e0,   5, &f0, &e9, &8a, &a8   ; ba00: d0 f1 c0... ...
    equb &48, &20, &de, &bd, &68, &18, &69, &2f, &8d, &41, &19, &18   ; ba0c: 48 20 de... H .
    equs "`8`"                                                        ; ba18: 60 38 60    `8`

.cba1b
    jsr c830b                                                         ; ba1b: 20 0b 83     ..
    cpy #&ff                                                          ; ba1e: c0 ff       ..
    bne cba1b                                                         ; ba20: d0 f9       ..
    lda l002a                                                         ; ba22: a5 2a       .*
    bmi cba29                                                         ; ba24: 30 03       0.
    ldy #&ff                                                          ; ba26: a0 ff       ..
    rts                                                               ; ba28: 60          `

.cba29
    lda l002a                                                         ; ba29: a5 2a       .*
    and #&20 ; ' '                                                    ; ba2b: 29 20       )
    bne cba1b                                                         ; ba2d: d0 ec       ..
    ldx #&24 ; '$'                                                    ; ba2f: a2 24       .$
    ldy #&33 ; '3'                                                    ; ba31: a0 33       .3
    jsr cbd6e                                                         ; ba33: 20 6e bd     n.
    ldy #&33 ; '3'                                                    ; ba36: a0 33       .3
    jsr cbd4b                                                         ; ba38: 20 4b bd     K.
.cba3b
    jsr c830b                                                         ; ba3b: 20 0b 83     ..
    cpy #&ff                                                          ; ba3e: c0 ff       ..
    bne cba3b                                                         ; ba40: d0 f9       ..
    lda l002a                                                         ; ba42: a5 2a       .*
    bmi cba4e                                                         ; ba44: 30 08       0.
    ldy #&33 ; '3'                                                    ; ba46: a0 33       .3
    jsr cbd4b                                                         ; ba48: 20 4b bd     K.
    ldy #&ff                                                          ; ba4b: a0 ff       ..
    rts                                                               ; ba4d: 60          `

.cba4e
    lda l002a                                                         ; ba4e: a5 2a       .*
    and #&40 ; '@'                                                    ; ba50: 29 40       )@
    bne cba3b                                                         ; ba52: d0 e7       ..
    ldx #&24 ; '$'                                                    ; ba54: a2 24       .$
    ldy #&37 ; '7'                                                    ; ba56: a0 37       .7
    jsr cbd6e                                                         ; ba58: 20 6e bd     n.
    ldy #&37 ; '7'                                                    ; ba5b: a0 37       .7
    jsr cbd4b                                                         ; ba5d: 20 4b bd     K.
    ldx #&33 ; '3'                                                    ; ba60: a2 33       .3
    ldy #8                                                            ; ba62: a0 08       ..
    jsr cbd6e                                                         ; ba64: 20 6e bd     n.
    ldx #&37 ; '7'                                                    ; ba67: a2 37       .7
    ldy #&0c                                                          ; ba69: a0 0c       ..
    jsr cbd6e                                                         ; ba6b: 20 6e bd     n.
    ldx #&33 ; '3'                                                    ; ba6e: a2 33       .3
    ldy #&37 ; '7'                                                    ; ba70: a0 37       .7
    jsr sub_cbae2                                                     ; ba72: 20 e2 ba     ..
    ldx #&35 ; '5'                                                    ; ba75: a2 35       .5
    ldy #&39 ; '9'                                                    ; ba77: a0 39       .9
    jsr sub_cbae2                                                     ; ba79: 20 e2 ba     ..
    ldx #8                                                            ; ba7c: a2 08       ..
    ldy #&0c                                                          ; ba7e: a0 0c       ..
    jsr sub_cbae2                                                     ; ba80: 20 e2 ba     ..
    ldx #&0a                                                          ; ba83: a2 0a       ..
    ldy #&0e                                                          ; ba85: a0 0e       ..
    jsr sub_cbae2                                                     ; ba87: 20 e2 ba     ..
    lda l000c                                                         ; ba8a: a5 0c       ..
    sec                                                               ; ba8c: 38          8
    sbc l0008                                                         ; ba8d: e5 08       ..
    sta l0043                                                         ; ba8f: 85 43       .C
    sta l0010                                                         ; ba91: 85 10       ..
    lda l000d                                                         ; ba93: a5 0d       ..
    sbc l0009                                                         ; ba95: e5 09       ..
    sta l0044                                                         ; ba97: 85 44       .D
    sta l0011                                                         ; ba99: 85 11       ..
    lda l000e                                                         ; ba9b: a5 0e       ..
    sec                                                               ; ba9d: 38          8
    sbc l000a                                                         ; ba9e: e5 0a       ..
    sta l0045                                                         ; baa0: 85 45       .E
    sta l0012                                                         ; baa2: 85 12       ..
    lda l000f                                                         ; baa4: a5 0f       ..
    sbc l000b                                                         ; baa6: e5 0b       ..
    sta l0046                                                         ; baa8: 85 46       .F
    sta l0013                                                         ; baaa: 85 13       ..
    jsr sub_cb617                                                     ; baac: 20 17 b6     ..
    lda l000a                                                         ; baaf: a5 0a       ..
    sec                                                               ; bab1: 38          8
    sbc l000e                                                         ; bab2: e5 0e       ..
    and #&fe                                                          ; bab4: 29 fe       ).
    beq cbad9                                                         ; bab6: f0 21       .!
    bcc cbac4                                                         ; bab8: 90 0a       ..
    lda l000a                                                         ; baba: a5 0a       ..
    pha                                                               ; babc: 48          H
    lda l000e                                                         ; babd: a5 0e       ..
    sta l000a                                                         ; babf: 85 0a       ..
    pla                                                               ; bac1: 68          h
    sta l000e                                                         ; bac2: 85 0e       ..
.cbac4
    ldx #8                                                            ; bac4: a2 08       ..
    ldy #&0c                                                          ; bac6: a0 0c       ..
    jsr sub_cbae2                                                     ; bac8: 20 e2 ba     ..
    lda l000d                                                         ; bacb: a5 0d       ..
    cmp l0009                                                         ; bacd: c5 09       ..
    bne cbadf                                                         ; bacf: d0 0e       ..
    lda l000c                                                         ; bad1: a5 0c       ..
    sbc l0008                                                         ; bad3: e5 08       ..
    and #&fe                                                          ; bad5: 29 fe       ).
    bne cbadf                                                         ; bad7: d0 06       ..
.cbad9
    jsr sub_cbbb1                                                     ; bad9: 20 b1 bb     ..
    ldy #&ff                                                          ; badc: a0 ff       ..
    rts                                                               ; bade: 60          `

.cbadf
    ldy #0                                                            ; badf: a0 00       ..
    rts                                                               ; bae1: 60          `

.sub_cbae2
    lda l0001,x                                                       ; bae2: b5 01       ..
    cmp l0001,y                                                       ; bae4: d9 01 00    ...
    bcc cbaf7                                                         ; bae7: 90 0e       ..
    bne cbaf2                                                         ; bae9: d0 07       ..
    lda l0000,x                                                       ; baeb: b5 00       ..
    cmp l0000,y                                                       ; baed: d9 00 00    ...
    bcc cbaf7                                                         ; baf0: 90 05       ..
.cbaf2
    jsr sub_cb7e3                                                     ; baf2: 20 e3 b7     ..
    sec                                                               ; baf5: 38          8
    rts                                                               ; baf6: 60          `

.cbaf7
    clc                                                               ; baf7: 18          .
    rts                                                               ; baf8: 60          `

.sub_cbaf9
    lda #0                                                            ; baf9: a9 00       ..
    sta l0049                                                         ; bafb: 85 49       .I
    sta l004a                                                         ; bafd: 85 4a       .J
.cbaff
    lda l0049                                                         ; baff: a5 49       .I
    bne cbb18                                                         ; bb01: d0 15       ..
    jsr do_our_osword_2_yx_24_and_postprocess                         ; bb03: 20 26 b9     &.
    jsr sub_cbe4b                                                     ; bb06: 20 4b be     K.
    ldy #&24 ; '$'                                                    ; bb09: a0 24       .$
    jsr sub_cbbbb                                                     ; bb0b: 20 bb bb     ..
    jsr sub_cbe6b                                                     ; bb0e: 20 6b be     k.
    lda #1                                                            ; bb11: a9 01       ..
    sta l0049                                                         ; bb13: 85 49       .I
    jmp cbb24                                                         ; bb15: 4c 24 bb    L$.

.cbb18
    lda l002a                                                         ; bb18: a5 2a       .*
    and #&20 ; ' '                                                    ; bb1a: 29 20       )
    bne cbb24                                                         ; bb1c: d0 06       ..
    ldy #&24 ; '$'                                                    ; bb1e: a0 24       .$
    jsr sub_cbbbb                                                     ; bb20: 20 bb bb     ..
    rts                                                               ; bb23: 60          `

.cbb24
    lda l002a                                                         ; bb24: a5 2a       .*
    bmi cbb37                                                         ; bb26: 30 0f       0.
    lda l004a                                                         ; bb28: a5 4a       .J
    bne cbb31                                                         ; bb2a: d0 05       ..
    ldy #&24 ; '$'                                                    ; bb2c: a0 24       .$
    jsr sub_cbbbb                                                     ; bb2e: 20 bb bb     ..
.cbb31
    jsr sub_cbe1d                                                     ; bb31: 20 1d be     ..
    ldy #&ff                                                          ; bb34: a0 ff       ..
    rts                                                               ; bb36: 60          `

.cbb37
    jsr do_our_osword_2_yx_24_and_postprocess                         ; bb37: 20 26 b9     &.
    jsr sub_cbe4b                                                     ; bb3a: 20 4b be     K.
    ldy #&24 ; '$'                                                    ; bb3d: a0 24       .$
    jsr sub_cb881                                                     ; bb3f: 20 81 b8     ..
    bcs cbb7f                                                         ; bb42: b0 3b       .;
    ldy #&26 ; '&'                                                    ; bb44: a0 26       .&
    jsr sub_cb8ad                                                     ; bb46: 20 ad b8     ..
    bcs cbb7f                                                         ; bb49: b0 34       .4
    lda l0024                                                         ; bb4b: a5 24       .$
    clc                                                               ; bb4d: 18          .
    adc l0043                                                         ; bb4e: 65 43       eC
    sta l0047                                                         ; bb50: 85 47       .G
    lda l0025                                                         ; bb52: a5 25       .%
    adc l0044                                                         ; bb54: 65 44       eD
    sta l0048                                                         ; bb56: 85 48       .H
    ldy #&47 ; 'G'                                                    ; bb58: a0 47       .G
    jsr sub_cb896                                                     ; bb5a: 20 96 b8     ..
    bcs cbb7f                                                         ; bb5d: b0 20       .
    lda l0026                                                         ; bb5f: a5 26       .&
    sec                                                               ; bb61: 38          8
    sbc l0045                                                         ; bb62: e5 45       .E
    sta l0047                                                         ; bb64: 85 47       .G
    lda l0027                                                         ; bb66: a5 27       .'
    sbc l0046                                                         ; bb68: e5 46       .F
    sta l0048                                                         ; bb6a: 85 48       .H
    ldy #&47 ; 'G'                                                    ; bb6c: a0 47       .G
    jsr sub_cb8c4                                                     ; bb6e: 20 c4 b8     ..
    bcs cbb7f                                                         ; bb71: b0 0c       ..
    ldx #&24 ; '$'                                                    ; bb73: a2 24       .$
    ldy #&2b ; '+'                                                    ; bb75: a0 2b       .+
    jsr sub_cb803                                                     ; bb77: 20 03 b8     ..
    bne cbb92                                                         ; bb7a: d0 16       ..
    jmp cbaff                                                         ; bb7c: 4c ff ba    L..

.cbb7f
    lda l004a                                                         ; bb7f: a5 4a       .J
    bne cbb88                                                         ; bb81: d0 05       ..
    ldy #&2b ; '+'                                                    ; bb83: a0 2b       .+
    jsr sub_cbbbb                                                     ; bb85: 20 bb bb     ..
.cbb88
    jsr sub_cbe32                                                     ; bb88: 20 32 be     2.
    lda #1                                                            ; bb8b: a9 01       ..
    sta l004a                                                         ; bb8d: 85 4a       .J
    jmp cbb24                                                         ; bb8f: 4c 24 bb    L$.

.cbb92
    lda l004a                                                         ; bb92: a5 4a       .J
    beq cbb99                                                         ; bb94: f0 03       ..
    jsr sub_cbe1d                                                     ; bb96: 20 1d be     ..
.cbb99
    lda l004a                                                         ; bb99: a5 4a       .J
    bne cbba2                                                         ; bb9b: d0 05       ..
    ldy #&2b ; '+'                                                    ; bb9d: a0 2b       .+
    jsr sub_cbbbb                                                     ; bb9f: 20 bb bb     ..
.cbba2
    ldy #&24 ; '$'                                                    ; bba2: a0 24       .$
    jsr sub_cbbbb                                                     ; bba4: 20 bb bb     ..
    jsr sub_cbe6b                                                     ; bba7: 20 6b be     k.
    lda #0                                                            ; bbaa: a9 00       ..
    sta l004a                                                         ; bbac: 85 4a       .J
    jmp cbaff                                                         ; bbae: 4c ff ba    L..

.sub_cbbb1
    ldy #&33 ; '3'                                                    ; bbb1: a0 33       .3
    jsr cbd4b                                                         ; bbb3: 20 4b bd     K.
    ldy #&37 ; '7'                                                    ; bbb6: a0 37       .7
    jmp cbd4b                                                         ; bbb8: 4c 4b bd    LK.

.sub_cbbbb
    lda #4                                                            ; bbbb: a9 04       ..
    jsr sub_cb79d                                                     ; bbbd: 20 9d b7     ..
    lda #&0a                                                          ; bbc0: a9 0a       ..
    jsr sub_cbc21                                                     ; bbc2: 20 21 bc     !.
    tya                                                               ; bbc5: 98          .
    pha                                                               ; bbc6: 48          H
    ldy #&43 ; 'C'                                                    ; bbc7: a0 43       .C
    jsr sub_cbdc3                                                     ; bbc9: 20 c3 bd     ..
    jsr sub_cbc19                                                     ; bbcc: 20 19 bc     ..
    lda #&0a                                                          ; bbcf: a9 0a       ..
    jsr sub_cbc21                                                     ; bbd1: 20 21 bc     !.
    jsr sub_cbc19                                                     ; bbd4: 20 19 bc     ..
    lda l0045                                                         ; bbd7: a5 45       .E
    eor #&ff                                                          ; bbd9: 49 ff       I.
    clc                                                               ; bbdb: 18          .
    adc #1                                                            ; bbdc: 69 01       i.
    php                                                               ; bbde: 08          .
    jsr oswrch                                                        ; bbdf: 20 ee ff     ..            ; Write character
    lda l0046                                                         ; bbe2: a5 46       .F
    eor #&ff                                                          ; bbe4: 49 ff       I.
    plp                                                               ; bbe6: 28          (
    adc #0                                                            ; bbe7: 69 00       i.
    jsr oswrch                                                        ; bbe9: 20 ee ff     ..            ; Write character
    lda #&0a                                                          ; bbec: a9 0a       ..
    jsr sub_cbc21                                                     ; bbee: 20 21 bc     !.
    lda l0043                                                         ; bbf1: a5 43       .C
    eor #&ff                                                          ; bbf3: 49 ff       I.
    clc                                                               ; bbf5: 18          .
    adc #1                                                            ; bbf6: 69 01       i.
    php                                                               ; bbf8: 08          .
    jsr oswrch                                                        ; bbf9: 20 ee ff     ..            ; Write character
    lda l0044                                                         ; bbfc: a5 44       .D
    eor #&ff                                                          ; bbfe: 49 ff       I.
    plp                                                               ; bc00: 28          (
    adc #0                                                            ; bc01: 69 00       i.
    jsr oswrch                                                        ; bc03: 20 ee ff     ..            ; Write character
    jsr sub_cbc19                                                     ; bc06: 20 19 bc     ..
    lda #&0a                                                          ; bc09: a9 0a       ..
    jsr sub_cbc21                                                     ; bc0b: 20 21 bc     !.
    jsr sub_cbc19                                                     ; bc0e: 20 19 bc     ..
    ldy #&45 ; 'E'                                                    ; bc11: a0 45       .E
    jsr sub_cbdc3                                                     ; bc13: 20 c3 bd     ..
    pla                                                               ; bc16: 68          h
    tay                                                               ; bc17: a8          .
    rts                                                               ; bc18: 60          `

.sub_cbc19
    lda #0                                                            ; bc19: a9 00       ..
    jsr oswrch                                                        ; bc1b: 20 ee ff     ..            ; Write character 0
    jmp oswrch                                                        ; bc1e: 4c ee ff    L..            ; Write character

.sub_cbc21
    pha                                                               ; bc21: 48          H
    lda #&19                                                          ; bc22: a9 19       ..
    jsr oswrch                                                        ; bc24: 20 ee ff     ..            ; Write character 25
    pla                                                               ; bc27: 68          h
    jmp oswrch                                                        ; bc28: 4c ee ff    L..            ; Write character

    equb &20, &41, &bd, &20, &77, &b8, &a0,   4, &20, &54, &b7, &a2   ; bc2b: 20 41 bd...  A.
    equb &1a, &20, &6b, &b7, &ad,   0,   7, &c9,   7, &f0,   7, &a2   ; bc37: 1a 20 6b... . k
    equb &39, &a0, &bf, &20,   4, &be, &20, &e8, &bd, &a0,   8, &20   ; bc43: 39 a0 bf... 9..
    equb &18, &be, &20, &5c, &b8, &90, &fb, &4c, &46, &bd, &a9,   7   ; bc4f: 18 be 20... ..
    equb &85, &4d, &a9, &45, &85, &4b, &a9, &19, &85, &4c, &a9, &2e   ; bc5b: 85 4d a9... .M.
    equb &8d, &44, &19, &4c, &7c, &bc, &a9,   9, &85, &4d, &a9, &43   ; bc67: 8d 44 19... .D.
    equb &85, &4b, &a9, &19, &85                                      ; bc73: 85 4b a9... .K.
    equs "LL|"                                                        ; bc78: 4c 4c 7c    LL|
    equb &bc, &20, &41, &bd, &a9,   4, &20, &ee, &ff, &a0,   2, &20   ; bc7b: bc 20 41... . A
    equb &54, &b7, &a2, &ff, &a0, &be, &20,   4, &be, &20, &fc, &b7   ; bc87: 54 b7 a2... T..
    equb &20, &54, &b8, &a0,   0, &8c, &4e, &19, &20, &81, &b9, &90   ; bc93: 20 54 b8...  T.
    equb   5, &20, &46, &bd, &38, &60, &c9, &7f, &f0, &15, &c9, &0d   ; bc9f: 05 20 46... . F
    equb &f0, &20, &c9, &20, &90, &e7, &c4, &4d, &f0, &e3, &20, &ee   ; bcab: f0 20 c9... . .
    equb &ff, &91, &4b, &c8, &4c, &98, &bc, &c0,   0, &f0, &d6, &20   ; bcb7: ff 91 4b... ..K
    equb &ee, &ff, &88, &a9, &20, &91, &4b, &4c, &98, &bc, &91, &4b   ; bcc3: ee ff 88... ...
    equb &c0,   0, &f0, &cd, &20, &46, &bd, &20, &77, &b8, &18, &60   ; bccf: c0 00 f0... ...
    equb &a0,   0, &b1, &47, &20, &ee, &ff, &c8, &c0, &10, &d0, &f6   ; bcdb: a0 00 b1... ...
    equb &a0, &10, &a9,   8, &20, &ee, &ff, &88, &d0, &fa, &a0,   0   ; bce7: a0 10 a9... ...
    equb &8c, &4e, &19, &20, &81, &b9, &ac, &4e, &19, &90,   1, &60   ; bcf3: 8c 4e 19... .N.
    equb &c9, &7f, &f0, &2d, &c9, &0d, &f0, &38, &c0, &10, &f0, &e8   ; bcff: c9 7f f0... ...
    equb &c0,   0, &d0, &18, &48, &a0, &0f, &a9, &20, &20, &ee, &ff   ; bd0b: c0 00 d0... ...
    equb &91, &47, &88, &10, &f8, &a0, &10, &a9,   8, &20, &ee, &ff   ; bd17: 91 47 88... .G.
    equb &88, &d0, &fa, &68, &20, &ee, &ff, &91, &47, &c8, &4c, &f3   ; bd23: 88 d0 fa... ...
    equb &bc, &c0,   0, &f0, &bf, &20, &ee, &ff, &88, &a9, &20, &91   ; bd2f: bc c0 00... ...
    equb &47, &4c, &f3, &bc, &18, &60                                 ; bd3b: 47 4c f3... GL.

.sub_cbd41
    ldx #1                                                            ; bd41: a2 01       ..
    jmp do_our_osword_1                                               ; bd43: 4c 6b b7    Lk.

.sub_cbd46
    ldx #2                                                            ; bd46: a2 02       ..
    jmp do_our_osword_1                                               ; bd48: 4c 6b b7    Lk.

.cbd4b
    lda l0000,y                                                       ; bd4b: b9 00 00    ...
    sta l0008                                                         ; bd4e: 85 08       ..
    lda l0001,y                                                       ; bd50: b9 01 00    ...
    sta l0009                                                         ; bd53: 85 09       ..
    tya                                                               ; bd55: 98          .
    pha                                                               ; bd56: 48          H
    jsr sub_c83ca                                                     ; bd57: 20 ca 83     ..
    pla                                                               ; bd5a: 68          h
    tay                                                               ; bd5b: a8          .
    lda l0002,y                                                       ; bd5c: b9 02 00    ...
    sta l000a                                                         ; bd5f: 85 0a       ..
    lda l0003,y                                                       ; bd61: b9 03 00    ...
    sta l000b                                                         ; bd64: 85 0b       ..
    tya                                                               ; bd66: 98          .
    pha                                                               ; bd67: 48          H
    jsr sub_c839f                                                     ; bd68: 20 9f 83     ..
    pla                                                               ; bd6b: 68          h
    tay                                                               ; bd6c: a8          .
    rts                                                               ; bd6d: 60          `

.cbd6e
    lda l0000,x                                                       ; bd6e: b5 00       ..
    sta l0000,y                                                       ; bd70: 99 00 00    ...
    lda l0001,x                                                       ; bd73: b5 01       ..
    sta l0001,y                                                       ; bd75: 99 01 00    ...
    lda l0002,x                                                       ; bd78: b5 02       ..
    sta l0002,y                                                       ; bd7a: 99 02 00    ...
    lda l0003,x                                                       ; bd7d: b5 03       ..
    sta l0003,y                                                       ; bd7f: 99 03 00    ...
    rts                                                               ; bd82: 60          `

.sub_cbd83
    lda #&12                                                          ; bd83: a9 12       ..
    jsr oswrch                                                        ; bd85: 20 ee ff     ..            ; Write character 18
    txa                                                               ; bd88: 8a          .
    jsr oswrch                                                        ; bd89: 20 ee ff     ..            ; Write character
    tya                                                               ; bd8c: 98          .
    jmp oswrch                                                        ; bd8d: 4c ee ff    L..            ; Write character

    equb &86,   4, &84,   5, &20, &41, &bd, &a2, &ef, &a0, &be, &20   ; bd90: 86 04 84... ...
    equb &ed, &bd, &a9, &0a, &20, &ee, &ff, &a0,   0, &b1,   4, &c8   ; bd9c: ed bd a9... ...
    equb &20, &ee, &ff, &c9, &0d, &d0, &f6, &a2, &18, &20, &6b, &b7   ; bda8: 20 ee ff...  ..
    equb &20, &5c, &b8, &90, &fb, &20, &46, &bd, &38, &60, &a9,   4   ; bdb4: 20 5c b8...  \.
    equb &4c, &9d, &b7                                                ; bdc0: 4c 9d b7    L..

.sub_cbdc3
    lda l0000,y                                                       ; bdc3: b9 00 00    ...
    jsr oswrch                                                        ; bdc6: 20 ee ff     ..            ; Write character
    lda l0001,y                                                       ; bdc9: b9 01 00    ...
    jmp oswrch                                                        ; bdcc: 4c ee ff    L..            ; Write character

    equb &20, &c3, &bd, &b9,   2,   0, &20, &ee, &ff, &b9,   3,   0   ; bdcf: 20 c3 bd...  ..
    equb &4c, &ee, &ff                                                ; bddb: 4c ee ff    L..

.do_our_osword_1_x_3
    ldx #3                                                            ; bdde: a2 03       ..
    jmp do_our_osword_1                                               ; bde0: 4c 6b b7    Lk.

.do_our_osword_1_x_4
    ldx #4                                                            ; bde3: a2 04       ..
    jmp do_our_osword_1                                               ; bde5: 4c 6b b7    Lk.

.do_our_osword_1_x_5
    ldx #5                                                            ; bde8: a2 05       ..
    jmp do_our_osword_1                                               ; bdea: 4c 6b b7    Lk.

.cbded
    stx l0047                                                         ; bded: 86 47       .G
    sty l0048                                                         ; bdef: 84 48       .H
    ldy #0                                                            ; bdf1: a0 00       ..
.loop_cbdf3
    lda (l0047),y                                                     ; bdf3: b1 47       .G
    sta l0100,y                                                       ; bdf5: 99 00 01    ...
    iny                                                               ; bdf8: c8          .
    cmp #&0d                                                          ; bdf9: c9 0d       ..
    bne loop_cbdf3                                                    ; bdfb: d0 f6       ..
    ldx #<(l0100)                                                     ; bdfd: a2 00       ..
    ldy #>(l0100)                                                     ; bdff: a0 01       ..
    jmp oscli                                                         ; be01: 4c f7 ff    L..

; ***************************************************************************************
.write_stringn_at_yx
    stx l0004                                                         ; be04: 86 04       ..
    sty l0005                                                         ; be06: 84 05       ..
    ldy #0                                                            ; be08: a0 00       ..
    lda (l0004),y                                                     ; be0a: b1 04       ..
    tax                                                               ; be0c: aa          .
    iny                                                               ; be0d: c8          .
.cbe0e
    lda (l0004),y                                                     ; be0e: b1 04       ..
    jsr oswrch                                                        ; be10: 20 ee ff     ..            ; Write character
    iny                                                               ; be13: c8          .
    dex                                                               ; be14: ca          .
    bne cbe0e                                                         ; be15: d0 f7       ..
    rts                                                               ; be17: 60          `

.sub_cbe18
    ldx #6                                                            ; be18: a2 06       ..
    jmp do_our_osword_1                                               ; be1a: 4c 6b b7    Lk.

.sub_cbe1d
    lda l1978                                                         ; be1d: ad 78 19    .x.
    beq cbe31                                                         ; be20: f0 0f       ..
    jsr sub_cbe32                                                     ; be22: 20 32 be     2.
    ldx #&97                                                          ; be25: a2 97       ..
    ldy #&be                                                          ; be27: a0 be       ..
    jsr cbded                                                         ; be29: 20 ed bd     ..
    lda #0                                                            ; be2c: a9 00       ..
    sta l1978                                                         ; be2e: 8d 78 19    .x.
.cbe31
    rts                                                               ; be31: 60          `

.sub_cbe32
    lda #1                                                            ; be32: a9 01       ..
    sta l1978                                                         ; be34: 8d 78 19    .x.
    ldx #&9b                                                          ; be37: a2 9b       ..
    ldy #&be                                                          ; be39: a0 be       ..
    jmp cbded                                                         ; be3b: 4c ed bd    L..

    equb &a2,   7, &a8, &4c, &6b, &b7, &a2,   8, &a8, &4c, &6b, &b7   ; be3e: a2 07 a8... ...

.loop_cbe4a
    rts                                                               ; be4a: 60          `

.sub_cbe4b
    lda l1917                                                         ; be4b: ad 17 19    ...
    beq loop_cbe4a                                                    ; be4e: f0 fa       ..
    lda l0024                                                         ; be50: a5 24       .$
    and l1918                                                         ; be52: 2d 18 19    -..
    sta l0024                                                         ; be55: 85 24       .$
    lda l0026                                                         ; be57: a5 26       .&
    and l1919                                                         ; be59: 2d 19 19    -..
    sta l0026                                                         ; be5c: 85 26       .&
    rts                                                               ; be5e: 60          `

.sub_cbe5f
    lda #&20 ; ' '                                                    ; be5f: a9 20       .
    jmp oswrch                                                        ; be61: 4c ee ff    L..            ; Write character 32

.cbe64
    jsr sub_cbe5f                                                     ; be64: 20 5f be     _.
    dex                                                               ; be67: ca          .
    bne cbe64                                                         ; be68: d0 fa       ..
    rts                                                               ; be6a: 60          `

.sub_cbe6b
    ldx #&24 ; '$'                                                    ; be6b: a2 24       .$
    ldy #&2b ; '+'                                                    ; be6d: a0 2b       .+
    jmp cbd6e                                                         ; be6f: 4c 6e bd    Ln.

.sub_cbe72
    clc                                                               ; be72: 18          .
    adc l0000,x                                                       ; be73: 75 00       u.
    sta l0000,x                                                       ; be75: 95 00       ..
    lda l0001,x                                                       ; be77: b5 01       ..
    adc #0                                                            ; be79: 69 00       i.
    sta l0001,x                                                       ; be7b: 95 01       ..
    rts                                                               ; be7d: 60          `

    equb &a9, &40, &a2, &40, &a0, &19, &20, &ce, &ff, &c9,   0, &d0   ; be7e: a9 40 a2... .@.
    equb   7, &a2, &15, &a0, &bf, &4c, &90, &bd, &8d, &2d, &19, &18   ; be8a: 07 a2 15... ...
    equs "`pHP"                                                       ; be96: 60 70 48... `pH
    equb &0d                                                          ; be9a: 0d          .
    equs "pMP"                                                        ; be9b: 70 4d 50    pMP
    equb &0d                                                          ; be9e: 0d          .
.process_string
    equs "PROCESS"                                                    ; be9f: 50 52 4f... PRO
    equb &0d, &10, &18                                                ; bea6: 0d 10 18    ...
.data_copied_to_1900
    equb &30,   0, &20,   0, &ae,   4, &9c,   3, &12,   3, &81, &10   ; bea9: 30 00 20... 0.
    equb &12,   0, &80, &12, &19,   2, &1e,   0,   0,   0, &19,   0   ; beb5: 12 00 80... ...
    equb   0,   0, &d4, &ff, &19,   2, &e2, &ff,   0,   0             ; bec1: 00 00 d4... ...
.lbecb
    equb &20                                                          ; becb: 20
.jump_table
    equb &30                                                          ; becc: 30          0
    equb >(sub_c853e), <(sub_c853e)                                   ; becd: 85 3e       .>
    equb &37                                                          ; becf: 37          7
    equb >(l4885), <(l4885)                                           ; bed0: 48 85       H.
    equb &71                                                          ; bed2: 71          q
    equb >(l4f60), <(l4f60)                                           ; bed3: 4f 60       O`
    equb &8b                                                          ; bed5: 8b          .
    equb >(sub_c8e67), <(sub_c8e67)                                   ; bed6: 8e 67       .g
    equb &78                                                          ; bed8: 78          x
    equb >(sub_c94dd), <(sub_c94dd)                                   ; bed9: 94 dd       ..
    equb &7f                                                          ; bedb: 7f          .
    equb >(sub_c90a0), <(sub_c90a0)                                   ; bedc: 90 a0       ..
    equb &21                                                          ; bede: 21          !
    equb >(sub_c97a8), <(sub_c97a8)                                   ; bedf: 97 a8       ..
    equb &b0                                                          ; bee1: b0          .
    equb >(l05af), <(l05af)                                           ; bee2: 05 af       ..
    equb &c0                                                          ; bee4: c0          .
    equb >(cb21b), <(cb21b)                                           ; bee5: b2 1b       ..
    equb &c7                                                          ; bee7: c7          .
    equb >(ldbb2), <(ldbb2)                                           ; bee8: db b2       ..
    equb &d3                                                          ; beea: d3          .
    equb >(le2f1), <(le2f1)                                           ; beeb: e2 f1       ..
    equb &85, &43                                                     ; beed: 85 43       .C
.command_copied_to_a00
    equs "pWI 22,17,51,13", &0d                                       ; beef: 70 57 49... pWI
    equb &14, &0a                                                     ; beff: 14 0a       ..
    equs "  Enter Filename : "                                        ; bf01: 20 20 45...   E
    equb &0d                                                          ; bf14: 0d          .
    equs "     No Such Filename !"                                    ; bf15: 20 20 20...
    equb &0d                                                          ; bf2c: 0d          .
.stringnbf2d
    equb lbf39 - lbf2e                                                ; bf2d: 0b          .
.lbf2e
    equs &18, "0", 0, " ", 0, &ae, 4, &9c, 3, &10, &1a                ; bf2e: 18 30 00... .0.
.lbf39
    equb &12                                                          ; bf39: 12          .
    equs "          No Files !"                                       ; bf3a: 20 20 20...
    equb &0d, &0b, &0d, &0a                                           ; bf4e: 0d 0b 0d... ...
    equs " Title : "                                                  ; bf52: 20 54 69...  Ti
    equb &0d, &0c, &0d, &0a, &0a                                      ; bf5b: 0d 0c 0d... ...
    equs " Date  : "                                                  ; bf60: 20 44 61...  Da
    equb &0d,   3,   3,   3,   3,   3,   0, &80, &80, &80, &80, &80   ; bf69: 0d 03 03... ...
    equb &80, &fe, &fe, &fe, &80, &80, &80, &80, &80, &80,   0,   0   ; bf75: 80 fe fe... ...
    equb   0,   1,   1,   1,   1,   0,   0,   0,   0,   0,   0,   0   ; bf81: 00 01 01... ...
    equb   0,   0,   0, &78, &84                                      ; bf8d: 00 00 00... ...
    equs "2BB2"                                                       ; bf92: 32 42 42... 2BB
    equb &84, &78,   0,   0,   0,   0,   0,   0,   0,   0, &aa,   0   ; bf96: 84 78 00... .x.
    equb &80,   0, &80,   0, &80,   0, &80,   0, &80,   0, &80,   0   ; bfa2: 80 00 80... ...
    equb &80,   0, &aa,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; bfae: 80 00 aa... ...
    equb   0,   0,   0,   0,   0,   0, &aa, &55, &aa, &55, &aa, &55   ; bfba: 00 00 00... ...
    equb &aa, &55, &aa, &55, &aa, &55, &aa, &55, &aa, &55, &aa, &55   ; bfc6: aa 55 aa... .U.
    equb &aa, &55, &aa, &55, &aa, &55, &aa, &55, &aa, &55, &aa, &55   ; bfd2: aa 55 aa... .U.
    equb &aa, &55, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff   ; bfde: aa 55 ff... .U.
    equb &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff   ; bfea: ff ff ff... ...
    equb &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff             ; bff6: ff ff ff... ...
.pydis_end

; Automatically generated labels:
;     c8076
;     c808d
;     c80d2
;     c816c
;     c8178
;     c81d5
;     c820c
;     c821e
;     c827d
;     c828c
;     c828e
;     c82a2
;     c82ad
;     c82ec
;     c82fa
;     c8308
;     c830b
;     c8320
;     c834b
;     c834c
;     c835e
;     c836a
;     c836d
;     c8383
;     c838f
;     c83f1
;     c8403
;     c8414
;     c8449
;     c8453
;     c845c
;     c846f
;     c8470
;     c8488
;     c84cf
;     c84d9
;     c84e4
;     c8545
;     c8564
;     c8565
;     c8b8e
;     c8b9c
;     c8bb4
;     c8dae
;     c8f5d
;     c8f62
;     c8f68
;     c8f6f
;     c8f97
;     c8f9f
;     c8ff8
;     c8ffb
;     c9011
;     c9014
;     c9040
;     c904d
;     c9059
;     c906f
;     c9072
;     c909e
;     c90ab
;     c90b7
;     c90d4
;     c90ee
;     c90f8
;     c90fe
;     c94ff
;     c9500
;     c967b
;     c9683
;     c96ac
;     c96ee
;     c96fa
;     c9715
;     c971f
;     c9724
;     c973b
;     c9743
;     c974b
;     c9760
;     c977c
;     c977f
;     c9787
;     c9791
;     c9796
;     c97a2
;     c97b1
;     c97d5
;     c97d9
;     c97dd
;     c97f9
;     c9814
;     c9827
;     c9837
;     c983a
;     c9846
;     c985f
;     c9875
;     c989f
;     c98b6
;     c98c6
;     c98cc
;     c98d4
;     c98d7
;     c9916
;     c992a
;     c994d
;     c9954
;     c9957
;     c995d
;     c9968
;     c998d
;     c999c
;     c99a9
;     c99b7
;     c99d0
;     c99dd
;     c99e5
;     c99f3
;     c9a0b
;     c9a39
;     c9a4d
;     c9a81
;     c9a9d
;     c9aa7
;     c9aa8
;     c9ac1
;     c9ac2
;     c9ad9
;     c9ade
;     c9ae1
;     c9b0a
;     c9b14
;     c9b1d
;     c9b22
;     c9b35
;     c9b41
;     c9b50
;     c9b60
;     c9b6a
;     c9b70
;     c9b73
;     c9b86
;     c9b9b
;     c9b9d
;     c9ba7
;     c9bc6
;     c9bcb
;     c9bda
;     c9be9
;     c9c0c
;     c9c25
;     c9c3f
;     c9c4d
;     c9c70
;     c9c84
;     c9cba
;     c9cd3
;     c9cd8
;     c9cdd
;     c9cfa
;     c9cff
;     c9d1c
;     c9d22
;     c9d30
;     c9d43
;     c9d4e
;     c9d55
;     c9d6b
;     c9d6e
;     c9d97
;     c9da2
;     c9daa
;     c9fe0
;     c9fe3
;     ca923
;     cb0b5
;     cb0cd
;     cb0db
;     cb0e9
;     cb0f7
;     cb17d
;     cb1ab
;     cb1b9
;     cb1c7
;     cb1d5
;     cb1e9
;     cb21a
;     cb21b
;     cb220
;     cb263
;     cb297
;     cb69b
;     cb6ba
;     cb6d3
;     cb6e6
;     cb6f2
;     cb707
;     cb71b
;     cb72f
;     cb738
;     cb74d
;     cb75f
;     cb77e
;     cb78f
;     cb7dc
;     cb823
;     cb84d
;     cb85c
;     cb876
;     cb892
;     cb894
;     cb8a9
;     cb8ab
;     cb8c0
;     cb8c2
;     cb8d5
;     cb8d7
;     cb8de
;     cb925
;     cb951
;     cb97a
;     cb97b
;     cb9d9
;     cb9de
;     cba1b
;     cba29
;     cba3b
;     cba4e
;     cbac4
;     cbad9
;     cbadf
;     cbaf2
;     cbaf7
;     cbaff
;     cbb18
;     cbb24
;     cbb31
;     cbb37
;     cbb7f
;     cbb88
;     cbb92
;     cbb99
;     cbba2
;     cbd4b
;     cbd6e
;     cbded
;     cbe0e
;     cbe31
;     cbe64
;     l0000
;     l0001
;     l0002
;     l0003
;     l0004
;     l0005
;     l0006
;     l0007
;     l0008
;     l0009
;     l000a
;     l000b
;     l000c
;     l000d
;     l000e
;     l000f
;     l0010
;     l0011
;     l0012
;     l0013
;     l0014
;     l0019
;     l001a
;     l001b
;     l001c
;     l001d
;     l001e
;     l001f
;     l0023
;     l0024
;     l0025
;     l0026
;     l0027
;     l0028
;     l0029
;     l002a
;     l0033
;     l0034
;     l0035
;     l0036
;     l0037
;     l0038
;     l0043
;     l0044
;     l0045
;     l0046
;     l0047
;     l0048
;     l0049
;     l004a
;     l004b
;     l004c
;     l004d
;     l004e
;     l004f
;     l0056
;     l0057
;     l0058
;     l005b
;     l005c
;     l005d
;     l005e
;     l005f
;     l00f8
;     l00fd
;     l00fe
;     l0100
;     l05af
;     l08ff
;     l0900
;     l0901
;     l09e0
;     l0a00
;     l0a01
;     l0a02
;     l0daa
;     l1900
;     l1901
;     l1902
;     l1903
;     l1904
;     l1905
;     l1906
;     l1907
;     l1908
;     l1909
;     l1911
;     l1912
;     l1913
;     l1915
;     l1916
;     l1917
;     l1918
;     l1919
;     l191a
;     l191b
;     l191c
;     l191d
;     l191e
;     l191f
;     l1920
;     l1921
;     l1922
;     l1923
;     l1926
;     l1927
;     l1928
;     l1929
;     l192a
;     l192b
;     l192d
;     l1940
;     l1942
;     l1944
;     l194e
;     l194f
;     l1950
;     l1951
;     l1952
;     l1953
;     l1958
;     l1959
;     l195a
;     l195b
;     l195c
;     l195d
;     l195e
;     l195f
;     l1960
;     l1961
;     l1962
;     l1966
;     l1967
;     l1969
;     l196a
;     l196b
;     l196c
;     l196d
;     l196e
;     l196f
;     l1973
;     l1976
;     l1978
;     l1979
;     l197b
;     l199d
;     l1a00
;     l2600
;     l2601
;     l2707
;     l2800
;     l4885
;     l4f60
;     l8020
;     l8536
;     la9bd
;     lbecb
;     lbf2e
;     lbf39
;     ldbb2
;     le2f1
;     loop_c80b3
;     loop_c80fe
;     loop_c8117
;     loop_c8161
;     loop_c8240
;     loop_c825e
;     loop_c8290
;     loop_c82ea
;     loop_c83b3
;     loop_c83de
;     loop_c842b
;     loop_c8b8d
;     loop_c8b9f
;     loop_c90d7
;     loop_c9505
;     loop_c96c5
;     loop_c9750
;     loop_c97ea
;     loop_c981c
;     loop_c9889
;     loop_c98fb
;     loop_c9a11
;     loop_c9a24
;     loop_c9bb6
;     loop_c9ca2
;     loop_c9cc5
;     loop_c9ce1
;     loop_c9d46
;     loop_c9d57
;     loop_c9d8c
;     loop_c9fb9
;     loop_c9fcb
;     loop_cb0b7
;     loop_cb14f
;     loop_cb1d7
;     loop_cb243
;     loop_cb286
;     loop_cb694
;     loop_cb743
;     loop_cb7d1
;     loop_cb867
;     loop_cb9a8
;     loop_cb9ce
;     loop_cb9e3
;     loop_cbdf3
;     loop_cbe4a
;     sub_c8335
;     sub_c839f
;     sub_c83ca
;     sub_c84f9
;     sub_c853e
;     sub_c8543
;     sub_c8d97
;     sub_c8e67
;     sub_c90a0
;     sub_c94dd
;     sub_c97a8
;     sub_c984c
;     sub_c98f3
;     sub_c9a45
;     sub_c9a48
;     sub_c9bec
;     sub_c9bfc
;     sub_c9c26
;     sub_c9c2d
;     sub_c9c36
;     sub_c9fa1
;     sub_ca00f
;     sub_cb0a3
;     sub_cb16e
;     sub_cb17e
;     sub_cb193
;     sub_cb1ea
;     sub_cb1f6
;     sub_cb202
;     sub_cb20e
;     sub_cb617
;     sub_cb644
;     sub_cb64f
;     sub_cb69e
;     sub_cb6a5
;     sub_cb6ac
;     sub_cb6c3
;     sub_cb6cd
;     sub_cb6e7
;     sub_cb708
;     sub_cb71c
;     sub_cb730
;     sub_cb739
;     sub_cb754
;     sub_cb759
;     sub_cb79d
;     sub_cb7a9
;     sub_cb7e3
;     sub_cb7fc
;     sub_cb803
;     sub_cb847
;     sub_cb854
;     sub_cb877
;     sub_cb881
;     sub_cb896
;     sub_cb8ad
;     sub_cb8c4
;     sub_cb8d9
;     sub_cbae2
;     sub_cbaf9
;     sub_cbbb1
;     sub_cbbbb
;     sub_cbc19
;     sub_cbc21
;     sub_cbd41
;     sub_cbd46
;     sub_cbd83
;     sub_cbdc3
;     sub_cbe18
;     sub_cbe1d
;     sub_cbe32
;     sub_cbe4b
;     sub_cbe5f
;     sub_cbe6b
;     sub_cbe72
    assert <(cb21b) == &1b
    assert <(l0024) == &24
    assert <(l0100) == &00
    assert <(l05af) == &af
    assert <(l0a00) == &00
    assert <(l1921) == &21
    assert <(l4885) == &85
    assert <(l4f60) == &60
    assert <(l8020) == &20
    assert <(ldbb2) == &b2
    assert <(le2f1) == &f1
    assert <(string_nul_809a) == &9a
    assert <(stringn8535) == &35
    assert <(stringnbf2d) == &2d
    assert <(sub_c853e) == &3e
    assert <(sub_c8e67) == &67
    assert <(sub_c90a0) == &a0
    assert <(sub_c94dd) == &dd
    assert <(sub_c97a8) == &a8
    assert <(title) == &09
    assert <xbrkv_handler == &95
    assert >(cb21b) == &b2
    assert >(l0024) == &00
    assert >(l0100) == &01
    assert >(l05af) == &05
    assert >(l0a00) == &0a
    assert >(l1921) == &19
    assert >(l4885) == &48
    assert >(l4f60) == &4f
    assert >(l8020) == &80
    assert >(ldbb2) == &db
    assert >(le2f1) == &e2
    assert >(string_nul_809a) == &80
    assert >(stringn8535) == &85
    assert >(stringnbf2d) == &bf
    assert >(sub_c853e) == &85
    assert >(sub_c8e67) == &8e
    assert >(sub_c90a0) == &90
    assert >(sub_c94dd) == &94
    assert >(sub_c97a8) == &97
    assert >(title) == &80
    assert >xbrkv_handler == &b9
    assert copyright - rom_header == &1f
    assert lbf39 - lbf2e == &0b
    assert osbyte_acknowledge_escape == &7e
    assert osbyte_flush_buffer_class == &0f
    assert osbyte_inkey == &81
    assert osbyte_read_rom_ptr_table_low == &a8
    assert osbyte_read_write_escape_break_effect == &c8
    assert osfind_close == &00
    assert osword_read_char == &0a
    assert sub_c853e - l8536 == &08
    assert xbrkv_offset == &03

save pydis_start, pydis_end
