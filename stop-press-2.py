from commands import *
import acorn

acorn.bbc()

# TODO: Move these into acorn.bbc()?
label(0xef, "osbyte_osword_a")
label(0xf0, "osbyte_osword_x")
label(0xf1, "osbyte_osword_y")
label(0xddb, "xkeyv")
expr_label(0xddc, "xkeyv + 1")
expr_label(0xddd, "xkeyv + 2")

config.set_label_references(False)

load(0x8000, "orig/stop-press-2.rom", "6502", "dd3ac37d910340515d0208b739d23836")
acorn.is_sideways_rom()

constant(0x35, "our_osword1")
constant(0x36, "our_osword2")

entry(0xa800, "service_handler_subroutine")
entry(0xa8e7, "service_command")
entry(0xa809, "service_handler_subroutine_part_2")
entry(0xa810, "service_osword")
entry(0xa8e6, "service_handler_subroutine_rts")

entry(0x803f, "pla_rts1")
entry(0x8040, "rts1")
entry(0xa807, "pla_rts2")

expr(0xa814, "our_osword2")
entry(0xa817, "our_osword2_handler")

expr(0x804c, "our_osword1")

entry(0x8317, "jmp_a_minus_1_th_entry_in_table_at_yx")
label(0x806c, "our_osword_1_x_handler_table")
expr(0x8058, make_lo("our_osword_1_x_handler_table"))
expr(0x805a, make_hi("our_osword_1_x_handler_table"))
for x in range(26):
    ptr = 0x806c + 2*x
    addr = get_u16_binary(ptr)
    name = "our_osword_1_x%d_handler" % x
    # print("%s = &%4x" % (name, addr))
    entry(addr, name)
    word(ptr)
    expr(ptr, name)

comment(0xa943, "The 'p' prefix is checked separately.")
label(0xa943, "command_table")
expr_label(0xa944, "command_table + 1")
expr_label(0xa945, "command_table + 2")
entry(0xa8f9, "check_next_command")
entry(0xa929, "skip_to_next_command")
entry(0xa921, "command_done")
expr(0xa909, make_hi("command_done - 1"))
expr(0xa90c, make_lo("command_done - 1"))

ptr = 0xa943
while get_u8_binary(ptr) != 0:
    i = 0
    name = ""
    while get_u8_binary(ptr + i) != 0:
        name += chr(get_u8_binary(ptr + i))
        i += 1
    ptr = stringz(ptr)
    handler = get_u16_binary(ptr) + 1
    expr(ptr, make_subtract(entry(handler, "command_p" + name), 1))
    word(ptr)
    ptr += 2

label(0xa9ed, "define_palette_data")
string(0xa9ed, 0xc)

constant(0x3c, "xkeyv_offset")
expr(0xaaad, "xkeyv_offset")
entry(0xa9f9, "xkeyv_handler")
expr(0xaab8, make_lo("xkeyv_handler"))
expr(0xaabd, make_hi("xkeyv_handler"))

constant(0x30, "xevntv_offset")
expr(0xaafd, "xevntv_offset")
entry(0xb1d1, "xevntv_handler")
expr(0xab1e, make_lo("xevntv_handler"))
expr(0xab23, make_hi("xevntv_handler"))

entry(0xb143, "skip_at_least_one_space_at_os_text_ptr")

go()
