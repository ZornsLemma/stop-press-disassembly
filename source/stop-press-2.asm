; Constants
inkey_key_f0                           = 223
inkey_key_f1                           = 142
inkey_key_f2                           = 141
osbyte_read_adc_or_get_buffer_status   = 128
osbyte_scan_keyboard                   = 121
osbyte_set_cursor_editing              = 4
osgbpb_read_file_names                 = 8
osword_read_pixel                      = 9
our_osword1                            = 53
our_osword2                            = 54

; Memory locations
l0000           = &0000
l0001           = &0001
l0002           = &0002
l0003           = &0003
l0004           = &0004
l0005           = &0005
l0006           = &0006
l0007           = &0007
l0008           = &0008
l0009           = &0009
l000a           = &000a
l000b           = &000b
l000c           = &000c
l000d           = &000d
l000e           = &000e
l000f           = &000f
l0015           = &0015
l0016           = &0016
l0019           = &0019
l001a           = &001a
l001b           = &001b
l001c           = &001c
l001d           = &001d
l001e           = &001e
l001f           = &001f
l0023           = &0023
l0024           = &0024
l0025           = &0025
l0026           = &0026
l0027           = &0027
l0028           = &0028
l0029           = &0029
l002a           = &002a
l0033           = &0033
l0034           = &0034
l0035           = &0035
l0036           = &0036
l0037           = &0037
l0038           = &0038
l0039           = &0039
l003a           = &003a
l003b           = &003b
l003c           = &003c
l003d           = &003d
l003e           = &003e
l0047           = &0047
l0048           = &0048
l0049           = &0049
l004a           = &004a
l004e           = &004e
l004f           = &004f
l0050           = &0050
l0051           = &0051
l0052           = &0052
l0053           = &0053
l0054           = &0054
l0055           = &0055
l0056           = &0056
l0057           = &0057
l0059           = &0059
l005a           = &005a
l005b           = &005b
l005c           = &005c
l005d           = &005d
osbyte_osword_a = &00ef
osbyte_osword_x = &00f0
osbyte_osword_y = &00f1
os_text_ptr     = &00f2
l0100           = &0100
l0104           = &0104
l0106           = &0106
l0300           = &0300
l0355           = &0355
l0700           = &0700
l09f0           = &09f0
l0a00           = &0a00
l0b00           = &0b00
l0da6           = &0da6
l0da7           = &0da7
l0da8           = &0da8
l0da9           = &0da9
l0daa           = &0daa
xkeyv           = &0ddb
l18cd           = &18cd
l18d6           = &18d6
l1911           = &1911
l1912           = &1912
l1913           = &1913
l1914           = &1914
l1915           = &1915
l1916           = &1916
l1917           = &1917
l1918           = &1918
l1919           = &1919
l191e           = &191e
l191f           = &191f
l1920           = &1920
l1921           = &1921
l1922           = &1922
l1923           = &1923
l1926           = &1926
l1927           = &1927
l1928           = &1928
l1929           = &1929
l192a           = &192a
l192b           = &192b
l192d           = &192d
l192f           = &192f
l1933           = &1933
l193e           = &193e
l1941           = &1941
l1943           = &1943
l1956           = &1956
l1957           = &1957
l1958           = &1958
l1959           = &1959
l195a           = &195a
l195b           = &195b
l195c           = &195c
l195d           = &195d
l195e           = &195e
l195f           = &195f
l1960           = &1960
l1963           = &1963
l1964           = &1964
l1965           = &1965
l196a           = &196a
l196b           = &196b
l196c           = &196c
l196f           = &196f
l1970           = &1970
l1971           = &1971
l1972           = &1972
l1973           = &1973
l1974           = &1974
l1975           = &1975
l1976           = &1976
l1977           = &1977
l1978           = &1978
l1979           = &1979
l197a           = &197a
l197b           = &197b
l197d           = &197d
l199d           = &199d
l19ad           = &19ad
l2600           = &2600
l2601           = &2601
l34e8           = &34e8
l34f0           = &34f0
l3768           = &3768
l3770           = &3770
l3780           = &3780
l3781           = &3781
l7380           = &7380
l7381           = &7381
user_via_orb_irb = &fe60
osgbpb          = &ffd1
oswrch          = &ffee
osword          = &fff1
osbyte          = &fff4
oscli           = &fff7

    org &8000

; Sideways ROM header
.rom_header
.language_entry
.pydis_start
    equb 0, 0, 0                                                      ; 8000: 00 00 00    ...

.service_entry
    jmp service_handler                                               ; 8003: 4c 41 80    LA.

.rom_type
    equb &82                                                          ; 8006: 82          .
.copyright_offset
    equb copyright - rom_header                                       ; 8007: 24          $
.binary_version
    equb 0                                                            ; 8008: 00          .
.title
    equs "Stop Press support 1.9   "                                  ; 8009: 53 74 6f... Sto
.version
    equb 0, 0                                                         ; 8022: 00 00       ..
.copyright
    equb 0                                                            ; 8024: 00          .
    equs "(C) Tecnation 1984-1987 ", &0d, 0                           ; 8025: 28 43 29... (C)

.pla_rts1
    pla                                                               ; 803f: 68          h
.rts1
    rts                                                               ; 8040: 60          `

.service_handler
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

.our_osword_1_x0_handler
    jsr sub_c9190                                                     ; 80a0: 20 90 91     ..
    lda l1979                                                         ; 80a3: ad 79 19    .y.
    beq c80ab                                                         ; 80a6: f0 03       ..
    jsr our_osword_1_x1_handler                                       ; 80a8: 20 0f 81     ..
.c80ab
    lda #&a8                                                          ; 80ab: a9 a8       ..
    sta l0052                                                         ; 80ad: 85 52       .R
    lda #&49 ; 'I'                                                    ; 80af: a9 49       .I
    sta l0053                                                         ; 80b1: 85 53       .S
    lda #0                                                            ; 80b3: a9 00       ..
    sta l0054                                                         ; 80b5: 85 54       .T
    lda #&26 ; '&'                                                    ; 80b7: a9 26       .&
    sta l0055                                                         ; 80b9: 85 55       .U
    ldx #&0a                                                          ; 80bb: a2 0a       ..
    ldy #0                                                            ; 80bd: a0 00       ..
.c80bf
    lda (l0052),y                                                     ; 80bf: b1 52       .R
    sta (l0054),y                                                     ; 80c1: 91 54       .T
    iny                                                               ; 80c3: c8          .
    bne c80bf                                                         ; 80c4: d0 f9       ..
    inc l0055                                                         ; 80c6: e6 55       .U
    lda l0052                                                         ; 80c8: a5 52       .R
    clc                                                               ; 80ca: 18          .
    adc #&80                                                          ; 80cb: 69 80       i.
    sta l0052                                                         ; 80cd: 85 52       .R
    bcc c80d3                                                         ; 80cf: 90 02       ..
    inc l0053                                                         ; 80d1: e6 53       .S
.c80d3
    inc l0053                                                         ; 80d3: e6 53       .S
    inc l0053                                                         ; 80d5: e6 53       .S
    dex                                                               ; 80d7: ca          .
    bne c80bf                                                         ; 80d8: d0 e5       ..
    lda #&a8                                                          ; 80da: a9 a8       ..
    sta l0052                                                         ; 80dc: 85 52       .R
    lda #&62 ; 'b'                                                    ; 80de: a9 62       .b
    sta l0053                                                         ; 80e0: 85 53       .S
    lda #0                                                            ; 80e2: a9 00       ..
    sta l0054                                                         ; 80e4: 85 54       .T
    lda #4                                                            ; 80e6: a9 04       ..
    sta l0055                                                         ; 80e8: 85 55       .U
    ldx #3                                                            ; 80ea: a2 03       ..
    ldy #0                                                            ; 80ec: a0 00       ..
.c80ee
    lda (l0052),y                                                     ; 80ee: b1 52       .R
    sta (l0054),y                                                     ; 80f0: 91 54       .T
    iny                                                               ; 80f2: c8          .
    bne c80ee                                                         ; 80f3: d0 f9       ..
    inc l0055                                                         ; 80f5: e6 55       .U
    lda l0052                                                         ; 80f7: a5 52       .R
    clc                                                               ; 80f9: 18          .
    adc #&80                                                          ; 80fa: 69 80       i.
    sta l0052                                                         ; 80fc: 85 52       .R
    bcc c8102                                                         ; 80fe: 90 02       ..
    inc l0053                                                         ; 8100: e6 53       .S
.c8102
    inc l0053                                                         ; 8102: e6 53       .S
    inc l0053                                                         ; 8104: e6 53       .S
    dex                                                               ; 8106: ca          .
    bne c80ee                                                         ; 8107: d0 e5       ..
    lda #1                                                            ; 8109: a9 01       ..
    sta l1979                                                         ; 810b: 8d 79 19    .y.
    rts                                                               ; 810e: 60          `

.our_osword_1_x1_handler
    jsr sub_c9190                                                     ; 810f: 20 90 91     ..
    lda l1979                                                         ; 8112: ad 79 19    .y.
    bne c8118                                                         ; 8115: d0 01       ..
    rts                                                               ; 8117: 60          `

.c8118
    lda #&a8                                                          ; 8118: a9 a8       ..
    sta l0052                                                         ; 811a: 85 52       .R
    lda #&49 ; 'I'                                                    ; 811c: a9 49       .I
    sta l0053                                                         ; 811e: 85 53       .S
    lda #0                                                            ; 8120: a9 00       ..
    sta l0054                                                         ; 8122: 85 54       .T
    lda #&26 ; '&'                                                    ; 8124: a9 26       .&
    sta l0055                                                         ; 8126: 85 55       .U
    ldx #&0a                                                          ; 8128: a2 0a       ..
    ldy #0                                                            ; 812a: a0 00       ..
.c812c
    lda (l0054),y                                                     ; 812c: b1 54       .T
    sta (l0052),y                                                     ; 812e: 91 52       .R
    iny                                                               ; 8130: c8          .
    bne c812c                                                         ; 8131: d0 f9       ..
    inc l0055                                                         ; 8133: e6 55       .U
    lda l0052                                                         ; 8135: a5 52       .R
    clc                                                               ; 8137: 18          .
    adc #&80                                                          ; 8138: 69 80       i.
    sta l0052                                                         ; 813a: 85 52       .R
    bcc c8140                                                         ; 813c: 90 02       ..
    inc l0053                                                         ; 813e: e6 53       .S
.c8140
    inc l0053                                                         ; 8140: e6 53       .S
    inc l0053                                                         ; 8142: e6 53       .S
    dex                                                               ; 8144: ca          .
    bne c812c                                                         ; 8145: d0 e5       ..
    lda #&a8                                                          ; 8147: a9 a8       ..
    sta l0052                                                         ; 8149: 85 52       .R
    lda #&62 ; 'b'                                                    ; 814b: a9 62       .b
    sta l0053                                                         ; 814d: 85 53       .S
    lda #0                                                            ; 814f: a9 00       ..
    sta l0054                                                         ; 8151: 85 54       .T
    lda #4                                                            ; 8153: a9 04       ..
    sta l0055                                                         ; 8155: 85 55       .U
    ldx #3                                                            ; 8157: a2 03       ..
    ldy #0                                                            ; 8159: a0 00       ..
.c815b
    lda (l0054),y                                                     ; 815b: b1 54       .T
    sta (l0052),y                                                     ; 815d: 91 52       .R
    iny                                                               ; 815f: c8          .
    bne c815b                                                         ; 8160: d0 f9       ..
    inc l0055                                                         ; 8162: e6 55       .U
    lda l0052                                                         ; 8164: a5 52       .R
    clc                                                               ; 8166: 18          .
    adc #&80                                                          ; 8167: 69 80       i.
    sta l0052                                                         ; 8169: 85 52       .R
    bcc c816f                                                         ; 816b: 90 02       ..
    inc l0053                                                         ; 816d: e6 53       .S
.c816f
    inc l0053                                                         ; 816f: e6 53       .S
    inc l0053                                                         ; 8171: e6 53       .S
    dex                                                               ; 8173: ca          .
    bne c815b                                                         ; 8174: d0 e5       ..
    lda #0                                                            ; 8176: a9 00       ..
    sta l1979                                                         ; 8178: 8d 79 19    .y.
    rts                                                               ; 817b: 60          `

.our_osword_1_x2_handler
    ldy osbyte_osword_y                                               ; 817c: a4 f1       ..
    lda #&40 ; '@'                                                    ; 817e: a9 40       .@
    sta l0006                                                         ; 8180: 85 06       ..
    lda #0                                                            ; 8182: a9 00       ..
    sta l0007                                                         ; 8184: 85 07       ..
.loop_c8186
    lda l0006                                                         ; 8186: a5 06       ..
    clc                                                               ; 8188: 18          .
    adc #&c0                                                          ; 8189: 69 c0       i.
    sta l0006                                                         ; 818b: 85 06       ..
    bcc c8191                                                         ; 818d: 90 02       ..
    inc l0007                                                         ; 818f: e6 07       ..
.c8191
    dey                                                               ; 8191: 88          .
    bne loop_c8186                                                    ; 8192: d0 f2       ..
    lda #4                                                            ; 8194: a9 04       ..
    jsr sub_c8606                                                     ; 8196: 20 06 86     ..
    lda l0006                                                         ; 8199: a5 06       ..
    jsr oswrch                                                        ; 819b: 20 ee ff     ..            ; Write character
    lda l0007                                                         ; 819e: a5 07       ..
    jsr oswrch                                                        ; 81a0: 20 ee ff     ..            ; Write character
    lda #&e4                                                          ; 81a3: a9 e4       ..
    jsr oswrch                                                        ; 81a5: 20 ee ff     ..            ; Write character 228
    lda #3                                                            ; 81a8: a9 03       ..
    jsr oswrch                                                        ; 81aa: 20 ee ff     ..            ; Write character 3
    lda #5                                                            ; 81ad: a9 05       ..
    jsr oswrch                                                        ; 81af: 20 ee ff     ..            ; Write character 5
    ldx #4                                                            ; 81b2: a2 04       ..
    jsr sub_c8351                                                     ; 81b4: 20 51 83     Q.
    lda #&f5                                                          ; 81b7: a9 f5       ..
    jsr oswrch                                                        ; 81b9: 20 ee ff     ..            ; Write character 245
    lda #&f7                                                          ; 81bc: a9 f7       ..
    ldx #9                                                            ; 81be: a2 09       ..
.loop_c81c0
    jsr oswrch                                                        ; 81c0: 20 ee ff     ..            ; Write character 247
    dex                                                               ; 81c3: ca          .
    bne loop_c81c0                                                    ; 81c4: d0 fa       ..
    lda #&f6                                                          ; 81c6: a9 f6       ..
    jsr oswrch                                                        ; 81c8: 20 ee ff     ..            ; Write character 246
.c81cb
    ldx #&80                                                          ; 81cb: a2 80       ..
    ldy #0                                                            ; 81cd: a0 00       ..
.c81cf
    iny                                                               ; 81cf: c8          .
    dey                                                               ; 81d0: 88          .
    dey                                                               ; 81d1: 88          .
    bne c81cf                                                         ; 81d2: d0 fb       ..
    dex                                                               ; 81d4: ca          .
    bne c81cf                                                         ; 81d5: d0 f8       ..
    rts                                                               ; 81d7: 60          `

.our_osword_1_x3_handler
    jsr sub_c8373                                                     ; 81d8: 20 73 83     s.
    ldx #&46 ; 'F'                                                    ; 81db: a2 46       .F
    ldy #&96                                                          ; 81dd: a0 96       ..
    lda osbyte_osword_y                                               ; 81df: a5 f1       ..
    jsr sub_c8336                                                     ; 81e1: 20 36 83     6.
    stx l0002                                                         ; 81e4: 86 02       ..
    sty l0003                                                         ; 81e6: 84 03       ..
    jsr our_osword_1_x4_handler                                       ; 81e8: 20 8f 82     ..
    ldx #&7d ; '}'                                                    ; 81eb: a2 7d       .}
    ldy #&a0                                                          ; 81ed: a0 a0       ..
    jsr c835f                                                         ; 81ef: 20 5f 83     _.
    ldx #&0f                                                          ; 81f2: a2 0f       ..
    ldy #1                                                            ; 81f4: a0 01       ..
.c81f6
    iny                                                               ; 81f6: c8          .
    lda (l0002),y                                                     ; 81f7: b1 02       ..
    cmp #&0d                                                          ; 81f9: c9 0d       ..
    beq c8208                                                         ; 81fb: f0 0b       ..
    cmp #&5f ; '_'                                                    ; 81fd: c9 5f       ._
    beq c8252                                                         ; 81ff: f0 51       .Q
    jsr oswrch                                                        ; 8201: 20 ee ff     ..            ; Write character
    dex                                                               ; 8204: ca          .
    jmp c81f6                                                         ; 8205: 4c f6 81    L..

.c8208
    lda #0                                                            ; 8208: a9 00       ..
    sta l0006                                                         ; 820a: 85 06       ..
    lda #1                                                            ; 820c: a9 01       ..
    sta l0007                                                         ; 820e: 85 07       ..
    ldy #1                                                            ; 8210: a0 01       ..
    lda (l0002),y                                                     ; 8212: b1 02       ..
    ldx #5                                                            ; 8214: a2 05       ..
.c8216
    asl a                                                             ; 8216: 0a          .
    bcc c823f                                                         ; 8217: 90 26       .&
    pha                                                               ; 8219: 48          H
    lda #4                                                            ; 821a: a9 04       ..
    jsr sub_c8606                                                     ; 821c: 20 06 86     ..
    lda l0006                                                         ; 821f: a5 06       ..
    jsr oswrch                                                        ; 8221: 20 ee ff     ..            ; Write character
    lda l0007                                                         ; 8224: a5 07       ..
    jsr oswrch                                                        ; 8226: 20 ee ff     ..            ; Write character
    lda #&c8                                                          ; 8229: a9 c8       ..
    jsr oswrch                                                        ; 822b: 20 ee ff     ..            ; Write character 200
    lda #3                                                            ; 822e: a9 03       ..
    jsr oswrch                                                        ; 8230: 20 ee ff     ..            ; Write character 3
    stx l001f                                                         ; 8233: 86 1f       ..
    ldx #&85                                                          ; 8235: a2 85       ..
    ldy #&a0                                                          ; 8237: a0 a0       ..
    jsr c835f                                                         ; 8239: 20 5f 83     _.
    ldx l001f                                                         ; 823c: a6 1f       ..
    pla                                                               ; 823e: 68          h
.c823f
    pha                                                               ; 823f: 48          H
    lda l0006                                                         ; 8240: a5 06       ..
    clc                                                               ; 8242: 18          .
    adc #&c0                                                          ; 8243: 69 c0       i.
    sta l0006                                                         ; 8245: 85 06       ..
    bcc c824b                                                         ; 8247: 90 02       ..
    inc l0007                                                         ; 8249: e6 07       ..
.c824b
    pla                                                               ; 824b: 68          h
    dex                                                               ; 824c: ca          .
    bne c8216                                                         ; 824d: d0 c7       ..
    jmp c81cb                                                         ; 824f: 4c cb 81    L..

.c8252
    cpx #0                                                            ; 8252: e0 00       ..
    beq c825f                                                         ; 8254: f0 09       ..
    lda #&20 ; ' '                                                    ; 8256: a9 20       .
    jsr oswrch                                                        ; 8258: 20 ee ff     ..            ; Write character 32
    dex                                                               ; 825b: ca          .
    jmp c8252                                                         ; 825c: 4c 52 82    LR.

.c825f
    ldx #&0c                                                          ; 825f: a2 0c       ..
    jmp c81f6                                                         ; 8261: 4c f6 81    L..

.our_osword_1_x9_handler
    lda #4                                                            ; 8264: a9 04       ..
    jsr oswrch                                                        ; 8266: 20 ee ff     ..            ; Write character 4
    lda #&1a                                                          ; 8269: a9 1a       ..
    jsr oswrch                                                        ; 826b: 20 ee ff     ..            ; Write character 26
    ldx #1                                                            ; 826e: a2 01       ..
    ldy #&a1                                                          ; 8270: a0 a1       ..
    lda osbyte_osword_y                                               ; 8272: a5 f1       ..
    jsr sub_c8336                                                     ; 8274: 20 36 83     6.
    stx l0047                                                         ; 8277: 86 47       .G
    sty l0048                                                         ; 8279: 84 48       .H
    ldy #0                                                            ; 827b: a0 00       ..
.loop_c827d
    lda (l0047),y                                                     ; 827d: b1 47       .G
    sta l0b00,y                                                       ; 827f: 99 00 0b    ...
    iny                                                               ; 8282: c8          .
    cmp #&0d                                                          ; 8283: c9 0d       ..
    bne loop_c827d                                                    ; 8285: d0 f6       ..
    ldx #<(l0b00)                                                     ; 8287: a2 00       ..
    ldy #>(l0b00)                                                     ; 8289: a0 0b       ..
    jsr oscli                                                         ; 828b: 20 f7 ff     ..
    rts                                                               ; 828e: 60          `

.our_osword_1_x4_handler
    ldx #&25 ; '%'                                                    ; 828f: a2 25       .%
    ldy #&96                                                          ; 8291: a0 96       ..
    jmp c835f                                                         ; 8293: 4c 5f 83    L_.

.our_osword_1_x5_handler
    jsr sub_c8373                                                     ; 8296: 20 73 83     s.
    ldx #&ba                                                          ; 8299: a2 ba       ..
    ldy #&9b                                                          ; 829b: a0 9b       ..
    lda osbyte_osword_y                                               ; 829d: a5 f1       ..
    jsr sub_c8336                                                     ; 829f: 20 36 83     6.
    stx l0002                                                         ; 82a2: 86 02       ..
    sty l0003                                                         ; 82a4: 84 03       ..
    jsr our_osword_1_x4_handler                                       ; 82a6: 20 8f 82     ..
    ldx #&7d ; '}'                                                    ; 82a9: a2 7d       .}
    ldy #&a0                                                          ; 82ab: a0 a0       ..
    jsr c835f                                                         ; 82ad: 20 5f 83     _.
    ldy #0                                                            ; 82b0: a0 00       ..
    lda (l0002),y                                                     ; 82b2: b1 02       ..
    clc                                                               ; 82b4: 18          .
    adc #&b7                                                          ; 82b5: 69 b7       i.
    eor #&ff                                                          ; 82b7: 49 ff       I.
    lsr a                                                             ; 82b9: 4a          J
    tax                                                               ; 82ba: aa          .
    lda #&20 ; ' '                                                    ; 82bb: a9 20       .
.loop_c82bd
    jsr oswrch                                                        ; 82bd: 20 ee ff     ..            ; Write character 32
    dex                                                               ; 82c0: ca          .
    bne loop_c82bd                                                    ; 82c1: d0 fa       ..
    ldx l0002                                                         ; 82c3: a6 02       ..
    ldy l0003                                                         ; 82c5: a4 03       ..
    jsr c835f                                                         ; 82c7: 20 5f 83     _.
    rts                                                               ; 82ca: 60          `

.our_osword_1_x6_handler
    lda osbyte_osword_y                                               ; 82cb: a5 f1       ..
    ldx #&ff                                                          ; 82cd: a2 ff       ..
.loop_c82cf
    inx                                                               ; 82cf: e8          .
    sec                                                               ; 82d0: 38          8
    sbc #&0a                                                          ; 82d1: e9 0a       ..
    bcs loop_c82cf                                                    ; 82d3: b0 fa       ..
    clc                                                               ; 82d5: 18          .
    adc #&0a                                                          ; 82d6: 69 0a       i.
    pha                                                               ; 82d8: 48          H
    txa                                                               ; 82d9: 8a          .
    clc                                                               ; 82da: 18          .
    adc #&30 ; '0'                                                    ; 82db: 69 30       i0
    jsr oswrch                                                        ; 82dd: 20 ee ff     ..            ; Write character
    pla                                                               ; 82e0: 68          h
    adc #&30 ; '0'                                                    ; 82e1: 69 30       i0
    jsr oswrch                                                        ; 82e3: 20 ee ff     ..            ; Write character
    rts                                                               ; 82e6: 60          `

.our_osword_1_x7_handler
    lda osbyte_osword_y                                               ; 82e7: a5 f1       ..
    ldx #&ff                                                          ; 82e9: a2 ff       ..
.loop_c82eb
    inx                                                               ; 82eb: e8          .
    sec                                                               ; 82ec: 38          8
    sbc #&64 ; 'd'                                                    ; 82ed: e9 64       .d
    bcs loop_c82eb                                                    ; 82ef: b0 fa       ..
    clc                                                               ; 82f1: 18          .
    adc #&64 ; 'd'                                                    ; 82f2: 69 64       id
    pha                                                               ; 82f4: 48          H
    txa                                                               ; 82f5: 8a          .
    clc                                                               ; 82f6: 18          .
    adc #&30 ; '0'                                                    ; 82f7: 69 30       i0
    jsr oswrch                                                        ; 82f9: 20 ee ff     ..            ; Write character
    pla                                                               ; 82fc: 68          h
    ldx #&ff                                                          ; 82fd: a2 ff       ..
.loop_c82ff
    inx                                                               ; 82ff: e8          .
    sec                                                               ; 8300: 38          8
    sbc #&0a                                                          ; 8301: e9 0a       ..
    bcs loop_c82ff                                                    ; 8303: b0 fa       ..
    clc                                                               ; 8305: 18          .
    adc #&0a                                                          ; 8306: 69 0a       i.
    pha                                                               ; 8308: 48          H
    txa                                                               ; 8309: 8a          .
    clc                                                               ; 830a: 18          .
    adc #&30 ; '0'                                                    ; 830b: 69 30       i0
    jsr oswrch                                                        ; 830d: 20 ee ff     ..            ; Write character
    pla                                                               ; 8310: 68          h
    adc #&30 ; '0'                                                    ; 8311: 69 30       i0
    jsr oswrch                                                        ; 8313: 20 ee ff     ..            ; Write character
    rts                                                               ; 8316: 60          `

.jmp_a_minus_1_th_entry_in_table_at_yx
    stx l0050                                                         ; 8317: 86 50       .P
    sty l0051                                                         ; 8319: 84 51       .Q
    sec                                                               ; 831b: 38          8
    sbc #1                                                            ; 831c: e9 01       ..
    asl a                                                             ; 831e: 0a          .
    clc                                                               ; 831f: 18          .
    adc l0050                                                         ; 8320: 65 50       eP
    sta l0050                                                         ; 8322: 85 50       .P
    bcc c8328                                                         ; 8324: 90 02       ..
    inc l0051                                                         ; 8326: e6 51       .Q
.c8328
    ldy #0                                                            ; 8328: a0 00       ..
    lda (l0050),y                                                     ; 832a: b1 50       .P
    sta l0006                                                         ; 832c: 85 06       ..
    iny                                                               ; 832e: c8          .
    lda (l0050),y                                                     ; 832f: b1 50       .P
    sta l0007                                                         ; 8331: 85 07       ..
    jmp (l0006)                                                       ; 8333: 6c 06 00    l..

.sub_c8336
    stx l0050                                                         ; 8336: 86 50       .P
    sty l0051                                                         ; 8338: 84 51       .Q
    sec                                                               ; 833a: 38          8
    sbc #1                                                            ; 833b: e9 01       ..
    asl a                                                             ; 833d: 0a          .
    clc                                                               ; 833e: 18          .
    adc l0050                                                         ; 833f: 65 50       eP
    sta l0050                                                         ; 8341: 85 50       .P
    bcc c8347                                                         ; 8343: 90 02       ..
    inc l0051                                                         ; 8345: e6 51       .Q
.c8347
    ldy #0                                                            ; 8347: a0 00       ..
    lda (l0050),y                                                     ; 8349: b1 50       .P
    tax                                                               ; 834b: aa          .
    iny                                                               ; 834c: c8          .
    lda (l0050),y                                                     ; 834d: b1 50       .P
    tay                                                               ; 834f: a8          .
    rts                                                               ; 8350: 60          `

.sub_c8351
    lda #&12                                                          ; 8351: a9 12       ..
    jsr oswrch                                                        ; 8353: 20 ee ff     ..            ; Write character 18
    txa                                                               ; 8356: 8a          .
    jsr oswrch                                                        ; 8357: 20 ee ff     ..            ; Write character
    tya                                                               ; 835a: 98          .
    jsr oswrch                                                        ; 835b: 20 ee ff     ..            ; Write character
    rts                                                               ; 835e: 60          `

.c835f
    stx l0004                                                         ; 835f: 86 04       ..
    sty l0005                                                         ; 8361: 84 05       ..
    ldy #0                                                            ; 8363: a0 00       ..
    lda (l0004),y                                                     ; 8365: b1 04       ..
    tax                                                               ; 8367: aa          .
    iny                                                               ; 8368: c8          .
.c8369
    lda (l0004),y                                                     ; 8369: b1 04       ..
    jsr oswrch                                                        ; 836b: 20 ee ff     ..            ; Write character
    iny                                                               ; 836e: c8          .
    dex                                                               ; 836f: ca          .
    bne c8369                                                         ; 8370: d0 f7       ..
    rts                                                               ; 8372: 60          `

.sub_c8373
    lda #&12                                                          ; 8373: a9 12       ..
    jsr oswrch                                                        ; 8375: 20 ee ff     ..            ; Write character 18
    lda #0                                                            ; 8378: a9 00       ..
    jsr oswrch                                                        ; 837a: 20 ee ff     ..            ; Write character 0
    lda #1                                                            ; 837d: a9 01       ..
    jsr oswrch                                                        ; 837f: 20 ee ff     ..            ; Write character 1
    lda #&12                                                          ; 8382: a9 12       ..
    jsr oswrch                                                        ; 8384: 20 ee ff     ..            ; Write character 18
    lda #0                                                            ; 8387: a9 00       ..
    jsr oswrch                                                        ; 8389: 20 ee ff     ..            ; Write character 0
    lda #&80                                                          ; 838c: a9 80       ..
    jsr oswrch                                                        ; 838e: 20 ee ff     ..            ; Write character 128
    rts                                                               ; 8391: 60          `

.our_osword_1_x8_handler
    lda #&1a                                                          ; 8392: a9 1a       ..
    sta l005b                                                         ; 8394: 85 5b       .[
    lda #0                                                            ; 8396: a9 00       ..
    sta l005c                                                         ; 8398: 85 5c       .\
    lda #2                                                            ; 839a: a9 02       ..
    sta l0057                                                         ; 839c: 85 57       .W
    ldx #3                                                            ; 839e: a2 03       ..
    ldy #3                                                            ; 83a0: a0 03       ..
    jsr sub_c8351                                                     ; 83a2: 20 51 83     Q.
.c83a5
    lda #&3a ; ':'                                                    ; 83a5: a9 3a       .:
    sta l0056                                                         ; 83a7: 85 56       .V
    lda #&0e                                                          ; 83a9: a9 0e       ..
    sta l0059                                                         ; 83ab: 85 59       .Y
    lda #0                                                            ; 83ad: a9 00       ..
    sta l005a                                                         ; 83af: 85 5a       .Z
    ldx #0                                                            ; 83b1: a2 00       ..
.c83b3
    lda la0c8,x                                                       ; 83b3: bd c8 a0    ...
    and #&f0                                                          ; 83b6: 29 f0       ).
    lsr a                                                             ; 83b8: 4a          J
    adc l0059                                                         ; 83b9: 65 59       eY
    sta l0059                                                         ; 83bb: 85 59       .Y
    lda l005a                                                         ; 83bd: a5 5a       .Z
    adc #0                                                            ; 83bf: 69 00       i.
    sta l005a                                                         ; 83c1: 85 5a       .Z
    lda #4                                                            ; 83c3: a9 04       ..
    jsr sub_c8606                                                     ; 83c5: 20 06 86     ..
    ldy #&59 ; 'Y'                                                    ; 83c8: a0 59       .Y
    jsr sub_c8496                                                     ; 83ca: 20 96 84     ..
    lda #1                                                            ; 83cd: a9 01       ..
    jsr sub_c8606                                                     ; 83cf: 20 06 86     ..
    jsr sub_c848e                                                     ; 83d2: 20 8e 84     ..
    lda la0c8,x                                                       ; 83d5: bd c8 a0    ...
    and #3                                                            ; 83d8: 29 03       ).
    asl a                                                             ; 83da: 0a          .
    asl a                                                             ; 83db: 0a          .
    ldy l0057                                                         ; 83dc: a4 57       .W
    cpy #1                                                            ; 83de: c0 01       ..
    beq c83f6                                                         ; 83e0: f0 14       ..
    ldy #0                                                            ; 83e2: a0 00       ..
    eor #&ff                                                          ; 83e4: 49 ff       I.
    clc                                                               ; 83e6: 18          .
    adc #1                                                            ; 83e7: 69 01       i.
    jsr oswrch                                                        ; 83e9: 20 ee ff     ..            ; Write character
    cmp #0                                                            ; 83ec: c9 00       ..
    beq c83f2                                                         ; 83ee: f0 02       ..
    ldy #&ff                                                          ; 83f0: a0 ff       ..
.c83f2
    tya                                                               ; 83f2: 98          .
    jmp c83fb                                                         ; 83f3: 4c fb 83    L..

.c83f6
    jsr oswrch                                                        ; 83f6: 20 ee ff     ..            ; Write character
    lda #0                                                            ; 83f9: a9 00       ..
.c83fb
    jsr oswrch                                                        ; 83fb: 20 ee ff     ..            ; Write character 0
    inx                                                               ; 83fe: e8          .
    txa                                                               ; 83ff: 8a          .
    and #&0f                                                          ; 8400: 29 0f       ).
    tax                                                               ; 8402: aa          .
    dec l0056                                                         ; 8403: c6 56       .V
    bne c83b3                                                         ; 8405: d0 ac       ..
    dec l0057                                                         ; 8407: c6 57       .W
    beq c8416                                                         ; 8409: f0 0b       ..
    lda #&a4                                                          ; 840b: a9 a4       ..
    sta l005b                                                         ; 840d: 85 5b       .[
    lda #3                                                            ; 840f: a9 03       ..
    sta l005c                                                         ; 8411: 85 5c       .\
    jmp c83a5                                                         ; 8413: 4c a5 83    L..

.c8416
    lda #&2c ; ','                                                    ; 8416: a9 2c       .,
    sta l0059                                                         ; 8418: 85 59       .Y
    lda #0                                                            ; 841a: a9 00       ..
    sta l005a                                                         ; 841c: 85 5a       .Z
    lda #2                                                            ; 841e: a9 02       ..
    sta l0057                                                         ; 8420: 85 57       .W
.c8422
    lda #&3c ; '<'                                                    ; 8422: a9 3c       .<
    sta l005b                                                         ; 8424: 85 5b       .[
    lda #0                                                            ; 8426: a9 00       ..
    sta l005c                                                         ; 8428: 85 5c       .\
    ldx #0                                                            ; 842a: a2 00       ..
.c842c
    lda la0d8,x                                                       ; 842c: bd d8 a0    ...
    and #&f0                                                          ; 842f: 29 f0       ).
    lsr a                                                             ; 8431: 4a          J
    lsr a                                                             ; 8432: 4a          J
    adc l005b                                                         ; 8433: 65 5b       e[
    sta l005b                                                         ; 8435: 85 5b       .[
    lda l005c                                                         ; 8437: a5 5c       .\
    adc #0                                                            ; 8439: 69 00       i.
    sta l005c                                                         ; 843b: 85 5c       .\
    lda #4                                                            ; 843d: a9 04       ..
    jsr sub_c8606                                                     ; 843f: 20 06 86     ..
    ldy #&59 ; 'Y'                                                    ; 8442: a0 59       .Y
    jsr sub_c8496                                                     ; 8444: 20 96 84     ..
    lda #1                                                            ; 8447: a9 01       ..
    jsr sub_c8606                                                     ; 8449: 20 06 86     ..
    lda la0d8,x                                                       ; 844c: bd d8 a0    ...
    and #7                                                            ; 844f: 29 07       ).
    asl a                                                             ; 8451: 0a          .
    ldy l0057                                                         ; 8452: a4 57       .W
    cpy #1                                                            ; 8454: c0 01       ..
    beq c846c                                                         ; 8456: f0 14       ..
    ldy #0                                                            ; 8458: a0 00       ..
    eor #&ff                                                          ; 845a: 49 ff       I.
    clc                                                               ; 845c: 18          .
    adc #1                                                            ; 845d: 69 01       i.
    jsr oswrch                                                        ; 845f: 20 ee ff     ..            ; Write character
    cmp #0                                                            ; 8462: c9 00       ..
    beq c8468                                                         ; 8464: f0 02       ..
    ldy #&ff                                                          ; 8466: a0 ff       ..
.c8468
    tya                                                               ; 8468: 98          .
    jmp c8471                                                         ; 8469: 4c 71 84    Lq.

.c846c
    jsr oswrch                                                        ; 846c: 20 ee ff     ..            ; Write character
    lda #0                                                            ; 846f: a9 00       ..
.c8471
    jsr oswrch                                                        ; 8471: 20 ee ff     ..            ; Write character 0
    jsr sub_c848e                                                     ; 8474: 20 8e 84     ..
    inx                                                               ; 8477: e8          .
    cpx #&29 ; ')'                                                    ; 8478: e0 29       .)
    bne c842c                                                         ; 847a: d0 b0       ..
    dec l0057                                                         ; 847c: c6 57       .W
    beq c848b                                                         ; 847e: f0 0b       ..
    lda #&b2                                                          ; 8480: a9 b2       ..
    sta l0059                                                         ; 8482: 85 59       .Y
    lda #4                                                            ; 8484: a9 04       ..
    sta l005a                                                         ; 8486: 85 5a       .Z
    jmp c8422                                                         ; 8488: 4c 22 84    L".

.c848b
    lda #0                                                            ; 848b: a9 00       ..
    rts                                                               ; 848d: 60          `

.sub_c848e
    lda #0                                                            ; 848e: a9 00       ..
    jsr oswrch                                                        ; 8490: 20 ee ff     ..            ; Write character 0
    jmp oswrch                                                        ; 8493: 4c ee ff    L..            ; Write character

.sub_c8496
    lda l0000,y                                                       ; 8496: b9 00 00    ...
    jsr oswrch                                                        ; 8499: 20 ee ff     ..            ; Write character
    lda l0001,y                                                       ; 849c: b9 01 00    ...
    jsr oswrch                                                        ; 849f: 20 ee ff     ..            ; Write character
    lda l0002,y                                                       ; 84a2: b9 02 00    ...
    jsr oswrch                                                        ; 84a5: 20 ee ff     ..            ; Write character
    lda l0003,y                                                       ; 84a8: b9 03 00    ...
    jmp oswrch                                                        ; 84ab: 4c ee ff    L..            ; Write character

.our_osword_1_x10_handler
    lda l0016                                                         ; 84ae: a5 16       ..
    sta l001a                                                         ; 84b0: 85 1a       ..
    ldx #&4a ; 'J'                                                    ; 84b2: a2 4a       .J
    ldy #&33 ; '3'                                                    ; 84b4: a0 33       .3
    jsr sub_c85f1                                                     ; 84b6: 20 f1 85     ..
    ldx #&3f ; '?'                                                    ; 84b9: a2 3f       .?
    ldy #&37 ; '7'                                                    ; 84bb: a0 37       .7
    jsr sub_c85f1                                                     ; 84bd: 20 f1 85     ..
    lda #0                                                            ; 84c0: a9 00       ..
    sta l001f                                                         ; 84c2: 85 1f       ..
    sta l004e                                                         ; 84c4: 85 4e       .N
    lda l0015                                                         ; 84c6: a5 15       ..
    sta l0019                                                         ; 84c8: 85 19       ..
    ldx #&33 ; '3'                                                    ; 84ca: a2 33       .3
    ldy #&3b ; ';'                                                    ; 84cc: a0 3b       .;
    jsr sub_c85f1                                                     ; 84ce: 20 f1 85     ..
