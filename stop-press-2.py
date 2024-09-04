from commands import *
import acorn

acorn.bbc()

# TODO: Move these into acorn.bbc()?
label(0xef, "osbyte_osword_a")
label(0xf0, "osbyte_osword_x")
label(0xf1, "osbyte_osword_y")

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

go()
