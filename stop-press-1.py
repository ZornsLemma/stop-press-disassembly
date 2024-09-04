from commands import *
import acorn

acorn.bbc()

config.set_label_references(False)

load(0x8000, "orig/stop-press-1.rom", "6502", "4aa7313ff6faaa8fe26ae724960b0a65")
acorn.is_sideways_rom()

go()
