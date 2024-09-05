from commands import *
import acorn

acorn.bbc()

config.set_label_references(False)

load(0x8000, "orig/stop-press-1.rom", "6502", "4aa7313ff6faaa8fe26ae724960b0a65")
acorn.is_sideways_rom()

label(0xddb, "xkeyv")
expr_label(0xddc, "xkeyv + 1")
expr_label(0xddd, "xkeyv + 2")

entry(0x8053, "service_auto_boot_and_help")
entry(0x80ad, "service_handler_part_2")
entry(0x804c, "service_help")
entry(0x8094, "ply_plx_pla_rts")
entry(0x80b1, "service_command")

constant(3, "xbrkv_offset")
expr(0x8136, "xbrkv_offset")
entry(0xb995, "xbrkv_handler")
expr(0x8138, make_lo("xbrkv_handler"))
expr(0x813d, make_hi("xbrkv_handler"))

def pntsyx_hook(runtime_addr, state, subroutine):
    x_addr = state.get_previous_load_imm('x')
    y_addr = state.get_previous_load_imm('y')
    string_addr = acorn.xy_addr(x_addr, y_addr)
    if string_addr is not None and not disassembly.is_classified(string_addr):
        label(string_addr, "string_nul_%04x" % string_addr)
        stringz(string_addr)
subroutine(0xb7c5, "print_nul_terminated_string_at_yx", None, None, hook=pntsyx_hook, is_entry_point=True)
#expr(0x8055, make_lo("title"))
#expr(0x8057, make_hi("title"))

label(0xbe9f, "process_string")
comment(0x80c0, "Copy 10 pages from &8000 to &2600, which just fits in below mode 0 screen RAM at &3000.")

def wsnyx_hook(runtime_addr, state, subroutine):
    x_addr = state.get_previous_load_imm('x')
    y_addr = state.get_previous_load_imm('y')
    string_addr = acorn.xy_addr(x_addr, y_addr)
    if string_addr is not None:
        label(string_addr, "stringn%04x" % string_addr)
        stringn(string_addr)
subroutine(0xbe04, "write_stringn_at_yx", None, None, hook=wsnyx_hook, is_entry_point=True)

entry(0xb76b, "do_our_osword_1")
entry(0xa919, "do_our_osword_1_x_10")
entry(0xbdde, "do_our_osword_1_x_3")
entry(0xbde3, "do_our_osword_1_x_4")
entry(0xbde8, "do_our_osword_1_x_5")

entry(0xb926, "do_our_osword_2_yx_24_and_postprocess")

entry(0xa91f, "long_delay")

label(0xbea9, "data_copied_to_1900")
entry(0xb14d, "copy_data_to_1900_and_zero_l1911")

label(0xbeef, "command_copied_to_a00")
stringcr(0xbeef)

entry(0x84f6, "jmp_indirect_l191c")
label(0xbecc, "jump_table")
expr_label(0xbecd, "jump_table + 1")
expr_label(0xbece, "jump_table + 2")
for i in range(11):
    ptr = 0xbecc + i*3
    byte(ptr) # TODO: what is this?
    addr = get_u16_be_binary(ptr + 1)
    byte(ptr + 1, 2)
    name = entry(addr)
    expr(ptr + 1, make_hi(name))
    expr(ptr + 2, make_lo(name))

entry(0xb77e, "jump_using_a_via_table_yx")
label(0x94d3, "jump_table2")
expr(0x9516, make_lo("jump_table2"))
expr(0x9518, make_hi("jump_table2"))
for i in range(5):
    ptr = 0x94d3 + i*2
    addr = get_u16_binary(ptr)
    name = entry(addr)
    word(ptr)
    expr(ptr, name)
label(0x8b83, "jump_table3")
expr(0x8bae, make_lo("jump_table3"))
expr(0x8bb0, make_hi("jump_table3"))
for i in range(5):
    ptr = 0x8b83 + i*2
    addr = get_u16_binary(ptr)
    name = entry(addr)
    word(ptr)
    expr(ptr, name)

go()
