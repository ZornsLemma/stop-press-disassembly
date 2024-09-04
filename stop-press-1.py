from commands import *
import acorn

acorn.bbc()

config.set_label_references(False)

load(0x8000, "orig/stop-press-1.rom", "6502", "4aa7313ff6faaa8fe26ae724960b0a65")
acorn.is_sideways_rom()

entry(0x8053, "service_auto_boot_and_help")
entry(0x80ad, "service_handler_part_2")
entry(0x804c, "service_help")
entry(0x8094, "ply_plx_pla_rts")
entry(0x80b1, "service_command")

entry(0xb7c5, "print_nul_terminated_string_at_yx")
expr(0x8055, make_lo("title"))
expr(0x8057, make_hi("title"))

label(0xbe9f, "process_string")
comment(0x80c0, "Copy 10 pages from &8000 to &2600, which just fits in below mode 0 screen RAM at &3000.")

go()