.c84d1
    ldy l001f                                                         ; 84d1: a4 1f       ..
    lda la190,y                                                       ; 84d3: b9 90 a1    ...
    sta l0023                                                         ; 84d6: 85 23       .#
.c84d8
    lda l1970                                                         ; 84d8: ad 70 19    .p.
    bne c850c                                                         ; 84db: d0 2f       ./
    ldx #&33 ; '3'                                                    ; 84dd: a2 33       .3
    ldy #&3b ; ';'                                                    ; 84df: a0 3b       .;
    jsr sub_c85cf                                                     ; 84e1: 20 cf 85     ..
    beq c850c                                                         ; 84e4: f0 26       .&
    lda l1972                                                         ; 84e6: ad 72 19    .r.
    beq c84f1                                                         ; 84e9: f0 06       ..
    lda l0035                                                         ; 84eb: a5 35       .5
    and #4                                                            ; 84ed: 29 04       ).
    beq c8505                                                         ; 84ef: f0 14       ..
.c84f1
    lda #&45 ; 'E'                                                    ; 84f1: a9 45       .E
    jsr sub_c8606                                                     ; 84f3: 20 06 86     ..
    ldy #&33 ; '3'                                                    ; 84f6: a0 33       .3
    jsr sub_c8496                                                     ; 84f8: 20 96 84     ..
    lda #&45 ; 'E'                                                    ; 84fb: a9 45       .E
    jsr sub_c8606                                                     ; 84fd: 20 06 86     ..
    ldy #&37 ; '7'                                                    ; 8500: a0 37       .7
    jsr sub_c8496                                                     ; 8502: 20 96 84     ..
.c8505
    ldx #&33 ; '3'                                                    ; 8505: a2 33       .3
    ldy #&3b ; ';'                                                    ; 8507: a0 3b       .;
    jsr sub_c85f1                                                     ; 8509: 20 f1 85     ..
.c850c
    lda l0023                                                         ; 850c: a5 23       .#
    beq c8543                                                         ; 850e: f0 33       .3
    dec l0023                                                         ; 8510: c6 23       .#
    lda l0015                                                         ; 8512: a5 15       ..
    clc                                                               ; 8514: 18          .
    adc l0019                                                         ; 8515: 65 19       e.
    sta l0019                                                         ; 8517: 85 19       ..
    bcc c850c                                                         ; 8519: 90 f1       ..
    lda l0037                                                         ; 851b: a5 37       .7
    clc                                                               ; 851d: 18          .
    adc #2                                                            ; 851e: 69 02       i.
    sta l0037                                                         ; 8520: 85 37       .7
    bcc c8526                                                         ; 8522: 90 02       ..
    inc l0038                                                         ; 8524: e6 38       .8
.c8526
    lda l0033                                                         ; 8526: a5 33       .3
    sec                                                               ; 8528: 38          8
    sbc #2                                                            ; 8529: e9 02       ..
    sta l0033                                                         ; 852b: 85 33       .3
    bcs c8531                                                         ; 852d: b0 02       ..
    dec l0034                                                         ; 852f: c6 34       .4
.c8531
    lda l0033                                                         ; 8531: a5 33       .3
    sec                                                               ; 8533: 38          8
    sbc l0037                                                         ; 8534: e5 37       .7
    lda l0034                                                         ; 8536: a5 34       .4
    sbc l0038                                                         ; 8538: e5 38       .8
    bcs c8540                                                         ; 853a: b0 04       ..
    lda l004e                                                         ; 853c: a5 4e       .N
    bne c854f                                                         ; 853e: d0 0f       ..
.c8540
    jmp c84d8                                                         ; 8540: 4c d8 84    L..

.c8543
    lda l004e                                                         ; 8543: a5 4e       .N
    beq c8550                                                         ; 8545: f0 09       ..
    dec l001f                                                         ; 8547: c6 1f       ..
    lda l001f                                                         ; 8549: a5 1f       ..
    cmp #&ff                                                          ; 854b: c9 ff       ..
    bne c856a                                                         ; 854d: d0 1b       ..
.c854f
    rts                                                               ; 854f: 60          `

.c8550
    inc l001f                                                         ; 8550: e6 1f       ..
    bpl c856a                                                         ; 8552: 10 16       ..
    dec l001f                                                         ; 8554: c6 1f       ..
    lda #1                                                            ; 8556: a9 01       ..
    sta l004e                                                         ; 8558: 85 4e       .N
    ldx #&33 ; '3'                                                    ; 855a: a2 33       .3
    ldy #&37 ; '7'                                                    ; 855c: a0 37       .7
    jsr sub_c85b6                                                     ; 855e: 20 b6 85     ..
    lda l0019                                                         ; 8561: a5 19       ..
    eor #&ff                                                          ; 8563: 49 ff       I.
    sta l0019                                                         ; 8565: 85 19       ..
    jmp c8505                                                         ; 8567: 4c 05 85    L..

.c856a
    lda l0016                                                         ; 856a: a5 16       ..
    clc                                                               ; 856c: 18          .
    adc l001a                                                         ; 856d: 65 1a       e.
    sta l001a                                                         ; 856f: 85 1a       ..
    bcs c8576                                                         ; 8571: b0 03       ..
    jmp c84d1                                                         ; 8573: 4c d1 84    L..

.c8576
    lda l1970                                                         ; 8576: ad 70 19    .p.
    beq c859d                                                         ; 8579: f0 22       ."
    lda l1972                                                         ; 857b: ad 72 19    .r.
    bne c8583                                                         ; 857e: d0 03       ..
    jmp c8589                                                         ; 8580: 4c 89 85    L..

.c8583
    lda l0035                                                         ; 8583: a5 35       .5
    and #4                                                            ; 8585: 29 04       ).
    beq c859d                                                         ; 8587: f0 14       ..
.c8589
    lda #4                                                            ; 8589: a9 04       ..
    jsr sub_c8606                                                     ; 858b: 20 06 86     ..
    ldy #&33 ; '3'                                                    ; 858e: a0 33       .3
    jsr sub_c8496                                                     ; 8590: 20 96 84     ..
    lda #5                                                            ; 8593: a9 05       ..
    jsr sub_c8606                                                     ; 8595: 20 06 86     ..
    ldy #&37 ; '7'                                                    ; 8598: a0 37       .7
    jsr sub_c8496                                                     ; 859a: 20 96 84     ..
.c859d
    lda l0035                                                         ; 859d: a5 35       .5
    clc                                                               ; 859f: 18          .
    adc #4                                                            ; 85a0: 69 04       i.
    sta l0035                                                         ; 85a2: 85 35       .5
    bcc c85a8                                                         ; 85a4: 90 02       ..
    inc l0036                                                         ; 85a6: e6 36       .6
.c85a8
    lda l0039                                                         ; 85a8: a5 39       .9
    clc                                                               ; 85aa: 18          .
    adc #4                                                            ; 85ab: 69 04       i.
    sta l0039                                                         ; 85ad: 85 39       .9
    bcc c85b3                                                         ; 85af: 90 02       ..
    inc l003a                                                         ; 85b1: e6 3a       .:
.c85b3
    jmp c84d1                                                         ; 85b3: 4c d1 84    L..

.sub_c85b6
    lda l0000,x                                                       ; 85b6: b5 00       ..
    pha                                                               ; 85b8: 48          H
    lda l0000,y                                                       ; 85b9: b9 00 00    ...
    sta l0000,x                                                       ; 85bc: 95 00       ..
    pla                                                               ; 85be: 68          h
    sta l0000,y                                                       ; 85bf: 99 00 00    ...
    lda l0001,x                                                       ; 85c2: b5 01       ..
    pha                                                               ; 85c4: 48          H
    lda l0001,y                                                       ; 85c5: b9 01 00    ...
    sta l0001,x                                                       ; 85c8: 95 01       ..
    pla                                                               ; 85ca: 68          h
    sta l0001,y                                                       ; 85cb: 99 01 00    ...
    rts                                                               ; 85ce: 60          `

.sub_c85cf
    lda l0000,x                                                       ; 85cf: b5 00       ..
    cmp l0000,y                                                       ; 85d1: d9 00 00    ...
    bne c85ee                                                         ; 85d4: d0 18       ..
    lda l0001,x                                                       ; 85d6: b5 01       ..
    cmp l0001,y                                                       ; 85d8: d9 01 00    ...
    bne c85ee                                                         ; 85db: d0 11       ..
    lda l0002,x                                                       ; 85dd: b5 02       ..
    cmp l0002,y                                                       ; 85df: d9 02 00    ...
    bne c85ee                                                         ; 85e2: d0 0a       ..
    lda l0003,x                                                       ; 85e4: b5 03       ..
    cmp l0003,y                                                       ; 85e6: d9 03 00    ...
    bne c85ee                                                         ; 85e9: d0 03       ..
    lda #0                                                            ; 85eb: a9 00       ..
    rts                                                               ; 85ed: 60          `

.c85ee
    lda #&ff                                                          ; 85ee: a9 ff       ..
    rts                                                               ; 85f0: 60          `

.sub_c85f1
    lda l0000,x                                                       ; 85f1: b5 00       ..
    sta l0000,y                                                       ; 85f3: 99 00 00    ...
    lda l0001,x                                                       ; 85f6: b5 01       ..
    sta l0001,y                                                       ; 85f8: 99 01 00    ...
    lda l0002,x                                                       ; 85fb: b5 02       ..
    sta l0002,y                                                       ; 85fd: 99 02 00    ...
    lda l0003,x                                                       ; 8600: b5 03       ..
    sta l0003,y                                                       ; 8602: 99 03 00    ...
    rts                                                               ; 8605: 60          `

.sub_c8606
    pha                                                               ; 8606: 48          H
    lda #&19                                                          ; 8607: a9 19       ..
    jsr oswrch                                                        ; 8609: 20 ee ff     ..            ; Write character 25
    pla                                                               ; 860c: 68          h
    jmp oswrch                                                        ; 860d: 4c ee ff    L..            ; Write character

.our_osword_1_x17_handler
    lda #4                                                            ; 8610: a9 04       ..
    jsr oswrch                                                        ; 8612: 20 ee ff     ..            ; Write character 4
    lda #0                                                            ; 8615: a9 00       ..
    sta l0049                                                         ; 8617: 85 49       .I
    sta l004a                                                         ; 8619: 85 4a       .J
    sta l0047                                                         ; 861b: 85 47       .G
    lda #&26 ; '&'                                                    ; 861d: a9 26       .&
    sta l0048                                                         ; 861f: 85 48       .H
    ldx #&0a                                                          ; 8621: a2 0a       ..
    ldy #&ff                                                          ; 8623: a0 ff       ..
.c8625
    lda (l0047),y                                                     ; 8625: b1 47       .G
    eor l0049                                                         ; 8627: 45 49       EI
    sta l0049                                                         ; 8629: 85 49       .I
    asl l0049                                                         ; 862b: 06 49       .I
    rol l004a                                                         ; 862d: 26 4a       &J
    lda l0049                                                         ; 862f: a5 49       .I
    adc #0                                                            ; 8631: 69 00       i.
    sta l0049                                                         ; 8633: 85 49       .I
    dey                                                               ; 8635: 88          .
    bne c8625                                                         ; 8636: d0 ed       ..
    inc l0048                                                         ; 8638: e6 48       .H
    dex                                                               ; 863a: ca          .
    bne c8625                                                         ; 863b: d0 e8       ..
    lda #0                                                            ; 863d: a9 00       ..
    sta l005b                                                         ; 863f: 85 5b       .[
    sta l005c                                                         ; 8641: 85 5c       .\
    sta l005d                                                         ; 8643: 85 5d       .]
    jmp c8d31                                                         ; 8645: 4c 31 8d    L1.

    equb &a5                                                          ; 8648: a5          .
    equs "IEJ"                                                        ; 8649: 49 45 4a    IEJ
    equb &c9, &10, &d0, &fe, &a9, &1e, &18, &65, &49, &85, &49, &a9   ; 864c: c9 10 d0... ...
    equb &8a, &18, &65, &4a, &85                                      ; 8658: 8a 18 65... ..e
    equs "JlI"                                                        ; 865d: 4a 6c 49    JlI
    equb 0                                                            ; 8660: 00          .

.our_osword_1_x23_handler
    lda #&71 ; 'q'                                                    ; 8661: a9 71       .q
    sta l0004                                                         ; 8663: 85 04       ..
    lda #&86                                                          ; 8665: a9 86       ..
    sta l0005                                                         ; 8667: 85 05       ..
    ldy #1                                                            ; 8669: a0 01       ..
    ldx l8671                                                         ; 866b: ae 71 86    .q.
    jmp c8369                                                         ; 866e: 4c 69 83    Li.

.l8671
    equb &18, &0d, &0a, &0a                                           ; 8671: 18 0d 0a... ...
    equs "       Press <CANCEL>"                                      ; 8675: 20 20 20...
    equb &0d                                                          ; 868a: 0d          .

.our_osword_1_x11_handler
    lda #0                                                            ; 868b: a9 00       ..
    sta l192b                                                         ; 868d: 8d 2b 19    .+.
    jsr sub_c8843                                                     ; 8690: 20 43 88     C.
    bcc c869b                                                         ; 8693: 90 06       ..
    lda #0                                                            ; 8695: a9 00       ..
    sta l192b                                                         ; 8697: 8d 2b 19    .+.
    rts                                                               ; 869a: 60          `

.c869b
    sec                                                               ; 869b: 38          8
    sbc l1920                                                         ; 869c: ed 20 19    . .
    cmp #8                                                            ; 869f: c9 08       ..
    bne c86b3                                                         ; 86a1: d0 10       ..
    ldy #6                                                            ; 86a3: a0 06       ..
    sty osbyte_osword_y                                               ; 86a5: 84 f1       ..
    jsr our_osword_1_x5_handler                                       ; 86a7: 20 96 82     ..
    jsr sub_c8922                                                     ; 86aa: 20 22 89     ".
    lda #1                                                            ; 86ad: a9 01       ..
    sta l192b                                                         ; 86af: 8d 2b 19    .+.
    rts                                                               ; 86b2: 60          `

.c86b3
    lda l191f                                                         ; 86b3: ad 1f 19    ...
    clc                                                               ; 86b6: 18          .
    adc #7                                                            ; 86b7: 69 07       i.
    jsr sub_c8867                                                     ; 86b9: 20 67 88     g.
    bcc c86c4                                                         ; 86bc: 90 06       ..
    lda #&ff                                                          ; 86be: a9 ff       ..
    sta l192b                                                         ; 86c0: 8d 2b 19    .+.
    rts                                                               ; 86c3: 60          `

