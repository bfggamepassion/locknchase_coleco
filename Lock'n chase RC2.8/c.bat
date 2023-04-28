set path=%path%;\sdcc\bin
sdcc -mz80 -c --std-c99 --opt-code-speed bios0.c
del bios0.lst
del bios0.sym
del bios0.asm
sdcc -mz80 -c --std-c99 --opt-code-speed bios1.c
del bios1.lst
del bios1.sym
del bios1.asm
sdcc -mz80 -c --std-c99 --opt-code-speed bonus.c
del bonus.lst
del bonus.sym
del bonus.asm
sdcc -mz80 -c --std-c99 --opt-code-speed gameOver.c
del gameOver.lst
del gameOver.sym
del gameOver.asm
sdcc -mz80 -c --std-c99 --opt-code-speed ingame.c
del ingame.lst
del ingame.sym
del ingame.asm
sdcc -mz80 -c --std-c99 --opt-code-speed level1.c
del level1.lst
del level1.sym
del level1.asm
sdcc -mz80 -c --std-c99 --opt-code-speed level2.c
del level2.lst
del level2.sym
del level2.asm
sdcc -mz80 -c --std-c99 --opt-code-speed level3.c
del level3.lst
del level3.sym
del level3.asm
sdcc -mz80 -c --std-c99 --opt-code-speed loose_life.c
del loose_life.lst
del loose_life.sym
del loose_life.asm
sdcc -mz80 -c --std-c99 --opt-code-speed main.c
sdasz80 -o musique.rel musique.s
sdcc -mz80 -c --std-c99 --opt-code-speed nextlevel.c
del nextlevel.lst
del nextlevel.sym
del nextlevel.asm
sdcc -mz80 -c --std-c99 --opt-code-speed piece.c
del piece.lst
del piece.sym
del piece.asm
sdcc -mz80 -c --std-c99 --opt-code-speed porte.c
del porte.lst
del porte.sym
del porte.asm
sdcc -mz80 -c --std-c99 --opt-code-speed Title.c
del Title.lst
del Title.sym
del Title.asm
pause
