from commands import *
import acorn

acorn.bbc()

config.set_label_references(False)

load(0x8000, "orig/stop-press-2.rom", "6502", "dd3ac37d910340515d0208b739d23836")
acorn.is_sideways_rom()

go()