.c86c4
    sta l1928                                                         ; 86c4: 8d 28 19    .(.
    lda #&4b ; 'K'                                                    ; 86c7: a9 4b       .K
    sta l1927                                                         ; 86c9: 8d 27 19    .'.
    lda #&80                                                          ; 86cc: a9 80       ..
    sta l1922                                                         ; 86ce: 8d 22 19    .".
    lda #&37 ; '7'                                                    ; 86d1: a9 37       .7
    sta l1923                                                         ; 86d3: 8d 23 19    .#.
    lda l1915                                                         ; 86d6: ad 15 19    ...
    sta l3780                                                         ; 86d9: 8d 80 37    ..7
    lda l1916                                                         ; 86dc: ad 16 19    ...
    sta l3781                                                         ; 86df: 8d 81 37    ..7
    jsr sub_c8934                                                     ; 86e2: 20 34 89     4.
    lda l192b                                                         ; 86e5: ad 2b 19    .+.
    beq c86f0                                                         ; 86e8: f0 06       ..
    lda #&ff                                                          ; 86ea: a9 ff       ..
    sta l192b                                                         ; 86ec: 8d 2b 19    .+.
    rts                                                               ; 86ef: 60          `

.c86f0
    lda #&a0                                                          ; 86f0: a9 a0       ..
    sta l3780                                                         ; 86f2: 8d 80 37    ..7
    lda #&60 ; '`'                                                    ; 86f5: a9 60       .`
    sta l3781                                                         ; 86f7: 8d 81 37    ..7
    lda #&98                                                          ; 86fa: a9 98       ..
    sta l0008                                                         ; 86fc: 85 08       ..
    sta l000c                                                         ; 86fe: 85 0c       ..
    lda #&41 ; 'A'                                                    ; 8700: a9 41       .A
    sta l000d                                                         ; 8702: 85 0d       ..
    lda #&37 ; '7'                                                    ; 8704: a9 37       .7
    sta l0009                                                         ; 8706: 85 09       ..
    lda #&18                                                          ; 8708: a9 18       ..
    sta l0023                                                         ; 870a: 85 23       .#
.c870c
    ldx #&48 ; 'H'                                                    ; 870c: a2 48       .H
.c870e
    ldy #7                                                            ; 870e: a0 07       ..
.loop_c8710
    lda (l000c),y                                                     ; 8710: b1 0c       ..
    sta (l0008),y                                                     ; 8712: 91 08       ..
    dey                                                               ; 8714: 88          .
    bpl loop_c8710                                                    ; 8715: 10 f9       ..
    lda l0008                                                         ; 8717: a5 08       ..
    clc                                                               ; 8719: 18          .
    adc #8                                                            ; 871a: 69 08       i.
    sta l0008                                                         ; 871c: 85 08       ..
    bcc c8722                                                         ; 871e: 90 02       ..
    inc l0009                                                         ; 8720: e6 09       ..
.c8722
    lda l000c                                                         ; 8722: a5 0c       ..
    clc                                                               ; 8724: 18          .
    adc #8                                                            ; 8725: 69 08       i.
    sta l000c                                                         ; 8727: 85 0c       ..
    bcc c872d                                                         ; 8729: 90 02       ..
    inc l000d                                                         ; 872b: e6 0d       ..
.c872d
    dex                                                               ; 872d: ca          .
    bne c870e                                                         ; 872e: d0 de       ..
    lda l0008                                                         ; 8730: a5 08       ..
    clc                                                               ; 8732: 18          .
    adc #&40 ; '@'                                                    ; 8733: 69 40       i@
    sta l0008                                                         ; 8735: 85 08       ..
    bcc c873b                                                         ; 8737: 90 02       ..
    inc l0009                                                         ; 8739: e6 09       ..
.c873b
    lda l000c                                                         ; 873b: a5 0c       ..
    clc                                                               ; 873d: 18          .
    adc #&40 ; '@'                                                    ; 873e: 69 40       i@
    sta l000c                                                         ; 8740: 85 0c       ..
    bcc c8746                                                         ; 8742: 90 02       ..
    inc l000d                                                         ; 8744: e6 0d       ..
.c8746
    dec l0023                                                         ; 8746: c6 23       .#
    bne c870c                                                         ; 8748: d0 c2       ..
    lda #&73 ; 's'                                                    ; 874a: a9 73       .s
    sta l0009                                                         ; 874c: 85 09       ..
    jsr sub_c88a2                                                     ; 874e: 20 a2 88     ..
    inc l191f                                                         ; 8751: ee 1f 19    ...
    jsr sub_c88f1                                                     ; 8754: 20 f1 88     ..
    sbc #&20 ; ' '                                                    ; 8757: e9 20       .
    jsr sub_c8912                                                     ; 8759: 20 12 89     ..
    rts                                                               ; 875c: 60          `

.our_osword_1_x12_handler
    lda #0                                                            ; 875d: a9 00       ..
    sta l192b                                                         ; 875f: 8d 2b 19    .+.
    jsr sub_c8843                                                     ; 8762: 20 43 88     C.
    bcc c876d                                                         ; 8765: 90 06       ..
    lda #0                                                            ; 8767: a9 00       ..
    sta l192b                                                         ; 8769: 8d 2b 19    .+.
    rts                                                               ; 876c: 60          `

.c876d
    cmp l1920                                                         ; 876d: cd 20 19    . .
    bne c8782                                                         ; 8770: d0 10       ..
    ldy #6                                                            ; 8772: a0 06       ..
    sty osbyte_osword_y                                               ; 8774: 84 f1       ..
    jsr our_osword_1_x5_handler                                       ; 8776: 20 96 82     ..
    jsr sub_c8922                                                     ; 8779: 20 22 89     ".
    lda #1                                                            ; 877c: a9 01       ..
    sta l192b                                                         ; 877e: 8d 2b 19    .+.
    rts                                                               ; 8781: 60          `

.c8782
    lda l191f                                                         ; 8782: ad 1f 19    ...
    sec                                                               ; 8785: 38          8
    sbc #1                                                            ; 8786: e9 01       ..
    jsr sub_c8867                                                     ; 8788: 20 67 88     g.
    bcc c8793                                                         ; 878b: 90 06       ..
    lda #&ff                                                          ; 878d: a9 ff       ..
    sta l192b                                                         ; 878f: 8d 2b 19    .+.
    rts                                                               ; 8792: 60          `

.c8793
    clc                                                               ; 8793: 18          .
    adc #6                                                            ; 8794: 69 06       i.
    sta l1928                                                         ; 8796: 8d 28 19    .(.
    lda #&4b ; 'K'                                                    ; 8799: a9 4b       .K
    sta l1927                                                         ; 879b: 8d 27 19    .'.
    lda #&80                                                          ; 879e: a9 80       ..
    sta l1922                                                         ; 87a0: 8d 22 19    .".
    lda #&73 ; 's'                                                    ; 87a3: a9 73       .s
    sta l1923                                                         ; 87a5: 8d 23 19    .#.
    lda l1915                                                         ; 87a8: ad 15 19    ...
    sta l7380                                                         ; 87ab: 8d 80 73    ..s
    lda l1916                                                         ; 87ae: ad 16 19    ...
    sta l7381                                                         ; 87b1: 8d 81 73    ..s
    jsr sub_c8934                                                     ; 87b4: 20 34 89     4.
    lda l192b                                                         ; 87b7: ad 2b 19    .+.
    beq c87c2                                                         ; 87ba: f0 06       ..
    lda #&ff                                                          ; 87bc: a9 ff       ..
    sta l192b                                                         ; 87be: 8d 2b 19    .+.
    rts                                                               ; 87c1: 60          `

.c87c2
    lda #&a0                                                          ; 87c2: a9 a0       ..
    sta l7380                                                         ; 87c4: 8d 80 73    ..s
    lda #&60 ; '`'                                                    ; 87c7: a9 60       .`
    sta l7381                                                         ; 87c9: 8d 81 73    ..s
    lda #&18                                                          ; 87cc: a9 18       ..
    sta l0008                                                         ; 87ce: 85 08       ..
    sta l000c                                                         ; 87d0: 85 0c       ..
    lda #&71 ; 'q'                                                    ; 87d2: a9 71       .q
    sta l000d                                                         ; 87d4: 85 0d       ..
    lda #&7b ; '{'                                                    ; 87d6: a9 7b       .{
    sta l0009                                                         ; 87d8: 85 09       ..
    lda #&18                                                          ; 87da: a9 18       ..
    sta l0023                                                         ; 87dc: 85 23       .#
.c87de
    ldx #&48 ; 'H'                                                    ; 87de: a2 48       .H
.c87e0
    ldy #7                                                            ; 87e0: a0 07       ..
.loop_c87e2
    lda (l000c),y                                                     ; 87e2: b1 0c       ..
    sta (l0008),y                                                     ; 87e4: 91 08       ..
    dey                                                               ; 87e6: 88          .
    bpl loop_c87e2                                                    ; 87e7: 10 f9       ..
    lda l0008                                                         ; 87e9: a5 08       ..
    clc                                                               ; 87eb: 18          .
    adc #8                                                            ; 87ec: 69 08       i.
    sta l0008                                                         ; 87ee: 85 08       ..
    bcc c87f4                                                         ; 87f0: 90 02       ..
    inc l0009                                                         ; 87f2: e6 09       ..
.c87f4
    lda l000c                                                         ; 87f4: a5 0c       ..
    clc                                                               ; 87f6: 18          .
    adc #8                                                            ; 87f7: 69 08       i.
    sta l000c                                                         ; 87f9: 85 0c       ..
    bcc c87ff                                                         ; 87fb: 90 02       ..
    inc l000d                                                         ; 87fd: e6 0d       ..
.c87ff
    dex                                                               ; 87ff: ca          .
    bne c87e0                                                         ; 8800: d0 de       ..
    lda l0008                                                         ; 8802: a5 08       ..
    clc                                                               ; 8804: 18          .
    adc #&40 ; '@'                                                    ; 8805: 69 40       i@
    sta l0008                                                         ; 8807: 85 08       ..
    bcc c880d                                                         ; 8809: 90 02       ..
    inc l0009                                                         ; 880b: e6 09       ..
.c880d
    dec l0009                                                         ; 880d: c6 09       ..
    dec l0009                                                         ; 880f: c6 09       ..
    dec l0009                                                         ; 8811: c6 09       ..
    dec l0009                                                         ; 8813: c6 09       ..
    dec l0009                                                         ; 8815: c6 09       ..
    lda l000c                                                         ; 8817: a5 0c       ..
    clc                                                               ; 8819: 18          .
    adc #&40 ; '@'                                                    ; 881a: 69 40       i@
    sta l000c                                                         ; 881c: 85 0c       ..
    bcc c8822                                                         ; 881e: 90 02       ..
    inc l000d                                                         ; 8820: e6 0d       ..
.c8822
    dec l000d                                                         ; 8822: c6 0d       ..
    dec l000d                                                         ; 8824: c6 0d       ..
    dec l000d                                                         ; 8826: c6 0d       ..
    dec l000d                                                         ; 8828: c6 0d       ..
    dec l000d                                                         ; 882a: c6 0d       ..
    dec l0023                                                         ; 882c: c6 23       .#
    bne c87de                                                         ; 882e: d0 ae       ..
    lda #&37 ; '7'                                                    ; 8830: a9 37       .7
    sta l0009                                                         ; 8832: 85 09       ..
    jsr sub_c88a2                                                     ; 8834: 20 a2 88     ..
    dec l191f                                                         ; 8837: ce 1f 19    ...
    jsr sub_c88f1                                                     ; 883a: 20 f1 88     ..
    sbc #&24 ; '$'                                                    ; 883d: e9 24       .$
    jsr sub_c8912                                                     ; 883f: 20 12 89     ..
    rts                                                               ; 8842: 60          `

.sub_c8843
    jsr sub_c897d                                                     ; 8843: 20 7d 89     }.
    bcs c8866                                                         ; 8846: b0 1e       ..
    lda l191e                                                         ; 8848: ad 1e 19    ...
    sta l1921                                                         ; 884b: 8d 21 19    .!.
    lda #0                                                            ; 884e: a9 00       ..
    sta l1922                                                         ; 8850: 8d 22 19    .".
    lda #&26 ; '&'                                                    ; 8853: a9 26       .&
    sta l1923                                                         ; 8855: 8d 23 19    .#.
    lda #&2a ; '*'                                                    ; 8858: a9 2a       .*
    sta l192a                                                         ; 885a: 8d 2a 19    .*.
    lda #0                                                            ; 885d: a9 00       ..
    sta l1929                                                         ; 885f: 8d 29 19    .).
    lda l191f                                                         ; 8862: ad 1f 19    ...
    clc                                                               ; 8865: 18          .
.c8866
    rts                                                               ; 8866: 60          `

.sub_c8867
    sta l1928                                                         ; 8867: 8d 28 19    .(.
    lda #0                                                            ; 886a: a9 00       ..
    sta l1922                                                         ; 886c: 8d 22 19    .".
    lda #&26 ; '&'                                                    ; 886f: a9 26       .&
    sta l1923                                                         ; 8871: 8d 23 19    .#.
    lda #&53 ; 'S'                                                    ; 8874: a9 53       .S
    sta l1927                                                         ; 8876: 8d 27 19    .'.
    jsr sub_c8934                                                     ; 8879: 20 34 89     4.
    lda l1912                                                         ; 887c: ad 12 19    ...
    beq c8891                                                         ; 887f: f0 10       ..
    lda l2600                                                         ; 8881: ad 00 26    ..&
    cmp l1915                                                         ; 8884: cd 15 19    ...
    bne c8891                                                         ; 8887: d0 08       ..
    lda l2601                                                         ; 8889: ad 01 26    ..&
    cmp l1916                                                         ; 888c: cd 16 19    ...
    beq c889d                                                         ; 888f: f0 0c       ..
.c8891
    ldy #2                                                            ; 8891: a0 02       ..
    sty osbyte_osword_y                                               ; 8893: 84 f1       ..
    jsr our_osword_1_x5_handler                                       ; 8895: 20 96 82     ..
    jsr sub_c8922                                                     ; 8898: 20 22 89     ".
    sec                                                               ; 889b: 38          8
    rts                                                               ; 889c: 60          `

.c889d
    lda l191f                                                         ; 889d: ad 1f 19    ...
    clc                                                               ; 88a0: 18          .
    rts                                                               ; 88a1: 60          `

.sub_c88a2
    lda #&26 ; '&'                                                    ; 88a2: a9 26       .&
    sta l000d                                                         ; 88a4: 85 0d       ..
    lda #&18                                                          ; 88a6: a9 18       ..
    sta l000c                                                         ; 88a8: 85 0c       ..
    lda #&98                                                          ; 88aa: a9 98       ..
    sta l0008                                                         ; 88ac: 85 08       ..
    lda #4                                                            ; 88ae: a9 04       ..
    sta l0023                                                         ; 88b0: 85 23       .#
.c88b2
    ldx #&48 ; 'H'                                                    ; 88b2: a2 48       .H
.c88b4
    ldy #7                                                            ; 88b4: a0 07       ..
.loop_c88b6
    lda (l000c),y                                                     ; 88b6: b1 0c       ..
    sta (l0008),y                                                     ; 88b8: 91 08       ..
    dey                                                               ; 88ba: 88          .
    bpl loop_c88b6                                                    ; 88bb: 10 f9       ..
    lda l0008                                                         ; 88bd: a5 08       ..
    clc                                                               ; 88bf: 18          .
    adc #8                                                            ; 88c0: 69 08       i.
    sta l0008                                                         ; 88c2: 85 08       ..
    bcc c88c8                                                         ; 88c4: 90 02       ..
    inc l0009                                                         ; 88c6: e6 09       ..
.c88c8
    lda l000c                                                         ; 88c8: a5 0c       ..
    clc                                                               ; 88ca: 18          .
    adc #8                                                            ; 88cb: 69 08       i.
    sta l000c                                                         ; 88cd: 85 0c       ..
    bcc c88d3                                                         ; 88cf: 90 02       ..
    inc l000d                                                         ; 88d1: e6 0d       ..
.c88d3
    dex                                                               ; 88d3: ca          .
    bne c88b4                                                         ; 88d4: d0 de       ..
    lda l0008                                                         ; 88d6: a5 08       ..
    clc                                                               ; 88d8: 18          .
    adc #&40 ; '@'                                                    ; 88d9: 69 40       i@
    sta l0008                                                         ; 88db: 85 08       ..
    bcc c88e1                                                         ; 88dd: 90 02       ..
    inc l0009                                                         ; 88df: e6 09       ..
.c88e1
    lda l000c                                                         ; 88e1: a5 0c       ..
    clc                                                               ; 88e3: 18          .
    adc #&40 ; '@'                                                    ; 88e4: 69 40       i@
    sta l000c                                                         ; 88e6: 85 0c       ..
    bcc c88ec                                                         ; 88e8: 90 02       ..
    inc l000d                                                         ; 88ea: e6 0d       ..
.c88ec
    dec l0023                                                         ; 88ec: c6 23       .#
    bne c88b2                                                         ; 88ee: d0 c2       ..
    rts                                                               ; 88f0: 60          `

.sub_c88f1
    lda #&19                                                          ; 88f1: a9 19       ..
    jsr oswrch                                                        ; 88f3: 20 ee ff     ..            ; Write character 25
    lda #4                                                            ; 88f6: a9 04       ..
    jsr oswrch                                                        ; 88f8: 20 ee ff     ..            ; Write character 4
    lda #&d0                                                          ; 88fb: a9 d0       ..
    jsr oswrch                                                        ; 88fd: 20 ee ff     ..            ; Write character 208
    lda #4                                                            ; 8900: a9 04       ..
    jsr oswrch                                                        ; 8902: 20 ee ff     ..            ; Write character 4
    lda l191f                                                         ; 8905: ad 1f 19    ...
    sec                                                               ; 8908: 38          8
    sbc l1920                                                         ; 8909: ed 20 19    . .
    asl a                                                             ; 890c: 0a          .
    asl a                                                             ; 890d: 0a          .
    eor #&ff                                                          ; 890e: 49 ff       I.
    sec                                                               ; 8910: 38          8
    rts                                                               ; 8911: 60          `

.sub_c8912
    jsr oswrch                                                        ; 8912: 20 ee ff     ..            ; Write character
    lda #0                                                            ; 8915: a9 00       ..
    jsr oswrch                                                        ; 8917: 20 ee ff     ..            ; Write character 0
    ldx #&33 ; '3'                                                    ; 891a: a2 33       .3
    ldy #&96                                                          ; 891c: a0 96       ..
    jsr c835f                                                         ; 891e: 20 5f 83     _.
    rts                                                               ; 8921: 60          `

.sub_c8922
    lda #8                                                            ; 8922: a9 08       ..
    ldx #0                                                            ; 8924: a2 00       ..
    ldy #0                                                            ; 8926: a0 00       ..
.c8928
    dey                                                               ; 8928: 88          .
    bne c8928                                                         ; 8929: d0 fd       ..
    dex                                                               ; 892b: ca          .
    bne c8928                                                         ; 892c: d0 fa       ..
    sec                                                               ; 892e: 38          8
    sbc #1                                                            ; 892f: e9 01       ..
    bne c8928                                                         ; 8931: d0 f5       ..
    rts                                                               ; 8933: 60          `

.sub_c8934
    lda #&0a                                                          ; 8934: a9 0a       ..
    sta l1912                                                         ; 8936: 8d 12 19    ...
.c8939
    lda #&7f                                                          ; 8939: a9 7f       ..
    ldx #<(l1921)                                                     ; 893b: a2 21       .!
    ldy #>(l1921)                                                     ; 893d: a0 19       ..
    jsr osword                                                        ; 893f: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    lda l192b                                                         ; 8942: ad 2b 19    .+.
    beq c897c                                                         ; 8945: f0 35       .5
    lda l1927                                                         ; 8947: ad 27 19    .'.
    pha                                                               ; 894a: 48          H
    lda l1928                                                         ; 894b: ad 28 19    .(.
    pha                                                               ; 894e: 48          H
    lda l1926                                                         ; 894f: ad 26 19    .&.
    pha                                                               ; 8952: 48          H
    lda #&69 ; 'i'                                                    ; 8953: a9 69       .i
    sta l1927                                                         ; 8955: 8d 27 19    .'.
    lda #0                                                            ; 8958: a9 00       ..
    sta l1928                                                         ; 895a: 8d 28 19    .(.
    lda #1                                                            ; 895d: a9 01       ..
    sta l1926                                                         ; 895f: 8d 26 19    .&.
    ldx #<(l1921)                                                     ; 8962: a2 21       .!
    ldy #>(l1921)                                                     ; 8964: a0 19       ..
    lda #&7f                                                          ; 8966: a9 7f       ..
    jsr osword                                                        ; 8968: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    pla                                                               ; 896b: 68          h
    sta l1926                                                         ; 896c: 8d 26 19    .&.
    pla                                                               ; 896f: 68          h
    sta l1928                                                         ; 8970: 8d 28 19    .(.
    pla                                                               ; 8973: 68          h
    sta l1927                                                         ; 8974: 8d 27 19    .'.
    dec l1912                                                         ; 8977: ce 12 19    ...
    bne c8939                                                         ; 897a: d0 bd       ..
.c897c
    rts                                                               ; 897c: 60          `

.sub_c897d
    lda l1911                                                         ; 897d: ad 11 19    ...
    clc                                                               ; 8980: 18          .
    beq c899c                                                         ; 8981: f0 19       ..
    ldy #&0f                                                          ; 8983: a0 0f       ..
    sty osbyte_osword_y                                               ; 8985: 84 f1       ..
    jsr our_osword_1_x5_handler                                       ; 8987: 20 96 82     ..
    lda #6                                                            ; 898a: a9 06       ..
.loop_c898c
    ldy #0                                                            ; 898c: a0 00       ..
.loop_c898e
    ldx #0                                                            ; 898e: a2 00       ..
.loop_c8990
    dex                                                               ; 8990: ca          .
    bne loop_c8990                                                    ; 8991: d0 fd       ..
    dey                                                               ; 8993: 88          .
    bne loop_c898e                                                    ; 8994: d0 f8       ..
    sec                                                               ; 8996: 38          8
    sbc #1                                                            ; 8997: e9 01       ..
    bne loop_c898c                                                    ; 8999: d0 f1       ..
    sec                                                               ; 899b: 38          8
.c899c
    rts                                                               ; 899c: 60          `

.our_osword_1_x13_handler
    ldx #&0b                                                          ; 899d: a2 0b       ..
.loop_c899f
    lda l0300,x                                                       ; 899f: bd 00 03    ...
    sta l09f0,x                                                       ; 89a2: 9d f0 09    ...
    dex                                                               ; 89a5: ca          .
    bpl loop_c899f                                                    ; 89a6: 10 f7       ..
    lda #4                                                            ; 89a8: a9 04       ..
    jsr oswrch                                                        ; 89aa: 20 ee ff     ..            ; Write character 4
    lda #&1a                                                          ; 89ad: a9 1a       ..
    jsr oswrch                                                        ; 89af: 20 ee ff     ..            ; Write character 26
    jsr our_osword_1_x0_handler                                       ; 89b2: 20 a0 80     ..
    ldx #&88                                                          ; 89b5: a2 88       ..
    ldy #&8b                                                          ; 89b7: a0 8b       ..
    jsr c8c72                                                         ; 89b9: 20 72 8c     r.
    lda #&10                                                          ; 89bc: a9 10       ..
    sta l0052                                                         ; 89be: 85 52       .R
    lda #&a2                                                          ; 89c0: a9 a2       ..
    sta l0053                                                         ; 89c2: 85 53       .S
    ldy #0                                                            ; 89c4: a0 00       ..
.loop_c89c6
    lda (l0052),y                                                     ; 89c6: b1 52       .R
    cmp #&88                                                          ; 89c8: c9 88       ..
    beq c89dd                                                         ; 89ca: f0 11       ..
    jsr oswrch                                                        ; 89cc: 20 ee ff     ..            ; Write character
    lda l0052                                                         ; 89cf: a5 52       .R
    clc                                                               ; 89d1: 18          .
    adc #1                                                            ; 89d2: 69 01       i.
    sta l0052                                                         ; 89d4: 85 52       .R
    bcc c89da                                                         ; 89d6: 90 02       ..
    inc l0053                                                         ; 89d8: e6 53       .S
.c89da
    jmp loop_c89c6                                                    ; 89da: 4c c6 89    L..

.c89dd
    lda #&1f                                                          ; 89dd: a9 1f       ..
    jsr oswrch                                                        ; 89df: 20 ee ff     ..            ; Write character 31
    lda #&1c                                                          ; 89e2: a9 1c       ..
    jsr oswrch                                                        ; 89e4: 20 ee ff     ..            ; Write character 28
    lda #&0c                                                          ; 89e7: a9 0c       ..
    jsr oswrch                                                        ; 89e9: 20 ee ff     ..            ; Write character 12
    ldy #0                                                            ; 89ec: a0 00       ..
.loop_c89ee
    lda l199d,y                                                       ; 89ee: b9 9d 19    ...
    jsr oswrch                                                        ; 89f1: 20 ee ff     ..            ; Write character
    iny                                                               ; 89f4: c8          .
    cpy #&10                                                          ; 89f5: c0 10       ..
    bne loop_c89ee                                                    ; 89f7: d0 f5       ..
    lda #&1f                                                          ; 89f9: a9 1f       ..
    jsr oswrch                                                        ; 89fb: 20 ee ff     ..            ; Write character 31
    lda #&1c                                                          ; 89fe: a9 1c       ..
    jsr oswrch                                                        ; 8a00: 20 ee ff     ..            ; Write character 28
    lda #&0e                                                          ; 8a03: a9 0e       ..
    jsr oswrch                                                        ; 8a05: 20 ee ff     ..            ; Write character 14
    ldy #0                                                            ; 8a08: a0 00       ..
.loop_c8a0a
    lda l19ad,y                                                       ; 8a0a: b9 ad 19    ...
    jsr oswrch                                                        ; 8a0d: 20 ee ff     ..            ; Write character
    iny                                                               ; 8a10: c8          .
    cpy #&10                                                          ; 8a11: c0 10       ..
    bne loop_c8a0a                                                    ; 8a13: d0 f5       ..
    lda l1917                                                         ; 8a15: ad 17 19    ...
    beq c8a21                                                         ; 8a18: f0 07       ..
    ldx #4                                                            ; 8a1a: a2 04       ..
    ldy #2                                                            ; 8a1c: a0 02       ..
    jsr sub_c8b98                                                     ; 8a1e: 20 98 8b     ..
.c8a21
    ldy #2                                                            ; 8a21: a0 02       ..
    ldx l1913                                                         ; 8a23: ae 13 19    ...
    inx                                                               ; 8a26: e8          .
    jsr sub_c8b98                                                     ; 8a27: 20 98 8b     ..
    ldy #1                                                            ; 8a2a: a0 01       ..
    lda #1                                                            ; 8a2c: a9 01       ..
    clc                                                               ; 8a2e: 18          .
    adc l1972                                                         ; 8a2f: 6d 72 19    mr.
    tax                                                               ; 8a32: aa          .
    jsr sub_c8b98                                                     ; 8a33: 20 98 8b     ..
    ldy #1                                                            ; 8a36: a0 01       ..
    lda #3                                                            ; 8a38: a9 03       ..
    clc                                                               ; 8a3a: 18          .
    adc l1970                                                         ; 8a3b: 6d 70 19    mp.
    tax                                                               ; 8a3e: aa          .
    jsr sub_c8b98                                                     ; 8a3f: 20 98 8b     ..
    ldy #0                                                            ; 8a42: a0 00       ..
    ldx l1964                                                         ; 8a44: ae 64 19    .d.
    jsr sub_c8b98                                                     ; 8a47: 20 98 8b     ..
    ldy #0                                                            ; 8a4a: a0 00       ..
    ldx l1963                                                         ; 8a4c: ae 63 19    .c.
    inx                                                               ; 8a4f: e8          .
    inx                                                               ; 8a50: e8          .
    inx                                                               ; 8a51: e8          .
    jsr sub_c8b98                                                     ; 8a52: 20 98 8b     ..
.c8a55
    jsr sub_c91a5                                                     ; 8a55: 20 a5 91     ..
    jsr c8c01                                                         ; 8a58: 20 01 8c     ..
    lda l002a                                                         ; 8a5b: a5 2a       .*
    and #&80                                                          ; 8a5d: 29 80       ).
    bne c8a78                                                         ; 8a5f: d0 17       ..
    jsr sub_c9190                                                     ; 8a61: 20 90 91     ..
    jsr our_osword_1_x1_handler                                       ; 8a64: 20 0f 81     ..
    ldx #&0b                                                          ; 8a67: a2 0b       ..
.loop_c8a69
    lda l09f0,x                                                       ; 8a69: bd f0 09    ...
    sta l0300,x                                                       ; 8a6c: 9d 00 03    ...
    dex                                                               ; 8a6f: ca          .
    bpl loop_c8a69                                                    ; 8a70: 10 f7       ..
    lda #0                                                            ; 8a72: a9 00       ..
    sta l1978                                                         ; 8a74: 8d 78 19    .x.
    rts                                                               ; 8a77: 60          `

.c8a78
    lda l002a                                                         ; 8a78: a5 2a       .*
    and #&20 ; ' '                                                    ; 8a7a: 29 20       )
    bne c8a55                                                         ; 8a7c: d0 d7       ..
    lda l0029                                                         ; 8a7e: a5 29       .)
    cmp #&10                                                          ; 8a80: c9 10       ..
    bne c8ad7                                                         ; 8a82: d0 53       .S
    lda l0028                                                         ; 8a84: a5 28       .(
    sec                                                               ; 8a86: 38          8
    sbc #&1e                                                          ; 8a87: e9 1e       ..
    sta l0052                                                         ; 8a89: 85 52       .R
    and #2                                                            ; 8a8b: 29 02       ).
    bne c8ad4                                                         ; 8a8d: d0 45       .E
    lda l0052                                                         ; 8a8f: a5 52       .R
    lsr a                                                             ; 8a91: 4a          J
    lsr a                                                             ; 8a92: 4a          J
    sec                                                               ; 8a93: 38          8
    sbc #1                                                            ; 8a94: e9 01       ..
    cmp #3                                                            ; 8a96: c9 03       ..
    bne c8ab8                                                         ; 8a98: d0 1e       ..
    jsr sub_c9190                                                     ; 8a9a: 20 90 91     ..
    ldx #4                                                            ; 8a9d: a2 04       ..
    ldy #2                                                            ; 8a9f: a0 02       ..
    jsr sub_c8b98                                                     ; 8aa1: 20 98 8b     ..
    lda l1917                                                         ; 8aa4: ad 17 19    ...
    eor #1                                                            ; 8aa7: 49 01       I.
    sta l1917                                                         ; 8aa9: 8d 17 19    ...
.loop_c8aac
    jsr c8c01                                                         ; 8aac: 20 01 8c     ..
    lda l002a                                                         ; 8aaf: a5 2a       .*
    and #&20 ; ' '                                                    ; 8ab1: 29 20       )
    beq loop_c8aac                                                    ; 8ab3: f0 f7       ..
    jmp c8b85                                                         ; 8ab5: 4c 85 8b    L..

.c8ab8
    cmp #3                                                            ; 8ab8: c9 03       ..
    bcs c8ad4                                                         ; 8aba: b0 18       ..
    pha                                                               ; 8abc: 48          H
    jsr sub_c9190                                                     ; 8abd: 20 90 91     ..
    ldy #2                                                            ; 8ac0: a0 02       ..
    ldx l1913                                                         ; 8ac2: ae 13 19    ...
    inx                                                               ; 8ac5: e8          .
    jsr sub_c8b98                                                     ; 8ac6: 20 98 8b     ..
    pla                                                               ; 8ac9: 68          h
    sta l1913                                                         ; 8aca: 8d 13 19    ...
    ldy #2                                                            ; 8acd: a0 02       ..
    tax                                                               ; 8acf: aa          .
    inx                                                               ; 8ad0: e8          .
    jsr sub_c8b98                                                     ; 8ad1: 20 98 8b     ..
.c8ad4
    jmp c8b85                                                         ; 8ad4: 4c 85 8b    L..

.c8ad7
    lda l0029                                                         ; 8ad7: a5 29       .)
    cmp #&12                                                          ; 8ad9: c9 12       ..
    bne c8b30                                                         ; 8adb: d0 53       .S
    lda l0028                                                         ; 8add: a5 28       .(
    sec                                                               ; 8adf: 38          8
    sbc #&1e                                                          ; 8ae0: e9 1e       ..
    sta l0052                                                         ; 8ae2: 85 52       .R
    and #2                                                            ; 8ae4: 29 02       ).
    bne c8b2d                                                         ; 8ae6: d0 45       .E
    lda l0052                                                         ; 8ae8: a5 52       .R
    lsr a                                                             ; 8aea: 4a          J
    lsr a                                                             ; 8aeb: 4a          J
    sec                                                               ; 8aec: 38          8
    sbc #1                                                            ; 8aed: e9 01       ..
    cmp #4                                                            ; 8aef: c9 04       ..
    bcs c8b2d                                                         ; 8af1: b0 3a       .:
    pha                                                               ; 8af3: 48          H
    jsr sub_c9190                                                     ; 8af4: 20 90 91     ..
    pla                                                               ; 8af7: 68          h
    pha                                                               ; 8af8: 48          H
    tax                                                               ; 8af9: aa          .
    inx                                                               ; 8afa: e8          .
    ldy #1                                                            ; 8afb: a0 01       ..
    jsr sub_c8b98                                                     ; 8afd: 20 98 8b     ..
    pla                                                               ; 8b00: 68          h
    pha                                                               ; 8b01: 48          H
    and #2                                                            ; 8b02: 29 02       ).
    bne c8b1b                                                         ; 8b04: d0 15       ..
    lda #1                                                            ; 8b06: a9 01       ..
    clc                                                               ; 8b08: 18          .
    adc l1972                                                         ; 8b09: 6d 72 19    mr.
    tax                                                               ; 8b0c: aa          .
    ldy #1                                                            ; 8b0d: a0 01       ..
    jsr sub_c8b98                                                     ; 8b0f: 20 98 8b     ..
    pla                                                               ; 8b12: 68          h
    and #1                                                            ; 8b13: 29 01       ).
    sta l1972                                                         ; 8b15: 8d 72 19    .r.
    jmp c8b85                                                         ; 8b18: 4c 85 8b    L..

.c8b1b
    lda #3                                                            ; 8b1b: a9 03       ..
    clc                                                               ; 8b1d: 18          .
    adc l1970                                                         ; 8b1e: 6d 70 19    mp.
    tax                                                               ; 8b21: aa          .
    ldy #1                                                            ; 8b22: a0 01       ..
    jsr sub_c8b98                                                     ; 8b24: 20 98 8b     ..
    pla                                                               ; 8b27: 68          h
    and #1                                                            ; 8b28: 29 01       ).
    sta l1970                                                         ; 8b2a: 8d 70 19    .p.
.c8b2d
    jmp c8b85                                                         ; 8b2d: 4c 85 8b    L..

.c8b30
    lda l0029                                                         ; 8b30: a5 29       .)
    cmp #&14                                                          ; 8b32: c9 14       ..
    bne c8b85                                                         ; 8b34: d0 4f       .O
    lda l0028                                                         ; 8b36: a5 28       .(
    sec                                                               ; 8b38: 38          8
    sbc #&1e                                                          ; 8b39: e9 1e       ..
    sta l0052                                                         ; 8b3b: 85 52       .R
    and #2                                                            ; 8b3d: 29 02       ).
    bne c8b85                                                         ; 8b3f: d0 44       .D
    lda l0052                                                         ; 8b41: a5 52       .R
    lsr a                                                             ; 8b43: 4a          J
    lsr a                                                             ; 8b44: 4a          J
    cmp #5                                                            ; 8b45: c9 05       ..
    bcs c8b85                                                         ; 8b47: b0 3c       .<
    pha                                                               ; 8b49: 48          H
    jsr sub_c9190                                                     ; 8b4a: 20 90 91     ..
    pla                                                               ; 8b4d: 68          h
    pha                                                               ; 8b4e: 48          H
    tax                                                               ; 8b4f: aa          .
    ldy #0                                                            ; 8b50: a0 00       ..
    jsr sub_c8b98                                                     ; 8b52: 20 98 8b     ..
    pla                                                               ; 8b55: 68          h
    pha                                                               ; 8b56: 48          H
    cmp #3                                                            ; 8b57: c9 03       ..
    beq c8b6e                                                         ; 8b59: f0 13       ..
    cmp #4                                                            ; 8b5b: c9 04       ..
    beq c8b6e                                                         ; 8b5d: f0 0f       ..
    ldx l1964                                                         ; 8b5f: ae 64 19    .d.
    ldy #0                                                            ; 8b62: a0 00       ..
    jsr sub_c8b98                                                     ; 8b64: 20 98 8b     ..
    pla                                                               ; 8b67: 68          h
    sta l1964                                                         ; 8b68: 8d 64 19    .d.
    jmp c8b85                                                         ; 8b6b: 4c 85 8b    L..

.c8b6e
    lda #3                                                            ; 8b6e: a9 03       ..
    clc                                                               ; 8b70: 18          .
    adc l1963                                                         ; 8b71: 6d 63 19    mc.
    tax                                                               ; 8b74: aa          .
    ldy #0                                                            ; 8b75: a0 00       ..
    jsr sub_c8b98                                                     ; 8b77: 20 98 8b     ..
    pla                                                               ; 8b7a: 68          h
    and #1                                                            ; 8b7b: 29 01       ).
    eor #1                                                            ; 8b7d: 49 01       I.
    sta l1963                                                         ; 8b7f: 8d 63 19    .c.
    jmp c8b85                                                         ; 8b82: 4c 85 8b    L..

.c8b85
    jmp c8a55                                                         ; 8b85: 4c 55 8a    LU.

    equs "pWI 22,21,49,11"                                            ; 8b88: 70 57 49... pWI
    equb &0d                                                          ; 8b97: 0d          .

.sub_c8b98
    tya                                                               ; 8b98: 98          .
    pha                                                               ; 8b99: 48          H
    lda #&19                                                          ; 8b9a: a9 19       ..
    jsr oswrch                                                        ; 8b9c: 20 ee ff     ..            ; Write character 25
    lda #4                                                            ; 8b9f: a9 04       ..
    jsr oswrch                                                        ; 8ba1: 20 ee ff     ..            ; Write character 4
    txa                                                               ; 8ba4: 8a          .
    asl a                                                             ; 8ba5: 0a          .
    asl a                                                             ; 8ba6: 0a          .
    asl a                                                             ; 8ba7: 0a          .
    asl a                                                             ; 8ba8: 0a          .
    asl a                                                             ; 8ba9: 0a          .
    asl a                                                             ; 8baa: 0a          .
    php                                                               ; 8bab: 08          .
    clc                                                               ; 8bac: 18          .
    adc #&da                                                          ; 8bad: 69 da       i.
    php                                                               ; 8baf: 08          .
    jsr oswrch                                                        ; 8bb0: 20 ee ff     ..            ; Write character
    plp                                                               ; 8bb3: 28          (
    lda #1                                                            ; 8bb4: a9 01       ..
    adc #0                                                            ; 8bb6: 69 00       i.
    plp                                                               ; 8bb8: 28          (
    adc #0                                                            ; 8bb9: 69 00       i.
    jsr oswrch                                                        ; 8bbb: 20 ee ff     ..            ; Write character
    pla                                                               ; 8bbe: 68          h
    asl a                                                             ; 8bbf: 0a          .
    asl a                                                             ; 8bc0: 0a          .
    asl a                                                             ; 8bc1: 0a          .
    asl a                                                             ; 8bc2: 0a          .
    asl a                                                             ; 8bc3: 0a          .
    asl a                                                             ; 8bc4: 0a          .
    clc                                                               ; 8bc5: 18          .
    adc #&58 ; 'X'                                                    ; 8bc6: 69 58       iX
    php                                                               ; 8bc8: 08          .
    jsr oswrch                                                        ; 8bc9: 20 ee ff     ..            ; Write character
    plp                                                               ; 8bcc: 28          (
    lda #1                                                            ; 8bcd: a9 01       ..
    adc #0                                                            ; 8bcf: 69 00       i.
    jsr oswrch                                                        ; 8bd1: 20 ee ff     ..            ; Write character
    ldy #0                                                            ; 8bd4: a0 00       ..
.loop_c8bd6
    lda l8be5,y                                                       ; 8bd6: b9 e5 8b    ...
    cmp #&80                                                          ; 8bd9: c9 80       ..
    beq c8be4                                                         ; 8bdb: f0 07       ..
    jsr oswrch                                                        ; 8bdd: 20 ee ff     ..            ; Write character
    iny                                                               ; 8be0: c8          .
    jmp loop_c8bd6                                                    ; 8be1: 4c d6 8b    L..

.c8be4
    rts                                                               ; 8be4: 60          `

.l8be5
    equb &12,   3,   3, &19,   9, &2c,   0,   0,   0, &19,   9,   0   ; 8be5: 12 03 03... ...
    equb   0, &30,   0, &19,   9, &d4, &ff,   0,   0, &19,   9,   0   ; 8bf1: 00 30 00... .0.
    equb   0, &d0, &ff, &80                                           ; 8bfd: 00 d0 ff... ...

.c8c01
    lda #&36 ; '6'                                                    ; 8c01: a9 36       .6
    ldx #<(l0024)                                                     ; 8c03: a2 24       .$
    ldy #>(l0024)                                                     ; 8c05: a0 00       ..
    jsr osword                                                        ; 8c07: 20 f1 ff     ..            ; Stop Press Routines (see https://beebwiki.mdfs.net/OSWORDs)
    lda l002a                                                         ; 8c0a: a5 2a       .*
    and #&20 ; ' '                                                    ; 8c0c: 29 20       )
    bne c8c3d                                                         ; 8c0e: d0 2d       .-
    lda l0025                                                         ; 8c10: a5 25       .%
    cmp #4                                                            ; 8c12: c9 04       ..
    bne c8c3d                                                         ; 8c14: d0 27       .'
    lda l0024                                                         ; 8c16: a5 24       .$
    cmp #&d0                                                          ; 8c18: c9 d0       ..
    bcc c8c3d                                                         ; 8c1a: 90 21       .!
    lda l0027                                                         ; 8c1c: a5 27       .'
    cmp #3                                                            ; 8c1e: c9 03       ..
    bne c8c3d                                                         ; 8c20: d0 1b       ..
    lda l0026                                                         ; 8c22: a5 26       .&
    cmp #&a0                                                          ; 8c24: c9 a0       ..
    bcc c8c3d                                                         ; 8c26: 90 15       ..
    lda l1979                                                         ; 8c28: ad 79 19    .y.
    bne c8c3d                                                         ; 8c2b: d0 10       ..
    jsr our_osword_1_x13_handler                                      ; 8c2d: 20 9d 89     ..
    ldx #0                                                            ; 8c30: a2 00       ..
    ldy #0                                                            ; 8c32: a0 00       ..
.c8c34
    dey                                                               ; 8c34: 88          .
    bne c8c34                                                         ; 8c35: d0 fd       ..
    dex                                                               ; 8c37: ca          .
    bne c8c34                                                         ; 8c38: d0 fa       ..
    jmp c8c01                                                         ; 8c3a: 4c 01 8c    L..

.c8c3d
    lda l0024                                                         ; 8c3d: a5 24       .$
    and #&fe                                                          ; 8c3f: 29 fe       ).
    sta l0024                                                         ; 8c41: 85 24       .$
    lda l0026                                                         ; 8c43: a5 26       .&
    and #&fc                                                          ; 8c45: 29 fc       ).
    sta l0026                                                         ; 8c47: 85 26       .&
    lda l002a                                                         ; 8c49: a5 2a       .*
    and #&e0                                                          ; 8c4b: 29 e0       ).
    cmp #&e0                                                          ; 8c4d: c9 e0       ..
    beq c8c64                                                         ; 8c4f: f0 13       ..
    cmp l1973                                                         ; 8c51: cd 73 19    .s.
    beq c8c63                                                         ; 8c54: f0 0d       ..
    sta l1973                                                         ; 8c56: 8d 73 19    .s.
    lda l1976                                                         ; 8c59: ad 76 19    .v.
    beq c8c63                                                         ; 8c5c: f0 05       ..
    lda #7                                                            ; 8c5e: a9 07       ..
    jsr oswrch                                                        ; 8c60: 20 ee ff     ..            ; Write character 7
.c8c63
    rts                                                               ; 8c63: 60          `

.c8c64
    lda #&e0                                                          ; 8c64: a9 e0       ..
    sta l1973                                                         ; 8c66: 8d 73 19    .s.
    rts                                                               ; 8c69: 60          `

    equs "pMP"                                                        ; 8c6a: 70 4d 50    pMP
    equb &0d                                                          ; 8c6d: 0d          .
    equs "pHP"                                                        ; 8c6e: 70 48 50    pHP
    equb &0d                                                          ; 8c71: 0d          .

.c8c72
    stx l0052                                                         ; 8c72: 86 52       .R
    sty l0053                                                         ; 8c74: 84 53       .S
    ldy #0                                                            ; 8c76: a0 00       ..
.loop_c8c78
    lda (l0052),y                                                     ; 8c78: b1 52       .R
    sta l0a00,y                                                       ; 8c7a: 99 00 0a    ...
    iny                                                               ; 8c7d: c8          .
    cmp #&0d                                                          ; 8c7e: c9 0d       ..
    bne loop_c8c78                                                    ; 8c80: d0 f6       ..
    ldx #<(l0a00)                                                     ; 8c82: a2 00       ..
    ldy #>(l0a00)                                                     ; 8c84: a0 0a       ..
    jmp oscli                                                         ; 8c86: 4c f7 ff    L..

.our_osword_1_x14_handler
    ldy #0                                                            ; 8c89: a0 00       ..
    ldx #0                                                            ; 8c8b: a2 00       ..
.loop_c8c8d
    lda l197d,x                                                       ; 8c8d: bd 7d 19    .}.
    sta l34e8,y                                                       ; 8c90: 99 e8 34    ..4
    inx                                                               ; 8c93: e8          .
    lda l197d,x                                                       ; 8c94: bd 7d 19    .}.
    sta l34f0,y                                                       ; 8c97: 99 f0 34    ..4
    inx                                                               ; 8c9a: e8          .
    iny                                                               ; 8c9b: c8          .
    cpy #8                                                            ; 8c9c: c0 08       ..
    bne loop_c8c8d                                                    ; 8c9e: d0 ed       ..
    ldy #0                                                            ; 8ca0: a0 00       ..
.loop_c8ca2
    lda l197d,x                                                       ; 8ca2: bd 7d 19    .}.
    sta l3768,y                                                       ; 8ca5: 99 68 37    .h7
    inx                                                               ; 8ca8: e8          .
    lda l197d,x                                                       ; 8ca9: bd 7d 19    .}.
    sta l3770,y                                                       ; 8cac: 99 70 37    .p7
    inx                                                               ; 8caf: e8          .
    iny                                                               ; 8cb0: c8          .
    cpy #8                                                            ; 8cb1: c0 08       ..
    bne loop_c8ca2                                                    ; 8cb3: d0 ed       ..
    rts                                                               ; 8cb5: 60          `

.our_osword_1_x15_handler
    ldy #0                                                            ; 8cb6: a0 00       ..
    ldx #0                                                            ; 8cb8: a2 00       ..
.loop_c8cba
    lda l34e8,y                                                       ; 8cba: b9 e8 34    ..4
    sta l197d,x                                                       ; 8cbd: 9d 7d 19    .}.
    inx                                                               ; 8cc0: e8          .
    lda l34f0,y                                                       ; 8cc1: b9 f0 34    ..4
    sta l197d,x                                                       ; 8cc4: 9d 7d 19    .}.
    inx                                                               ; 8cc7: e8          .
    iny                                                               ; 8cc8: c8          .
    cpy #8                                                            ; 8cc9: c0 08       ..
    bne loop_c8cba                                                    ; 8ccb: d0 ed       ..
    ldy #0                                                            ; 8ccd: a0 00       ..
.loop_c8ccf
    lda l3768,y                                                       ; 8ccf: b9 68 37    .h7
    sta l197d,x                                                       ; 8cd2: 9d 7d 19    .}.
    inx                                                               ; 8cd5: e8          .
    lda l3770,y                                                       ; 8cd6: b9 70 37    .p7
    sta l197d,x                                                       ; 8cd9: 9d 7d 19    .}.
    inx                                                               ; 8cdc: e8          .
    iny                                                               ; 8cdd: c8          .
    cpy #8                                                            ; 8cde: c0 08       ..
    bne loop_c8ccf                                                    ; 8ce0: d0 ed       ..
    rts                                                               ; 8ce2: 60          `

    equb &a2,   0, &a0,   0, &c8, &88, &88, &d0, &fb, &ca, &d0, &f8   ; 8ce3: a2 00 a0... ...
    equb &60                                                          ; 8cef: 60          `

.our_osword_1_x16_handler
    ldx #0                                                            ; 8cf0: a2 00       ..
.loop_c8cf2
    ldy #&10                                                          ; 8cf2: a0 10       ..
.loop_c8cf4
    lsr l34e8,x                                                       ; 8cf4: 5e e8 34    ^.4
    ror l34f0,x                                                       ; 8cf7: 7e f0 34    ~.4
    rol l004a                                                         ; 8cfa: 26 4a       &J
    rol l0049                                                         ; 8cfc: 26 49       &I
    dey                                                               ; 8cfe: 88          .
    bne loop_c8cf4                                                    ; 8cff: d0 f3       ..
    lda l0049                                                         ; 8d01: a5 49       .I
    sta l34e8,x                                                       ; 8d03: 9d e8 34    ..4
    lda l004a                                                         ; 8d06: a5 4a       .J
    sta l34f0,x                                                       ; 8d08: 9d f0 34    ..4
    inx                                                               ; 8d0b: e8          .
    cpx #8                                                            ; 8d0c: e0 08       ..
    bne loop_c8cf2                                                    ; 8d0e: d0 e2       ..
    ldx #0                                                            ; 8d10: a2 00       ..
.loop_c8d12
    ldy #&10                                                          ; 8d12: a0 10       ..
.loop_c8d14
    lsr l3768,x                                                       ; 8d14: 5e 68 37    ^h7
    ror l3770,x                                                       ; 8d17: 7e 70 37    ~p7
    rol l004a                                                         ; 8d1a: 26 4a       &J
    rol l0049                                                         ; 8d1c: 26 49       &I
    dey                                                               ; 8d1e: 88          .
    bne loop_c8d14                                                    ; 8d1f: d0 f3       ..
    lda l0049                                                         ; 8d21: a5 49       .I
    sta l3768,x                                                       ; 8d23: 9d 68 37    .h7
    lda l004a                                                         ; 8d26: a5 4a       .J
    sta l3770,x                                                       ; 8d28: 9d 70 37    .p7
    inx                                                               ; 8d2b: e8          .
    cpx #8                                                            ; 8d2c: e0 08       ..
    bne loop_c8d12                                                    ; 8d2e: d0 e2       ..
    rts                                                               ; 8d30: 60          `

.c8d31
    lda #0                                                            ; 8d31: a9 00       ..
    sta l196f                                                         ; 8d33: 8d 6f 19    .o.
    sta l1965                                                         ; 8d36: 8d 65 19    .e.
    sta l1963                                                         ; 8d39: 8d 63 19    .c.
    sta l1970                                                         ; 8d3c: 8d 70 19    .p.
    sta l1971                                                         ; 8d3f: 8d 71 19    .q.
    sta l1975                                                         ; 8d42: 8d 75 19    .u.
    sta l1977                                                         ; 8d45: 8d 77 19    .w.
    sta l1972                                                         ; 8d48: 8d 72 19    .r.
    sta l1978                                                         ; 8d4b: 8d 78 19    .x.
    sta l1917                                                         ; 8d4e: 8d 17 19    ...
    sta l1979                                                         ; 8d51: 8d 79 19    .y.
    sta l1974                                                         ; 8d54: 8d 74 19    .t.
    sta l197a                                                         ; 8d57: 8d 7a 19    .z.
    sta l1956                                                         ; 8d5a: 8d 56 19    .V.
    sta l1957                                                         ; 8d5d: 8d 57 19    .W.
    sta l1958                                                         ; 8d60: 8d 58 19    .X.
    sta l196c                                                         ; 8d63: 8d 6c 19    .l.
    sta l197b                                                         ; 8d66: 8d 7b 19    .{.
    lda #1                                                            ; 8d69: a9 01       ..
    sta l196a                                                         ; 8d6b: 8d 6a 19    .j.
    sta l1913                                                         ; 8d6e: 8d 13 19    ...
    sta l1976                                                         ; 8d71: 8d 76 19    .v.
    lda #&f0                                                          ; 8d74: a9 f0       ..
    sta l1918                                                         ; 8d76: 8d 18 19    ...
    sta l1919                                                         ; 8d79: 8d 19 19    ...
    lda #2                                                            ; 8d7c: a9 02       ..
    sta l196b                                                         ; 8d7e: 8d 6b 19    .k.
    sta l1964                                                         ; 8d81: 8d 64 19    .d.
    jsr our_osword_1_x22_handler                                      ; 8d84: 20 55 95     U.
    lda #&e1                                                          ; 8d87: a9 e1       ..
    sta l001f                                                         ; 8d89: 85 1f       ..
    lda #4                                                            ; 8d8b: a9 04       ..
    sta l0023                                                         ; 8d8d: 85 23       .#
.loop_c8d8f
    lda l001f                                                         ; 8d8f: a5 1f       ..
    ldx #0                                                            ; 8d91: a2 00       ..
    ldy #0                                                            ; 8d93: a0 00       ..
    jsr osbyte                                                        ; 8d95: 20 f4 ff     ..
    inc l001f                                                         ; 8d98: e6 1f       ..
    dec l0023                                                         ; 8d9a: c6 23       .#
    bne loop_c8d8f                                                    ; 8d9c: d0 f1       ..
    lda #osbyte_set_cursor_editing                                    ; 8d9e: a9 04       ..
    ldx #2                                                            ; 8da0: a2 02       ..
    jsr osbyte                                                        ; 8da2: 20 f4 ff     ..            ; Disable cursor editing (edit keys act as soft keys f11 to f15) (X=2)
    rts                                                               ; 8da5: 60          `

.our_osword_1_x18_handler
    lda #&80                                                          ; 8da6: a9 80       ..
    sta l1979                                                         ; 8da8: 8d 79 19    .y.
    sta l0000                                                         ; 8dab: 85 00       ..
    lda #&55 ; 'U'                                                    ; 8dad: a9 55       .U
    sta l0001                                                         ; 8daf: 85 01       ..
    lda #1                                                            ; 8db1: a9 01       ..
    sta l193e                                                         ; 8db3: 8d 3e 19    .>.
    lda l004f                                                         ; 8db6: a5 4f       .O
    beq c8dcb                                                         ; 8db8: f0 11       ..
    cmp #2                                                            ; 8dba: c9 02       ..
    beq c8dcb                                                         ; 8dbc: f0 0d       ..
    lda #0                                                            ; 8dbe: a9 00       ..
    sta l0000                                                         ; 8dc0: 85 00       ..
    lda #&30 ; '0'                                                    ; 8dc2: a9 30       .0
    sta l0001                                                         ; 8dc4: 85 01       ..
    lda #0                                                            ; 8dc6: a9 00       ..
    sta l193e                                                         ; 8dc8: 8d 3e 19    .>.
.c8dcb
    lda l0000                                                         ; 8dcb: a5 00       ..
    sta l0004                                                         ; 8dcd: 85 04       ..
    lda l0001                                                         ; 8dcf: a5 01       ..
    sta l0005                                                         ; 8dd1: 85 05       ..
    lda #0                                                            ; 8dd3: a9 00       ..
    sta l0002                                                         ; 8dd5: 85 02       ..
    lda #&26 ; '&'                                                    ; 8dd7: a9 26       .&
    sta l0003                                                         ; 8dd9: 85 03       ..
    lda #&11                                                          ; 8ddb: a9 11       ..
    sta l001f                                                         ; 8ddd: 85 1f       ..
.c8ddf
    ldx #&90                                                          ; 8ddf: a2 90       ..
    ldy #0                                                            ; 8de1: a0 00       ..
.loop_c8de3
    lda (l0004),y                                                     ; 8de3: b1 04       ..
    sta (l0002),y                                                     ; 8de5: 91 02       ..
    lda #0                                                            ; 8de7: a9 00       ..
    sta (l0004),y                                                     ; 8de9: 91 04       ..
    iny                                                               ; 8deb: c8          .
    dex                                                               ; 8dec: ca          .
    bne loop_c8de3                                                    ; 8ded: d0 f4       ..
    lda l0002                                                         ; 8def: a5 02       ..
    clc                                                               ; 8df1: 18          .
    adc #&90                                                          ; 8df2: 69 90       i.
    sta l0002                                                         ; 8df4: 85 02       ..
    bcc c8dfa                                                         ; 8df6: 90 02       ..
    inc l0003                                                         ; 8df8: e6 03       ..
.c8dfa
    clc                                                               ; 8dfa: 18          .
    lda l0004                                                         ; 8dfb: a5 04       ..
    adc #&80                                                          ; 8dfd: 69 80       i.
    sta l0004                                                         ; 8dff: 85 04       ..
    lda l0005                                                         ; 8e01: a5 05       ..
    adc #2                                                            ; 8e03: 69 02       i.
    sta l0005                                                         ; 8e05: 85 05       ..
    dec l001f                                                         ; 8e07: c6 1f       ..
    bne c8ddf                                                         ; 8e09: d0 d4       ..
    jsr sub_c9190                                                     ; 8e0b: 20 90 91     ..
    ldx #0                                                            ; 8e0e: a2 00       ..
    lda #&10                                                          ; 8e10: a9 10       ..
    sec                                                               ; 8e12: 38          8
    sbc l193e                                                         ; 8e13: ed 3e 19    .>.
    tay                                                               ; 8e16: a8          .
    lda #4                                                            ; 8e17: a9 04       ..
    jsr oswrch                                                        ; 8e19: 20 ee ff     ..            ; Write character 4
    lda #&1f                                                          ; 8e1c: a9 1f       ..
    jsr oswrch                                                        ; 8e1e: 20 ee ff     ..            ; Write character 31
    txa                                                               ; 8e21: 8a          .
    jsr oswrch                                                        ; 8e22: 20 ee ff     ..            ; Write character
    tya                                                               ; 8e25: 98          .
    jsr oswrch                                                        ; 8e26: 20 ee ff     ..            ; Write character
    ldx #&10                                                          ; 8e29: a2 10       ..
    lda #&fa                                                          ; 8e2b: a9 fa       ..
.loop_c8e2d
    jsr oswrch                                                        ; 8e2d: 20 ee ff     ..            ; Write character 250
    dex                                                               ; 8e30: ca          .
    bne loop_c8e2d                                                    ; 8e31: d0 fa       ..
    lda l193e                                                         ; 8e33: ad 3e 19    .>.
    asl a                                                             ; 8e36: 0a          .
    ora l193e                                                         ; 8e37: 0d 3e 19    .>.
    adc #&f8                                                          ; 8e3a: 69 f8       i.
    jsr oswrch                                                        ; 8e3c: 20 ee ff     ..            ; Write character
    clc                                                               ; 8e3f: 18          .
    adc #1                                                            ; 8e40: 69 01       i.
    jsr oswrch                                                        ; 8e42: 20 ee ff     ..            ; Write character
    ldx #&10                                                          ; 8e45: a2 10       ..
.loop_c8e47
    lda #8                                                            ; 8e47: a9 08       ..
    jsr oswrch                                                        ; 8e49: 20 ee ff     ..            ; Write character 8
    jsr oswrch                                                        ; 8e4c: 20 ee ff     ..            ; Write character
    lda #&0b                                                          ; 8e4f: a9 0b       ..
    sec                                                               ; 8e51: 38          8
    sbc l193e                                                         ; 8e52: ed 3e 19    .>.
    jsr oswrch                                                        ; 8e55: 20 ee ff     ..            ; Write character
    lda #&fd                                                          ; 8e58: a9 fd       ..
    jsr oswrch                                                        ; 8e5a: 20 ee ff     ..            ; Write character 253
    lda #&fe                                                          ; 8e5d: a9 fe       ..
    jsr oswrch                                                        ; 8e5f: 20 ee ff     ..            ; Write character 254
    dex                                                               ; 8e62: ca          .
    bne loop_c8e47                                                    ; 8e63: d0 e2       ..
.c8e65
    ldy #8                                                            ; 8e65: a0 08       ..
    lda #4                                                            ; 8e67: a9 04       ..
    jsr sub_c8606                                                     ; 8e69: 20 06 86     ..
    jsr sub_c8496                                                     ; 8e6c: 20 96 84     ..
    ldx #&98                                                          ; 8e6f: a2 98       ..
    ldy #&a0                                                          ; 8e71: a0 a0       ..
    jsr c835f                                                         ; 8e73: 20 5f 83     _.
    lda l193e                                                         ; 8e76: ad 3e 19    .>.
    asl a                                                             ; 8e79: 0a          .
    asl a                                                             ; 8e7a: 0a          .
    asl a                                                             ; 8e7b: 0a          .
    asl a                                                             ; 8e7c: 0a          .
    sta l1914                                                         ; 8e7d: 8d 14 19    ...
    lda #&80                                                          ; 8e80: a9 80       ..
    sta l0004                                                         ; 8e82: 85 04       ..
    lda #&55 ; 'U'                                                    ; 8e84: a9 55       .U
    sta l0005                                                         ; 8e86: 85 05       ..
    lda l193e                                                         ; 8e88: ad 3e 19    .>.
    beq c8e91                                                         ; 8e8b: f0 04       ..
    lda #&7d ; '}'                                                    ; 8e8d: a9 7d       .}
    sta l0005                                                         ; 8e8f: 85 05       ..
.c8e91
    ldx #8                                                            ; 8e91: a2 08       ..
    ldy #&4b ; 'K'                                                    ; 8e93: a0 4b       .K
    jsr sub_c85f1                                                     ; 8e95: 20 f1 85     ..
    jsr sub_c91b1                                                     ; 8e98: 20 b1 91     ..
    lda #&10                                                          ; 8e9b: a9 10       ..
    sta l001f                                                         ; 8e9d: 85 1f       ..
.c8e9f
    lda #&10                                                          ; 8e9f: a9 10       ..
    sta l0023                                                         ; 8ea1: 85 23       .#
.c8ea3
    jsr sub_c9210                                                     ; 8ea3: 20 10 92     ..
    lda #0                                                            ; 8ea6: a9 00       ..
    ldx l001b                                                         ; 8ea8: a6 1b       ..
    beq c8eae                                                         ; 8eaa: f0 02       ..
    lda #&fe                                                          ; 8eac: a9 fe       ..
.c8eae
    ldy #7                                                            ; 8eae: a0 07       ..
.loop_c8eb0
    sta (l0004),y                                                     ; 8eb0: 91 04       ..
    dey                                                               ; 8eb2: 88          .
    bne loop_c8eb0                                                    ; 8eb3: d0 fb       ..
    lda #0                                                            ; 8eb5: a9 00       ..
    sta (l0004),y                                                     ; 8eb7: 91 04       ..
    lda l0004                                                         ; 8eb9: a5 04       ..
    clc                                                               ; 8ebb: 18          .
    adc #8                                                            ; 8ebc: 69 08       i.
    sta l0004                                                         ; 8ebe: 85 04       ..
    bcc c8ec4                                                         ; 8ec0: 90 02       ..
    inc l0005                                                         ; 8ec2: e6 05       ..
.c8ec4
    jsr sub_c9219                                                     ; 8ec4: 20 19 92     ..
    dec l0023                                                         ; 8ec7: c6 23       .#
    bne c8ea3                                                         ; 8ec9: d0 d8       ..
    lda l0005                                                         ; 8ecb: a5 05       ..
    sec                                                               ; 8ecd: 38          8
    sbc #3                                                            ; 8ece: e9 03       ..
    sta l0005                                                         ; 8ed0: 85 05       ..
    dec l000a                                                         ; 8ed2: c6 0a       ..
    jsr sub_c91c1                                                     ; 8ed4: 20 c1 91     ..
    dec l001f                                                         ; 8ed7: c6 1f       ..
    bne c8e9f                                                         ; 8ed9: d0 c4       ..
    ldx #&4b ; 'K'                                                    ; 8edb: a2 4b       .K
    ldy #8                                                            ; 8edd: a0 08       ..
    jsr sub_c85f1                                                     ; 8edf: 20 f1 85     ..
.c8ee2
    jsr c8c01                                                         ; 8ee2: 20 01 8c     ..
    lda l002a                                                         ; 8ee5: a5 2a       .*
    and #&40 ; '@'                                                    ; 8ee7: 29 40       )@
    beq c8efd                                                         ; 8ee9: f0 12       ..
    lda #0                                                            ; 8eeb: a9 00       ..
    sta l0050                                                         ; 8eed: 85 50       .P
    sta l0051                                                         ; 8eef: 85 51       .Q
    jsr sub_c91a5                                                     ; 8ef1: 20 a5 91     ..
    lda l002a                                                         ; 8ef4: a5 2a       .*
    and #&80                                                          ; 8ef6: 29 80       ).
    bne c8efd                                                         ; 8ef8: d0 03       ..
    jmp c913a                                                         ; 8efa: 4c 3a 91    L:.

.c8efd
    lda l002a                                                         ; 8efd: a5 2a       .*
    and #&60 ; '`'                                                    ; 8eff: 29 60       )`
    cmp #&60 ; '`'                                                    ; 8f01: c9 60       .`
    beq c8ee2                                                         ; 8f03: f0 dd       ..
    lda l0028                                                         ; 8f05: a5 28       .(
    cmp #&12                                                          ; 8f07: c9 12       ..
    bcs c8f26                                                         ; 8f09: b0 1b       ..
    lda #0                                                            ; 8f0b: a9 00       ..
    sta l001f                                                         ; 8f0d: 85 1f       ..
    lda l0029                                                         ; 8f0f: a5 29       .)
    cmp l1914                                                         ; 8f11: cd 14 19    ...
    rol l001f                                                         ; 8f14: 26 1f       &.
    lda l1914                                                         ; 8f16: ad 14 19    ...
    clc                                                               ; 8f19: 18          .
    adc #&10                                                          ; 8f1a: 69 10       i.
    cmp l0029                                                         ; 8f1c: c5 29       .)
    rol l001f                                                         ; 8f1e: 26 1f       &.
    lda l001f                                                         ; 8f20: a5 1f       ..
    cmp #3                                                            ; 8f22: c9 03       ..
    beq c8f29                                                         ; 8f24: f0 03       ..
.c8f26
    jmp c90a6                                                         ; 8f26: 4c a6 90    L..

.c8f29
    lda l002a                                                         ; 8f29: a5 2a       .*
    and #&20 ; ' '                                                    ; 8f2b: 29 20       )
    bne c8f32                                                         ; 8f2d: d0 03       ..
    jmp c8ff1                                                         ; 8f2f: 4c f1 8f    L..

.c8f32
    jsr sub_c91a5                                                     ; 8f32: 20 a5 91     ..
    lda l0050                                                         ; 8f35: a5 50       .P
    ora l0051                                                         ; 8f37: 05 51       .Q
    bne c8f3e                                                         ; 8f39: d0 03       ..
.loop_c8f3b
    jmp c8fe6                                                         ; 8f3b: 4c e6 8f    L..

.c8f3e
    lda l0028                                                         ; 8f3e: a5 28       .(
    cmp l0050                                                         ; 8f40: c5 50       .P
    bne c8f4a                                                         ; 8f42: d0 06       ..
    lda l0029                                                         ; 8f44: a5 29       .)
    cmp l0051                                                         ; 8f46: c5 51       .Q
    beq loop_c8f3b                                                    ; 8f48: f0 f1       ..
.c8f4a
    ldx #8                                                            ; 8f4a: a2 08       ..
    ldy #&24 ; '$'                                                    ; 8f4c: a0 24       .$
    jsr sub_c85f1                                                     ; 8f4e: 20 f1 85     ..
    lda l0024                                                         ; 8f51: a5 24       .$
    clc                                                               ; 8f53: 18          .
    adc #&10                                                          ; 8f54: 69 10       i.
    sta l0024                                                         ; 8f56: 85 24       .$
    bcc c8f5c                                                         ; 8f58: 90 02       ..
    inc l0025                                                         ; 8f5a: e6 25       .%
.c8f5c
    lda l0050                                                         ; 8f5c: a5 50       .P
    sec                                                               ; 8f5e: 38          8
    sbc l0028                                                         ; 8f5f: e5 28       .(
    beq c8f7f                                                         ; 8f61: f0 1c       ..
    asl a                                                             ; 8f63: 0a          .
    bmi c8f74                                                         ; 8f64: 30 0e       0.
    clc                                                               ; 8f66: 18          .
    adc l0024                                                         ; 8f67: 65 24       e$
    sta l0024                                                         ; 8f69: 85 24       .$
    lda l0025                                                         ; 8f6b: a5 25       .%
    adc #0                                                            ; 8f6d: 69 00       i.
    sta l0025                                                         ; 8f6f: 85 25       .%
    jmp c8f7f                                                         ; 8f71: 4c 7f 8f    L..

.c8f74
    clc                                                               ; 8f74: 18          .
    adc l0024                                                         ; 8f75: 65 24       e$
    sta l0024                                                         ; 8f77: 85 24       .$
    lda l0025                                                         ; 8f79: a5 25       .%
    adc #&ff                                                          ; 8f7b: 69 ff       i.
    sta l0025                                                         ; 8f7d: 85 25       .%
.c8f7f
    lda l0026                                                         ; 8f7f: a5 26       .&
    clc                                                               ; 8f81: 18          .
    adc #&20 ; ' '                                                    ; 8f82: 69 20       i
    sta l0026                                                         ; 8f84: 85 26       .&
    bcc c8f8a                                                         ; 8f86: 90 02       ..
    inc l0027                                                         ; 8f88: e6 27       .'
.c8f8a
    lda l0029                                                         ; 8f8a: a5 29       .)
    sec                                                               ; 8f8c: 38          8
    sbc l0051                                                         ; 8f8d: e5 51       .Q
    beq c8fae                                                         ; 8f8f: f0 1d       ..
    asl a                                                             ; 8f91: 0a          .
    asl a                                                             ; 8f92: 0a          .
    bmi c8fa3                                                         ; 8f93: 30 0e       0.
    clc                                                               ; 8f95: 18          .
    adc l0026                                                         ; 8f96: 65 26       e&
    sta l0026                                                         ; 8f98: 85 26       .&
    lda l0027                                                         ; 8f9a: a5 27       .'
    adc #0                                                            ; 8f9c: 69 00       i.
    sta l0027                                                         ; 8f9e: 85 27       .'
    jmp c8fae                                                         ; 8fa0: 4c ae 8f    L..

.c8fa3
    clc                                                               ; 8fa3: 18          .
    adc l0026                                                         ; 8fa4: 65 26       e&
    sta l0026                                                         ; 8fa6: 85 26       .&
    lda l0027                                                         ; 8fa8: a5 27       .'
    adc #&ff                                                          ; 8faa: 69 ff       i.
    sta l0027                                                         ; 8fac: 85 27       .'
.c8fae
    lda l0028                                                         ; 8fae: a5 28       .(
    sta l0050                                                         ; 8fb0: 85 50       .P
    lda l0029                                                         ; 8fb2: a5 29       .)
    sta l0051                                                         ; 8fb4: 85 51       .Q
    lda l0027                                                         ; 8fb6: a5 27       .'
    sta l004e                                                         ; 8fb8: 85 4e       .N
    lda l0026                                                         ; 8fba: a5 26       .&
    lsr l004e                                                         ; 8fbc: 46 4e       FN
    ror a                                                             ; 8fbe: 6a          j
    lsr l004e                                                         ; 8fbf: 46 4e       FN
    ror a                                                             ; 8fc1: 6a          j
    lsr l004e                                                         ; 8fc2: 46 4e       FN
    ror a                                                             ; 8fc4: 6a          j
    lsr l004e                                                         ; 8fc5: 46 4e       FN
    ror a                                                             ; 8fc7: 6a          j
    lsr l004e                                                         ; 8fc8: 46 4e       FN
    ror a                                                             ; 8fca: 6a          j
    eor #&1f                                                          ; 8fcb: 49 1f       I.
    sta l0029                                                         ; 8fcd: 85 29       .)
    lda l0025                                                         ; 8fcf: a5 25       .%
    sta l004e                                                         ; 8fd1: 85 4e       .N
    lda l0024                                                         ; 8fd3: a5 24       .$
    lsr l004e                                                         ; 8fd5: 46 4e       FN
    ror a                                                             ; 8fd7: 6a          j
    lsr l004e                                                         ; 8fd8: 46 4e       FN
    ror a                                                             ; 8fda: 6a          j
    lsr l004e                                                         ; 8fdb: 46 4e       FN
    ror a                                                             ; 8fdd: 6a          j
    lsr l004e                                                         ; 8fde: 46 4e       FN
    ror a                                                             ; 8fe0: 6a          j
    sta l0028                                                         ; 8fe1: 85 28       .(
    jmp c90b0                                                         ; 8fe3: 4c b0 90    L..

.c8fe6
    lda l0028                                                         ; 8fe6: a5 28       .(
    sta l0050                                                         ; 8fe8: 85 50       .P
    lda l0029                                                         ; 8fea: a5 29       .)
    sta l0051                                                         ; 8fec: 85 51       .Q
    jmp c8f26                                                         ; 8fee: 4c 26 8f    L&.

.c8ff1
    jsr sub_c9190                                                     ; 8ff1: 20 90 91     ..
    lda l0028                                                         ; 8ff4: a5 28       .(
    pha                                                               ; 8ff6: 48          H
    ldx #<(l0024)                                                     ; 8ff7: a2 24       .$
    ldy #>(l0024)                                                     ; 8ff9: a0 00       ..
    lda #osword_read_pixel                                            ; 8ffb: a9 09       ..
    jsr osword                                                        ; 8ffd: 20 f1 ff     ..            ; Read pixel value
    lda l0028                                                         ; 9000: a5 28       .(
    eor #1                                                            ; 9002: 49 01       I.
    tay                                                               ; 9004: a8          .
    pla                                                               ; 9005: 68          h
    sta l0028                                                         ; 9006: 85 28       .(
    sty l001f                                                         ; 9008: 84 1f       ..
    ldx #0                                                            ; 900a: a2 00       ..
    jsr sub_c8351                                                     ; 900c: 20 51 83     Q.
    jmp c9015                                                         ; 900f: 4c 15 90    L..

.c9012
    jmp c8f26                                                         ; 9012: 4c 26 8f    L&.

.c9015
    jsr sub_c9190                                                     ; 9015: 20 90 91     ..
    lda l0028                                                         ; 9018: a5 28       .(
    sec                                                               ; 901a: 38          8
    sbc #&10                                                          ; 901b: e9 10       ..
    bcs c9012                                                         ; 901d: b0 f3       ..
    lda #0                                                            ; 901f: a9 00       ..
    sta l0023                                                         ; 9021: 85 23       .#
    lda l0029                                                         ; 9023: a5 29       .)
    cmp l1914                                                         ; 9025: cd 14 19    ...
    rol l0023                                                         ; 9028: 26 23       &#
    lda l1914                                                         ; 902a: ad 14 19    ...
    clc                                                               ; 902d: 18          .
    adc #&10                                                          ; 902e: 69 10       i.
    cmp l0029                                                         ; 9030: c5 29       .)
    rol l0023                                                         ; 9032: 26 23       &#
    lda l0023                                                         ; 9034: a5 23       .#
    cmp #3                                                            ; 9036: c9 03       ..
    bne c9012                                                         ; 9038: d0 d8       ..
    lda l193e                                                         ; 903a: ad 3e 19    .>.
    bne c9045                                                         ; 903d: d0 06       ..
    lda l0029                                                         ; 903f: a5 29       .)
    cmp #&10                                                          ; 9041: c9 10       ..
    beq c9012                                                         ; 9043: f0 cd       ..
.c9045
    ldx l0028                                                         ; 9045: a6 28       .(
    ldy l0029                                                         ; 9047: a4 29       .)
    lda #4                                                            ; 9049: a9 04       ..
    jsr oswrch                                                        ; 904b: 20 ee ff     ..            ; Write character 4
    lda #&1f                                                          ; 904e: a9 1f       ..
    jsr oswrch                                                        ; 9050: 20 ee ff     ..            ; Write character 31
    txa                                                               ; 9053: 8a          .
    jsr oswrch                                                        ; 9054: 20 ee ff     ..            ; Write character
    tya                                                               ; 9057: 98          .
    jsr oswrch                                                        ; 9058: 20 ee ff     ..            ; Write character
    lda #&20 ; ' '                                                    ; 905b: a9 20       .
    ldx l001f                                                         ; 905d: a6 1f       ..
    beq c9063                                                         ; 905f: f0 02       ..
    lda #&ff                                                          ; 9061: a9 ff       ..
.c9063
    jsr oswrch                                                        ; 9063: 20 ee ff     ..            ; Write character 255
    lda #&45 ; 'E'                                                    ; 9066: a9 45       .E
    jsr sub_c8606                                                     ; 9068: 20 06 86     ..
    lda l0028                                                         ; 906b: a5 28       .(
    asl a                                                             ; 906d: 0a          .
    clc                                                               ; 906e: 18          .
    adc l0008                                                         ; 906f: 65 08       e.
    sta l000c                                                         ; 9071: 85 0c       ..
    lda l0009                                                         ; 9073: a5 09       ..
    adc #0                                                            ; 9075: 69 00       i.
    sta l000d                                                         ; 9077: 85 0d       ..
    lda #&0f                                                          ; 9079: a9 0f       ..
    sec                                                               ; 907b: 38          8
    sbc l0029                                                         ; 907c: e5 29       .)
    clc                                                               ; 907e: 18          .
    adc l1914                                                         ; 907f: 6d 14 19    m..
    asl a                                                             ; 9082: 0a          .
    asl a                                                             ; 9083: 0a          .
    clc                                                               ; 9084: 18          .
    adc l000a                                                         ; 9085: 65 0a       e.
    sta l000e                                                         ; 9087: 85 0e       ..
    lda l000b                                                         ; 9089: a5 0b       ..
    adc #0                                                            ; 908b: 69 00       i.
    sta l000f                                                         ; 908d: 85 0f       ..
    ldy #&0c                                                          ; 908f: a0 0c       ..
    jsr sub_c8496                                                     ; 9091: 20 96 84     ..
    jsr sub_c91a5                                                     ; 9094: 20 a5 91     ..
    jsr c8c01                                                         ; 9097: 20 01 8c     ..
    lda l002a                                                         ; 909a: a5 2a       .*
    and #&20 ; ' '                                                    ; 909c: 29 20       )
    bne c90a3                                                         ; 909e: d0 03       ..
    jmp c9015                                                         ; 90a0: 4c 15 90    L..

.c90a3
    jmp c8ee2                                                         ; 90a3: 4c e2 8e    L..

.c90a6
    lda l002a                                                         ; 90a6: a5 2a       .*
    and #&40 ; '@'                                                    ; 90a8: 29 40       )@
    bne c90a3                                                         ; 90aa: d0 f7       ..
    lda l004f                                                         ; 90ac: a5 4f       .O
    beq c90a3                                                         ; 90ae: f0 f3       ..
.c90b0
    lda l0024                                                         ; 90b0: a5 24       .$
    sec                                                               ; 90b2: 38          8
    sbc #&10                                                          ; 90b3: e9 10       ..
    sta l0024                                                         ; 90b5: 85 24       .$
    bcs c90bb                                                         ; 90b7: b0 02       ..
    dec l0025                                                         ; 90b9: c6 25       .%
.c90bb
    lda l0026                                                         ; 90bb: a5 26       .&
    sec                                                               ; 90bd: 38          8
    sbc #&20 ; ' '                                                    ; 90be: e9 20       .
    sta l0026                                                         ; 90c0: 85 26       .&
    bcs c90c6                                                         ; 90c2: b0 02       ..
    dec l0027                                                         ; 90c4: c6 27       .'
.c90c6
    dec l0028                                                         ; 90c6: c6 28       .(
    inc l0029                                                         ; 90c8: e6 29       .)
    lda l0028                                                         ; 90ca: a5 28       .(
    sec                                                               ; 90cc: 38          8
    sbc #3                                                            ; 90cd: e9 03       ..
    bcc c90a3                                                         ; 90cf: 90 d2       ..
    lda l0028                                                         ; 90d1: a5 28       .(
    cmp #&48 ; 'H'                                                    ; 90d3: c9 48       .H
    bne c90db                                                         ; 90d5: d0 04       ..
    inc l0024                                                         ; 90d7: e6 24       .$
    inc l0024                                                         ; 90d9: e6 24       .$
.c90db
    sec                                                               ; 90db: 38          8
    sbc #&49 ; 'I'                                                    ; 90dc: e9 49       .I
    bcs c90a3                                                         ; 90de: b0 c3       ..
    lda l0029                                                         ; 90e0: a5 29       .)
    cmp #&1f                                                          ; 90e2: c9 1f       ..
    bcs c90a3                                                         ; 90e4: b0 bd       ..
    lda l0029                                                         ; 90e6: a5 29       .)
    cmp #5                                                            ; 90e8: c9 05       ..
    bne c90f4                                                         ; 90ea: d0 08       ..
    inc l0026                                                         ; 90ec: e6 26       .&
    inc l0026                                                         ; 90ee: e6 26       .&
    inc l0026                                                         ; 90f0: e6 26       .&
    inc l0026                                                         ; 90f2: e6 26       .&
.c90f4
    sec                                                               ; 90f4: 38          8
    sbc #5                                                            ; 90f5: e9 05       ..
    bcc c90a3                                                         ; 90f7: 90 aa       ..
    lda l193e                                                         ; 90f9: ad 3e 19    .>.
    bne c9107                                                         ; 90fc: d0 09       ..
    lda l0029                                                         ; 90fe: a5 29       .)
    cmp #&13                                                          ; 9100: c9 13       ..
    bcs c9113                                                         ; 9102: b0 0f       ..
    jmp c910d                                                         ; 9104: 4c 0d 91    L..

.c9107
    lda l0029                                                         ; 9107: a5 29       .)
    cmp #&0f                                                          ; 9109: c9 0f       ..
    bcc c9113                                                         ; 910b: 90 06       ..
.c910d
    lda l0028                                                         ; 910d: a5 28       .(
    cmp #&12                                                          ; 910f: c9 12       ..
    bcc c90a3                                                         ; 9111: 90 90       ..
.c9113
    ldy #8                                                            ; 9113: a0 08       ..
    lda #4                                                            ; 9115: a9 04       ..
    jsr sub_c8606                                                     ; 9117: 20 06 86     ..
    jsr sub_c8496                                                     ; 911a: 20 96 84     ..
    jsr sub_c9190                                                     ; 911d: 20 90 91     ..
    ldx #&98                                                          ; 9120: a2 98       ..
    ldy #&a0                                                          ; 9122: a0 a0       ..
    jsr c835f                                                         ; 9124: 20 5f 83     _.
    ldx #&24 ; '$'                                                    ; 9127: a2 24       .$
    ldy #8                                                            ; 9129: a0 08       ..
    jsr sub_c85f1                                                     ; 912b: 20 f1 85     ..
    jmp c8e65                                                         ; 912e: 4c 65 8e    Le.

    equb &20, &3a, &91, &a9,   0, &8d, &79, &19, &60                  ; 9131: 20 3a 91...  :.

.c913a
    jsr sub_c9190                                                     ; 913a: 20 90 91     ..
    ldy #8                                                            ; 913d: a0 08       ..
    lda #4                                                            ; 913f: a9 04       ..
    jsr sub_c8606                                                     ; 9141: 20 06 86     ..
    jsr sub_c8496                                                     ; 9144: 20 96 84     ..
    ldx #&98                                                          ; 9147: a2 98       ..
    ldy #&a0                                                          ; 9149: a0 a0       ..
    jsr c835f                                                         ; 914b: 20 5f 83     _.
    lda l0000                                                         ; 914e: a5 00       ..
    sta l0004                                                         ; 9150: 85 04       ..
    lda l0001                                                         ; 9152: a5 01       ..
    sta l0005                                                         ; 9154: 85 05       ..
    lda #0                                                            ; 9156: a9 00       ..
    sta l0002                                                         ; 9158: 85 02       ..
    lda #&26 ; '&'                                                    ; 915a: a9 26       .&
    sta l0003                                                         ; 915c: 85 03       ..
    lda #&11                                                          ; 915e: a9 11       ..
    sta l001f                                                         ; 9160: 85 1f       ..
.c9162
    ldx #&90                                                          ; 9162: a2 90       ..
    ldy #0                                                            ; 9164: a0 00       ..
.loop_c9166
    lda (l0002),y                                                     ; 9166: b1 02       ..
    sta (l0004),y                                                     ; 9168: 91 04       ..
    iny                                                               ; 916a: c8          .
    dex                                                               ; 916b: ca          .
    bne loop_c9166                                                    ; 916c: d0 f8       ..
    lda l0002                                                         ; 916e: a5 02       ..
    clc                                                               ; 9170: 18          .
    adc #&90                                                          ; 9171: 69 90       i.
    sta l0002                                                         ; 9173: 85 02       ..
    bcc c9179                                                         ; 9175: 90 02       ..
    inc l0003                                                         ; 9177: e6 03       ..
.c9179
    clc                                                               ; 9179: 18          .
    lda l0004                                                         ; 917a: a5 04       ..
    adc #&80                                                          ; 917c: 69 80       i.
    sta l0004                                                         ; 917e: 85 04       ..
    lda l0005                                                         ; 9180: a5 05       ..
    adc #2                                                            ; 9182: 69 02       i.
    sta l0005                                                         ; 9184: 85 05       ..
    dec l001f                                                         ; 9186: c6 1f       ..
    bne c9162                                                         ; 9188: d0 d8       ..
    lda #0                                                            ; 918a: a9 00       ..
    sta l1979                                                         ; 918c: 8d 79 19    .y.
    rts                                                               ; 918f: 60          `

.sub_c9190
    lda l1978                                                         ; 9190: ad 78 19    .x.
    beq c91a4                                                         ; 9193: f0 0f       ..
    jsr sub_c91a5                                                     ; 9195: 20 a5 91     ..
    ldx #&6e ; 'n'                                                    ; 9198: a2 6e       .n
    ldy #&8c                                                          ; 919a: a0 8c       ..
    jsr c8c72                                                         ; 919c: 20 72 8c     r.
    lda #0                                                            ; 919f: a9 00       ..
    sta l1978                                                         ; 91a1: 8d 78 19    .x.
.c91a4
    rts                                                               ; 91a4: 60          `

.sub_c91a5
    lda #1                                                            ; 91a5: a9 01       ..
    sta l1978                                                         ; 91a7: 8d 78 19    .x.
    ldx #&6a ; 'j'                                                    ; 91aa: a2 6a       .j
    ldy #&8c                                                          ; 91ac: a0 8c       ..
    jmp c8c72                                                         ; 91ae: 4c 72 8c    Lr.

.sub_c91b1
    lsr l0009                                                         ; 91b1: 46 09       F.
    ror l0008                                                         ; 91b3: 66 08       f.
    lda l000a                                                         ; 91b5: a5 0a       ..
    lsr l000b                                                         ; 91b7: 46 0b       F.
    ror a                                                             ; 91b9: 6a          j
    lsr l000b                                                         ; 91ba: 46 0b       F.
    ror a                                                             ; 91bc: 6a          j
    eor #&ff                                                          ; 91bd: 49 ff       I.
    sta l000a                                                         ; 91bf: 85 0a       ..
.sub_c91c1
    lda l000a                                                         ; 91c1: a5 0a       ..
    and #7                                                            ; 91c3: 29 07       ).
    sta l001c                                                         ; 91c5: 85 1c       ..
    lda l000a                                                         ; 91c7: a5 0a       ..
    and #&f8                                                          ; 91c9: 29 f8       ).
    lsr a                                                             ; 91cb: 4a          J
    lsr a                                                             ; 91cc: 4a          J
    clc                                                               ; 91cd: 18          .
    adc #&30 ; '0'                                                    ; 91ce: 69 30       i0
    sta l001d                                                         ; 91d0: 85 1d       ..
    lda l000a                                                         ; 91d2: a5 0a       ..
    lsr a                                                             ; 91d4: 4a          J
    lsr a                                                             ; 91d5: 4a          J
    lsr a                                                             ; 91d6: 4a          J
    lsr a                                                             ; 91d7: 4a          J
    php                                                               ; 91d8: 08          .
    clc                                                               ; 91d9: 18          .
    adc l001d                                                         ; 91da: 65 1d       e.
    sta l001d                                                         ; 91dc: 85 1d       ..
    lda #0                                                            ; 91de: a9 00       ..
    plp                                                               ; 91e0: 28          (
    ror a                                                             ; 91e1: 6a          j
    adc l001c                                                         ; 91e2: 65 1c       e.
    sta l001c                                                         ; 91e4: 85 1c       ..
    lda l0009                                                         ; 91e6: a5 09       ..
    and #3                                                            ; 91e8: 29 03       ).
    clc                                                               ; 91ea: 18          .
    adc l001d                                                         ; 91eb: 65 1d       e.
    sta l001d                                                         ; 91ed: 85 1d       ..
    lda l0008                                                         ; 91ef: a5 08       ..
    and #&f8                                                          ; 91f1: 29 f8       ).
    clc                                                               ; 91f3: 18          .
    adc l001c                                                         ; 91f4: 65 1c       e.
    sta l001c                                                         ; 91f6: 85 1c       ..
    lda l001d                                                         ; 91f8: a5 1d       ..
    adc #0                                                            ; 91fa: 69 00       i.
    sta l001d                                                         ; 91fc: 85 1d       ..
    lda l0008                                                         ; 91fe: a5 08       ..
    and #7                                                            ; 9200: 29 07       ).
    tay                                                               ; 9202: a8          .
    iny                                                               ; 9203: c8          .
    lda #&80                                                          ; 9204: a9 80       ..
.loop_c9206
    dey                                                               ; 9206: 88          .
    beq c920d                                                         ; 9207: f0 04       ..
    lsr a                                                             ; 9209: 4a          J
    jmp loop_c9206                                                    ; 920a: 4c 06 92    L..

.c920d
    sta l001e                                                         ; 920d: 85 1e       ..
    rts                                                               ; 920f: 60          `

.sub_c9210
    lda l001e                                                         ; 9210: a5 1e       ..
    ldx #0                                                            ; 9212: a2 00       ..
    and (l001c,x)                                                     ; 9214: 21 1c       !.
    sta l001b                                                         ; 9216: 85 1b       ..
    rts                                                               ; 9218: 60          `

.sub_c9219
    lsr l001e                                                         ; 9219: 46 1e       F.
    bne c922c                                                         ; 921b: d0 0f       ..
    lda #&80                                                          ; 921d: a9 80       ..
    sta l001e                                                         ; 921f: 85 1e       ..
    lda l001c                                                         ; 9221: a5 1c       ..
    clc                                                               ; 9223: 18          .
    adc #8                                                            ; 9224: 69 08       i.
    sta l001c                                                         ; 9226: 85 1c       ..
    bcc c922c                                                         ; 9228: 90 02       ..
    inc l001d                                                         ; 922a: e6 1d       ..
.c922c
    rts                                                               ; 922c: 60          `

.our_osword_1_x19_handler
    lda #&10                                                          ; 922d: a9 10       ..
    sta l0048                                                         ; 922f: 85 48       .H
    lda l0024                                                         ; 9231: a5 24       .$
    clc                                                               ; 9233: 18          .
    adc #2                                                            ; 9234: 69 02       i.
    sta l0024                                                         ; 9236: 85 24       .$
    bcc c923c                                                         ; 9238: 90 02       ..
    inc l0025                                                         ; 923a: e6 25       .%
.c923c
    lda l0026                                                         ; 923c: a5 26       .&
    sec                                                               ; 923e: 38          8
    sbc #&40 ; '@'                                                    ; 923f: e9 40       .@
    sta l0026                                                         ; 9241: 85 26       .&
    bcs c9247                                                         ; 9243: b0 02       ..
    dec l0027                                                         ; 9245: c6 27       .'
.c9247
    lda l0026                                                         ; 9247: a5 26       .&
    and #&3c ; '<'                                                    ; 9249: 29 3c       )<
    clc                                                               ; 924b: 18          .
    adc #&a0                                                          ; 924c: 69 a0       i.
    sta l003d                                                         ; 924e: 85 3d       .=
    lda #0                                                            ; 9250: a9 00       ..
    adc #3                                                            ; 9252: 69 03       i.
    sta l003e                                                         ; 9254: 85 3e       .>
.c9256
    lda l0024                                                         ; 9256: a5 24       .$
    and #&1e                                                          ; 9258: 29 1e       ).
    clc                                                               ; 925a: 18          .
    adc #&d0                                                          ; 925b: 69 d0       i.
    sta l003b                                                         ; 925d: 85 3b       .;
    lda #0                                                            ; 925f: a9 00       ..
    adc #4                                                            ; 9261: 69 04       i.
    sta l003c                                                         ; 9263: 85 3c       .<
    lda #&10                                                          ; 9265: a9 10       ..
    sta l0047                                                         ; 9267: 85 47       .G
.c9269
    lda #osword_read_pixel                                            ; 9269: a9 09       ..
    ldx #<(l0024)                                                     ; 926b: a2 24       .$
    ldy #>(l0024)                                                     ; 926d: a0 00       ..
    jsr osword                                                        ; 926f: 20 f1 ff     ..            ; Read pixel value
    ldx #0                                                            ; 9272: a2 00       ..
    ldy l0028                                                         ; 9274: a4 28       .(
    jsr sub_c8351                                                     ; 9276: 20 51 83     Q.
    lda #&45 ; 'E'                                                    ; 9279: a9 45       .E
    jsr sub_c8606                                                     ; 927b: 20 06 86     ..
    ldy #&3b ; ';'                                                    ; 927e: a0 3b       .;
    jsr sub_c8496                                                     ; 9280: 20 96 84     ..
    lda l0024                                                         ; 9283: a5 24       .$
    clc                                                               ; 9285: 18          .
    adc #2                                                            ; 9286: 69 02       i.
    sta l0024                                                         ; 9288: 85 24       .$
    bcc c928e                                                         ; 928a: 90 02       ..
    inc l0025                                                         ; 928c: e6 25       .%
.c928e
    dec l0047                                                         ; 928e: c6 47       .G
    beq c92a8                                                         ; 9290: f0 16       ..
    lda l003b                                                         ; 9292: a5 3b       .;
    clc                                                               ; 9294: 18          .
    adc #2                                                            ; 9295: 69 02       i.
    sta l003b                                                         ; 9297: 85 3b       .;
    cmp #&f0                                                          ; 9299: c9 f0       ..
    bne c9269                                                         ; 929b: d0 cc       ..
    lda #&d0                                                          ; 929d: a9 d0       ..
    sta l003b                                                         ; 929f: 85 3b       .;
    lda #4                                                            ; 92a1: a9 04       ..
    sta l003c                                                         ; 92a3: 85 3c       .<
    jmp c9269                                                         ; 92a5: 4c 69 92    Li.

.c92a8
    lda l0024                                                         ; 92a8: a5 24       .$
    sec                                                               ; 92aa: 38          8
    sbc #&20 ; ' '                                                    ; 92ab: e9 20       .
    sta l0024                                                         ; 92ad: 85 24       .$
    bcs c92b3                                                         ; 92af: b0 02       ..
    dec l0025                                                         ; 92b1: c6 25       .%
.c92b3
    lda l0026                                                         ; 92b3: a5 26       .&
    clc                                                               ; 92b5: 18          .
    adc #4                                                            ; 92b6: 69 04       i.
    sta l0026                                                         ; 92b8: 85 26       .&
    bcc c92be                                                         ; 92ba: 90 02       ..
    inc l0027                                                         ; 92bc: e6 27       .'
.c92be
    dec l0048                                                         ; 92be: c6 48       .H
    beq c92d8                                                         ; 92c0: f0 16       ..
    lda l003d                                                         ; 92c2: a5 3d       .=
    clc                                                               ; 92c4: 18          .
    adc #4                                                            ; 92c5: 69 04       i.
    sta l003d                                                         ; 92c7: 85 3d       .=
    cmp #&e0                                                          ; 92c9: c9 e0       ..
    bne c9256                                                         ; 92cb: d0 89       ..
    lda #&a0                                                          ; 92cd: a9 a0       ..
    sta l003d                                                         ; 92cf: 85 3d       .=
    lda #3                                                            ; 92d1: a9 03       ..
    sta l003e                                                         ; 92d3: 85 3e       .>
    jmp c9256                                                         ; 92d5: 4c 56 92    LV.

.c92d8
    rts                                                               ; 92d8: 60          `

.our_osword_1_x20_handler
    jsr sub_c9190                                                     ; 92d9: 20 90 91     ..
    jsr our_osword_1_x0_handler                                       ; 92dc: 20 a0 80     ..
    lda #4                                                            ; 92df: a9 04       ..
    jsr oswrch                                                        ; 92e1: 20 ee ff     ..            ; Write character 4
    ldx #&40 ; '@'                                                    ; 92e4: a2 40       .@
    ldy #&a1                                                          ; 92e6: a0 a1       ..
    jsr c8c72                                                         ; 92e8: 20 72 8c     r.
    lda #0                                                            ; 92eb: a9 00       ..
    sta l0008                                                         ; 92ed: 85 08       ..
    lda #&1a                                                          ; 92ef: a9 1a       ..
    sta l0009                                                         ; 92f1: 85 09       ..
    lda #4                                                            ; 92f3: a9 04       ..
    sta l0023                                                         ; 92f5: 85 23       .#
    jmp c92ff                                                         ; 92f7: 4c ff 92    L..

.c92fa
    lda #&0a                                                          ; 92fa: a9 0a       ..
    jsr oswrch                                                        ; 92fc: 20 ee ff     ..            ; Write character 10
.c92ff
    lda #&0d                                                          ; 92ff: a9 0d       ..
    jsr oswrch                                                        ; 9301: 20 ee ff     ..            ; Write character 13
    lda #&0a                                                          ; 9304: a9 0a       ..
    jsr oswrch                                                        ; 9306: 20 ee ff     ..            ; Write character 10
    lda #&20 ; ' '                                                    ; 9309: a9 20       .
    jsr oswrch                                                        ; 930b: 20 ee ff     ..            ; Write character 32
    jsr oswrch                                                        ; 930e: 20 ee ff     ..            ; Write character
    lda #&0d                                                          ; 9311: a9 0d       ..
    sta l001f                                                         ; 9313: 85 1f       ..
.c9315
    jsr sub_c9430                                                     ; 9315: 20 30 94     0.
    inc l0008                                                         ; 9318: e6 08       ..
    bne c931e                                                         ; 931a: d0 02       ..
    inc l0009                                                         ; 931c: e6 09       ..
.c931e
    jsr sub_c9430                                                     ; 931e: 20 30 94     0.
    lda #8                                                            ; 9321: a9 08       ..
    jsr oswrch                                                        ; 9323: 20 ee ff     ..            ; Write character 8
    jsr oswrch                                                        ; 9326: 20 ee ff     ..            ; Write character
    lda #&0a                                                          ; 9329: a9 0a       ..
    jsr oswrch                                                        ; 932b: 20 ee ff     ..            ; Write character 10
    lda l0008                                                         ; 932e: a5 08       ..
    clc                                                               ; 9330: 18          .
    adc #&0f                                                          ; 9331: 69 0f       i.
    sta l0008                                                         ; 9333: 85 08       ..
    bcc c9339                                                         ; 9335: 90 02       ..
    inc l0009                                                         ; 9337: e6 09       ..
.c9339
    jsr sub_c9430                                                     ; 9339: 20 30 94     0.
    inc l0008                                                         ; 933c: e6 08       ..
    bne c9342                                                         ; 933e: d0 02       ..
    inc l0009                                                         ; 9340: e6 09       ..
.c9342
    jsr sub_c9430                                                     ; 9342: 20 30 94     0.
    lda l0008                                                         ; 9345: a5 08       ..
    clc                                                               ; 9347: 18          .
    adc #&0f                                                          ; 9348: 69 0f       i.
    sta l0008                                                         ; 934a: 85 08       ..
    bcc c9350                                                         ; 934c: 90 02       ..
    inc l0009                                                         ; 934e: e6 09       ..
.c9350
    lda #&0b                                                          ; 9350: a9 0b       ..
    jsr oswrch                                                        ; 9352: 20 ee ff     ..            ; Write character 11
    dec l001f                                                         ; 9355: c6 1f       ..
    bne c9315                                                         ; 9357: d0 bc       ..
    dec l0023                                                         ; 9359: c6 23       .#
    bne c92fa                                                         ; 935b: d0 9d       ..
    lda l0009                                                         ; 935d: a5 09       ..
    cmp #&25 ; '%'                                                    ; 935f: c9 25       .%
    bne c939d                                                         ; 9361: d0 3a       .:
    lda #&df                                                          ; 9363: a9 df       ..
    sta l0004                                                         ; 9365: 85 04       ..
    lda #&19                                                          ; 9367: a9 19       ..
    sta l0005                                                         ; 9369: 85 05       ..
    lda #&0a                                                          ; 936b: a9 0a       ..
    jsr oswrch                                                        ; 936d: 20 ee ff     ..            ; Write character 10
    lda #&0a                                                          ; 9370: a9 0a       ..
    jsr oswrch                                                        ; 9372: 20 ee ff     ..            ; Write character 10
    lda #&0a                                                          ; 9375: a9 0a       ..
    jsr oswrch                                                        ; 9377: 20 ee ff     ..            ; Write character 10
    lda #&0d                                                          ; 937a: a9 0d       ..
    jsr oswrch                                                        ; 937c: 20 ee ff     ..            ; Write character 13
    jsr sub_c93ca                                                     ; 937f: 20 ca 93     ..
    ldy #0                                                            ; 9382: a0 00       ..
    ldx #&10                                                          ; 9384: a2 10       ..
    jsr c8369                                                         ; 9386: 20 69 83     i.
    lda #&0d                                                          ; 9389: a9 0d       ..
    jsr oswrch                                                        ; 938b: 20 ee ff     ..            ; Write character 13
    lda #&0a                                                          ; 938e: a9 0a       ..
    jsr oswrch                                                        ; 9390: 20 ee ff     ..            ; Write character 10
    jsr sub_c93ca                                                     ; 9393: 20 ca 93     ..
    ldy #&11                                                          ; 9396: a0 11       ..
    ldx #&10                                                          ; 9398: a2 10       ..
    jsr c8369                                                         ; 939a: 20 69 83     i.
.c939d
    jsr c8c01                                                         ; 939d: 20 01 8c     ..
    jsr sub_c91a5                                                     ; 93a0: 20 a5 91     ..
    lda l002a                                                         ; 93a3: a5 2a       .*
    and #&80                                                          ; 93a5: 29 80       ).
    beq c93d5                                                         ; 93a7: f0 2c       .,
    lda l002a                                                         ; 93a9: a5 2a       .*
    and #&20 ; ' '                                                    ; 93ab: 29 20       )
    beq c93e0                                                         ; 93ad: f0 31       .1
    lda l002a                                                         ; 93af: a5 2a       .*
    and #&40 ; '@'                                                    ; 93b1: 29 40       )@
    bne c939d                                                         ; 93b3: d0 e8       ..
    lda l0009                                                         ; 93b5: a5 09       ..
    cmp #&25 ; '%'                                                    ; 93b7: c9 25       .%
    beq c93d5                                                         ; 93b9: f0 1a       ..
    jsr sub_c9190                                                     ; 93bb: 20 90 91     ..
    lda #&0c                                                          ; 93be: a9 0c       ..
    jsr oswrch                                                        ; 93c0: 20 ee ff     ..            ; Write character 12
    lda #3                                                            ; 93c3: a9 03       ..
    sta l0023                                                         ; 93c5: 85 23       .#
    jmp c92ff                                                         ; 93c7: 4c ff 92    L..

.sub_c93ca
    ldx #7                                                            ; 93ca: a2 07       ..
.loop_c93cc
    lda #&20 ; ' '                                                    ; 93cc: a9 20       .
    jsr oswrch                                                        ; 93ce: 20 ee ff     ..            ; Write character 32
    dex                                                               ; 93d1: ca          .
    bne loop_c93cc                                                    ; 93d2: d0 f8       ..
    rts                                                               ; 93d4: 60          `

.c93d5
    jsr sub_c9190                                                     ; 93d5: 20 90 91     ..
    jsr our_osword_1_x1_handler                                       ; 93d8: 20 0f 81     ..
    lda #&ff                                                          ; 93db: a9 ff       ..
    sta l001f                                                         ; 93dd: 85 1f       ..
    rts                                                               ; 93df: 60          `

.c93e0
    lda l0028                                                         ; 93e0: a5 28       .(
    sec                                                               ; 93e2: 38          8
    sbc #&18                                                          ; 93e3: e9 18       ..
    bcc c939d                                                         ; 93e5: 90 b6       ..
    lda l0029                                                         ; 93e7: a5 29       .)
    sec                                                               ; 93e9: 38          8
    sbc #&0c                                                          ; 93ea: e9 0c       ..
    bcc c939d                                                         ; 93ec: 90 af       ..
    lda #&31 ; '1'                                                    ; 93ee: a9 31       .1
    sec                                                               ; 93f0: 38          8
    sbc l0028                                                         ; 93f1: e5 28       .(
    bcc c939d                                                         ; 93f3: 90 a8       ..
    lda #&13                                                          ; 93f5: a9 13       ..
    sec                                                               ; 93f7: 38          8
    sbc l0029                                                         ; 93f8: e5 29       .)
    bcc c939d                                                         ; 93fa: 90 a1       ..
    lda l0029                                                         ; 93fc: a5 29       .)
    sec                                                               ; 93fe: 38          8
    sbc #&0c                                                          ; 93ff: e9 0c       ..
    lsr a                                                             ; 9401: 4a          J
    sta l0023                                                         ; 9402: 85 23       .#
    asl a                                                             ; 9404: 0a          .
    clc                                                               ; 9405: 18          .
    adc l0023                                                         ; 9406: 65 23       e#
    asl a                                                             ; 9408: 0a          .
    asl a                                                             ; 9409: 0a          .
    clc                                                               ; 940a: 18          .
    adc l0023                                                         ; 940b: 65 23       e#
    sta l001f                                                         ; 940d: 85 1f       ..
    lda l0028                                                         ; 940f: a5 28       .(
    sec                                                               ; 9411: 38          8
    sbc #&1a                                                          ; 9412: e9 1a       ..
    lsr a                                                             ; 9414: 4a          J
    clc                                                               ; 9415: 18          .
    adc l001f                                                         ; 9416: 65 1f       e.
    sta l001f                                                         ; 9418: 85 1f       ..
    lda l0009                                                         ; 941a: a5 09       ..
    cmp #&25 ; '%'                                                    ; 941c: c9 25       .%
    bne c9427                                                         ; 941e: d0 07       ..
    lda l001f                                                         ; 9420: a5 1f       ..
    clc                                                               ; 9422: 18          .
    adc #&34 ; '4'                                                    ; 9423: 69 34       i4
    sta l001f                                                         ; 9425: 85 1f       ..
.c9427
    inc l001f                                                         ; 9427: e6 1f       ..
    jsr sub_c9190                                                     ; 9429: 20 90 91     ..
    jsr our_osword_1_x1_handler                                       ; 942c: 20 0f 81     ..
    rts                                                               ; 942f: 60          `

.sub_c9430
    ldy #0                                                            ; 9430: a0 00       ..
    ldx #8                                                            ; 9432: a2 08       ..
    lda #&17                                                          ; 9434: a9 17       ..
    jsr oswrch                                                        ; 9436: 20 ee ff     ..            ; Write character 23
    lda #&e0                                                          ; 9439: a9 e0       ..
    jsr oswrch                                                        ; 943b: 20 ee ff     ..            ; Write character 224
.loop_c943e
    lda (l0008),y                                                     ; 943e: b1 08       ..
    jsr oswrch                                                        ; 9440: 20 ee ff     ..            ; Write character
    iny                                                               ; 9443: c8          .
    iny                                                               ; 9444: c8          .
    dex                                                               ; 9445: ca          .
    bne loop_c943e                                                    ; 9446: d0 f6       ..
    lda #&e0                                                          ; 9448: a9 e0       ..
    jsr oswrch                                                        ; 944a: 20 ee ff     ..            ; Write character 224
    rts                                                               ; 944d: 60          `

.our_osword_1_x21_handler
    lda #4                                                            ; 944e: a9 04       ..
    ldy #&2b ; '+'                                                    ; 9450: a0 2b       .+
    jsr sub_c9500                                                     ; 9452: 20 00 95     ..
    jsr sub_c94e9                                                     ; 9455: 20 e9 94     ..
.c9458
    jsr c8c01                                                         ; 9458: 20 01 8c     ..
    jsr sub_c9526                                                     ; 945b: 20 26 95     &.
    lda l002a                                                         ; 945e: a5 2a       .*
    and #&e0                                                          ; 9460: 29 e0       ).
    cmp #&e0                                                          ; 9462: c9 e0       ..
    bne c946f                                                         ; 9464: d0 09       ..
    ldx #&2b ; '+'                                                    ; 9466: a2 2b       .+
    ldy #&24 ; '$'                                                    ; 9468: a0 24       .$
    jsr sub_c85cf                                                     ; 946a: 20 cf 85     ..
    beq c9458                                                         ; 946d: f0 e9       ..
.c946f
    lda #4                                                            ; 946f: a9 04       ..
    ldy #&2b ; '+'                                                    ; 9471: a0 2b       .+
    jsr sub_c9500                                                     ; 9473: 20 00 95     ..
    jsr sub_c94e9                                                     ; 9476: 20 e9 94     ..
    lda #4                                                            ; 9479: a9 04       ..
    ldy #&24 ; '$'                                                    ; 947b: a0 24       .$
    jsr sub_c9500                                                     ; 947d: 20 00 95     ..
    jsr sub_c94e9                                                     ; 9480: 20 e9 94     ..
    ldx #&24 ; '$'                                                    ; 9483: a2 24       .$
    ldy #&2b ; '+'                                                    ; 9485: a0 2b       .+
    jsr sub_c85f1                                                     ; 9487: 20 f1 85     ..
    lda l002a                                                         ; 948a: a5 2a       .*
    and #&80                                                          ; 948c: 29 80       ).
    beq c94de                                                         ; 948e: f0 4e       .N
    lda l002a                                                         ; 9490: a5 2a       .*
    and #&20 ; ' '                                                    ; 9492: 29 20       )
    bne c9458                                                         ; 9494: d0 c2       ..
    lda #4                                                            ; 9496: a9 04       ..
    ldy #&2b ; '+'                                                    ; 9498: a0 2b       .+
    jsr sub_c9500                                                     ; 949a: 20 00 95     ..
    jsr sub_c94e9                                                     ; 949d: 20 e9 94     ..
    jsr sub_c953a                                                     ; 94a0: 20 3a 95     :.
    lda #4                                                            ; 94a3: a9 04       ..
    ldy #&24 ; '$'                                                    ; 94a5: a0 24       .$
    jsr sub_c9500                                                     ; 94a7: 20 00 95     ..
    jsr sub_c954a                                                     ; 94aa: 20 4a 95     J.
    and #&fb                                                          ; 94ad: 29 fb       ).
    ldx l1970                                                         ; 94af: ae 70 19    .p.
    beq c94b6                                                         ; 94b2: f0 02       ..
    lda #0                                                            ; 94b4: a9 00       ..
.c94b6
    ldy #&33 ; '3'                                                    ; 94b6: a0 33       .3
    jsr sub_c9500                                                     ; 94b8: 20 00 95     ..
    jsr sub_c954a                                                     ; 94bb: 20 4a 95     J.
    and #&fb                                                          ; 94be: 29 fb       ).
    ldx l1970                                                         ; 94c0: ae 70 19    .p.
    beq c94c7                                                         ; 94c3: f0 02       ..
    lda #&51 ; 'Q'                                                    ; 94c5: a9 51       .Q
.c94c7
    ldy #&37 ; '7'                                                    ; 94c7: a0 37       .7
    jsr sub_c9500                                                     ; 94c9: 20 00 95     ..
    jsr sub_c954a                                                     ; 94cc: 20 4a 95     J.
    and #&fb                                                          ; 94cf: 29 fb       ).
    ldx l1970                                                         ; 94d1: ae 70 19    .p.
    bne c94db                                                         ; 94d4: d0 05       ..
    ldy #&3b ; ';'                                                    ; 94d6: a0 3b       .;
    jsr sub_c9500                                                     ; 94d8: 20 00 95     ..
.c94db
    jmp our_osword_1_x21_handler                                      ; 94db: 4c 4e 94    LN.

.c94de
    lda #4                                                            ; 94de: a9 04       ..
    ldy #&2b ; '+'                                                    ; 94e0: a0 2b       .+
    jsr sub_c9500                                                     ; 94e2: 20 00 95     ..
    jsr sub_c94e9                                                     ; 94e5: 20 e9 94     ..
    rts                                                               ; 94e8: 60          `

.sub_c94e9
    ldx #4                                                            ; 94e9: a2 04       ..
    jsr sub_c8351                                                     ; 94eb: 20 51 83     Q.
    lda #1                                                            ; 94ee: a9 01       ..
    ldy #&33 ; '3'                                                    ; 94f0: a0 33       .3
    jsr sub_c9500                                                     ; 94f2: 20 00 95     ..
    ldy #&37 ; '7'                                                    ; 94f5: a0 37       .7
    jsr sub_c9500                                                     ; 94f7: 20 00 95     ..
    ldy #&3b ; ';'                                                    ; 94fa: a0 3b       .;
    jsr sub_c9500                                                     ; 94fc: 20 00 95     ..
    rts                                                               ; 94ff: 60          `

.sub_c9500
    pha                                                               ; 9500: 48          H
    tya                                                               ; 9501: 98          .
    tax                                                               ; 9502: aa          .
    iny                                                               ; 9503: c8          .
    iny                                                               ; 9504: c8          .
    pla                                                               ; 9505: 68          h
    jmp c9509                                                         ; 9506: 4c 09 95    L..

.c9509
    pha                                                               ; 9509: 48          H
    jsr sub_c8606                                                     ; 950a: 20 06 86     ..
    lda l0000,x                                                       ; 950d: b5 00       ..
    jsr oswrch                                                        ; 950f: 20 ee ff     ..            ; Write character
    lda l0001,x                                                       ; 9512: b5 01       ..
    jsr oswrch                                                        ; 9514: 20 ee ff     ..            ; Write character
    lda l0000,y                                                       ; 9517: b9 00 00    ...
    jsr oswrch                                                        ; 951a: 20 ee ff     ..            ; Write character
    lda l0001,y                                                       ; 951d: b9 01 00    ...
    jsr oswrch                                                        ; 9520: 20 ee ff     ..            ; Write character
    pla                                                               ; 9523: 68          h
    rts                                                               ; 9524: 60          `

.loop_c9525
    rts                                                               ; 9525: 60          `

.sub_c9526
    lda l1917                                                         ; 9526: ad 17 19    ...
    beq loop_c9525                                                    ; 9529: f0 fa       ..
    lda l0024                                                         ; 952b: a5 24       .$
    and l1918                                                         ; 952d: 2d 18 19    -..
    sta l0024                                                         ; 9530: 85 24       .$
    lda l0026                                                         ; 9532: a5 26       .&
    and l1919                                                         ; 9534: 2d 19 19    -..
    sta l0026                                                         ; 9537: 85 26       .&
    rts                                                               ; 9539: 60          `

.sub_c953a
    ldx #4                                                            ; 953a: a2 04       ..
    lda l1913                                                         ; 953c: ad 13 19    ...
    cmp #2                                                            ; 953f: c9 02       ..
    beq c9545                                                         ; 9541: f0 02       ..
    ldx #0                                                            ; 9543: a2 00       ..
.c9545
    tay                                                               ; 9545: a8          .
    jsr sub_c8351                                                     ; 9546: 20 51 83     Q.
    rts                                                               ; 9549: 60          `

.sub_c954a
    lda l1972                                                         ; 954a: ad 72 19    .r.
    beq c9552                                                         ; 954d: f0 03       ..
    lda #&15                                                          ; 954f: a9 15       ..
    rts                                                               ; 9551: 60          `

.c9552
    lda #&0d                                                          ; 9552: a9 0d       ..
    rts                                                               ; 9554: 60          `

.our_osword_1_x22_handler
    lda #&10                                                          ; 9555: a9 10       ..
    sta l1959                                                         ; 9557: 8d 59 19    .Y.
    sta l195a                                                         ; 955a: 8d 5a 19    .Z.
    lda #&ff                                                          ; 955d: a9 ff       ..
    sta l195b                                                         ; 955f: 8d 5b 19    .[.
    sta l195c                                                         ; 9562: 8d 5c 19    .\.
    lda #0                                                            ; 9565: a9 00       ..
    sta l195e                                                         ; 9567: 8d 5e 19    .^.
    sta l1960                                                         ; 956a: 8d 60 19    .`.
    lda #&20 ; ' '                                                    ; 956d: a9 20       .
    sta l195d                                                         ; 956f: 8d 5d 19    .].
    lda #&40 ; '@'                                                    ; 9572: a9 40       .@
    sta l195f                                                         ; 9574: 8d 5f 19    ._.
    rts                                                               ; 9577: 60          `

.our_osword_1_x24_handler
    ldy #0                                                            ; 9578: a0 00       ..
.loop_c957a
    lda la3d1,y                                                       ; 957a: b9 d1 a3    ...
    sta l0700,y                                                       ; 957d: 99 00 07    ...
    dey                                                               ; 9580: 88          .
    bne loop_c957a                                                    ; 9581: d0 f7       ..
    rts                                                               ; 9583: 60          `

.our_osword_1_x25_handler
    ldy #7                                                            ; 9584: a0 07       ..
.loop_c9586
    lda la0ba,y                                                       ; 9586: b9 ba a0    ...
    sta l0100,y                                                       ; 9589: 99 00 01    ...
    dey                                                               ; 958c: 88          .
    bpl loop_c9586                                                    ; 958d: 10 f7       ..
    lda l1941                                                         ; 958f: ad 41 19    .A.
    sta l0106                                                         ; 9592: 8d 06 01    ...
    ldx #<(l0100)                                                     ; 9595: a2 00       ..
    ldy #>(l0100)                                                     ; 9597: a0 01       ..
    jsr oscli                                                         ; 9599: 20 f7 ff     ..
    ldy #5                                                            ; 959c: a0 05       ..
.loop_c959e
    lda la0c2,y                                                       ; 959e: b9 c2 a0    ...
    sta l0100,y                                                       ; 95a1: 99 00 01    ...
    dey                                                               ; 95a4: 88          .
    bpl loop_c959e                                                    ; 95a5: 10 f7       ..
    lda l1943                                                         ; 95a7: ad 43 19    .C.
    sta l0104                                                         ; 95aa: 8d 04 01    ...
    ldx #<(l0100)                                                     ; 95ad: a2 00       ..
    ldy #>(l0100)                                                     ; 95af: a0 01       ..
    jsr oscli                                                         ; 95b1: 20 f7 ff     ..
    ldy #&0c                                                          ; 95b4: a0 0c       ..
    lda #0                                                            ; 95b6: a9 00       ..
.loop_c95b8
    sta l192d,y                                                       ; 95b8: 99 2d 19    .-.
    dey                                                               ; 95bb: 88          .
    bpl loop_c95b8                                                    ; 95bc: 10 fa       ..
    ldy #0                                                            ; 95be: a0 00       ..
.loop_c95c0
    sta l0700,y                                                       ; 95c0: 99 00 07    ...
    dey                                                               ; 95c3: 88          .
    bne loop_c95c0                                                    ; 95c4: d0 fa       ..
    lda #7                                                            ; 95c6: a9 07       ..
    sta l192f                                                         ; 95c8: 8d 2f 19    ./.
    sta l1933                                                         ; 95cb: 8d 33 19    .3.
    ldx #<(l192d)                                                     ; 95ce: a2 2d       .-
    ldy #>(l192d)                                                     ; 95d0: a0 19       ..
    lda #osgbpb_read_file_names                                       ; 95d2: a9 08       ..
    jsr osgbpb                                                        ; 95d4: 20 d1 ff     ..            ; read file names from the current directory (A=8)
    lda #0                                                            ; 95d7: a9 00       ..
    sta l0047                                                         ; 95d9: 85 47       .G
    lda #7                                                            ; 95db: a9 07       ..
    sta l0048                                                         ; 95dd: 85 48       .H
    lda #8                                                            ; 95df: a9 08       ..
    jsr oswrch                                                        ; 95e1: 20 ee ff     ..            ; Write character 8
    lda l0700                                                         ; 95e4: ad 00 07    ...
    cmp #7                                                            ; 95e7: c9 07       ..
    bne c9616                                                         ; 95e9: d0 2b       .+
.c95eb
    ldy #0                                                            ; 95eb: a0 00       ..
    lda (l0047),y                                                     ; 95ed: b1 47       .G
    beq c9616                                                         ; 95ef: f0 25       .%
    lda #&20 ; ' '                                                    ; 95f1: a9 20       .
    jsr oswrch                                                        ; 95f3: 20 ee ff     ..            ; Write character 32
    lda #&20 ; ' '                                                    ; 95f6: a9 20       .
    jsr oswrch                                                        ; 95f8: 20 ee ff     ..            ; Write character 32
    lda #&20 ; ' '                                                    ; 95fb: a9 20       .
    jsr oswrch                                                        ; 95fd: 20 ee ff     ..            ; Write character 32
    ldy #1                                                            ; 9600: a0 01       ..
.loop_c9602
    lda (l0047),y                                                     ; 9602: b1 47       .G
    jsr oswrch                                                        ; 9604: 20 ee ff     ..            ; Write character
    iny                                                               ; 9607: c8          .
    cpy #8                                                            ; 9608: c0 08       ..
    bne loop_c9602                                                    ; 960a: d0 f6       ..
    clc                                                               ; 960c: 18          .
    lda l0047                                                         ; 960d: a5 47       .G
    adc #8                                                            ; 960f: 69 08       i.
    sta l0047                                                         ; 9611: 85 47       .G
    jmp c95eb                                                         ; 9613: 4c eb 95    L..

.c9616
    ldx #&ba                                                          ; 9616: a2 ba       ..
    ldy #&a0                                                          ; 9618: a0 a0       ..
    jsr c8c72                                                         ; 961a: 20 72 8c     r.
    ldx #&c2                                                          ; 961d: a2 c2       ..
    ldy #&a0                                                          ; 961f: a0 a0       ..
    jsr c8c72                                                         ; 9621: 20 72 8c     r.
    rts                                                               ; 9624: 60          `

    equb &0d, &1a,   4, &18, &1c,   0, &c4,   3, &cc,   4, &f0,   3   ; 9625: 0d 1a 04... ...
    equb &10, &1a, &12, &19,   2, &1e,   0,   0,   0, &19,   0,   0   ; 9631: 10 1a 12... ...
    equb   0, &d4, &ff, &19,   2, &e2, &ff,   0,   0, &8c, &96, &b1   ; 963d: 00 d4 ff... ...
    equb &96, &dd, &96, &10, &97, &43, &97, &78, &97, &a5, &97, &d8   ; 9649: 96 dd 96... ...
    equb &97,   7, &98,   7, &98, &26, &98, &4a, &98, &71, &98, &8c   ; 9655: 97 07 98... ...
    equb &98, &b5, &98, &d2, &98, &f1, &98, &10, &99, &3a, &99, &5e   ; 9661: 98 b5 98... ...
    equb &99, &74, &99, &91, &99, &ca, &99, &f7, &99, &1a, &9a, &35   ; 966d: 99 74 99... .t.
    equb &9a, &66, &9a, &86, &9a, &b3, &9a, &e1, &9a, &f8, &9a, &2e   ; 9679: 9a 66 9a... .f.
    equb &9b, &62, &9b, &7d, &9b, &a4, &9b,   0, &f0                  ; 9685: 9b 62 9b... .b.
    equs "WINDOW:_Define_Border_Clear_Invert"                         ; 968e: 57 49 4e... WIN
    equb &0d,   0, &f8                                                ; 96b0: 0d 00 f8    ...
    equs "TEXT:_Format_Size_File_Keyboard_Show Font"                  ; 96b3: 54 45 58... TEX
    equb &0d,   0, &f8                                                ; 96dc: 0d 00 f8    ...
    equs "TEXT FORMAT:_Centre_Justify_R.Right_Literal_Font"           ; 96df: 54 45 58... TEX
    equb &0d,   0, &f8                                                ; 970f: 0d 00 f8    ...
    equs "FONT SIZE:_Wider_Narrower_Taller_Shorter_Spacing"           ; 9712: 46 4f 4e... FON
    equb &0d,   0, &f8                                                ; 9742: 0d 00 f8    ...
    equs "FONT SPACING:_Wider_Narrower_Taller_Shorter_Symbol"         ; 9745: 46 4f 4e... FON
    equb &0d,   0, &f8                                                ; 9777: 0d 00 f8    ...
    equs "LOAD:_Font_Font Cat_Wordwise_View_Text Cat"                 ; 977a: 4c 4f 41... LOA
    equb &0d,   0, &e0                                                ; 97a4: 0d 00 e0    ...
    equs "ROTATE:_   90_  180_  270        (All Clockwise)"           ; 97a7: 52 4f 54... ROT
    equb &0d,   0, &f8                                                ; 97d7: 0d 00 f8    ...
    equs "GRAPHICS:_Symbol_Spray_Paint_Patterns_Shapes"               ; 97da: 47 52 41... GRA
    equb &0d,   0                                                     ; 9806: 0d 00       ..
    equs "pSPRAY:__Start_Ghost_(White)_"                              ; 9808: 70 53 50... pSP
    equb &0d,   0                                                     ; 9825: 0d 00       ..
    equs "xSHAPES:__Circle_Triangle_Box_Line"                         ; 9827: 78 53 48... xSH
    equb &0d,   0, &f8                                                ; 9849: 0d 00 f8    ...
    equs "PASTE:_Copy_Stretch_Rotate_Flip_Zoom"                       ; 984c: 50 41 53... PAS
    equb &0d,   0, &e0                                                ; 9870: 0d 00 e0    ...
    equs "FLIP:_Same_L to R_T to B"                                   ; 9873: 46 4c 49... FLI
    equb &0d,   0,   0                                                ; 988b: 0d 00 00    ...
    equs "ZOOM:__Select area to ZOOM or touch up"                     ; 988e: 5a 4f 4f... ZOO
    equb &0d,   0, &e0                                                ; 98b4: 0d 00 e0    ...
    equs "FILING:_Page_Screen_Cutout"                                 ; 98b7: 46 49 4c... FIL
    equb &0d,   0, &d0                                                ; 98d1: 0d 00 d0    ...
    equs "SCREEN:_Load_Save__Catalogue"                               ; 98d4: 53 43 52... SCR
    equb &0d,   0, &d0                                                ; 98f0: 0d 00 d0    ...
    equs "CUTOUT:_Load_Save__Catalogue"                               ; 98f3: 43 55 54... CUT
    equb &0d,   0, &f0                                                ; 990f: 0d 00 f0    ...
    equs "SELECT:_Drive 0_Drive 1_Drive 2_Drive 3"                    ; 9912: 53 45 4c... SEL
    equb &0d,   0, &d0                                                ; 9939: 0d 00 d0    ...
    equs "PAGE FILING:_Save_Load__Duplicate"                          ; 993c: 50 41 47... PAG
    equb &0d,   0, &c0                                                ; 995d: 0d 00 c0    ...
    equs "COPY:_Ghost_(White)"                                        ; 9960: 43 4f 50... COP
    equb &0d,   0, &b0                                                ; 9973: 0d 00 b0    ...
    equs "STRETCH:_Same__ x 1/2_ x 2"                                 ; 9976: 53 54 52... STR
    equb &0d,   0, &f8                                                ; 9990: 0d 00 f8    ...
    equs "GOODIES:_Gridlock_Sound on_Interlace_*COMMAND_More ..."     ; 9993: 47 4f 4f... GOO
    equb &0d,   0, &f8                                                ; 99c9: 0d 00 f8    ...
    equs "GRIDLOCK:_Wider_Narrower_Taller_Shorter_On"                 ; 99cc: 47 52 49... GRI
    equb &0d,   0, &d0                                                ; 99f6: 0d 00 d0    ...
    equs "LOAD CUTOUT:_Ghost_(White)__Load"                           ; 99f9: 4c 4f 41... LOA
    equb &0d,   0, &e0                                                ; 9a19: 0d 00 e0    ...
    equs "DUMP:_Page_Screen_Window"                                   ; 9a1c: 44 55 4d... DUM
    equb &0d,   0, &f8                                                ; 9a34: 0d 00 f8    ...
    equs "PATTERNS:_Reverse_Define_Pick-Up_Select_Invert"             ; 9a37: 50 41 54... PAT
    equb &0d,   0                                                     ; 9a65: 0d 00       ..
    equs "8LINE:___X-Hairs_3D-Aid_Normal"                             ; 9a67: 38 4c 49... 8LI
    equb &0d,   0,   0                                                ; 9a85: 0d 00 00    ...
    equs "DEFINE:__Define your pattern in the window"                 ; 9a88: 44 45 46... DEF
    equb &0d,   0, &f8                                                ; 9ab2: 0d 00 f8    ...
    equs "TEXT COLUMN:_ Up_Down_Window_Continue_Abort"                ; 9ab5: 54 45 58... TEX
    equb &0d,   0, &18                                                ; 9ae0: 0d 00 18    ...
    equs "ZOOM:____ Top_Bottom"                                       ; 9ae3: 5a 4f 4f... ZOO
    equb &0d,   0, &f8                                                ; 9af7: 0d 00 f8    ...
    equs "DUMP:_Sml Draft_Sml Std_Sml NTQ_Large Std_Large NTQ"        ; 9afa: 44 55 4d... DUM
    equb &0d,   0, &f0                                                ; 9b2d: 0d 00 f0    ...
    equs "MORE GOODIES:_Main Menu_Shadow_3D Zicon_u-Justify"          ; 9b30: 4d 4f 52... MOR
    equb &0d,   0, &c0                                                ; 9b61: 0d 00 c0    ...
    equs "3D ZICON:_Load_Catalogue"                                   ; 9b64: 33 44 20... 3D
    equb &0d,   0, &f8                                                ; 9b7c: 0d 00 f8    ...
    equs "PASTE:_Move_Stretch_Rotate_Flip_Zoom"                       ; 9b7f: 50 41 53... PAS
    equb &0d,   0, &c0                                                ; 9ba3: 0d 00 c0    ...
    equs "MOVE:_Ghost_(White)"                                        ; 9ba6: 4d 4f 56... MOV
    equb &0d, &f8, &9b, &0c, &9c, &2d, &9c, &52, &9c, &52, &9c, &61   ; 9bb9: 0d f8 9b... ...
    equb &9c, &81, &9c, &c0, &9c, &d0, &9c, &fa, &9c, &22, &9d, &4a   ; 9bc5: 9c 81 9c... ...
    equb &9d, &70, &9d, &9c, &9d, &b2, &9d, &e6, &9d, &fb, &9d, &17   ; 9bd1: 9d 70 9d... .p.
    equb &9e, &5f, &9e, &75, &9e, &a9, &9e, &cf, &9e, &f7, &9e, &1e   ; 9bdd: 9e 5f 9e... ._.
    equb &9f, &44, &9f, &6a, &9f, &8d, &9f, &bb, &9f, &ee, &9f, &23   ; 9be9: 9f 44 9f... .D.
    equb &a0, &55, &a0, &12                                           ; 9bf5: a0 55 a0... .U.
    equs "Is this OK (Y/N) ?"                                         ; 9bf9: 49 73 20... Is
    equb &0d, &1f                                                     ; 9c0b: 0d 1f       ..
    equs "Incorrect or Corrupt Page Disk."                            ; 9c0d: 49 6e 63... Inc
    equb &0d                                                          ; 9c2c: 0d          .
    equs "#Position Cursor and press <EXECUTE>"                       ; 9c2d: 23 50 6f... #Po
    equb &0d, &0d                                                     ; 9c51: 0d 0d       ..
    equs "Please Wait !"                                              ; 9c53: 50 6c 65... Ple
    equb &0d, &1e                                                     ; 9c60: 0d 1e       ..
    equs "Cannot scroll ... end of page."                             ; 9c62: 43 61 6e... Can
    equb &0d                                                          ; 9c80: 0d          .
    equs "=Changes will be lost - Continue <EXECUTE> or Abort <CAN"   ; 9c81: 3d 43 68... =Ch
    equs "CEL> ?"                                                     ; 9cb9: 43 45 4c... CEL
    equb &0d, &0e                                                     ; 9cbf: 0d 0e       ..
    equs "Press <CANCEL>"                                             ; 9cc1: 50 72 65... Pre
    equb &0d                                                          ; 9ccf: 0d          .
    equs "(AMX Stop Press 1.9 - Select a function  "                  ; 9cd0: 28 41 4d... (AM
    equb &0d                                                          ; 9cf9: 0d          .
    equs "&Insert Cutout Disk and Press <EXECUTE>"                    ; 9cfa: 26 49 6e... &In
    equb &0d                                                          ; 9d21: 0d          .
    equs "&Insert Screen Disk and Press <EXECUTE>"                    ; 9d22: 26 49 6e... &In
    equb &0d                                                          ; 9d49: 0d          .
    equs "$Insert Page Disk and Press <EXECUTE>"                      ; 9d4a: 24 49 6e... $In
    equb &0d                                                          ; 9d6f: 0d          .
    equs "*Select new area using <EXECUTE> and <MOVE>"                ; 9d70: 2a 53 65... *Se
    equb &0d, &14                                                     ; 9d9b: 0d 14       ..
    equs "Are You Sure (Y/N) ?"                                       ; 9d9d: 41 72 65... Are
    equb &0d                                                          ; 9db1: 0d          .
    equs "2Cant use PASTE or FILING when a window is active !"        ; 9db2: 32 43 61... 2Ca
    equb &0d, &13                                                     ; 9de5: 0d 13       ..
    equs "Select area to save"                                        ; 9de7: 53 65 6c... Sel
    equb &0d, &1a                                                     ; 9dfa: 0d 1a       ..
    equs "Invert before save (Y/N) ?"                                 ; 9dfc: 49 6e 76... Inv
    equb &0d                                                          ; 9e16: 0d          .
    equs "FPress <EXECUTE> over pattern or press <MOVE> to select "   ; 9e17: 46 50 72... FPr
    equs "from font store"                                            ; 9e4f: 66 72 6f... fro
    equb &0d, &14                                                     ; 9e5e: 0d 14       ..
    equs "Enter TITLE and DATE"                                       ; 9e60: 45 6e 74... Ent
    equb &0d                                                          ; 9e74: 0d          .
    equs "2Continue down page <EXECUTE> or Options <CANCEL> ?"        ; 9e75: 32 43 6f... 2Co
    equb &0d                                                          ; 9ea8: 0d          .
    equs "$Insert TEXT disk and press <EXECUTE>"                      ; 9ea9: 24 49 6e... $In
    equb &0d                                                          ; 9ece: 0d          .
    equs "&Insert SYSTEM Disk and Press <EXECUTE>"                    ; 9ecf: 26 49 6e... &In
    equb &0d                                                          ; 9ef6: 0d          .
    equs "%Select the page to copy this one into"                     ; 9ef7: 25 53 65... %Se
    equb &0d                                                          ; 9f1d: 0d          .
    equs "$Finish off with <ESCAPE> or <CANCEL>"                      ; 9f1e: 24 46 69... $Fi
    equb &0d                                                          ; 9f43: 0d          .
    equs "$Dumping ... Press <CANCEL> to abort."                      ; 9f44: 24 44 75... $Du
    equb &0d                                                          ; 9f69: 0d          .
    equs "!Please Wait ... Duplicating Page."                         ; 9f6a: 21 50 6c... !Pl
    equb &0d                                                          ; 9f8c: 0d          .
    equs ",Insert PRINTER DUMP Disk and Press <EXECUTE>"              ; 9f8d: 2c 49 6e... ,In
    equb &0d                                                          ; 9fba: 0d          .
    equs "1Enter *COMMANDS, finish with <RETURN> or <ESCAPE>"         ; 9fbb: 31 45 6e... 1En
    equb &0d                                                          ; 9fed: 0d          .
    equs "3Enter the name of the SPOOLED 3D Zicon file to load"       ; 9fee: 33 45 6e... 3En
    equb &0d                                                          ; a022: 0d          .
    equs "0Continue down page <EXECUTE> or Abort <CANCEL> ?"          ; a023: 30 43 6f... 0Co
    equb &0d                                                          ; a054: 0d          .
    equs "&Cannot scroll page due to disk error !"                    ; a055: 26 43 61... &Ca
    equb &0d,   7, &19,   4, &20,   0, &e4,   3,   5, &12, &19, &11   ; a07c: 0d 07 19... ...
    equb   0,   0, &26,   0, &19,   1, &b0,   0,   0,   0, &19, &11   ; a088: 00 00 26... ..&
    equb   0,   0, &da, &ff, &21, &12,   3,   3, &19,   0, &fe, &ff   ; a094: 00 00 da... ...
    equb &fc, &ff, &19,   9, &22,   0,   0,   0, &19,   9,   0,   0   ; a0a0: fc ff 19... ...
    equb &44,   0, &19,   9, &de, &ff,   0,   0, &19,   9,   0,   0   ; a0ac: 44 00 19... D..
    equb &bc, &ff                                                     ; a0b8: bc ff       ..
.la0ba
    equs "DRIVE 0"                                                    ; a0ba: 44 52 49... DRI
    equb &0d                                                          ; a0c1: 0d          .
.la0c2
    equs "DIR $"                                                      ; a0c2: 44 49 52... DIR
    equb &0d                                                          ; a0c7: 0d          .
.la0c8
    equb &80, &10                                                     ; a0c8: 80 10       ..
    equs "2! 0"                                                       ; a0ca: 32 21 20... 2!
    equb &12, &42,   0, &42, &10                                      ; a0ce: 12 42 00... .B.
    equs "0!", '"', "0"                                               ; a0d3: 30 21 22... 0!"
    equb &10                                                          ; a0d7: 10          .
.la0d8
    equb   2, &12, &86                                                ; a0d8: 02 12 86    ...
    equs "@Rv6"                                                       ; a0db: 40 52 76... @Rv
    equb &90, &12, &96                                                ; a0df: 90 12 96    ...
    equs '"', "rPVv", '"'                                             ; a0e2: 22 72 50... "rP
    equb &a6,   0, &92                                                ; a0e8: a6 00 92    ...
    equs "2f`B"                                                       ; a0eb: 32 66 60... 2f`
    equb &86, &16, &a2, &10, &86                                      ; a0ef: 86 16 a2... ...
    equs "Bb`6"                                                       ; a0f4: 42 62 60... Bb`
    equb &96, &12, &96                                                ; a0f8: 96 12 96    ...
    equs " rRVp", '"'                                                 ; a0fb: 20 72 52...  rR
    equb &11, &a1, &20, &a1, &30, &a1, &40, &a1, &50, &a1, &60, &a1   ; a101: 11 a1 20... ..
    equb &70, &a1, &80, &a1                                           ; a10d: 70 a1 80... p..
    equs "pWI 19,17,57,9"                                             ; a111: 70 57 49... pWI
    equb &0d                                                          ; a11f: 0d          .
    equs "pWI 22,16,51,14"                                            ; a120: 70 57 49... pWI
    equb &0d                                                          ; a12f: 0d          .
    equs "pWI 22,17,51,13"                                            ; a130: 70 57 49... pWI
    equb &0d                                                          ; a13f: 0d          .
    equs "pWI 22,21,51,11"                                            ; a140: 70 57 49... pWI
    equb &0d                                                          ; a14f: 0d          .
    equs "pWI 31,21,44,11"                                            ; a150: 70 57 49... pWI
    equb &0d                                                          ; a15f: 0d          .
    equs "pWI 24,18,49,14"                                            ; a160: 70 57 49... pWI
    equb &0d                                                          ; a16f: 0d          .
    equs "pWI 31,20,50,11"                                            ; a170: 70 57 49... pWI
    equb &0d                                                          ; a17f: 0d          .
    equs "pWI 31,21,50,11"                                            ; a180: 70 57 49... pWI
    equb &0d                                                          ; a18f: 0d          .
.la190
    equb &20, &0d, &0a,   8,   8,   6,   6,   6,   5,   5,   5,   4   ; a190: 20 0d 0a...  ..
    equb   4,   4,   4,   4,   3,   4,   3,   3,   3,   3,   3,   3   ; a19c: 04 04 04... ...
    equb   3,   2,   3,   2,   3,   2,   3,   2,   2,   2,   3,   2   ; a1a8: 03 02 03... ...
    equb   2,   2,   2,   2,   1,   2,   2,   2,   1,   2,   2,   1   ; a1b4: 02 02 02... ...
    equb   2,   1,   2,   1,   2,   1,   2,   1,   1,   2,   1,   1   ; a1c0: 02 01 02... ...
    equb   2,   1,   1,   1,   1,   1,   1,   1,   2,   1,   1,   1   ; a1cc: 02 01 01... ...
    equb   0,   1,   1,   1,   1,   1,   1,   1,   0,   1,   1,   1   ; a1d8: 00 01 01... ...
    equb   0,   1,   1,   0,   1,   1,   0,   1,   0,   1,   0,   1   ; a1e4: 00 01 01... ...
    equb   0,   1,   0,   1,   0,   1,   0,   0,   1,   0,   0,   1   ; a1f0: 00 01 00... ...
    equb   0,   0,   1,   0,   0,   0,   0,   1,   0,   0,   0,   0   ; a1fc: 00 00 01... ...
    equb   0,   0,   1,   0,   0,   0,   0,   0, &1a, &1f, &17, &10   ; a208: 00 00 01... ...
    equs "COLOUR:"                                                    ; a214: 43 4f 4c... COL
    equb &1f, &17, &12                                                ; a21b: 1f 17 12    ...
    equs "SHAPES: "                                                   ; a21e: 53 48 41... SHA
    equb &1f, &17, &14                                                ; a226: 1f 17 14    ...
    equs "SPRAY:"                                                     ; a229: 53 50 52... SPR
    equb &1f, &1e, &14, &17, &f0,   0,   0,   0,   1,   0,   0,   0   ; a22f: 1f 1e 14... ...
    equb   0, &f0, &17, &f0,   0,   0,   0,   0,   0,   0,   0,   0   ; a23b: 00 f0 17... ...
    equb &f0, &20, &20, &17, &f0,   0,   0,   3, &0f, &0f,   3,   0   ; a247: f0 20 20... .
    equb   0, &f0, &17, &f0,   0,   0, &c0, &f0, &f0, &c0,   0,   0   ; a253: 00 f0 17... ...
    equb &f0, &20, &20, &17, &f0, &0f, &3f, &7f, &ff, &ff, &7f, &3f   ; a25f: f0 20 20... .
    equb &0f, &f0, &17, &f0, &f0, &fc, &fe, &ff, &ff, &fe, &fc, &f0   ; a26b: 0f f0 17... ...
    equb &f0, &20, &20, &17, &f0, &0f, &3f, &7f, &ff, &ff, &7f, &3f   ; a277: f0 20 20... .
    equb &0f, &f0, &17, &f0, &f0, &fc, &fe, &ff, &ff, &fe, &fc, &f0   ; a283: 0f f0 17... ...
    equb &f0, &20, &20, &17, &f0,   2, &15, &2a, &55, &aa, &55, &2a   ; a28f: f0 20 20... .
    equb   5, &f0, &17, &f0, &a0, &54, &aa, &55, &aa, &54, &a8, &40   ; a29b: 05 f0 17... ...
    equb &f0, &1f, &2e, &10, &17, &f0                                 ; a2a7: f0 1f 2e... ...
    equs "?3?3?3?"                                                    ; a2ad: 3f 33 3f... ?3?
    equb   0, &f0, &17, &f0, &ff, &33, &ff, &33, &ff, &33, &ff,   0   ; a2b4: 00 f0 17... ...
    equb &f0, &1a, &19,   4, &64,   1, &44,   2, &19,   5, &18,   3   ; a2c0: f0 1a 19... ...
    equb &44,   2, &19,   5, &18,   3, &98,   2, &19,   5, &64,   1   ; a2cc: 44 02 19... D..
    equb &98,   2, &19,   5, &64,   1, &44,   2, &19,   4, &64,   1   ; a2d8: 98 02 19... ...
    equb &44,   1, &19,   5, &18,   3, &44,   1, &19,   5, &18,   3   ; a2e4: 44 01 19... D..
    equb &1c,   2, &19,   5, &64,   1, &1c,   2, &19,   5, &64,   1   ; a2f0: 1c 02 19... ...
    equb &44,   1, &19,   4, &20,   2, &e0,   1, &19,   5, &40,   2   ; a2fc: 44 01 19... D..
    equb &e0,   1, &19,   5, &40,   2,   0,   2, &19,   5, &20,   2   ; a308: e0 01 19... ...
    equb   0,   2, &19,   5, &20,   2, &e0,   1, &19,   4, &60,   2   ; a314: 00 02 19... ...
    equb &e0,   1, &19,   5, &80,   2, &e0,   1, &19, &55, &80,   2   ; a320: e0 01 19... ...
    equb   0,   2, &19,   5, &60,   2,   0,   2, &19, &55, &60,   2   ; a32c: 00 02 19... ...
    equb &e0,   1, &19,   4, &a0,   2, &e0,   1, &19,   5, &c0,   2   ; a338: e0 01 19... ...
    equb &e0,   1, &19,   5, &c0,   2,   0,   2, &19,   5, &a0,   2   ; a344: e0 01 19... ...
    equb   0,   2, &19, &55, &a0,   2, &e0,   1, &19,   4, &20,   2   ; a350: 00 02 19... ...
    equb &a0,   1, &19,   5, &40,   2, &a0,   1, &19,   5, &40,   2   ; a35c: a0 01 19... ...
    equb &c0,   1, &19,   5, &20,   2, &c0,   1, &19,   5, &20,   2   ; a368: c0 01 19... ...
    equb &a0,   1, &19,   4, &60,   2, &a0,   1, &19, &15, &80,   2   ; a374: a0 01 19... ...
    equb &a0,   1, &19, &15, &80,   2, &c0,   1, &19, &15, &60,   2   ; a380: a0 01 19... ...
    equb &c0,   1, &19, &15, &60,   2, &a0,   1, &19,   4, &a0,   2   ; a38c: c0 01 19... ...
    equb &a0,   1, &19,   5, &c0,   2, &a0,   1, &19,   5, &c0,   2   ; a398: a0 01 19... ...
    equb &c0,   1, &19,   5, &a0,   2, &c0,   1, &19,   5, &a0,   2   ; a3a4: c0 01 19... ...
    equb &a0,   1, &19,   4, &e0,   2, &a0,   1, &19,   5,   0,   3   ; a3b0: a0 01 19... ...
    equb &a0,   1, &19, &55,   0,   3, &c0,   1, &19,   5, &e0,   2   ; a3bc: a0 01 19... ...
    equb &c0,   1, &19, &55, &e0,   2, &a0,   1, &88                  ; a3c8: c0 01 19... ...
.la3d1
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; a3d1: 00 00 00... ...
    equb   0,   0,   0, &80,   0,   0,   0,   8,   0,   0,   0, &80   ; a3dd: 00 00 00... ...
    equb   0, &22,   0,   0,   0, &22,   0,   0,   0, &aa,   0, &aa   ; a3e9: 00 22 00... .".
    equb   0, &aa,   0, &aa, &aa, &55, &aa, &55, &aa, &55, &aa, &55   ; a3f5: 00 aa 00... ...
    equb &aa, &ff, &aa, &ff, &aa, &ff, &aa, &ff, &ff, &ff, &ff, &ff   ; a401: aa ff aa... ...
    equb &ff, &ff, &ff, &ff, &40, &20, &10,   8,   4,   2,   1, &80   ; a40d: ff ff ff... ...
    equb   1,   2,   4,   8, &10, &20, &40, &80, &41, &22, &14,   8   ; a419: 01 02 04... ...
    equb &14, &22, &41, &80,   0,   0,   0, &ff,   0,   0,   0, &ff   ; a425: 14 22 41... ."A
    equb &88, &88, &88, &88, &88, &88, &88, &88, &80, &80, &80, &80   ; a431: 88 88 88... ...
    equb &80, &80, &80, &ff, &aa, &aa, &aa, &aa, &aa, &aa, &aa, &aa   ; a43d: 80 80 80... ...
    equb   0, &ff,   0, &ff,   0, &ff,   0, &ff, &80, &80, &80, &ff   ; a449: 00 ff 00... ...
    equb   8,   8,   8, &ff, &80,   1,   3, &84                       ; a455: 08 08 08... ...
    equs "H0 @"                                                       ; a45d: 48 30 20... H0
    equb   4,   4, &0c, &12, &21, &c0, &30,   8, &80, &41, &3e,   8   ; a461: 04 04 0c... ...
    equb   8, &14, &e3, &80, &aa                                      ; a46d: 08 14 e3... ...
    equs "P  "                                                        ; a472: 50 20 20    P
    equb &aa,   5,   2,   2, &82,   5, &0a, &14, &28, &50, &a0, &41   ; a475: aa 05 02... ...
    equb &88, &11,   2,   4,   8, &11, &22, &44,   8, &14, &22, &41   ; a481: 88 11 02... ...
    equb &80,   0,   0,   0, &88                                      ; a48d: 80 00 00... ...
    equs "U", '"', "U"                                                ; a492: 55 22 55    U"U
    equb &88                                                          ; a495: 88          .
    equs "U", '"', "U"                                                ; a496: 55 22 55    U"U
    equb &80,   4, &40,   8,   1, &20,   2, &10, &b1, &81, &18, &1b   ; a499: 80 04 40... ..@
    equb &63, &60,   6                                                ; a4a5: 63 60 06    c`.
    equs "6|:"                                                        ; a4a8: 36 7c 3a    6|:
    equb &11, &a3, &c7, &8b, &11, &b8, &55, &fd,   5, &fd, &55, &df   ; a4ab: 11 a3 c7... ...
    equb &50, &df, &44, &e0, &70, &38, &11, &83,   7, &0e,   4,   0   ; a4b7: 50 df 44... P.D
    equb &40, &20, &10,   0,   1,   2, &f0, &f0, &0f, &0f, &0f, &0f   ; a4c3: 40 20 10... @ .
    equb &f0, &f0,   2, &f0, &f0, &0f, &0f, &0f, &0f, &f0, &f0, &20   ; a4cf: f0 f0 02... ...
    equb &de, &94, &60, &a2,   4, &20, &51, &83, &a9,   1, &a0, &33   ; a4db: de 94 60... ..`
    equb &20, &f5, &94, &a0, &37, &20, &f5, &94, &a0, &3b, &20, &f5   ; a4e7: 20 f5 94...  ..
    equb &94, &60, &48, &98, &aa, &c8, &c8, &68, &4c, &fe, &94, &48   ; a4f3: 94 60 48... .`H
    equb &20,   6, &86, &b5,   0, &20, &ee, &ff, &b5,   1, &20, &ee   ; a4ff: 20 06 86...  ..
    equb &ff, &b9,   0,   0, &20, &ee, &ff, &b9,   1,   0, &20, &ee   ; a50b: ff b9 00... ...
    equb &ff                                                          ; a517: ff          .
    equs "h``"                                                        ; a518: 68 60 60    h``
    equb &ad, &17, &19, &f0, &fa, &a5, &24, &2d, &18, &19, &85, &24   ; a51b: ad 17 19... ...
    equb &a5, &26, &2d, &19, &19, &85, &26, &60, &a2,   4, &ad, &13   ; a527: a5 26 2d... .&-
    equb &19, &c9,   2, &f0,   2, &a2,   0, &a8, &20, &51, &83, &60   ; a533: 19 c9 02... ...
    equb &ad, &72, &19, &f0,   3, &a9, &15, &60, &a9, &0d, &60, &a9   ; a53f: ad 72 19... .r.
    equb &10, &8d, &59, &19, &8d, &5a, &19, &a9, &ff, &8d, &5b, &19   ; a54b: 10 8d 59... ..Y
    equb &8d, &5c, &19, &a9,   0, &8d, &5e, &19, &8d, &60, &19, &a9   ; a557: 8d 5c 19... .\.
    equb &20, &8d, &5d, &19, &a9, &40, &8d, &5f, &19, &60, &a0,   0   ; a563: 20 8d 5d...  .]
    equb &b9, &c6, &a3, &99,   0,   7, &88, &d0, &f7, &60, &a0,   7   ; a56f: b9 c6 a3... ...
    equb &b9, &af, &a0, &99,   0,   1, &88, &10, &f7, &ad, &41, &19   ; a57b: b9 af a0... ...
    equb &8d,   6,   1, &a2,   0, &a0,   1, &20, &f7, &ff, &a0,   5   ; a587: 8d 06 01... ...
    equb &b9, &b7, &a0, &99,   0,   1, &88, &10, &f7, &ad, &43, &19   ; a593: b9 b7 a0... ...
    equb &8d,   4,   1, &a2,   0, &a0,   1, &20, &f7, &ff, &a0, &0c   ; a59f: 8d 04 01... ...
    equb &a9,   0, &99, &2d, &19, &88, &10, &fa, &a0,   0, &99,   0   ; a5ab: a9 00 99... ...
    equb   7, &88, &d0, &fa, &a9,   7, &8d, &2f, &19, &8d, &33, &19   ; a5b7: 07 88 d0... ...
    equb &a2, &2d, &a0, &19, &a9,   8, &20, &d1, &ff, &a9,   0, &85   ; a5c3: a2 2d a0... .-.
    equb &47, &a9,   7, &85, &48, &a9,   8, &20, &ee, &ff, &ad,   0   ; a5cf: 47 a9 07... G..
    equb   7, &c9,   7, &d0, &2b, &a0,   0, &b1, &47, &f0, &25, &a9   ; a5db: 07 c9 07... ...
    equb &20, &20, &ee, &ff, &a9, &20, &20, &ee, &ff, &a9, &20, &20   ; a5e7: 20 20 ee...   .
    equb &ee, &ff, &a0,   1, &b1, &47, &20, &ee, &ff, &c8, &c0,   8   ; a5f3: ee ff a0... ...
    equb &d0, &f6, &18, &a5, &47, &69,   8, &85, &47, &4c, &e0, &95   ; a5ff: d0 f6 18... ...
    equb &a2, &af, &a0, &a0, &20, &67, &8c, &a2, &b7, &a0, &a0, &20   ; a60b: a2 af a0... ...
    equb &67, &8c, &60, &0d, &1a,   4, &18, &1c,   0, &c4,   3, &cc   ; a617: 67 8c 60... g.`
    equb   4, &f0,   3, &10, &1a, &12, &19,   2, &1e,   0,   0,   0   ; a623: 04 f0 03... ...
    equb &19,   0,   0,   0, &d4, &ff, &19,   2, &e2, &ff,   0,   0   ; a62f: 19 00 00... ...
    equb &81, &96, &a6, &96, &d2, &96,   5, &97, &38, &97, &6d, &97   ; a63b: 81 96 a6... ...
    equb &9a, &97, &cd, &97, &fc, &97, &fc, &97, &1b, &98, &3f, &98   ; a647: 9a 97 cd... ...
    equb &66, &98, &81, &98, &aa, &98, &c7, &98, &e6, &98,   5, &99   ; a653: 66 98 81... f..
    equb &2f, &99, &53, &99, &69, &99, &86, &99, &bf, &99, &ec, &99   ; a65f: 2f 99 53... /.S
    equb &0f, &9a, &2a, &9a, &5b, &9a, &7b, &9a, &a8, &9a, &d6, &9a   ; a66b: 0f 9a 2a... ..*
    equb &ed, &9a, &23, &9b, &57, &9b, &72, &9b, &99, &9b,   0, &f0   ; a677: ed 9a 23... ..#
    equs "WINDOW:_Define_Border_Clear_Invert"                         ; a683: 57 49 4e... WIN
    equb &0d,   0, &f8                                                ; a6a5: 0d 00 f8    ...
    equs "TEXT:_Format_Size_File_Keyboard_Show Font"                  ; a6a8: 54 45 58... TEX
    equb &0d,   0, &f8                                                ; a6d1: 0d 00 f8    ...
    equs "TEXT FORMAT:_Centre_Justify_R.Right_Literal_Font"           ; a6d4: 54 45 58... TEX
    equb &0d,   0, &f8                                                ; a704: 0d 00 f8    ...
    equs "FONT SIZE:_Wider_Narrower_Taller_Shorter_Spacing"           ; a707: 46 4f 4e... FON
    equb &0d,   0, &f8                                                ; a737: 0d 00 f8    ...
    equs "FONT SPACING:_Wider_Narrower_Taller_Shorter_Symbol"         ; a73a: 46 4f 4e... FON
    equb &0d,   0, &f8                                                ; a76c: 0d 00 f8    ...
    equs "LOAD:_Font_Font Cat_Wordwise_View_Text Cat"                 ; a76f: 4c 4f 41... LOA
    equb &0d,   0, &e0                                                ; a799: 0d 00 e0    ...
    equs "ROTATE:_   90_  180_  270        (All Clockwise)"           ; a79c: 52 4f 54... ROT
    equb &0d,   0, &f8                                                ; a7cc: 0d 00 f8    ...
    equs "GRAPHICS:_Symbol_Spray_Paint_Patterns_Shapes"               ; a7cf: 47 52 41... GRA
    equb &0d,   0                                                     ; a7fb: 0d 00       ..
    equs "pSP"                                                        ; a7fd: 70 53 50    pSP

.service_handler_subroutine
    cmp #4                                                            ; a800: c9 04       ..
    bne service_handler_subroutine_part_2                             ; a802: d0 05       ..
    jmp service_command                                               ; a804: 4c e7 a8    L..

.pla_rts2
    pla                                                               ; a807: 68          h
    rts                                                               ; a808: 60          `

.service_handler_subroutine_part_2
    cmp #8                                                            ; a809: c9 08       ..
    beq service_osword                                                ; a80b: f0 03       ..
    jmp service_handler_subroutine_rts                                ; a80d: 4c e6 a8    L..

.service_osword
    pha                                                               ; a810: 48          H
    lda osbyte_osword_a                                               ; a811: a5 ef       ..
    cmp #our_osword2                                                  ; a813: c9 36       .6
    bne pla_rts2                                                      ; a815: d0 f0       ..
.our_osword2_handler
    txa                                                               ; a817: 8a          .
    pha                                                               ; a818: 48          H
    tya                                                               ; a819: 98          .
    pha                                                               ; a81a: 48          H
    lda osbyte_osword_x                                               ; a81b: a5 f0       ..
    pha                                                               ; a81d: 48          H
    lda osbyte_osword_y                                               ; a81e: a5 f1       ..
    pha                                                               ; a820: 48          H
    lda #&e0                                                          ; a821: a9 e0       ..
    sta l18d6                                                         ; a823: 8d d6 18    ...
    lda l18cd                                                         ; a826: ad cd 18    ...
    cmp #2                                                            ; a829: c9 02       ..
    bne ca84d                                                         ; a82b: d0 20       .
    jsr sub_cb155                                                     ; a82d: 20 55 b1     U.
    pla                                                               ; a830: 68          h
    sta osbyte_osword_y                                               ; a831: 85 f1       ..
    pla                                                               ; a833: 68          h
    sta osbyte_osword_x                                               ; a834: 85 f0       ..
    lda osbyte_osword_x                                               ; a836: a5 f0       ..
    pha                                                               ; a838: 48          H
    lda osbyte_osword_y                                               ; a839: a5 f1       ..
    pha                                                               ; a83b: 48          H
    lda #&e0                                                          ; a83c: a9 e0       ..
    sta l18d6                                                         ; a83e: 8d d6 18    ...
    lda #osbyte_read_adc_or_get_buffer_status                         ; a841: a9 80       ..
    ldx #0                                                            ; a843: a2 00       ..
    jsr osbyte                                                        ; a845: 20 f4 ff     ..            ; Read the channel number last used for an ADC conversion and joystick fire buttons (X=0)
    txa                                                               ; a848: 8a          .              ; X has the joystick fire buttons status in the lower two bits: bit 0=left button, bit 1=right button
    and #1                                                            ; a849: 29 01       ).
    bne ca858                                                         ; a84b: d0 0b       ..
.ca84d
    ldx #(255 - inkey_key_f0) EOR 128                                 ; a84d: a2 a0       ..             ; X=internal key number EOR 128
    lda #osbyte_scan_keyboard                                         ; a84f: a9 79       .y
    jsr osbyte                                                        ; a851: 20 f4 ff     ..            ; Test for 'F0' key pressed (X=160)
    cpx #0                                                            ; a854: e0 00       ..             ; X has top bit set if 'F0' pressed
    bpl ca860                                                         ; a856: 10 08       ..
.ca858
    lda #&20 ; ' '                                                    ; a858: a9 20       .
    eor l18d6                                                         ; a85a: 4d d6 18    M..
    sta l18d6                                                         ; a85d: 8d d6 18    ...
.ca860
    lda #osbyte_scan_keyboard                                         ; a860: a9 79       .y
    ldx #(255 - inkey_key_f1) EOR 128                                 ; a862: a2 f1       ..             ; X=internal key number EOR 128
    jsr osbyte                                                        ; a864: 20 f4 ff     ..            ; Test for 'F1' key pressed (X=241)
    cpx #0                                                            ; a867: e0 00       ..             ; X has top bit set if 'F1' pressed
    bpl ca873                                                         ; a869: 10 08       ..
    lda #&40 ; '@'                                                    ; a86b: a9 40       .@
    eor l18d6                                                         ; a86d: 4d d6 18    M..
    sta l18d6                                                         ; a870: 8d d6 18    ...
.ca873
    lda #osbyte_scan_keyboard                                         ; a873: a9 79       .y
    ldx #(255 - inkey_key_f2) EOR 128                                 ; a875: a2 f2       ..             ; X=internal key number EOR 128
    jsr osbyte                                                        ; a877: 20 f4 ff     ..            ; Test for 'F2' key pressed (X=242)
    cpx #0                                                            ; a87a: e0 00       ..             ; X has top bit set if 'F2' pressed
    bpl ca886                                                         ; a87c: 10 08       ..
    lda #&80                                                          ; a87e: a9 80       ..
    eor l18d6                                                         ; a880: 4d d6 18    M..
    sta l18d6                                                         ; a883: 8d d6 18    ...
.ca886
    pla                                                               ; a886: 68          h
    sta osbyte_osword_y                                               ; a887: 85 f1       ..
    pla                                                               ; a889: 68          h
    sta osbyte_osword_x                                               ; a88a: 85 f0       ..
    ldy #6                                                            ; a88c: a0 06       ..
    lda l18d6                                                         ; a88e: ad d6 18    ...
    sta (osbyte_osword_x),y                                           ; a891: 91 f0       ..
    ldy #3                                                            ; a893: a0 03       ..
.loop_ca895
    lda l0da6,y                                                       ; a895: b9 a6 0d    ...
    sta (osbyte_osword_x),y                                           ; a898: 91 f0       ..
    dey                                                               ; a89a: 88          .
    bpl loop_ca895                                                    ; a89b: 10 f8       ..
    lda l18cd                                                         ; a89d: ad cd 18    ...
    cmp #2                                                            ; a8a0: c9 02       ..
    beq ca8af                                                         ; a8a2: f0 0b       ..
    ldy #6                                                            ; a8a4: a0 06       ..
    lda (osbyte_osword_x),y                                           ; a8a6: b1 f0       ..
    and user_via_orb_irb                                              ; a8a8: 2d 60 fe    -`.
    and #&e0                                                          ; a8ab: 29 e0       ).
    sta (osbyte_osword_x),y                                           ; a8ad: 91 f0       ..
.ca8af
    lda l0da7                                                         ; a8af: ad a7 0d    ...
    sta osbyte_osword_a                                               ; a8b2: 85 ef       ..
    lda l0da6                                                         ; a8b4: ad a6 0d    ...
    ldy #4                                                            ; a8b7: a0 04       ..
.loop_ca8b9
    lsr osbyte_osword_a                                               ; a8b9: 46 ef       F.
    ror a                                                             ; a8bb: 6a          j
    dey                                                               ; a8bc: 88          .
    bne loop_ca8b9                                                    ; a8bd: d0 fa       ..
    ldy l0355                                                         ; a8bf: ac 55 03    .U.
    beq ca8c5                                                         ; a8c2: f0 01       ..
    lsr a                                                             ; a8c4: 4a          J
.ca8c5
    ldy #4                                                            ; a8c5: a0 04       ..
    sta (osbyte_osword_x),y                                           ; a8c7: 91 f0       ..
    lda l0da9                                                         ; a8c9: ad a9 0d    ...
    sta osbyte_osword_a                                               ; a8cc: 85 ef       ..
    lda l0da8                                                         ; a8ce: ad a8 0d    ...
    ldy #5                                                            ; a8d1: a0 05       ..
.loop_ca8d3
    lsr osbyte_osword_a                                               ; a8d3: 46 ef       F.
    ror a                                                             ; a8d5: 6a          j
    dey                                                               ; a8d6: 88          .
    bne loop_ca8d3                                                    ; a8d7: d0 fa       ..
    ldy #5                                                            ; a8d9: a0 05       ..
    eor #&1f                                                          ; a8db: 49 1f       I.
    sta (osbyte_osword_x),y                                           ; a8dd: 91 f0       ..
    pla                                                               ; a8df: 68          h
    tay                                                               ; a8e0: a8          .
    pla                                                               ; a8e1: 68          h
    tax                                                               ; a8e2: aa          .
    pla                                                               ; a8e3: 68          h
    lda #0                                                            ; a8e4: a9 00       ..
.service_handler_subroutine_rts
    rts                                                               ; a8e6: 60          `

.service_command
    pha                                                               ; a8e7: 48          H
    lda (os_text_ptr),y                                               ; a8e8: b1 f2       ..
    cmp #&70 ; 'p'                                                    ; a8ea: c9 70       .p
    beq ca8f0                                                         ; a8ec: f0 02       ..
    pla                                                               ; a8ee: 68          h
    rts                                                               ; a8ef: 60          `

.ca8f0
    txa                                                               ; a8f0: 8a          .
    pha                                                               ; a8f1: 48          H
    tya                                                               ; a8f2: 98          .
    pha                                                               ; a8f3: 48          H
    iny                                                               ; a8f4: c8          .
    tya                                                               ; a8f5: 98          .
    pha                                                               ; a8f6: 48          H
    ldx #0                                                            ; a8f7: a2 00       ..
.check_next_command
    lda (os_text_ptr),y                                               ; a8f9: b1 f2       ..
    cmp command_table,x                                               ; a8fb: dd 43 a9    .C.
    bne skip_to_next_command                                          ; a8fe: d0 29       .)
    iny                                                               ; a900: c8          .
    inx                                                               ; a901: e8          .
    lda command_table,x                                               ; a902: bd 43 a9    .C.
    bne check_next_command                                            ; a905: d0 f2       ..
    pla                                                               ; a907: 68          h
    lda #&a9                                                          ; a908: a9 a9       ..
    pha                                                               ; a90a: 48          H
    lda #&20 ; ' '                                                    ; a90b: a9 20       .
    pha                                                               ; a90d: 48          H
    lda command_table + 2,x                                           ; a90e: bd 45 a9    .E.
    pha                                                               ; a911: 48          H
    lda command_table + 1,x                                           ; a912: bd 44 a9    .D.
    pha                                                               ; a915: 48          H
    lda l18cd                                                         ; a916: ad cd 18    ...
    cmp #2                                                            ; a919: c9 02       ..
    bne ca920                                                         ; a91b: d0 03       ..
    jsr sub_cb155                                                     ; a91d: 20 55 b1     U.
.ca920
    rts                                                               ; a920: 60          `

    equb &68, &a8, &68, &aa, &68, &a9,   0, &60                       ; a921: 68 a8 68... h.h

.skip_to_next_command
    inx                                                               ; a929: e8          .
    lda command_table,x                                               ; a92a: bd 43 a9    .C.
    bne skip_to_next_command                                          ; a92d: d0 fa       ..
    inx                                                               ; a92f: e8          .
    inx                                                               ; a930: e8          .
    inx                                                               ; a931: e8          .
    pla                                                               ; a932: 68          h
    tay                                                               ; a933: a8          .
    tya                                                               ; a934: 98          .
    pha                                                               ; a935: 48          H
    lda command_table,x                                               ; a936: bd 43 a9    .C.
    bne check_next_command                                            ; a939: d0 be       ..
    pla                                                               ; a93b: 68          h
    tay                                                               ; a93c: a8          .
    pla                                                               ; a93d: 68          h
    tay                                                               ; a93e: a8          .
    pla                                                               ; a93f: 68          h
    tax                                                               ; a940: aa          .
    pla                                                               ; a941: 68          h
    rts                                                               ; a942: 60          `

.command_table
    equb &44                                                          ; a943: 44          D
    equb &46                                                          ; a944: 46          F
    equb   0, &7e, &a9, &44, &45,   0, &c6, &a9                       ; a945: 00 7e a9... .~.
    equs "MOUSE"                                                      ; a94d: 4d 4f 55... MOU
    equb   0, &d1, &aa, &4d, &50,   0, &aa, &ab, &53, &50,   0, &c8   ; a952: 00 d1 aa... ...
    equb &ab, &48, &50,   0, &73, &ab, &53, &45,   0, &f0, &ad, &49   ; a95e: ab 48 50... .HP
    equb &43,   0, &19, &ae, &57, &49,   0, &f7, &ae                  ; a96a: 43 00 19... C..
    equs "JOYSTICK"                                                   ; a973: 4a 4f 59... JOY
    equb   0, &4b, &b1,   0, &b1, &f2, &c8, &c9, &20, &d0, &f9, &98   ; a97b: 00 4b b1... .K.
    equb &18, &65, &f2, &aa, &a5, &f3, &69,   0, &a8, &a9, &40, &20   ; a987: 18 65 f2... .e.
    equb &ce, &ff, &85, &f2, &a2, &fc, &a9, &17, &20, &ee, &ff, &8a   ; a993: ce ff 85... ...
    equb &20, &ee, &ff, &a9,   8, &85, &f3, &a4, &f2, &20, &d7, &ff   ; a99f: 20 ee ff...  ..
    equb &20, &ee, &ff, &c6, &f3, &d0, &f4, &e8, &8a, &29,   3, &d0   ; a9ab: 20 ee ff...  ..
    equb &e1, &8a, &38, &e9,   8, &aa, &30, &da, &a9,   0, &a4, &f2   ; a9b7: e1 8a 38... ..8
    equb &20, &ce, &ff, &60, &a2,   0, &bd, &ed, &a9, &20, &ee, &ff   ; a9c3: 20 ce ff...  ..
    equb &e8, &e0, &0c, &d0, &f5, &a9, &84, &20, &f4, &ff, &86, &f2   ; a9cf: e8 e0 0c... ...
    equb &84, &f3, &a0,   0, &a9, &aa, &91, &f2, &49, &ff, &88, &d0   ; a9db: 84 f3 a0... ...
    equb &f9, &e6, &f3, &10, &f5, &60, &13,   0,   7,   0,   0,   0   ; a9e7: f9 e6 f3... ...
    equb &13,   1,   0,   0,   0,   0,   8, &b0,   5, &50,   3, &4c   ; a9f3: 13 01 00... ...
    equb &91, &aa, &e0, &ea, &d0, &2e, &ad, &cd, &18, &c9,   1, &f0   ; a9ff: 91 aa e0... ...
    equb &19, &a9, &80, &a2,   0, &20, &f4, &ff, &8a, &29,   1, &aa   ; aa0b: 19 a9 80... ...
    equb &a9, &80, &e0,   0, &d0,   5, &a2, &a0, &4c, &91, &aa, &aa   ; aa17: a9 80 e0... ...
    equb &28, &60, &ad, &60, &fe, &29, &20, &0a, &0a, &49, &80, &f0   ; aa23: 28 60 ad... (`.
    equb &ed, &aa, &28, &60, &e0, &eb, &d0, &12, &ad, &60, &fe, &29   ; aa2f: ed aa 28... ..(
    equb &40, &0a, &49, &80, &f0,   3, &aa, &28, &60, &a2, &f1, &4c   ; aa3b: 40 0a 49... @.I
    equb &91, &aa, &e0, &ec, &d0, &11, &ad, &60, &fe, &29, &80, &49   ; aa47: 91 aa e0... ...
    equb &80, &f0,   3, &aa, &28, &60, &a2, &f2, &4c, &91, &aa, &e0   ; aa53: 80 f0 03... ...
    equb   0, &d0, &2f, &ad, &cd, &18, &c9,   1, &f0, &19, &a9, &80   ; aa5f: 00 d0 2f... ../
    equb &a2,   0, &20, &f4, &ff, &8a, &29,   1, &aa, &a9,   0, &e0   ; aa6b: a2 00 20... ..
    equb   0, &d0,   5, &a2,   0, &4c, &91, &aa, &aa, &28, &60, &ad   ; aa77: 00 d0 05... ...
    equb &60, &fe, &29, &e0, &c9, &e0, &f0,   6, &a9,   0, &aa, &68   ; aa83: 60 fe 29... `.)
    equb &8a                                                          ; aa8f: 8a          .
    equs "`(l"                                                        ; aa90: 60 28 6c    `(l
    equb &ce, &18, &ad, &28,   2, &8d, &ce, &18, &ad, &29,   2, &8d   ; aa93: ce 18 ad... ...
    equb &cf, &18, &a9, &a8, &a2,   0, &a0, &ff, &20, &f4, &ff, &8a   ; aa9f: cf 18 a9... ...
    equb &18, &69, &3c, &85, &f8, &98, &69,   0, &85, &f9, &a0,   0   ; aaab: 18 69 3c... .i<
    equb &a9, &f9, &91, &f8, &c8, &a9, &a9, &91, &f8, &c8, &a5, &f4   ; aab7: a9 f9 91... ...
    equb &91, &f8, &78, &a9, &3c, &8d, &28,   2, &a9, &ff, &8d, &29   ; aac3: 91 f8 78... ..x
    equb   2, &58, &60, &a9,   1, &8d, &cd, &18, &a9,   2, &8d, &df   ; aacf: 02 58 60... .X`
    equb &18, &a9,   0, &8d, &a6, &0d, &8d, &a8, &0d, &a9,   2, &8d   ; aadb: 18 a9 00... ...
    equb &a7, &0d, &8d, &a9, &0d, &a2,   9, &a0,   0, &8a, &48, &a9   ; aae7: a7 0d 8d... ...
    equb &0d, &20, &f4, &ff, &68, &aa, &ca, &10, &f2, &a9, &30, &8d   ; aaf3: 0d 20 f4... . .
    equb &20,   2, &a9, &ff, &8d, &21,   2, &a9, &a8, &a2,   0, &a0   ; aaff: 20 02 a9...  ..
    equb &ff, &20, &f4, &ff, &78, &8a, &18, &69, &30, &85, &f8, &98   ; ab0b: ff 20 f4... . .
    equb &69,   0, &85, &f9, &a0,   0, &a9, &d1, &91, &f8, &c8, &a9   ; ab17: 69 00 85... i..
    equb &b1, &91, &f8, &c8, &a5, &f4, &91, &f8, &a9, &0e, &a2,   4   ; ab23: b1 91 f8... ...
    equb &20, &f4, &ff, &ad,   5,   2, &c9, &18, &d0,   3, &4c, &73   ; ab2f: 20 f4 ff...  ..
    equb &ab, &20, &95, &aa, &a2,   0, &bd, &35, &ad, &c9, &24, &f0   ; ab3b: ab 20 95... . .
    equb   7, &9d,   0, &18, &e8, &4c, &41, &ab, &ad,   4,   2, &8d   ; ab47: 07 9d 00... ...
    equb &e4, &0d, &ad,   5,   2, &8d, &e5, &0d, &a9,   0, &8d,   4   ; ab53: e4 0d ad... ...
    equb   2, &a9, &18, &8d,   5,   2, &a9, &98, &8d, &6e, &fe, &a9   ; ab5f: 02 a9 18... ...
    equb   0, &8d, &62, &fe, &8d, &de, &18                            ; ab6b: 00 8d 62... ..b
    equs "X` x"                                                       ; ab72: 58 60 20... X`
    equb &ab, &60, &ad, &de, &18, &f0                                 ; ab76: ab 60 ad... .`.
    equs "- }"                                                        ; ab7c: 2d 20 7d    - }
    equb &ac, &a2,   0, &a0,   0, &a5, &f8, &18, &69,   8, &a5, &f9   ; ab7f: ac a2 00... ...
    equb &69,   0, &30, &16, &bd, &e0, &18, &91, &f8, &a0,   8, &bd   ; ab8b: 69 00 30... i.0
    equb &f0, &18, &91, &f8, &e8, &20,   2, &ad, &b0,   4, &e0, &10   ; ab97: f0 18 91... ...
    equb &d0, &dd, &a9,   0, &8d, &de, &18, &60, &ad, &de, &18, &f0   ; aba3: d0 dd a9... ...
    equb &11, &ad, &a6, &0d, &cd, &dc, &18, &d0,   9, &ad, &a8, &0d   ; abaf: 11 ad a6... ...
    equb &cd, &dd, &18, &d0,   1, &60, &a9, &13, &20, &f4, &ff, &20   ; abbb: cd dd 18... ...
    equb &78, &ab, &ad, &a6, &0d, &8d, &d0, &18, &8d, &dc, &18, &ad   ; abc7: 78 ab ad... x..
    equb &a7, &0d, &8d, &d1, &18, &ad, &a8, &0d, &8d, &d2, &18, &8d   ; abd3: a7 0d 8d... ...
    equb &dd, &18, &ad, &a9, &0d, &8d, &d3, &18, &20, &56, &ac, &a2   ; abdf: dd 18 ad... ...
    equb   0, &a0,   0, &b1, &f8, &9d, &e0, &18, &bd, &e3, &b2, &8d   ; abeb: 00 a0 00... ...
    equb &d6, &18, &bd, &f3, &b2, &8d, &d7, &18, &a9,   0, &8d, &d8   ; abf7: d6 18 bd... ...
    equb &18, &a9, &ff, &8d, &d9, &18, &ad, &d4, &18, &c9, &80, &f0   ; ac03: 18 a9 ff... ...
    equb &11, &4e, &d6, &18, &6e, &d8, &18, &38, &6e, &d7, &18, &6e   ; ac0f: 11 4e d6... .N.
    equb &d9, &18, &0a, &4c, &0c, &ac, &a5, &f8, &18, &69,   8, &a5   ; ac1b: d9 18 0a... ...
    equb &f9, &69,   0, &30, &24, &bd, &e0, &18, &0d, &d6, &18, &2d   ; ac27: f9 69 00... .i.
    equb &d7, &18, &91, &f8, &a0,   8, &b1, &f8, &9d, &f0, &18, &0d   ; ac33: d7 18 91... ...
    equb &d8, &18, &2d, &d9, &18, &91, &f8, &20,   2, &ad, &b0,   5   ; ac3f: d8 18 2d... ..-
    equb &e8, &e0, &10, &d0, &9c, &a9,   1, &8d, &de, &18, &60, &4e   ; ac4b: e8 e0 10... ...
    equb &d1, &18, &6e, &d0, &18, &4e, &d3, &18, &6e, &d2, &18, &4e   ; ac57: d1 18 6e... ..n
    equb &d3, &18, &6e, &d2, &18, &ad, &d2, &18, &49, &ff, &8d, &d2   ; ac63: d3 18 6e... ..n
    equb &18, &ad, &55,   3, &c9,   4, &d0,   6, &4e, &d1, &18, &6e   ; ac6f: 18 ad 55... ..U
    equb &d0, &18, &ad, &d2, &18, &29,   7, &85, &f8, &ad, &55,   3   ; ac7b: d0 18 ad... ...
    equb &c9,   4, &d0, &28, &ad, &d2, &18                            ; ac87: c9 04 d0... ...
    equs "JJJ"                                                        ; ac8e: 4a 4a 4a    JJJ
    equb &18, &69, &58, &85, &f9, &ad, &d2, &18                       ; ac91: 18 69 58... .iX
    equs "JJJJJ"                                                      ; ac99: 4a 4a 4a... JJJ
    equb &18, &65, &f9, &85, &f9, &ad, &d2, &18, &0a, &0a, &0a, &29   ; ac9e: 18 65 f9... .e.
    equb &c0, &18, &65, &f8, &85, &f8, &4c, &d4, &ac, &ad, &d2, &18   ; acaa: c0 18 65... ..e
    equb &29, &f8, &4a, &4a, &18, &69, &30, &85, &f9, &ad, &d2, &18   ; acb6: 29 f8 4a... ).J
    equs "JJJJ"                                                       ; acc2: 4a 4a 4a... JJJ
    equb   8, &18, &65, &f9, &85, &f9, &a9,   0                       ; acc6: 08 18 65... ..e
    equs "(je"                                                        ; acce: 28 6a 65    (je
    equb &f8, &85, &f8, &ad, &d1, &18, &29,   3, &18, &65, &f9, &85   ; acd1: f8 85 f8... ...
    equb &f9, &ad, &d0, &18, &29, &f8, &18, &65, &f8, &85, &f8, &a5   ; acdd: f9 ad d0... ...
    equb &f9, &69,   0, &85, &f9, &ad, &d0, &18, &29,   7, &a8, &c8   ; ace9: f9 69 00... .i.
    equb &a9, &80, &88, &f0,   4, &4a, &4c, &f7, &ac, &8d, &d4, &18   ; acf5: a9 80 88... ...
    equb &60, &e6, &f8, &d0,   2, &e6, &f9, &a5, &f8, &29,   7, &d0   ; ad01: 60 e6 f8... `..
    equb &21, &a5, &f8, &18, &69, &78, &85, &f8, &a5, &f9, &69,   2   ; ad0d: 21 a5 f8... !..
    equb &85, &f9, &ad, &55,   3, &c9,   4, &d0, &0d, &a5, &f8, &38   ; ad19: 85 f9 ad... ...
    equb &e9, &40, &85, &f8, &a5, &f9, &e9,   1, &85, &f9, &a5, &f9   ; ad25: e9 40 85... .@.
    equb &38, &e9, &80, &60, &8a, &48, &ad, &6d, &fe, &29, &18, &d0   ; ad31: 38 e9 80... 8..
    equb   7, &68, &aa, &a5, &fc, &6c, &e4, &0d, &ae, &60, &fe, &48   ; ad3d: 07 68 aa... .h.
    equb &29, &10, &f0, &5c, &8a, &29,   1, &f0, &38, &ad, &a6, &0d   ; ad49: 29 10 f0... )..
    equb &18, &6d, &df, &18, &8d, &a6, &0d, &90,   3, &ee, &a7, &0d   ; ad55: 18 6d df... .m.
    equb &ad, &a7, &0d, &c9,   4, &d0, &1f, &ad, &55,   3, &c9,   4   ; ad61: ad a7 0d... ...
    equb &d0, &0c, &ad, &a6, &0d, &29, &e0, &c9, &e0, &d0, &0f, &8d   ; ad6d: d0 0c ad... ...
    equb &a6, &0d, &ad, &a6, &0d, &29, &f0, &c9, &f0, &d0,   3, &8d   ; ad79: a6 0d ad... ...
    equb &a6, &0d, &18, &90, &1f, &ad, &a6, &0d, &d0, &10, &ce, &a7   ; ad85: a6 0d 18... ...
    equb &0d, &10, &0b, &a9,   0, &8d, &a7, &0d, &8d, &a6, &0d, &18   ; ad91: 0d 10 0b... ...
    equb &90, &0a, &ad, &a6, &0d, &38, &ed, &df, &18, &8d, &a6, &0d   ; ad9d: 90 0a ad... ...
    equb &68, &29,   8, &f0, &3d, &8a, &29,   4, &f0, &19, &ad, &a8   ; ada9: 68 29 08... h).
    equb &0d, &18, &6d, &df, &18, &8d, &a8, &0d, &90, &0a, &ee, &a9   ; adb5: 0d 18 6d... ..m
    equb &0d, &ad, &a9, &0d, &c9,   4, &f0,   3, &18, &90, &1f, &ad   ; adc1: 0d ad a9... ...
    equb &a8, &0d, &d0, &10, &ce, &a9, &0d, &10, &0b, &a9,   0, &8d   ; adcd: a8 0d d0... ...
    equb &a9, &0d, &8d, &a8, &0d, &18, &90, &0a, &ad, &a8, &0d, &38   ; add9: a9 0d 8d... ...
    equb &ed, &df, &18, &8d, &a8, &0d, &68, &aa, &a5, &fc             ; ade5: ed df 18... ...
    equs "@$ C"                                                       ; adef: 40 24 20... @$
    equb &b1, &b1, &f2, &29,   7, &aa, &e8, &a9,   1, &8d, &df, &18   ; adf3: b1 b1 f2... ...
    equb &a9, &ff, &ca, &f0,   7, &0a, &0e, &df, &18, &4c,   1, &ae   ; adff: a9 ff ca... ...
    equb &48, &2d, &a6, &0d, &8d, &a6, &0d, &68, &2d, &a8, &0d, &8d   ; ae0b: 48 2d a6... H-.
    equb &a8, &0d, &60, &b1, &f2, &c8, &c9, &20, &f0, &f9, &88, &20   ; ae17: a8 0d 60... ..`
    equb &c7, &ae, &b1, &f2, &c9, &0d, &f0, &1b, &ad, &d6, &18, &48   ; ae23: c7 ae b1... ...
    equb &a9, &1f, &20, &ee, &ff, &c8, &20, &c7, &ae, &20, &ee, &ff   ; ae2f: a9 1f 20... ..
    equb &c8, &20, &c7, &ae, &20, &ee, &ff, &68, &8d, &d6, &18, &ad   ; ae3b: c8 20 c7... . .
    equb &d6, &18, &29, &e0, &f0, &48, &ad, &d6, &18, &38, &e9, &20   ; ae47: d6 18 29... ..)
    equb &85, &f2, &a9,   0, &85, &f3, &a2,   5,   6, &f2, &26, &f3   ; ae53: 85 f2 a9... ...
    equb &ca, &d0, &f9, &a5, &f3, &18, &69, &b8, &85, &f3, &a9, &80   ; ae5f: ca d0 f9... ...
    equb &8d, &d6, &18, &a0,   0, &a9, &17, &20, &ee, &ff, &ad, &d6   ; ae6b: 8d d6 18... ...
    equb &18, &20, &ee, &ff, &a2,   8, &b1, &f2, &20, &ee, &ff, &c8   ; ae77: 18 20 ee... . .
    equb &ca, &d0, &f7, &ee, &d6, &18, &ad, &d6, &18, &c9, &84, &d0   ; ae83: ca d0 f7... ...
    equb &e0, &a9, &80, &8d, &d6, &18, &ad, &d6, &18, &0a, &0a,   9   ; ae8f: e0 a9 80... ...
    equb &80, &8d, &d6, &18, &20, &ee, &ff,   9,   2, &20, &ee, &ff   ; ae9b: 80 8d d6... ...
    equb &a9, &0a, &20, &ee, &ff, &a9,   8, &20, &ee, &ff, &20, &ee   ; aea7: a9 0a 20... ..
    equb &ff, &ad, &d6, &18,   9,   1, &20, &ee, &ff,   9,   2, &20   ; aeb3: ff ad d6... ...
    equb &ee, &ff, &a9, &0b, &20, &ee, &ff, &60, &b1, &f2, &29, &0f   ; aebf: ee ff a9... ...
    equb &8d, &d6, &18, &c8, &b1, &f2, &c9, &2c, &f0, &1f, &c9, &0d   ; aecb: 8d d6 18... ...
    equb &f0, &1b, &29, &0f, &8d, &d7, &18, &0e, &d6, &18, &ad, &d6   ; aed7: f0 1b 29... ..)
    equb &18, &0a, &0a, &18, &6d, &d6, &18, &18, &6d, &d7, &18, &8d   ; aee3: 18 0a 0a... ...
    equb &d6, &18, &4c, &ce, &ae, &ad, &d6, &18, &60, &a9, &12, &20   ; aeef: d6 18 4c... ..L
    equb &ee, &ff, &a9,   0, &20, &ee, &ff, &a9,   7, &20, &ee, &ff   ; aefb: ee ff a9... ...
    equb &a9, &1c, &20, &ee, &ff, &20, &43, &b1, &20, &c7, &ae, &8d   ; af07: a9 1c 20... ..
    equb &d8, &18, &20, &ee, &ff, &c8, &20, &c7, &ae, &8d, &d9, &18   ; af13: d8 18 20... ..
    equb &20, &ee, &ff, &c8, &20, &c7, &ae, &8d, &da, &18, &20, &ee   ; af1f: 20 ee ff...  ..
    equb &ff, &c8, &20, &c7, &ae, &8d, &db, &18, &20, &ee, &ff, &a9   ; af2b: ff c8 20... ..
    equb &0c, &20, &ee, &ff, &ee, &da, &18, &a2,   2, &ad, &55,   3   ; af37: 0c 20 ee... . .
    equb &f0,   2, &a2,   4, &8e, &d5, &18, &a9, &19, &20, &ee, &ff   ; af43: f0 02 a2... ...
    equb &a9,   4, &20, &ee, &ff, &ad, &d8, &18, &20, &d0, &b0, &ad   ; af4f: a9 04 20... ..
    equb &d6, &18, &38, &ed, &d5, &18,   8, &20, &ee, &ff, &28, &ad   ; af5b: d6 18 38... ..8
    equb &d7, &18, &e9,   0, &20, &ee, &ff, &ad, &d9, &18, &20, &fe   ; af67: d7 18 e9... ...
    equb &b0, &20, &36, &b1, &a9, &19, &20, &ee, &ff, &a9,   5, &20   ; af73: b0 20 36... . 6
    equb &ee, &ff, &ad, &da, &18, &20, &d0, &b0, &20, &36, &b1, &ad   ; af7f: ee ff ad... ...
    equb &d9, &18, &20, &fe, &b0, &20, &36, &b1, &a9, &19, &20, &ee   ; af8b: d9 18 20... ..
    equb &ff, &a9,   5, &20, &ee, &ff, &ad, &da, &18, &20, &d0, &b0   ; af97: ff a9 05... ...
    equb &20, &36, &b1, &ad, &db, &18, &20, &fe, &b0, &ad, &d6, &18   ; afa3: 20 36 b1...  6.
    equb &18, &69, &24,   8, &20, &ee, &ff, &28, &ad, &d7, &18, &69   ; afaf: 18 69 24... .i$
    equb   0, &20, &ee, &ff, &a9, &19, &20, &ee, &ff, &a9,   5, &20   ; afbb: 00 20 ee... . .
    equb &ee, &ff, &ad, &d8, &18, &20, &d0, &b0, &ad, &d6, &18, &38   ; afc7: ee ff ad... ...
    equb &ed, &d5, &18,   8, &20, &ee, &ff, &28, &ad, &d7, &18, &e9   ; afd3: ed d5 18... ...
    equb   0, &20, &ee, &ff, &ad, &db, &18, &20, &fe, &b0, &ad, &d6   ; afdf: 00 20 ee... . .
    equb &18, &18, &69, &24,   8, &20, &ee, &ff, &28, &ad, &d7, &18   ; afeb: 18 18 69... ..i
    equb &69,   0, &20, &ee, &ff, &a9, &19, &20, &ee, &ff, &a9,   5   ; aff7: 69 00 20... i.
    equb &20, &ee, &ff, &ad, &d8, &18, &20, &d0, &b0, &ad, &d6, &18   ; b003: 20 ee ff...  ..
    equb &38, &ed, &d5, &18,   8, &20, &ee, &ff, &28, &ad, &d7, &18   ; b00f: 38 ed d5... 8..
    equb &e9,   0, &20, &ee, &ff, &ad, &d9, &18, &20, &fe, &b0, &20   ; b01b: e9 00 20... ..
    equb &36, &b1, &a9, &19, &20, &ee, &ff, &a9,   4, &20, &ee, &ff   ; b027: 36 b1 a9... 6..
    equb &ad, &d8, &18, &20, &d0, &b0, &20, &36, &b1, &ad, &d9, &18   ; b033: ad d8 18... ...
    equb &20, &fe, &b0, &ad, &d6, &18, &38, &e9,   4,   8, &20, &ee   ; b03f: 20 fe b0...  ..
    equb &ff, &28, &ad, &d7, &18, &e9,   0, &20, &ee, &ff, &a9, &19   ; b04b: ff 28 ad... .(.
    equb &20, &ee, &ff, &a9,   5, &20, &ee, &ff, &ad, &da, &18, &20   ; b057: 20 ee ff...  ..
    equb &d0, &b0, &ad, &d6, &18, &18, &6d, &d5, &18,   8, &20, &ee   ; b063: d0 b0 ad... ...
    equb &ff, &28, &ad, &d7, &18, &69,   0, &20, &ee, &ff, &ad, &d9   ; b06f: ff 28 ad... .(.
    equb &18, &20, &fe, &b0, &ad, &d6, &18, &38, &e9,   4,   8, &20   ; b07b: 18 20 fe... . .
    equb &ee, &ff, &28, &ad, &d7, &18, &e9,   0, &20, &ee, &ff, &a9   ; b087: ee ff 28... ..(
    equb &19, &20, &ee, &ff, &a9,   5, &20, &ee, &ff, &ad, &da, &18   ; b093: 19 20 ee... . .
    equb &20, &d0, &b0, &ad, &d6, &18, &18, &6d, &d5, &18,   8, &20   ; b09f: 20 d0 b0...  ..
    equb &ee, &ff, &28, &ad, &d7, &18, &69,   0, &20, &ee, &ff, &ad   ; b0ab: ee ff 28... ..(
    equb &db, &18, &20, &fe, &b0, &ad, &d6, &18, &18, &69, &20,   8   ; b0b7: db 18 20... ..
    equb &20, &ee, &ff, &28, &ad, &d7, &18, &69,   0, &20, &ee, &ff   ; b0c3: 20 ee ff...  ..
    equb &60, &8d, &d6, &18, &a9,   0, &8d, &d7, &18, &0e, &d6, &18   ; b0cf: 60 8d d6... `..
    equb &2e, &d7, &18, &0e, &d6, &18, &2e, &d7, &18, &0e, &d6, &18   ; b0db: 2e d7 18... ...
    equb &2e, &d7, &18, &0e, &d6, &18, &2e, &d7, &18, &ad, &55,   3   ; b0e7: 2e d7 18... ...
    equb &c9,   4, &d0,   6, &0e, &d6, &18, &2e, &d7, &18, &60, &8d   ; b0f3: c9 04 d0... ...
    equb &d6, &18, &a9,   0, &8d, &d7, &18, &0e, &d6, &18, &2e, &d7   ; b0ff: d6 18 a9... ...
    equb &18, &0e, &d6, &18, &2e, &d7, &18, &0e, &d6, &18, &2e, &d7   ; b10b: 18 0e d6... ...
    equb &18, &0e, &d6, &18, &2e, &d7, &18, &0e, &d6, &18, &2e, &d7   ; b117: 18 0e d6... ...
    equb &18, &a9, &df, &38, &ed, &d6, &18, &8d, &d6, &18, &a9,   3   ; b123: 18 a9 df... ...
    equb &ed, &d7, &18, &8d, &d7, &18, &60, &ad, &d6, &18, &20, &ee   ; b12f: ed d7 18... ...
    equb &ff, &ad, &d7, &18, &20, &ee, &ff, &60, &b1, &f2, &c8, &c9   ; b13b: ff ad d7... ...
    equb &20, &f0, &f9, &88, &60, &a9,   2, &8d, &cd, &18, &20, &95   ; b147: 20 f0 f9...  ..
    equb &aa, &60                                                     ; b153: aa 60       .`

.sub_cb155
    pha                                                               ; b155: 48          H
    txa                                                               ; b156: 8a          .
    pha                                                               ; b157: 48          H
    tya                                                               ; b158: 98          .
    pha                                                               ; b159: 48          H
    lda #osbyte_read_adc_or_get_buffer_status                         ; b15a: a9 80       ..
    ldx #1                                                            ; b15c: a2 01       ..
    jsr osbyte                                                        ; b15e: 20 f4 ff     ..            ; Read the ADC conversion value for channel X=1
    stx l0da6                                                         ; b161: 8e a6 0d    ...            ; X and Y contain the ADC value read (low,high)
    sty l0da7                                                         ; b164: 8c a7 0d    ...
    lda #osbyte_read_adc_or_get_buffer_status                         ; b167: a9 80       ..
    ldx #2                                                            ; b169: a2 02       ..
    jsr osbyte                                                        ; b16b: 20 f4 ff     ..            ; Read the ADC conversion value for channel X=2
    stx l0da8                                                         ; b16e: 8e a8 0d    ...            ; X and Y contain the ADC value read (low,high)
    sty l0da9                                                         ; b171: 8c a9 0d    ...
    ldx #6                                                            ; b174: a2 06       ..
.loop_cb176
    lsr l0da7                                                         ; b176: 4e a7 0d    N..
    ror l0da6                                                         ; b179: 6e a6 0d    n..
    dex                                                               ; b17c: ca          .
    bne loop_cb176                                                    ; b17d: d0 f7       ..
    lda l0da7                                                         ; b17f: ad a7 0d    ...
    eor #3                                                            ; b182: 49 03       I.
    sta l0da7                                                         ; b184: 8d a7 0d    ...
    lda l0da6                                                         ; b187: ad a6 0d    ...
    eor #&ff                                                          ; b18a: 49 ff       I.
    sta l0da6                                                         ; b18c: 8d a6 0d    ...
    lda l0da7                                                         ; b18f: ad a7 0d    ...
    sta l18d6                                                         ; b192: 8d d6 18    ...
    lda l0da6                                                         ; b195: ad a6 0d    ...
    lsr l18d6                                                         ; b198: 4e d6 18    N..
    ror a                                                             ; b19b: 6a          j
    lsr l18d6                                                         ; b19c: 4e d6 18    N..
    ror a                                                             ; b19f: 6a          j
    clc                                                               ; b1a0: 18          .
    adc l0da6                                                         ; b1a1: 6d a6 0d    m..
    sta l0da6                                                         ; b1a4: 8d a6 0d    ...
    lda l0da7                                                         ; b1a7: ad a7 0d    ...
    adc #0                                                            ; b1aa: 69 00       i.
    sta l0da7                                                         ; b1ac: 8d a7 0d    ...
    cmp #4                                                            ; b1af: c9 04       ..
    bne cb1c0                                                         ; b1b1: d0 0d       ..
    lda l0da6                                                         ; b1b3: ad a6 0d    ...
    sec                                                               ; b1b6: 38          8
    sbc #&f0                                                          ; b1b7: e9 f0       ..
    bcc cb1c0                                                         ; b1b9: 90 05       ..
    lda #&f0                                                          ; b1bb: a9 f0       ..
    sta l0da6                                                         ; b1bd: 8d a6 0d    ...
.cb1c0
    ldx #6                                                            ; b1c0: a2 06       ..
.loop_cb1c2
    lsr l0da9                                                         ; b1c2: 4e a9 0d    N..
    ror l0da8                                                         ; b1c5: 6e a8 0d    n..
    dex                                                               ; b1c8: ca          .
    bne loop_cb1c2                                                    ; b1c9: d0 f7       ..
    pla                                                               ; b1cb: 68          h
    tay                                                               ; b1cc: a8          .
    pla                                                               ; b1cd: 68          h
    tax                                                               ; b1ce: aa          .
    pla                                                               ; b1cf: 68          h
    rts                                                               ; b1d0: 60          `

    equb   8, &48, &8a, &48, &98, &48, &a5, &ef, &48, &a5, &f0, &48   ; b1d1: 08 48 8a... .H.
    equb &a5, &f1, &48, &a9, &79, &a2, &80, &20, &f4, &ff, &8a, &48   ; b1dd: a5 f1 48... ..H
    equb &e0,   0, &10, &22, &0e, &df, &18, &0e, &df, &18, &ad, &df   ; b1e9: e0 00 10... ...
    equb &18, &a2,   0, &e8, &0a, &90, &fc, &38, &6a, &ca, &d0, &fb   ; b1f5: 18 a2 00... ...
    equb &48, &2d, &a6, &0d, &8d, &a6, &0d, &68, &2d, &a8, &0d, &8d   ; b201: 48 2d a6... H-.
    equb &a8, &0d, &a9, &79, &a2, &f9, &20, &f4, &ff, &e0,   0, &10   ; b20d: a8 0d a9... ...
    equb &38, &ad, &a6, &0d, &18, &6d, &df, &18, &8d, &a6, &0d, &90   ; b219: 38 ad a6... 8..
    equb   3, &ee, &a7, &0d, &ad, &a7, &0d, &c9,   4, &d0, &1f, &ad   ; b225: 03 ee a7... ...
    equb &55,   3, &c9,   4, &d0, &0c, &ad, &a6, &0d, &29, &e0, &c9   ; b231: 55 03 c9... U..
    equb &e0, &d0, &0f, &8d, &a6, &0d, &ad, &a6, &0d, &29, &f0, &c9   ; b23d: e0 d0 0f... ...
    equb &f0, &d0,   3, &8d, &a6, &0d, &4c, &7c, &b2, &a9, &79, &a2   ; b249: f0 d0 03... ...
    equb &99, &20, &f4, &ff, &e0,   0, &10, &1f, &ad, &a6, &0d, &d0   ; b255: 99 20 f4... . .
    equb &10, &ce, &a7, &0d, &10, &0b, &a9,   0, &8d, &a7, &0d, &8d   ; b261: 10 ce a7... ...
    equb &a6, &0d, &4c, &7c, &b2, &ad, &a6, &0d, &38, &ed, &df, &18   ; b26d: a6 0d 4c... ..L
    equb &8d, &a6, &0d, &a9, &79, &a2, &b9, &20, &f4, &ff, &e0,   0   ; b279: 8d a6 0d... ...
    equb &10, &19, &ad, &a8, &0d, &18, &6d, &df, &18, &8d, &a8, &0d   ; b285: 10 19 ad... ...
    equb &90, &0a, &ee, &a9, &0d, &ad, &a9, &0d, &c9,   4, &f0, &0e   ; b291: 90 0a ee... ...
    equb &4c, &ca, &b2, &a9, &79, &a2, &a9, &20, &f4, &ff, &e0,   0   ; b29d: 4c ca b2... L..
    equb &10, &1f, &ad, &a8, &0d, &d0, &10, &ce, &a9, &0d, &10, &0b   ; b2a9: 10 1f ad... ...
    equb &a9,   0, &8d, &a9, &0d, &8d, &a8, &0d, &18, &90, &0a, &ad   ; b2b5: a9 00 8d... ...
    equb &a8, &0d, &38, &ed, &df, &18, &8d, &a8, &0d, &68, &10,   6   ; b2c1: a8 0d 38... ..8
    equb &4e, &df, &18, &4e, &df, &18, &68, &85, &f1, &68, &85, &f0   ; b2cd: 4e df 18... N..
    equb &68, &85, &ef, &68, &a8, &68, &aa                            ; b2d9: 68 85 ef... h..
    equs "h(`"                                                        ; b2e0: 68 28 60    h(`
    equb 0                                                            ; b2e3: 00          .
    equs "@`px|~xhH"                                                  ; b2e4: 40 60 70... @`p
    equb 4, 4, 2, 2, 0, 0                                             ; b2ed: 04 04 02... ...
    equs "?_ow{}~xkK5"                                                ; b2f3: 3f 5f 6f... ?_o
    equb &f5, &fa, &fa, &fc, &ff,   0,   2, &19,   5, &20,   2,   0   ; b2fe: f5 fa fa... ...
    equb   2, &19,   5, &20,   2, &e0,   1, &19,   4, &60,   2, &e0   ; b30a: 02 19 05... ...
    equb   1, &19,   5, &80,   2, &e0,   1, &19, &55, &80,   2,   0   ; b316: 01 19 05... ...
    equb   2, &19,   5, &60,   2,   0,   2, &19, &55, &60,   2, &e0   ; b322: 02 19 05... ...
    equb   1, &19,   4, &a0,   2, &e0,   1, &19,   5, &c0,   2, &e0   ; b32e: 01 19 04... ...
    equb   1, &19,   5, &c0,   2,   0,   2, &19,   5, &a0,   2,   0   ; b33a: 01 19 05... ...
    equb   2, &19, &55, &a0,   2, &e0,   1, &19,   4, &20,   2, &a0   ; b346: 02 19 55... ..U
    equb   1, &19,   5, &40,   2, &a0,   1, &19,   5, &40,   2, &c0   ; b352: 01 19 05... ...
    equb   1, &19,   5, &20,   2, &c0,   1, &19,   5, &20,   2, &a0   ; b35e: 01 19 05... ...
    equb   1, &19,   4, &60,   2, &a0,   1, &19, &15, &80,   2, &a0   ; b36a: 01 19 04... ...
    equb   1, &19, &15, &80,   2, &c0,   1, &19, &15, &60,   2, &c0   ; b376: 01 19 15... ...
    equb   1, &19, &15, &60,   2, &a0,   1, &19,   4, &a0,   2, &a0   ; b382: 01 19 15... ...
    equb   1, &19,   5, &c0,   2, &a0,   1, &19,   5, &c0,   2, &c0   ; b38e: 01 19 05... ...
    equb   1, &19,   5, &a0,   2, &c0,   1, &19,   5, &a0,   2, &a0   ; b39a: 01 19 05... ...
    equb   1, &19,   4, &e0,   2, &a0,   1, &19,   5,   0,   3, &a0   ; b3a6: 01 19 04... ...
    equb   1, &19, &55,   0,   3, &c0,   1, &19,   5, &e0,   2, &c0   ; b3b2: 01 19 55... ..U
    equb   1, &19, &55, &e0,   2, &a0,   1, &88,   0,   0,   0,   0   ; b3be: 01 19 55... ..U
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, &80   ; b3ca: 00 00 00... ...
    equb   0,   0,   0,   8,   0,   0,   0, &80,   0, &22,   0,   0   ; b3d6: 00 00 00... ...
    equb   0, &22,   0,   0,   0, &aa,   0, &aa,   0, &aa,   0, &aa   ; b3e2: 00 22 00... .".
    equb &aa, &55, &aa, &55, &aa, &55, &aa, &55, &aa, &ff, &aa, &ff   ; b3ee: aa 55 aa... .U.
    equb &aa, &ff, &aa, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff, &ff   ; b3fa: aa ff aa... ...
    equb &40, &20, &10,   8,   4,   2,   1, &80,   1,   2,   4,   8   ; b406: 40 20 10... @ .
    equb &10, &20, &40, &80, &41, &22, &14,   8, &14, &22, &41, &80   ; b412: 10 20 40... . @
    equb   0,   0,   0, &ff,   0,   0,   0, &ff, &88, &88, &88, &88   ; b41e: 00 00 00... ...
    equb &88, &88, &88, &88, &80, &80, &80, &80, &80, &80, &80, &ff   ; b42a: 88 88 88... ...
    equb &aa, &aa, &aa, &aa, &aa, &aa, &aa, &aa,   0, &ff,   0, &ff   ; b436: aa aa aa... ...
    equb   0, &ff,   0, &ff, &80, &80, &80, &ff,   8,   8,   8, &ff   ; b442: 00 ff 00... ...
    equb &80,   1,   3, &84                                           ; b44e: 80 01 03... ...
    equs "H0 @"                                                       ; b452: 48 30 20... H0
    equb   4,   4, &0c, &12, &21, &c0, &30,   8, &80, &41, &3e,   8   ; b456: 04 04 0c... ...
    equb   8, &14, &e3, &80, &aa                                      ; b462: 08 14 e3... ...
    equs "P  "                                                        ; b467: 50 20 20    P
    equb &aa,   5,   2,   2, &82,   5, &0a, &14, &28, &50, &a0, &41   ; b46a: aa 05 02... ...
    equb &88, &11,   2,   4,   8, &11, &22, &44,   8, &14, &22, &41   ; b476: 88 11 02... ...
    equb &80,   0,   0,   0, &88                                      ; b482: 80 00 00... ...
    equs "U", '"', "U"                                                ; b487: 55 22 55    U"U
    equb &88                                                          ; b48a: 88          .
    equs "U", '"', "U"                                                ; b48b: 55 22 55    U"U
    equb &80,   4, &40,   8,   1, &20,   2, &10, &b1, &81, &18, &1b   ; b48e: 80 04 40... ..@
    equb &63, &60,   6                                                ; b49a: 63 60 06    c`.
    equs "6|:"                                                        ; b49d: 36 7c 3a    6|:
    equb &11, &a3, &c7, &8b, &11, &b8, &55, &fd,   5, &fd, &55, &df   ; b4a0: 11 a3 c7... ...
    equb &50, &df, &44, &e0, &70, &38, &11, &83,   7, &0e,   4,   0   ; b4ac: 50 df 44... P.D
    equb &40, &20, &10,   0,   1,   2, &f0, &f0, &0f, &0f, &0f, &0f   ; b4b8: 40 20 10... @ .
    equb &f0, &f0, &0d,   9                                           ; b4c4: f0 f0 0d... ...
    equs "INY"                                                        ; b4c8: 49 4e 59    INY
    equb &0d,   9                                                     ; b4cb: 0d 09       ..
    equs "CMP"                                                        ; b4cd: 43 4d 50    CMP
    equb 9                                                            ; b4d0: 09          .
    equs "#13"                                                        ; b4d1: 23 31 33    #13
    equb &0d,   9                                                     ; b4d4: 0d 09       ..
    equs "BNE"                                                        ; b4d6: 42 4e 45    BNE
    equb 9                                                            ; b4d9: 09          .
    equs "OSCLIN"                                                     ; b4da: 4f 53 43... OSC
    equb &0d,   9                                                     ; b4e0: 0d 09       ..
    equs "LDX"                                                        ; b4e2: 4c 44 58    LDX
    equb   9, &23, &30,   9,   9                                      ; b4e5: 09 23 30... .#0
    equs ";Set up PARS"                                               ; b4ea: 3b 53 65... ;Se
    equb &0d,   9                                                     ; b4f6: 0d 09       ..
    equs "LDY"                                                        ; b4f8: 4c 44 59    LDY
    equb 9                                                            ; b4fb: 09          .
    equs "#&B"                                                        ; b4fc: 23 26 42    #&B
    equb &0d,   9                                                     ; b4ff: 0d 09       ..
    equs "JSR"                                                        ; b501: 4a 53 52    JSR
    equb 9                                                            ; b504: 09          .
    equs "&FFF7"                                                      ; b505: 26 46 46... &FF
    equb 9, 9                                                         ; b50a: 09 09       ..
    equs ";Execute and return"                                        ; b50c: 3b 45 78... ;Ex
    equb &0d,   9                                                     ; b51f: 0d 09       ..
    equs "RTS"                                                        ; b521: 52 54 53    RTS
    equb &0d, &0d                                                     ; b524: 0d 0d       ..
    equs "CLRM"                                                       ; b526: 43 4c 52... CLR
    equb 9                                                            ; b52a: 09          .
    equs "LDX"                                                        ; b52b: 4c 44 58    LDX
    equb 9                                                            ; b52e: 09          .
    equs "#>MCLRM"                                                    ; b52f: 23 3e 4d... #>M
    equb &0d,   9                                                     ; b536: 0d 09       ..
    equs "LDY"                                                        ; b538: 4c 44 59    LDY
    equb 9                                                            ; b53b: 09          .
    equs "#<MCLRM"                                                    ; b53c: 23 3c 4d... #<M
    equb &0d,   9                                                     ; b543: 0d 09       ..
    equs "JMP"                                                        ; b545: 4a 4d 50    JMP
    equb 9                                                            ; b548: 09          .
    equs "DISPS2"                                                     ; b549: 44 49 53... DIS
    equb 9                                                            ; b54f: 09          .
    equs ";Execute and return"                                        ; b550: 3b 45 78... ;Ex
    equb &0d, &0d                                                     ; b563: 0d 0d       ..
    equs "CENMES"                                                     ; b565: 43 45 4e... CEN
    equb 9                                                            ; b56b: 09          .
    equs "JSR"                                                        ; b56c: 4a 53 52    JSR
    equb 9                                                            ; b56f: 09          .
    equs "COLOUR"                                                     ; b570: 43 4f 4c... COL
    equb &0d,   9                                                     ; b576: 0d 09       ..
    equs "LDX"                                                        ; b578: 4c 44 58    LDX
    equb 9                                                            ; b57b: 09          .
    equs "#>MESTAB"                                                   ; b57c: 23 3e 4d... #>M
    equb &0d,   9                                                     ; b584: 0d 09       ..
    equs "LDY"                                                        ; b586: 4c 44 59    LDY
    equb 9                                                            ; b589: 09          .
    equs "#<MESTAB"                                                   ; b58a: 23 3c 4d... #<M
    equb &0d,   9                                                     ; b592: 0d 09       ..
    equs "LDA"                                                        ; b594: 4c 44 41    LDA
    equb 9                                                            ; b597: 09          .
    equs "&F1"                                                        ; b598: 26 46 31    &F1
    equb &0d,   9                                                     ; b59b: 0d 09       ..
    equs "JSR"                                                        ; b59d: 4a 53 52    JSR
    equb 9                                                            ; b5a0: 09          .
    equs "GETADD"                                                     ; b5a1: 47 45 54... GET
    equb &0d,   9                                                     ; b5a7: 0d 09       ..
    equs "STX"                                                        ; b5a9: 53 54 58    STX
    equb 9                                                            ; b5ac: 09          .
    equs "MADDL"                                                      ; b5ad: 4d 41 44... MAD
    equb 9, 9                                                         ; b5b2: 09 09       ..
    equs ";Save message pointers"                                     ; b5b4: 3b 53 61... ;Sa
    equb &0d,   9                                                     ; b5ca: 0d 09       ..
    equs "STY"                                                        ; b5cc: 53 54 59    STY
    equb 9                                                            ; b5cf: 09          .
    equs "MADDH"                                                      ; b5d0: 4d 41 44... MAD
    equb &0d,   9                                                     ; b5d5: 0d 09       ..
    equs "JSR"                                                        ; b5d7: 4a 53 52    JSR
    equb 9                                                            ; b5da: 09          .
    equs "CLRM"                                                       ; b5db: 43 4c 52... CLR
    equb &0d,   9                                                     ; b5df: 0d 09       ..
    equs "LDX"                                                        ; b5e1: 4c 44 58    LDX
    equb 9                                                            ; b5e4: 09          .
    equs "#>MMPOSN"                                                   ; b5e5: 23 3e 4d... #>M
    equb 9                                                            ; b5ed: 09          .
    equs ";Position Cursor"                                           ; b5ee: 3b 50 6f... ;Po
    equb &0d,   9                                                     ; b5fe: 0d 09       ..
    equs "LDY"                                                        ; b600: 4c 44 59    LDY
    equb 9                                                            ; b603: 09          .
    equs "#<MMPOSN"                                                   ; b604: 23 3c 4d... #<M
    equb &0d,   9                                                     ; b60c: 0d 09       ..
    equs "JSR"                                                        ; b60e: 4a 53 52    JSR
    equb 9                                                            ; b611: 09          .
    equs "DISPS2"                                                     ; b612: 44 49 53... DIS
    equb &0d,   9                                                     ; b618: 0d 09       ..
    equs "LDY"                                                        ; b61a: 4c 44 59    LDY
    equb   9, &23, &30, &0d,   9                                      ; b61d: 09 23 30... .#0
    equs "LDA"                                                        ; b622: 4c 44 41    LDA
    equb 9                                                            ; b625: 09          .
    equs "(MADDL),Y"                                                  ; b626: 28 4d 41... (MA
    equb &0d,   9                                                     ; b62f: 0d 09       ..
    equs "CLC"                                                        ; b631: 43 4c 43    CLC
    equb &0d,   9                                                     ; b634: 0d 09       ..
    equs "ADC"                                                        ; b636: 41 44 43    ADC
    equb 9                                                            ; b639: 09          .
    equs "#183"                                                       ; b63a: 23 31 38... #18
    equb &0d,   9                                                     ; b63e: 0d 09       ..
    equs "EOR"                                                        ; b640: 45 4f 52    EOR
    equb 9                                                            ; b643: 09          .
    equs "#255"                                                       ; b644: 23 32 35... #25
    equb &0d,   9                                                     ; b648: 0d 09       ..
    equs "LSR"                                                        ; b64a: 4c 53 52    LSR
    equb   9, &41, &0d,   9                                           ; b64d: 09 41 0d... .A.
    equs "TAX"                                                        ; b651: 54 41 58    TAX
    equb &0d,   9                                                     ; b654: 0d 09       ..
    equs "LDA"                                                        ; b656: 4c 44 41    LDA
    equb 9                                                            ; b659: 09          .
    equs "#32"                                                        ; b65a: 23 33 32    #32
    equb &0d                                                          ; b65d: 0d          .
    equs "CENMNS"                                                     ; b65e: 43 45 4e... CEN
    equb 9                                                            ; b664: 09          .
    equs "JSR"                                                        ; b665: 4a 53 52    JSR
    equb 9                                                            ; b668: 09          .
    equs "&FFEE"                                                      ; b669: 26 46 46... &FF
    equb &0d,   9                                                     ; b66e: 0d 09       ..
    equs "DEX"                                                        ; b670: 44 45 58    DEX
    equb &0d,   9                                                     ; b673: 0d 09       ..
    equs "BNE"                                                        ; b675: 42 4e 45    BNE
    equb 9                                                            ; b678: 09          .
    equs "CENMNS"                                                     ; b679: 43 45 4e... CEN
    equb &0d,   9                                                     ; b67f: 0d 09       ..
    equs "LDX"                                                        ; b681: 4c 44 58    LDX
    equb 9                                                            ; b684: 09          .
    equs "MADDL"                                                      ; b685: 4d 41 44... MAD
    equb &0d,   9                                                     ; b68a: 0d 09       ..
    equs "LDY"                                                        ; b68c: 4c 44 59    LDY
    equb 9                                                            ; b68f: 09          .
    equs "MADDH"                                                      ; b690: 4d 41 44... MAD
    equb &0d,   9                                                     ; b695: 0d 09       ..
    equs "JSR"                                                        ; b697: 4a 53 52    JSR
    equb 9                                                            ; b69a: 09          .
    equs "DISPS2"                                                     ; b69b: 44 49 53... DIS
    equb &0d,   9                                                     ; b6a1: 0d 09       ..
    equs "RTS"                                                        ; b6a3: 52 54 53    RTS
    equb &0d, &0d                                                     ; b6a6: 0d 0d       ..
    equs "DISPNO"                                                     ; b6a8: 44 49 53... DIS
    equb 9                                                            ; b6ae: 09          .
    equs "LDA"                                                        ; b6af: 4c 44 41    LDA
    equb 9                                                            ; b6b2: 09          .
    equs "&F1"                                                        ; b6b3: 26 46 31    &F1
    equb &0d,   9                                                     ; b6b6: 0d 09       ..
    equs "LDX"                                                        ; b6b8: 4c 44 58    LDX
    equb 9                                                            ; b6bb: 09          .
    equs "#&FF"                                                       ; b6bc: 23 26 46... #&F
    equb &0d                                                          ; b6c0: 0d          .
    equs "DISPN2"                                                     ; b6c1: 44 49 53... DIS
    equb 9                                                            ; b6c7: 09          .
    equs "INX"                                                        ; b6c8: 49 4e 58    INX
    equb &0d,   9                                                     ; b6cb: 0d 09       ..
    equs "SEC"                                                        ; b6cd: 53 45 43    SEC
    equb &0d,   9                                                     ; b6d0: 0d 09       ..
    equs "SBC"                                                        ; b6d2: 53 42 43    SBC
    equb 9                                                            ; b6d5: 09          .
    equs "#10"                                                        ; b6d6: 23 31 30    #10
    equb &0d,   9                                                     ; b6d9: 0d 09       ..
    equs "BCS"                                                        ; b6db: 42 43 53    BCS
    equb 9                                                            ; b6de: 09          .
    equs "DISPN2"                                                     ; b6df: 44 49 53... DIS
    equb &0d,   9                                                     ; b6e5: 0d 09       ..
    equs "CLC"                                                        ; b6e7: 43 4c 43    CLC
    equb &0d,   9                                                     ; b6ea: 0d 09       ..
    equs "ADC"                                                        ; b6ec: 41 44 43    ADC
    equb 9                                                            ; b6ef: 09          .
    equs "#10"                                                        ; b6f0: 23 31 30    #10
    equb &0d,   9                                                     ; b6f3: 0d 09       ..
    equs "PHA"                                                        ; b6f5: 50 48 41    PHA
    equb &0d,   9                                                     ; b6f8: 0d 09       ..
    equs "TXA"                                                        ; b6fa: 54 58 41    TXA
    equb &0d,   9                                                     ; b6fd: 0d 09       ..
    equs "CLC"                                                        ; b6ff: 43 4c 43    CLC
    equb &0d,   9                                                     ; b702: 0d 09       ..
    equs "ADC"                                                        ; b704: 41 44 43    ADC
    equb 9                                                            ; b707: 09          .
    equs "#'0'"                                                       ; b708: 23 27 30... #'0
    equb &0d,   9                                                     ; b70c: 0d 09       ..
    equs "JSR"                                                        ; b70e: 4a 53 52    JSR
    equb 9                                                            ; b711: 09          .
    equs "&FFEE"                                                      ; b712: 26 46 46... &FF
    equb &0d,   9                                                     ; b717: 0d 09       ..
    equs "PLA"                                                        ; b719: 50 4c 41    PLA
    equb &0d,   9                                                     ; b71c: 0d 09       ..
    equs "ADC"                                                        ; b71e: 41 44 43    ADC
    equb 9                                                            ; b721: 09          .
    equs "#'0'"                                                       ; b722: 23 27 30... #'0
    equb &0d,   9                                                     ; b726: 0d 09       ..
    equs "JSR"                                                        ; b728: 4a 53 52    JSR
    equb 9                                                            ; b72b: 09          .
    equs "&FFEE"                                                      ; b72c: 26 46 46... &FF
    equb &0d,   9                                                     ; b731: 0d 09       ..
    equs "RTS"                                                        ; b733: 52 54 53    RTS
    equb &0d, &0d                                                     ; b736: 0d 0d       ..
    equs "DISPLN"                                                     ; b738: 44 49 53... DIS
    equb 9                                                            ; b73e: 09          .
    equs "LDA"                                                        ; b73f: 4c 44 41    LDA
    equb 9                                                            ; b742: 09          .
    equs "&F1"                                                        ; b743: 26 46 31    &F1
    equb &0d,   9                                                     ; b746: 0d 09       ..
    equs "LDX"                                                        ; b748: 4c 44 58    LDX
    equb 9                                                            ; b74b: 09          .
    equs "#&FF"                                                       ; b74c: 23 26 46... #&F
    equb &0d                                                          ; b750: 0d          .
    equs "DISPN3"                                                     ; b751: 44 49 53... DIS
    equb 9                                                            ; b757: 09          .
    equs "INX"                                                        ; b758: 49 4e 58    INX
    equb &0d,   9                                                     ; b75b: 0d 09       ..
    equs "SEC"                                                        ; b75d: 53 45 43    SEC
    equb &0d,   9                                                     ; b760: 0d 09       ..
    equs "SBC"                                                        ; b762: 53 42 43    SBC
    equb 9                                                            ; b765: 09          .
    equs "#100"                                                       ; b766: 23 31 30... #10
    equb &0d,   9                                                     ; b76a: 0d 09       ..
    equs "BCS"                                                        ; b76c: 42 43 53    BCS
    equb 9                                                            ; b76f: 09          .
    equs "DISPN3"                                                     ; b770: 44 49 53... DIS
    equb &0d,   9                                                     ; b776: 0d 09       ..
    equs "CLC"                                                        ; b778: 43 4c 43    CLC
    equb &0d,   9                                                     ; b77b: 0d 09       ..
    equs "ADC"                                                        ; b77d: 41 44 43    ADC
    equb 9                                                            ; b780: 09          .
    equs "#100"                                                       ; b781: 23 31 30... #10
    equb &0d,   9                                                     ; b785: 0d 09       ..
    equs "PHA"                                                        ; b787: 50 48 41    PHA
    equb &0d,   9                                                     ; b78a: 0d 09       ..
    equs "TXA"                                                        ; b78c: 54 58 41    TXA
    equb &0d,   9                                                     ; b78f: 0d 09       ..
    equs "CLC"                                                        ; b791: 43 4c 43    CLC
    equb &0d,   9                                                     ; b794: 0d 09       ..
    equs "ADC"                                                        ; b796: 41 44 43    ADC
    equb 9                                                            ; b799: 09          .
    equs "#'0'"                                                       ; b79a: 23 27 30... #'0
    equb &0d,   9                                                     ; b79e: 0d 09       ..
    equs "JSR"                                                        ; b7a0: 4a 53 52    JSR
    equb 9                                                            ; b7a3: 09          .
    equs "&FFEE"                                                      ; b7a4: 26 46 46... &FF
    equb &0d,   9                                                     ; b7a9: 0d 09       ..
    equs "PLA"                                                        ; b7ab: 50 4c 41    PLA
    equb &0d,   9                                                     ; b7ae: 0d 09       ..
    equs "LDX"                                                        ; b7b0: 4c 44 58    LDX
    equb 9                                                            ; b7b3: 09          .
    equs "#&FF"                                                       ; b7b4: 23 26 46... #&F
    equb &0d                                                          ; b7b8: 0d          .
    equs "DISPN4"                                                     ; b7b9: 44 49 53... DIS
    equb 9                                                            ; b7bf: 09          .
    equs "INX"                                                        ; b7c0: 49 4e 58    INX
    equb &0d,   9                                                     ; b7c3: 0d 09       ..
    equs "SEC"                                                        ; b7c5: 53 45 43    SEC
    equb &0d,   9                                                     ; b7c8: 0d 09       ..
    equs "SBC"                                                        ; b7ca: 53 42 43    SBC
    equb 9                                                            ; b7cd: 09          .
    equs "#10"                                                        ; b7ce: 23 31 30    #10
    equb &0d,   9                                                     ; b7d1: 0d 09       ..
    equs "BCS"                                                        ; b7d3: 42 43 53    BCS
    equb 9                                                            ; b7d6: 09          .
    equs "DISPN4"                                                     ; b7d7: 44 49 53... DIS
    equb &0d,   9                                                     ; b7dd: 0d 09       ..
    equs "CLC"                                                        ; b7df: 43 4c 43    CLC
    equb &0d,   9                                                     ; b7e2: 0d 09       ..
    equs "ADC"                                                        ; b7e4: 41 44 43    ADC
    equb 9                                                            ; b7e7: 09          .
    equs "#10"                                                        ; b7e8: 23 31 30    #10
    equb &0d,   9                                                     ; b7eb: 0d 09       ..
    equs "PHA"                                                        ; b7ed: 50 48 41    PHA
    equb &0d,   9                                                     ; b7f0: 0d 09       ..
    equs "TXA"                                                        ; b7f2: 54 58 41    TXA
    equb &0d,   9                                                     ; b7f5: 0d 09       ..
    equs "CLC"                                                        ; b7f7: 43 4c 43    CLC
    equb &0d,   9                                                     ; b7fa: 0d 09       ..
    equs "ADC"                                                        ; b7fc: 41 44 43    ADC
    equb   9, &aa, &55, &aa, &55, &ff, &c0, &80, &83, &bf, &83, &80   ; b7ff: 09 aa 55... ..U
    equb &c0, &ff, &55, &aa, &55, &aa, &55, &aa, &55, &fe,   3,   1   ; b80b: c0 ff 55... ..U
    equb &c1, &fd, &c1,   1,   3, &fe, &55, &aa, &55, &af, &54, &ff   ; b817: c1 fd c1... ...
    equb &40, &ff, &60, &aa, &6a, &aa, &6a, &aa, &6a, &aa, &60, &a0   ; b823: 40 ff 60... @.`
    equb &7f, &ea, &55, &fe,   5, &fe, &0d, &aa, &ad, &aa, &ad, &aa   ; b82f: 7f ea 55... ..U
    equb &ad, &aa, &0d, &0a, &fd, &aa, &55, &bf, &50, &b7, &50, &b6   ; b83b: ad aa 0d... ...
    equb &50, &f5, &d0, &9f, &80, &80, &c0, &ff, &55, &aa, &55, &fa   ; b847: 50 f5 d0... P..
    equb &0d, &6a, &0d, &ea, &0d, &6e, &0b, &f9,   1,   1,   3, &fe   ; b853: 0d 6a 0d... .j.
    equb &55, &ff, &c0, &9f, &90, &9f, &80, &9b, &9b, &80, &9b, &9b   ; b85f: 55 ff c0... U..
    equb &80, &9b, &9b, &c0, &7f, &fa, &0d, &e6, &25, &e6,   5, &66   ; b86b: 80 9b 9b... ...
    equb &65,   6, &65, &66,   5, &66, &65, &0e, &fd, &aa, &55, &bf   ; b877: 65 06 65... e.e
    equb &60, &a0, &60, &a0, &61, &a0, &61, &a1, &61, &a0, &7f, &aa   ; b883: 60 a0 60... `.`
    equb &55, &aa, &55, &fe,   5,   6,   5,   6, &85,   6, &85, &86   ; b88f: 55 aa 55... U.U
    equb &85,   6, &fd, &aa, &55, &aa, &55, &aa, &7f, &80, &80, &b7   ; b89b: 85 06 fd... ...
    equb &b7, &80, &87, &88, &7f, &aa, &55, &aa, &55, &aa, &55, &aa   ; b8a7: b7 80 87... ...
    equb &ff,   1,   1, &ed, &ed,   1, &e1, &11, &ff, &aa, &55, &aa   ; b8b3: ff 01 01... ...
    equb &55, &bf, &6a, &ff, &50, &d0, &57, &d0, &57, &d0, &50, &d0   ; b8bf: 55 bf 6a... U.j
    equb &50, &d0, &50, &ff, &55, &fe, &af, &fa, &0b, &0a, &4b, &0a   ; b8cb: 50 d0 50... P.P
    equb &8b, &0a, &0b, &0a, &0b, &0a, &0d, &fa, &55, &aa, &55, &aa   ; b8d7: 8b 0a 0b... ...
    equb &55, &aa, &7f, &ff, &f4, &e8, &58, &bc, &7f, &ff, &7f, &aa   ; b8e3: 55 aa 7f... U..
    equb &55, &aa, &55, &aa, &55, &aa, &fd, &fe, &df, &6e, &75, &fa   ; b8ef: 55 aa 55... U.U
    equb &fd, &fe, &fd, &aa, &55, &aa, &57, &b8, &60, &c1, &41, &81   ; b8fb: fd fe fd... ...
    equb &81, &81, &82, &84, &48, &c0, &60, &b8, &57, &aa, &d5, &3a   ; b907: 81 81 82... ...
    equb &0d,   6,   5,   2,   3,   2,   3,   2,   5,   6, &0d, &3a   ; b913: 0d 06 05... ...
    equb &d5, &aa, &7f, &c0, &5a, &c0, &5d, &c0, &56, &c0, &5b, &c0   ; b91f: d5 aa 7f... ...
    equb &59, &c0, &40, &ff, &55, &aa, &fd,   6, &e5,   6, &55,   6   ; b92b: 59 c0 40... Y.@
    equb &b5,   6, &75,   6, &65,   6,   5, &fe, &55, &aa, &7f, &c0   ; b937: b5 06 75... ..u
    equb &5f, &c0, &5e, &c0, &5f, &c0, &5f, &c0, &5f, &c0, &40, &ff   ; b943: 5f c0 5e... _.^
    equb &55, &aa, &d5                                                ; b94f: 55 aa d5    U..
    equs "jUJ}"                                                       ; b952: 6a 55 4a... jUJ
    equb   6, &f5,   6, &85,   6, &e5,   6,   5, &fe, &55, &aa, &ff   ; b956: 06 f5 06... ...
    equb &82, &ff, &80, &80, &80, &80, &80, &80, &80, &80, &80, &80   ; b962: 82 ff 80... ...
    equb &ff, &55, &aa, &55, &aa, &ff,   1,   1,   1,   1,   1,   1   ; b96e: ff 55 aa... .U.
    equb   1,   1,   1,   1, &ff, &55, &ff, &80, &9e, &b3, &83, &86   ; b97a: 01 01 01... ...
    equb &8c, &99, &b1, &bf, &81, &ff, &ab, &55, &ab, &55, &ea        ; b986: 8c 99 b1... ...
    equs "UjU"                                                        ; b991: 55 6a 55    UjU
    equb &7f, &61, &c1, &99, &39, &19, &19, &19, &19, &3d,   1, &ff   ; b994: 7f 61 c1... .a.
    equb &aa, &55, &ff, &c0, &a0, &90, &88, &84, &86, &89, &90, &a0   ; b9a0: aa 55 ff... .U.
    equb &c0, &ff, &aa, &55, &aa, &55, &ff,   3,   5,   9, &11, &21   ; b9ac: c0 ff aa... ...
    equb &61, &91,   9,   5,   3, &ff, &aa, &55, &aa, &55, &aa, &ff   ; b9b8: 61 91 09... a..
    equb &80, &80, &9f, &80, &9f, &80, &9c, &80, &ff, &55, &aa, &55   ; b9c4: 80 80 9f... ...
    equb &aa, &55, &aa, &ff,   1, &0d, &8d,   1,   1,   1,   1,   1   ; b9d0: aa 55 aa... .U.
    equb &ff, &55, &aa, &55, &aa, &57, &ac, &5a, &fa, &f8, &a8, &58   ; b9dc: ff 55 aa... .U.
    equb &a8, &58, &ac, &57, &aa, &55, &aa, &55, &aa, &f5, &1a, &ad   ; b9e8: a8 58 ac... .X.
    equb &aa, &0d, &0a, &0d, &0a, &0d, &1a, &f5, &aa, &55, &aa, &55   ; b9f4: aa 0d 0a... ...
    equb &ba, &4d, &9b, &be, &f8, &71, &a1, &61, &c1, &62, &a4, &70   ; ba00: ba 4d 9b... .M.
    equb &b8, &5e, &bb, &75, &ba, &65, &b2, &fb, &3e, &1d, &0a, &0d   ; ba0c: b8 5e bb... .^.
    equb   6, &0d, &0a, &1d, &3a, &f5, &ba, &5d,   0, &fe, &82, &ff   ; ba18: 06 0d 0a... ...
    equb &80, &80, &80, &80, &80, &80, &80, &80, &80, &80, &ff,   0   ; ba24: 80 80 80... ...
    equb   0,   0,   0, &ff,   1,   1,   1,   1,   1,   1,   1,   1   ; ba30: 00 00 00... ...
    equb   1,   1, &ff,   0,   0,   0,   0, &ff, &80, &80, &80, &80   ; ba3c: 01 01 ff... ...
    equb &9f, &80, &9f, &80, &9e, &80, &ff,   0,   0,   0,   0, &ff   ; ba48: 9f 80 9f... ...
    equb   1, &0d, &0d, &0d, &c1,   1,   1,   1,   1,   1, &ff,   0   ; ba54: 01 0d 0d... ...
    equb   0,   0                                                     ; ba60: 00 00       ..
    equs "?    ! !!! ?"                                               ; ba62: 3f 20 20... ?
    equb   0,   0,   0,   0, &fc,   4,   4,   4,   4, &84,   4, &84   ; ba6e: 00 00 00... ...
    equb &84, &84,   4, &fc,   0,   0,   8,   8, &0c, &0c,   6,   6   ; ba7a: 84 84 04... ...
    equb   3,   3,   3,   3,   6,   4                                 ; ba86: 03 03 03... ...
    equs "<hXp  ``"                                                   ; ba8c: 3c 68 58... <hX
    equb &c0, &c0, &80, &80, &80, &80, &c0                            ; ba94: c0 c0 80... ...
    equs "@x,4"                                                       ; ba9b: 40 78 2c... @x,
    equb &1c,   0,   0,   0,   0,   1,   3,   6, &3f, &17             ; ba9f: 1c 00 00... ...
    equs "?////?"                                                     ; baa9: 3f 2f 2f... ?//
    equb   0, &18, &30, &60, &c0, &80,   0,   0, &c0, &80, &c0, &c0   ; baaf: 00 18 30... ..0
    equb &c0, &c0, &c0, &c0,   0,   7, &0f, &1c, &38, &38,   0,   0   ; babb: c0 c0 c0... ...
    equb   0,   0,   1,   1,   1,   0,   1,   1,   0, &e0, &f0, &38   ; bac7: 00 00 01... ...
    equb &1c, &1c, &1c, &38, &70, &e0, &c0, &c0, &c0,   0, &c0, &c0   ; bad3: 1c 1c 1c... ...
    equb   0,   0, &1f                                                ; badf: 00 00 1f    ...
    equs "0``"                                                        ; bae2: 30 60 60    0``
    equb   1, &0e                                                     ; bae5: 01 0e       ..
    equs "8p``a3"                                                     ; bae7: 38 70 60... 8p`
    equb &1e,   0,   0,   0, &c0, &e0, &70, &70, &f0                  ; baed: 1e 00 00... ...
    equs "pppp"                                                       ; baf6: 70 70 70... ppp
    equb &f0, &f4, &7c, &38,   0,   0,   1,   3,   7, &0f, &1f, &3f   ; bafa: f0 f4 7c... ..|
    equb   7,   7,   7,   7,   0,   0,   0,   0,   0,   0,   0, &80   ; bb06: 07 07 07... ...
    equb &c0, &e0, &f0, &f8, &c0, &c0, &c0, &c0,   0,   0,   0,   0   ; bb12: c0 e0 f0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   7,   7,   7,   7   ; bb1e: 00 00 00... ...
    equb &3f, &1f, &0f,   7,   3,   1,   0,   0,   0,   0,   0,   0   ; bb2a: 3f 1f 0f... ?..
    equb &c0, &c0, &c0, &c0, &f8, &f0, &e0, &c0, &80,   0,   0,   0   ; bb36: c0 c0 c0... ...
    equb   0,   0,   0,   7,   7,   7,   7,   7,   0,   0,   0,   0   ; bb42: 00 00 00... ...
    equb   0,   0,   0,   0                                           ; bb4e: 00 00 00... ...
    equs " 08"                                                        ; bb52: 20 30 38     08
    equb &fc, &fe, &ff, &fe, &fc                                      ; bb55: fc fe ff... ...
    equs "80 "                                                        ; bb5a: 38 30 20    80
    equb   0,   0,   0,   0,   0,   4, &0c, &1c, &3f, &7f, &ff, &7f   ; bb5d: 00 00 00... ...
    equb &3f, &1c, &0c,   4,   0,   0,   0,   0,   0,   0,   0,   0   ; bb69: 3f 1c 0c... ?..
    equb &e0, &e0, &e0, &e0, &e0,   0,   0,   0,   0,   0,   0,   0   ; bb75: e0 e0 e0... ...
    equb   0,   0,   0,   0,   1,   3,   7,   7,   3,   1,   0,   0   ; bb81: 00 00 00... ...
    equb   0,   0,   1,   0,   0,   0,   0,   0, &80, &c0, &e0, &f1   ; bb8d: 00 00 01... ...
    equb &fb, &ff, &ff, &7f, &7f, &ff, &ff,   0,   0,   0,   0,   0   ; bb99: fb ff ff... ...
    equb   1,   3, &87, &cf, &ff, &ff, &ff, &fe, &fe, &ff, &ff,   0   ; bba5: 01 03 87... ...
    equb   0,   0,   0,   0, &80, &c0, &e0, &e0, &c0, &80,   0,   0   ; bbb1: 00 00 00... ...
    equb   0,   0, &80,   1,   0,   0,   0,   0,   1,   3,   7,   7   ; bbbd: 00 00 80... ...
    equb   3,   1,   0,   0,   0,   0,   0, &ff, &ff, &7f, &7f, &ff   ; bbc9: 03 01 00... ...
    equb &ff, &ff, &f3, &e1, &c0, &80,   0,   0,   0,   0,   0, &ff   ; bbd5: ff ff f3... ...
    equb &ff, &fe, &fe, &ff, &ff, &ff, &cf, &87,   3,   1,   0,   0   ; bbe1: ff fe fe... ...
    equb   0,   0,   0, &80,   0,   0,   0,   0, &80, &c0, &e0, &e0   ; bbed: 00 00 00... ...
    equb &c0, &80,   0,   0,   0,   0,   0,   0,   0, &1e             ; bbf9: c0 80 00... ...
    equs "7*5*5"                                                      ; bc03: 37 2a 35... 7*5
    equb &1a, &15, &0a, &0d,   7,   3,   1,   0,   0,   0, &70, &f8   ; bc08: 1a 15 0a... ...
    equb &bc, &5c, &bc, &5c, &b8, &78, &f0, &f0, &e0, &c0, &80,   0   ; bc14: bc 5c bc... .\.
    equb   0,   7, &0f, &0f, &0f,   7, &1f                            ; bc20: 00 07 0f... ...
    equs "????"                                                       ; bc27: 3f 3f 3f... ???
    equb &1f, &0b,   3,   7,   0,   0, &80, &c0, &c0, &c0, &80, &e0   ; bc2b: 1f 0b 03... ...
    equb &f0, &f0, &f0, &f0, &e0, &40,   0, &80,   0,   0,   0,   1   ; bc37: f0 f0 f0... ...
    equb   3,   5, &0a, &15                                           ; bc43: 03 05 0a... ...
    equs "*U*"                                                        ; bc47: 2a 55 2a    *U*
    equb &15, &0a,   5,   3,   1,   0,   0,   0,   0, &80, &c0, &e0   ; bc4a: 15 0a 05... ...
    equb &70, &b8, &5c, &b8, &70, &e0, &c0, &80,   0,   0,   0,   1   ; bc56: 70 b8 5c... p.\
    equb   3,   7, &0f, &0f, &1f, &1f, &1f, &1f, &1f, &1f, &0d,   1   ; bc62: 03 07 0f... ...
    equb   3,   0,   0,   0, &80, &c0, &e0, &e0, &f0, &f0, &f0, &f0   ; bc6e: 03 00 00... ...
    equb &f0, &f0, &60,   0, &80,   0,   0,   0                       ; bc7a: f0 f0 60... ..`
    equs "? && && && ?"                                               ; bc82: 3f 20 26... ? &
    equb   0,   0,   0,   0, &fc,   4, &64, &64,   4, &64, &64,   4   ; bc8e: 00 00 00... ...
    equb &64, &64,   4, &fc,   0,   0,   0,   0                       ; bc9a: 64 64 04... dd.
    equs "? && !! && ?"                                               ; bca2: 3f 20 26... ? &
    equb   0,   0,   0,   0, &fc,   4, &64, &64,   4, &84, &84,   4   ; bcae: 00 00 00... ...
    equb &64, &64,   4, &fc,   0,   0,   0,   0                       ; bcba: 64 64 04... dd.
    equs "? &&    && ?"                                               ; bcc2: 3f 20 26... ? &
    equb   0,   0,   0,   0, &fc,   4, &64, &64,   4,   4,   4,   4   ; bcce: 00 00 00... ...
    equb &64, &64,   4, &fc,   0,   0,   0,   0                       ; bcda: 64 64 04... dd.
    equs "? && !!    ?"                                               ; bce2: 3f 20 26... ? &
    equb   0,   0,   0,   0, &fc,   4,   4,   4,   4, &84, &84,   4   ; bcee: 00 00 00... ...
    equb &64, &64,   4, &fc,   0,   0,   0,   0                       ; bcfa: 64 64 04... dd.
    equs "? &&       ?"                                               ; bd02: 3f 20 26... ? &
    equb   0,   0,   0,   0, &fc,   4,   4,   4,   4,   4,   4,   4   ; bd0e: 00 00 00... ...
    equb &64, &64,   4, &fc,   0,   0,   0,   0                       ; bd1a: 64 64 04... dd.
    equs "?    !!    ?"                                               ; bd22: 3f 20 20... ?
    equb   0,   0,   0,   0, &fc,   4,   4,   4,   4, &84, &84,   4   ; bd2e: 00 00 00... ...
    equb   4,   4,   4, &fc,   0,   0,   7, &18                       ; bd3a: 04 04 04... ...
    equs " @L"                                                        ; bd42: 20 40 4c     @L
    equb &92, &96, &8c, &80, &80, &90                                 ; bd45: 92 96 8c... ...
    equs "LC "                                                        ; bd4b: 4c 43 20    LC
    equb &18,   7, &c0, &30,   8,   4, &64, &92, &d2, &62,   2,   2   ; bd4e: 18 07 c0... ...
    equb &12, &64, &84,   8, &30, &c0,   7, &18                       ; bd5a: 12 64 84... .d.
    equs " @L"                                                        ; bd62: 20 40 4c     @L
    equb &92, &96, &8c, &80, &80, &83                                 ; bd65: 92 96 8c... ...
    equs "LP "                                                        ; bd6b: 4c 50 20    LP
    equb &18,   7, &c0, &30,   8,   4, &64, &92, &d2, &62,   2,   2   ; bd6e: 18 07 c0... ...
    equb &82, &64, &14,   8, &30, &c0,   0,   0                       ; bd7a: 82 64 14... .d.
    equs "?`@@@@@@@@`?"                                               ; bd82: 3f 60 40... ?`@
    equb   0,   0,   0,   0, &f8, &0c,   4,   4,   4,   4,   4,   4   ; bd8e: 00 00 00... ...
    equb   4,   4, &0c, &f8,   0,   0,   0,   0                       ; bd9a: 04 04 0c... ...
    equs "?`@@@@@@@@`?"                                               ; bda2: 3f 60 40... ?`@
    equb   0,   0,   0,   0, &ff,   0,   0,   0,   0,   0,   0,   0   ; bdae: 00 00 00... ...
    equb   0,   0,   0, &ff,   0,   0,   0,   0, &ff,   0,   0,   0   ; bdba: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0, &ff,   0,   0,   0,   0   ; bdc6: 00 00 00... ...
    equb &ff,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, &ff   ; bdd2: ff 00 00... ...
    equb   0,   0,   0,   0, &ff,   0,   0,   0,   0,   0,   0,   0   ; bdde: 00 00 00... ...
    equb   0,   0,   0, &ff,   0,   0,   0,   0, &f8, &0c,   4,   4   ; bdea: 00 00 00... ...
    equb   4,   4,   4,   4,   4,   4, &0c, &f8,   0,   0,   0        ; bdf6: 04 04 04... ...
    equs "@`px|~"                                                     ; be01: 40 60 70... @`p
    equb &7f                                                          ; be07: 7f          .
    equs "xlL"                                                        ; be08: 78 6c 4c    xlL
    equb   6,   6,   3,   3,   0,   0,   0,   0,   0,   0,   0,   0   ; be0b: 06 06 03... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0, &c0, &e0, &f0   ; be17: 00 00 00... ...
    equb &f8, &fc, &fe, &ff, &ff, &ff, &fe, &fe, &4f, &0f,   7,   7   ; be23: f8 fc fe... ...
    equb   3,   0,   0,   0,   0,   0,   0,   0, &80, &80,   0,   0   ; be2f: 03 00 00... ...
    equb   0,   0, &80, &80,   0,   0,   0,   3,   5,   5,   5, &15   ; be3b: 00 00 80... ...
    equb &2c, &24, &10,   8,   4,   2,   2,   2,   0,   0, &80        ; be47: 2c 24 10... ,$.
    equs "`PXTT"                                                      ; be52: 60 50 58... `PX
    equb   4,   4,   4,   8,   8, &10, &10, &10,   0,   0,   3,   7   ; be57: 04 04 04... ...
    equb &0f, &0f, &1f, &3f, &7f, &7f, &3f, &1f, &0f,   7,   7,   7   ; be63: 0f 0f 1f... ...
    equb   3, &80, &e0, &f0, &f8, &fc, &fe, &fe, &fe, &fe, &fe, &fc   ; be6f: 03 80 e0... ...
    equb &fc, &f8, &f8, &f8, &f0,   0,   0,   1,   7,   1,   3,   3   ; be7b: fc f8 f8... ...
    equb   2,   2,   2,   2,   0,   0,   0,   0,   0,   0,   0, &fc   ; be87: 02 02 02... ...
    equb &7e, &1c, &ce                                                ; be93: 7e 1c ce    ~..
    equs "Fv&v&v&>"                                                   ; be96: 46 76 26... Fv&
    equb   0,   0,   0,   1,   7, &0f,   7,   7,   7,   7,   7,   7   ; be9e: 00 00 00... ...
    equb   7,   2,   0,   0,   0,   0,   0, &fc, &fe, &ff, &fe, &ff   ; beaa: 07 02 00... ...
    equb &ff, &ff, &7f, &ff, &7f, &ff, &7f, &7f, &3e,   0,   0,   1   ; beb6: ff ff 7f... ...
    equb   3,   0                                                     ; bec2: 03 00       ..
    equs "? o/?"                                                      ; bec4: 3f 20 6f... ? o
    equb   0,   1,   3,   3,   3,   3,   0,   0,   0, &80,   0, &f8   ; bec9: 00 01 03... ...
    equb   8, &fe, &fa, &fa,   2, &fe, &80, &80, &80, &80,   0,   1   ; bed5: 08 fe fa... ...
    equb   2,   7, &3f, &7f, &7f, &ff, &7f, &7f, &3f,   3,   7,   7   ; bee1: 02 07 3f... ..?
    equb   7,   7,   3,   0, &80, &c0, &f8, &fc, &fe, &ff, &ff, &ff   ; beed: 07 07 03... ...
    equb &ff, &ff, &ff, &c0, &c0, &c0, &80,   0, &6c, &10, &10, &10   ; bef9: ff ff ff... ...
    equb &10, &10, &10, &10, &10, &10, &6c,   0,   0,   0,   0,   0   ; bf05: 10 10 10... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; bf11: 00 00 00... ...
    equb   0,   0,   0, &6c, &fe                                      ; bf1d: 00 00 00... ...
    equs "|8888888|"                                                  ; bf22: 7c 38 38... |88
    equb &fe, &6c,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; bf2b: fe 6c 00... .l.
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   1   ; bf37: 00 00 00... ...
    equb   1,   1,   1,   0, &7c,   0,   1,   1,   1,   1,   1,   0   ; bf43: 01 01 01... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0, &7c,   0,   0,   0   ; bf4f: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   3,   3,   3,   3,   3,   3, &ff   ; bf5b: 00 00 00... ...
    equb &fe, &ff,   3,   3,   3,   3,   3,   3,   0, &80, &80, &80   ; bf67: fe ff 03... ...
    equb &80, &80, &80, &fe, &fe, &fe, &80, &80, &80, &80, &80, &80   ; bf73: 80 80 80... ...
    equb   0,   0,   0,   1,   1,   1,   1,   0,   0,   0,   0,   0   ; bf7f: 00 00 00... ...
    equb   0,   0,   0,   0,   0, &78, &84                            ; bf8b: 00 00 00... ...
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
;     c8061
;     c80ab
;     c80bf
;     c80d3
;     c80ee
;     c8102
;     c8118
;     c812c
;     c8140
;     c815b
;     c816f
;     c8191
;     c81cb
;     c81cf
;     c81f6
;     c8208
;     c8216
;     c823f
;     c824b
;     c8252
;     c825f
;     c8328
;     c8347
;     c835f
;     c8369
;     c83a5
;     c83b3
;     c83f2
;     c83f6
;     c83fb
;     c8416
;     c8422
;     c842c
;     c8468
;     c846c
;     c8471
;     c848b
;     c84d1
;     c84d8
;     c84f1
;     c8505
;     c850c
;     c8526
;     c8531
;     c8540
;     c8543
;     c854f
;     c8550
;     c856a
;     c8576
;     c8583
;     c8589
;     c859d
;     c85a8
;     c85b3
;     c85ee
;     c8625
;     c869b
;     c86b3
;     c86c4
;     c86f0
;     c870c
;     c870e
;     c8722
;     c872d
;     c873b
;     c8746
;     c876d
;     c8782
;     c8793
;     c87c2
;     c87de
;     c87e0
;     c87f4
;     c87ff
;     c880d
;     c8822
;     c8866
;     c8891
;     c889d
;     c88b2
;     c88b4
;     c88c8
;     c88d3
;     c88e1
;     c88ec
;     c8928
;     c8939
;     c897c
;     c899c
;     c89da
;     c89dd
;     c8a21
;     c8a55
;     c8a78
;     c8ab8
;     c8ad4
;     c8ad7
;     c8b1b
;     c8b2d
;     c8b30
;     c8b6e
;     c8b85
;     c8be4
;     c8c01
;     c8c34
;     c8c3d
;     c8c63
;     c8c64
;     c8c72
;     c8d31
;     c8dcb
;     c8ddf
;     c8dfa
;     c8e65
;     c8e91
;     c8e9f
;     c8ea3
;     c8eae
;     c8ec4
;     c8ee2
;     c8efd
;     c8f26
;     c8f29
;     c8f32
;     c8f3e
;     c8f4a
;     c8f5c
;     c8f74
;     c8f7f
;     c8f8a
;     c8fa3
;     c8fae
;     c8fe6
;     c8ff1
;     c9012
;     c9015
;     c9045
;     c9063
;     c90a3
;     c90a6
;     c90b0
;     c90bb
;     c90c6
;     c90db
;     c90f4
;     c9107
;     c910d
;     c9113
;     c913a
;     c9162
;     c9179
;     c91a4
;     c920d
;     c922c
;     c923c
;     c9247
;     c9256
;     c9269
;     c928e
;     c92a8
;     c92b3
;     c92be
;     c92d8
;     c92fa
;     c92ff
;     c9315
;     c931e
;     c9339
;     c9342
;     c9350
;     c939d
;     c93d5
;     c93e0
;     c9427
;     c9458
;     c946f
;     c94b6
;     c94c7
;     c94db
;     c94de
;     c9509
;     c9545
;     c9552
;     c95eb
;     c9616
;     ca84d
;     ca858
;     ca860
;     ca873
;     ca886
;     ca8af
;     ca8c5
;     ca8f0
;     ca920
;     cb1c0
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
;     l0015
;     l0016
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
;     l0039
;     l003a
;     l003b
;     l003c
;     l003d
;     l003e
;     l0047
;     l0048
;     l0049
;     l004a
;     l004e
;     l004f
;     l0050
;     l0051
;     l0052
;     l0053
;     l0054
;     l0055
;     l0056
;     l0057
;     l0059
;     l005a
;     l005b
;     l005c
;     l005d
;     l0100
;     l0104
;     l0106
;     l0300
;     l0355
;     l0700
;     l09f0
;     l0a00
;     l0b00
;     l0da6
;     l0da7
;     l0da8
;     l0da9
;     l0daa
;     l18cd
;     l18d6
;     l1911
;     l1912
;     l1913
;     l1914
;     l1915
;     l1916
;     l1917
;     l1918
;     l1919
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
;     l192f
;     l1933
;     l193e
;     l1941
;     l1943
;     l1956
;     l1957
;     l1958
;     l1959
;     l195a
;     l195b
;     l195c
;     l195d
;     l195e
;     l195f
;     l1960
;     l1963
;     l1964
;     l1965
;     l196a
;     l196b
;     l196c
;     l196f
;     l1970
;     l1971
;     l1972
;     l1973
;     l1974
;     l1975
;     l1976
;     l1977
;     l1978
;     l1979
;     l197a
;     l197b
;     l197d
;     l199d
;     l19ad
;     l2600
;     l2601
;     l34e8
;     l34f0
;     l3768
;     l3770
;     l3780
;     l3781
;     l7380
;     l7381
;     l8671
;     l8be5
;     la0ba
;     la0c2
;     la0c8
;     la0d8
;     la190
;     la3d1
;     loop_c8186
;     loop_c81c0
;     loop_c827d
;     loop_c82bd
;     loop_c82cf
;     loop_c82eb
;     loop_c82ff
;     loop_c8710
;     loop_c87e2
;     loop_c88b6
;     loop_c898c
;     loop_c898e
;     loop_c8990
;     loop_c899f
;     loop_c89c6
;     loop_c89ee
;     loop_c8a0a
;     loop_c8a69
;     loop_c8aac
;     loop_c8bd6
;     loop_c8c78
;     loop_c8c8d
;     loop_c8ca2
;     loop_c8cba
;     loop_c8ccf
;     loop_c8cf2
;     loop_c8cf4
;     loop_c8d12
;     loop_c8d14
;     loop_c8d8f
;     loop_c8de3
;     loop_c8e2d
;     loop_c8e47
;     loop_c8eb0
;     loop_c8f3b
;     loop_c9166
;     loop_c9206
;     loop_c93cc
;     loop_c943e
;     loop_c9525
;     loop_c957a
;     loop_c9586
;     loop_c959e
;     loop_c95b8
;     loop_c95c0
;     loop_c9602
;     loop_ca895
;     loop_ca8b9
;     loop_ca8d3
;     loop_cb176
;     loop_cb1c2
;     sub_c8336
;     sub_c8351
;     sub_c8373
;     sub_c848e
;     sub_c8496
;     sub_c85b6
;     sub_c85cf
;     sub_c85f1
;     sub_c8606
;     sub_c8843
;     sub_c8867
;     sub_c88a2
;     sub_c88f1
;     sub_c8912
;     sub_c8922
;     sub_c8934
;     sub_c897d
;     sub_c8b98
;     sub_c9190
;     sub_c91a5
;     sub_c91b1
;     sub_c91c1
;     sub_c9210
;     sub_c9219
;     sub_c93ca
;     sub_c9430
;     sub_c94e9
;     sub_c9500
;     sub_c9526
;     sub_c953a
;     sub_c954a
;     sub_cb155
    assert (255 - inkey_key_f0) EOR 128 == &a0
    assert (255 - inkey_key_f1) EOR 128 == &f1
    assert (255 - inkey_key_f2) EOR 128 == &f2
    assert <(l0024) == &24
    assert <(l0100) == &00
    assert <(l0a00) == &00
    assert <(l0b00) == &00
    assert <(l1921) == &21
    assert <(l192d) == &2d
    assert <our_osword_1_x_handler_table == &6c
    assert >(l0024) == &00
    assert >(l0100) == &01
    assert >(l0a00) == &0a
    assert >(l0b00) == &0b
    assert >(l1921) == &19
    assert >(l192d) == &19
    assert >our_osword_1_x_handler_table == &80
    assert copyright - rom_header == &24
    assert osbyte_read_adc_or_get_buffer_status == &80
    assert osbyte_scan_keyboard == &79
    assert osbyte_set_cursor_editing == &04
    assert osgbpb_read_file_names == &08
    assert osword_read_pixel == &09
    assert our_osword1 == &35
    assert our_osword2 == &36
    assert our_osword_1_x0_handler == &80a0
    assert our_osword_1_x10_handler == &84ae
    assert our_osword_1_x11_handler == &868b
    assert our_osword_1_x12_handler == &875d
    assert our_osword_1_x13_handler == &899d
    assert our_osword_1_x14_handler == &8c89
    assert our_osword_1_x15_handler == &8cb6
    assert our_osword_1_x16_handler == &8cf0
    assert our_osword_1_x17_handler == &8610
    assert our_osword_1_x18_handler == &8da6
    assert our_osword_1_x19_handler == &922d
    assert our_osword_1_x1_handler == &810f
    assert our_osword_1_x20_handler == &92d9
    assert our_osword_1_x21_handler == &944e
    assert our_osword_1_x22_handler == &9555
    assert our_osword_1_x23_handler == &8661
    assert our_osword_1_x24_handler == &9578
    assert our_osword_1_x25_handler == &9584
    assert our_osword_1_x2_handler == &817c
    assert our_osword_1_x3_handler == &81d8
    assert our_osword_1_x4_handler == &828f
    assert our_osword_1_x5_handler == &8296
    assert our_osword_1_x6_handler == &82cb
    assert our_osword_1_x7_handler == &82e7
    assert our_osword_1_x8_handler == &8392
    assert our_osword_1_x9_handler == &8264

save pydis_start, pydis_end
