set path=%path%;\sdcc\bin
sdcc -mz80 --code-loc 0x8048 --data-loc 0x7000 --no-std-crt0 ../crtcv.rel ../cvlib.lib ../getput.lib bios0.rel bios1.rel bonus.rel gameOver.rel ingame.rel level1.rel level2.rel level3.rel loose_life.rel main.rel musique.rel nextlevel.rel piece.rel porte.rel Title.rel
objcopy --input-target=ihex --output-target=binary crtcv.ihx result.rom
del *.ihx
del crtcv.lnk
pause
