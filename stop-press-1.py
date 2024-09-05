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

go()
