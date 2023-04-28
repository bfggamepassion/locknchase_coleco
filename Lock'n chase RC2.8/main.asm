;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Oct 31 2010) (MINGW32)
; This file was generated Fri Apr 28 19:49:48 2023
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _nmi
	.globl _main
	.globl _comptePills
	.globl _eraseScreen
	.globl _playIntro
	.globl _resetSprites
	.globl _menu
	.globl _gameLoop
	.globl _initLevel
	.globl _openDoors
	.globl _createDoor
	.globl _renderDoors
	.globl _renderCop
	.globl _moveCop3
	.globl _moveCop2
	.globl _moveCop1
	.globl _moveCop0
	.globl _initCop
	.globl _reInitPlayer
	.globl _initPlayer
	.globl _renderSprite
	.globl _checkPlayerGameCollisions
	.globl _renderPlayerDeath
	.globl _animatePlayer
	.globl _movePlayer
	.globl _changePlayerDirection
	.globl _isCopDirectionFree
	.globl _isPlayerDirectionFree
	.globl _renderAutoDoor
	.globl _initAutoDoor
	.globl _peekGhostGameZone
	.globl _isCollision
	.globl _renderPlayerLevel
	.globl _renderPlayerNbLives
	.globl _renderPlayerHiScore
	.globl _renderPlayerScore
	.globl _renderBonus
	.globl _createBonus
	.globl _desactivateBonus
	.globl _initBonus
	.globl _addScore
	.globl _changeFontColor
	.globl _startsfx
	.globl _startsfxPrio
	.globl _startmusic
	.globl _stopmusic
	.globl _sound_nmi
	.globl _modulo
	.globl _nSfxDelay
	.globl _pSfxList
	.globl _nPlayDelay
	.globl _pPlayListForLoop
	.globl _pPlayList
	.globl _vola
	.globl _sfxEnCours
	.globl _loopMusic
	.globl _G_KILLTick
	.globl _G_ATATTickShoot
	.globl _G_ATATTick
	.globl _G_count
	.globl _G_LastTick
	.globl _G_TickCount
	.globl _nextLifeBonus
	.globl _activateNmi
	.globl _timerDirectionDemandee
	.globl _directionDemandee
	.globl _levelParamShowPlayerDoors
	.globl _levelParamNbLives
	.globl _levelParamCop3FreezeStart
	.globl _levelParamCop2FreezeStart
	.globl _levelParamCop1FreezeStart
	.globl _levelParamCop0FreezeStart
	.globl _levelParamShowAutoDoors
	.globl _levelParamBonusShowTime
	.globl _levelParamCopFreezeBonus
	.globl _levelParamScatterModeTime
	.globl _levelParamCop3Speed
	.globl _levelParamCop2Speed
	.globl _levelParamCop1Speed
	.globl _levelParamCop0Speed
	.globl _odd
	.globl _bsprites
	.globl _currentFlicker
	.globl _workflow
	.globl _currentAbsoluteLevel
	.globl _currentLevel
	.globl _bigTimer
	.globl _autoDoorCurrentMove
	.globl _autoDoorCurrentFrame
	.globl _autoDoorTimer
	.globl _scatterModeTimer
	.globl _animateSprite
	.globl _currentBonus
	.globl _extend
	.globl _bonus
	.globl _autoDoorCurrentGfx
	.globl _autoDoors
	.globl _playerDoors
	.globl _cop
	.globl _player
	.globl _hiscore
	.globl _snd_table
	.globl _frm
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_hiscore::
	.ds 2
_player::
	.ds 32
_cop::
	.ds 52
_playerDoors::
	.ds 26
_autoDoors::
	.ds 16
_autoDoorCurrentGfx::
	.ds 1
_bonus::
	.ds 9
_extend::
	.ds 1
_currentBonus::
	.ds 1
_animateSprite::
	.ds 1
_scatterModeTimer::
	.ds 2
_autoDoorTimer::
	.ds 2
_autoDoorCurrentFrame::
	.ds 2
_autoDoorCurrentMove::
	.ds 2
_bigTimer::
	.ds 2
_currentLevel::
	.ds 1
_currentAbsoluteLevel::
	.ds 1
_workflow::
	.ds 1
_currentFlicker::
	.ds 1
_bsprites::
	.ds 128
_odd::
	.ds 1
_levelParamCop0Speed::
	.ds 1
_levelParamCop1Speed::
	.ds 1
_levelParamCop2Speed::
	.ds 1
_levelParamCop3Speed::
	.ds 1
_levelParamScatterModeTime::
	.ds 2
_levelParamCopFreezeBonus::
	.ds 2
_levelParamBonusShowTime::
	.ds 2
_levelParamShowAutoDoors::
	.ds 1
_levelParamCop0FreezeStart::
	.ds 2
_levelParamCop1FreezeStart::
	.ds 2
_levelParamCop2FreezeStart::
	.ds 2
_levelParamCop3FreezeStart::
	.ds 2
_levelParamNbLives::
	.ds 2
_levelParamShowPlayerDoors::
	.ds 2
_directionDemandee::
	.ds 1
_timerDirectionDemandee::
	.ds 1
_activateNmi::
	.ds 1
_nextLifeBonus::
	.ds 2
_G_TickCount::
	.ds 2
_G_LastTick::
	.ds 2
_G_count::
	.ds 2
_G_ATATTick::
	.ds 2
_G_ATATTickShoot::
	.ds 2
_G_KILLTick::
	.ds 2
_loopMusic::
	.ds 1
_sfxEnCours::
	.ds 1
_vola::
	.ds 1
_pPlayList::
	.ds 2
_pPlayListForLoop::
	.ds 2
_nPlayDelay::
	.ds 1
_pSfxList::
	.ds 2
_nSfxDelay::
	.ds 1
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;main.c:295: unsigned int G_TickCount = 0;
	ld	iy,#_G_TickCount
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:296: unsigned int G_LastTick = 0;
	ld	iy,#_G_LastTick
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:297: unsigned int G_count = 0;
	ld	iy,#_G_count
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:298: unsigned int G_ATATTick = 0;
	ld	iy,#_G_ATATTick
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:299: unsigned int G_ATATTickShoot = 0;
	ld	iy,#_G_ATATTickShoot
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:300: unsigned int G_KILLTick = 0;
	ld	iy,#_G_KILLTick
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:303: volatile char vola=0;
	ld	iy,#_vola
	ld	0 (iy),#0x00
;main.c:304: volatile unsigned char *pPlayList=NULL;		// audio playlist
	ld	iy,#_pPlayList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:305: volatile unsigned char *pPlayListForLoop=NULL;		// audio playlist
	ld	iy,#_pPlayListForLoop
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:306: unsigned char nPlayDelay=1;
	ld	iy,#_nPlayDelay
	ld	0 (iy),#0x01
;main.c:307: volatile unsigned char *pSfxList=NULL;		// sfx audio playlist
	ld	iy,#_pSfxList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:308: unsigned char nSfxDelay=1;
	ld	iy,#_nSfxDelay
	ld	0 (iy),#0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:311: int modulo(int a,int b)
;	---------------------------------
; Function modulo
; ---------------------------------
_modulo_start::
_modulo:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:313: return a%b;
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	ix
	ret
_modulo_end::
_BONUS:
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x38	; 56
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x38	; 56
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x38	; 56
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x3C	; 60
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x3C	; 60
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x3C	; 60
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x40	; 64
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x40	; 64
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x40	; 64
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x44	; 68	D
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x44	; 68	D
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x44	; 68	D
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x48	; 72	H
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x48	; 72	H
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x48	; 72	H
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x4C	; 76	L
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x4C	; 76	L
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x4C	; 76	L
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x50	; 80	P
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x50	; 80	P
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x50	; 80	P
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x54	; 84	T
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x54	; 84	T
	.db #0x30	; 48
	.db #0x34	; 52
	.db #0x34	; 52
_horizontalSpace:
	.db #0x00	; 0
	.db #0x00	; 0
_gfxAutoDoor:
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x81	; 129
	.db #0x89	; 137
	.db #0x82	; 130
	.db #0x8A	; 138
	.db #0x83	; 131
	.db #0x8B	; 139
	.db #0x84	; 132
	.db #0x8C	; 140
	.db #0x85	; 133
	.db #0x8D	; 141
	.db #0x86	; 134
	.db #0x8E	; 142
	.db #0x87	; 135
	.db #0x8F	; 143
	.db #0x87	; 135
	.db #0x8F	; 143
	.db #0x87	; 135
	.db #0x8F	; 143
	.db #0x86	; 134
	.db #0x8E	; 142
	.db #0x85	; 133
	.db #0x8D	; 141
	.db #0x84	; 132
	.db #0x8C	; 140
	.db #0x83	; 131
	.db #0x8B	; 139
	.db #0x82	; 130
	.db #0x8A	; 138
	.db #0x81	; 129
	.db #0x89	; 137
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
_grp1:
	.ascii "GET READY PLAYER 1"
	.db 0x00
_frm:
	.db #0xE0	; 224
	.db #0xE7	; 231
	.db #0xEB	; 235
	.db #0xEF	; 239
	.db #0xE1	; 225
	.db #0xE8	; 232
	.db #0xEC	; 236
	.db #0xF0	; 240
	.db #0xE2	; 226
	.db #0xE9	; 233
	.db #0xED	; 237
	.db #0xF1	; 241
	.db #0xE3	; 227
	.db #0xEA	; 234
	.db #0xEE	; 238
	.db #0xF2	; 242
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
_snd_table:
	.db #0x00	; 0
;main.c:316: void sound_nmi(void)
;	---------------------------------
; Function sound_nmi
; ---------------------------------
_sound_nmi_start::
_sound_nmi:
;main.c:335: if (NULL != pPlayList) {
	ld	bc,(_pPlayList)
	ld	a,c
	or	a,b
	jp	Z,00118$
;main.c:336: nPlayDelay++;
	ld	iy,#_nPlayDelay
	inc	0 (iy)
;main.c:337: if (nPlayDelay == *(pPlayList))
	ld	hl,(_pPlayList)
	ld	a,0 (iy)
	sub	a,(hl)
	jp	NZ,00118$
;main.c:339: while (nPlayDelay==*(pPlayList))
00112$:
	ld	hl,(_pPlayList)
	ld	c,(hl)
	ld	a,(#_nPlayDelay + 0)
	sub	a,c
	jp	NZ,00118$
;main.c:341: nDat=*(++pPlayList);
	ld	iy,#_pPlayList
	inc	0 (iy)
	jr	NZ,00156$
	inc	1 (iy)
00156$:
	ld	hl,(_pPlayList)
	ld	c, (hl)
;main.c:342: if (0 == nDat) {
	ld	a,c
	or	a,a
	jr	NZ,00105$
;main.c:344: if (loopMusic==LOOP_OFF) pPlayList=NULL;
	xor	a,a
	ld	iy,#_loopMusic
	or	a,0 (iy)
	jr	NZ,00102$
	ld	iy,#_pPlayList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
	jp	00118$
00102$:
;main.c:345: else {pPlayList=pPlayListForLoop;nPlayDelay=(*pPlayListForLoop)-1;}
	ld	a,(#_pPlayListForLoop + 0)
	ld	iy,#_pPlayList
	ld	0 (iy),a
	ld	a,(#_pPlayListForLoop + 1)
	ld	iy,#_pPlayList
	ld	1 (iy),a
	ld	hl,(_pPlayListForLoop)
	ld	a, (hl)
	ld	hl, #_nPlayDelay
	dec	a
	ld	(hl),a
;main.c:346: break;
	jr	00118$
00105$:
;main.c:348: switch (nDat&0x90) {
	ld	a,c
	and	a,#0x90
	ld	l,a
	sub	a,#0x80
	jr	Z,00106$
	ld	a,l
	sub	a,#0x90
	jr	Z,00109$
	jr	00110$
;main.c:349: case 0x80:		// load sample
00106$:
;main.c:352: direct_sound(nDat);
	push	bc
	ld	a,c
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
	pop	bc
;main.c:353: if ((nDat&0xe0) != 0xe0) direct_sound(*(++pPlayList));
	ld	a,c
	and	a,#0xE0
	ld	l,a
	sub	a,#0xE0
	jr	Z,00111$
	ld	iy,#_pPlayList
	inc	0 (iy)
	jr	NZ,00162$
	inc	1 (iy)
00162$:
	ld	hl,(_pPlayList)
	ld	a, (hl)
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:354: break;
	jr	00111$
;main.c:355: case 0x90:		// load volume
00109$:
;main.c:357: direct_sound(nDat);
	ld	a,c
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:358: break;
	jr	00111$
;main.c:359: default:		// don't know what this is, should abort
00110$:
;main.c:360: pPlayList=NULL;
	ld	iy,#_pPlayList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:362: }
00111$:
;main.c:364: pPlayList++;
	ld	iy,#_pPlayList
	inc	0 (iy)
	jp	NZ,00112$
	inc	1 (iy)
	jp	00112$
00118$:
;main.c:369: if (NULL != pSfxList)
	ld	de,(_pSfxList)
	ld	a,e
	or	a,d
	ret	Z
;main.c:371: nSfxDelay++;
	ld	iy,#_nSfxDelay
	inc	0 (iy)
;main.c:372: if (nSfxDelay == *(pSfxList))
	ld	hl,(_pSfxList)
	ld	a,0 (iy)
	sub	a,(hl)
	jr	Z,00166$
	ret
00166$:
;main.c:374: while (nSfxDelay==*(pSfxList))
00127$:
	ld	hl,(_pSfxList)
	ld	b,(hl)
	ld	a,(#_nSfxDelay + 0)
	sub	a,b
	jr	Z,00168$
	ret
00168$:
;main.c:376: nDat=*(++pSfxList);
	ld	iy,#_pSfxList
	inc	0 (iy)
	jr	NZ,00169$
	inc	1 (iy)
00169$:
	ld	hl,(_pSfxList)
	ld	c, (hl)
;main.c:377: if (0 == nDat) {
	ld	a,c
	or	a,a
	jr	NZ,00120$
;main.c:378: pSfxList=NULL;
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:379: sfxEnCours = NON;
	ld	hl,#_sfxEnCours + 0
	ld	(hl), #0x00
;main.c:380: break;
	ret
00120$:
;main.c:382: switch (nDat&0x90) {
	ld	a,c
	and	a,#0x90
	ld	l,a
	sub	a,#0x80
	jr	Z,00121$
	ld	a,l
	sub	a,#0x90
	jr	Z,00124$
	jr	00125$
;main.c:383: case 0x80:		// load sample
00121$:
;main.c:386: direct_sound(nDat);
	push	bc
	ld	a,c
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
	pop	bc
;main.c:387: if ((nDat&0xe0) != 0xe0) direct_sound(*(++pSfxList));
	ld	a,c
	and	a,#0xE0
	sub	a,#0xE0
	jr	Z,00126$
	ld	iy,#_pSfxList
	inc	0 (iy)
	jr	NZ,00175$
	inc	1 (iy)
00175$:
	ld	hl,(_pSfxList)
	ld	a, (hl)
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:388: break;
	jr	00126$
;main.c:389: case 0x90:		// load volume
00124$:
;main.c:390: direct_sound(nDat);
	ld	a,c
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:391: break;
	jr	00126$
;main.c:392: default:		// don't know what this is, should abort
00125$:
;main.c:393: pSfxList=NULL;
	ld	iy,#_pSfxList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:394: sfxEnCours=NON;
	ld	hl,#_sfxEnCours + 0
	ld	(hl), #0x00
;main.c:396: }
00126$:
;main.c:398: /*if (pSfxList!=NULL)*/ pSfxList++;
	ld	iy,#_pSfxList
	inc	0 (iy)
	jp	NZ,00127$
	inc	1 (iy)
	jp	00127$
_sound_nmi_end::
;main.c:406: void stopmusic() {
;	---------------------------------
; Function stopmusic
; ---------------------------------
_stopmusic_start::
_stopmusic:
;main.c:407: pPlayList=NULL;
	ld	iy,#_pPlayList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:408: pPlayListForLoop=NULL;
	ld	iy,#_pPlayListForLoop
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:409: pSfxList=NULL;
	ld	iy,#_pSfxList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:410: direct_sound(0x9F);
	ld	a,#0x9F
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:411: direct_sound(0xAF);
	ld	a,#0xAF
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:412: direct_sound(0xDF);
	ld	a,#0xDF
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
;main.c:413: direct_sound(0xFF);
	ld	a,#0xFF
	push	af
	inc	sp
	call	_direct_sound
	inc	sp
	ret
_stopmusic_end::
;main.c:416: void startmusic(unsigned char *pDat,byte loop) {
;	---------------------------------
; Function startmusic
; ---------------------------------
_startmusic_start::
_startmusic:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:418: loopMusic = loop;
	ld	a,6 (ix)
	ld	iy,#_loopMusic
	ld	0 (iy),a
;main.c:419: if (NULL != pPlayList) {
	ld	bc,(_pPlayList)
	ld	a,c
	or	a,b
	jr	Z,00102$
;main.c:420: stopmusic();
	call	_stopmusic
00102$:
;main.c:423: nPlayDelay=(*pDat)-1;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	hl, #_nPlayDelay
	dec	a
	ld	(hl),a
;main.c:424: pPlayList=pDat;
	ld	iy,#_pPlayList
	ld	0 (iy),c
	ld	1 (iy),b
;main.c:425: pPlayListForLoop=pDat;
	ld	iy,#_pPlayListForLoop
	ld	0 (iy),c
	ld	1 (iy),b
	pop	ix
	ret
_startmusic_end::
;main.c:429: void startsfxPrio(unsigned char *pDat) {
;	---------------------------------
; Function startsfxPrio
; ---------------------------------
_startsfxPrio_start::
_startsfxPrio:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:431: if (NULL != pSfxList) {
	ld	bc,(_pSfxList)
	ld	a,c
	or	a,b
	jr	Z,00102$
;main.c:432: pSfxList=NULL;
	ld	iy,#_pSfxList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
00102$:
;main.c:435: nSfxDelay=(*pDat)-1;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	hl, #_nSfxDelay
	dec	a
	ld	(hl),a
;main.c:436: pSfxList=pDat;
	ld	iy,#_pSfxList
	ld	0 (iy),c
	ld	1 (iy),b
;main.c:437: sfxEnCours = OUI;
	ld	hl,#_sfxEnCours + 0
	ld	(hl), #0x01
	pop	ix
	ret
_startsfxPrio_end::
;main.c:440: void startsfx(unsigned char *pDat) {
;	---------------------------------
; Function startsfx
; ---------------------------------
_startsfx_start::
_startsfx:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:442: if (NULL != pSfxList) {
	ld	bc,(_pSfxList)
	ld	a,c
	or	a,b
	jr	Z,00102$
;main.c:443: pSfxList=NULL;
	ld	iy,#_pSfxList
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
00102$:
;main.c:446: nSfxDelay=(*pDat)-1;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	hl, #_nSfxDelay
	dec	a
	ld	(hl),a
;main.c:447: pSfxList=pDat;
	ld	iy,#_pSfxList
	ld	0 (iy),c
	ld	1 (iy),b
	pop	ix
	ret
_startsfx_end::
;main.c:453: void changeFontColor(byte col1,byte col2)
;	---------------------------------
; Function changeFontColor
; ---------------------------------
_changeFontColor_start::
_changeFontColor:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:457: finalColor = col1 << 4;
	ld	a,4 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
;main.c:458: finalColor+= col2;
	add	a,5 (ix)
	ld	c,a
;main.c:460: fill_vram(coltab+(32*8),finalColor,59*8);
	push	bc
	ld	hl,#0x01D8
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#0x2100
	push	hl
	call	_fill_vram
	pop	af
	pop	af
	inc	sp
	pop	bc
;main.c:461: fill_vram(coltab+(32*8)+2048,finalColor,59*8);
	push	bc
	ld	hl,#0x01D8
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#0x2900
	push	hl
	call	_fill_vram
	pop	af
	pop	af
	inc	sp
	pop	bc
;main.c:462: fill_vram(coltab+(32*8)+4096,finalColor,59*8);
	ld	hl,#0x01D8
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#0x3100
	push	hl
	call	_fill_vram
	pop	af
	pop	af
	inc	sp
	pop	ix
	ret
_changeFontColor_end::
;main.c:465: void addScore(byte s)
;	---------------------------------
; Function addScore
; ---------------------------------
_addScore_start::
_addScore:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:467: if (player.score<=65000) player.score+=s;
	ld	hl,#0x0017 + _player
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	c,l
	ld	b,h
	ld	de,#0x0000
	ld	a,#0xE8
	sub	a,c
	ld	a,#0xFD
	sbc	a,b
	ld	a,#0x00
	sbc	a,e
	ld	a,#0x00
	sbc	a,d
	jp	PO,00106$
	xor	a,#0x80
00106$:
	jp	M,00103$
	ld	c,4 (ix)
	ld	b,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0017 + _player
	ld	(hl),c
	inc	hl
	ld	(hl),b
00103$:
	pop	ix
	ret
_addScore_end::
;main.c:470: void initBonus()
;	---------------------------------
; Function initBonus
; ---------------------------------
_initBonus_start::
_initBonus:
;main.c:472: sprites[SPRITE6].y = 204;
	ld	hl,#0x000c + _sprites
	ld	(hl),#0xCC
;main.c:473: bonus.py=204;
	ld	hl,#0x0005 + _bonus
	ld	(hl),#0xCC
;main.c:474: bonus.actif = NOK;
	ld	hl,#_bonus
	ld	(hl),#0x01
;main.c:475: bonus.affiche = NOK;
	ld	hl,#0x0001 + _bonus
	ld	(hl),#0x01
;main.c:476: currentBonus = 0;
	ld	hl,#_currentBonus + 0
	ld	(hl), #0x00
	ret
_initBonus_end::
;main.c:479: void desactivateBonus()
;	---------------------------------
; Function desactivateBonus
; ---------------------------------
_desactivateBonus_start::
_desactivateBonus:
;main.c:481: bonus.py = 204;
	ld	hl,#0x0005 + _bonus
	ld	(hl),#0xCC
;main.c:482: sprites[SPRITE6].y = 204;
	ld	hl,#0x000c + _sprites
	ld	(hl),#0xCC
;main.c:484: bonus.actif = NOK;
	ld	hl,#_bonus
	ld	(hl),#0x01
;main.c:485: bonus.affiche = NOK;
	ld	hl,#0x0001 + _bonus
	ld	(hl),#0x01
	ret
_desactivateBonus_end::
;main.c:488: void createBonus()
;	---------------------------------
; Function createBonus
; ---------------------------------
_createBonus_start::
_createBonus:
;main.c:490: if (bonus.actif==NOK)
	ld	a,(#_bonus)
	sub	a,#0x01
	jr	Z,00154$
	ret
00154$:
;main.c:492: bonus.actif = OK;
	ld	hl,#_bonus
	ld	(hl),#0x00
;main.c:493: bonus.pattern = BONUS[currentBonus];
	ld	hl,#_currentBonus
	ld	a,#<(_BONUS)
	add	a,(hl)
	ld	c,a
	ld	a,#>(_BONUS)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	(#0x0006 + _bonus),a
;main.c:494: currentBonus++;
	ld	iy,#_currentBonus
	inc	0 (iy)
;main.c:495: if (currentBonus==72) currentBonus = 69;
	ld	a,0 (iy)
	sub	a,#0x48
	jr	NZ,00102$
	ld	0 (iy),#0x45
00102$:
;main.c:497: if (bonus.pattern==BONUS1) bonus.colour = 10;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x30
	jr	NZ,00130$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0A
	jp	00131$
00130$:
;main.c:498: else if (bonus.pattern==BONUS2) bonus.colour = 4;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x34
	jr	NZ,00127$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x04
	jp	00131$
00127$:
;main.c:499: else if (bonus.pattern==BONUS3) bonus.colour = 10;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x38
	jr	NZ,00124$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0A
	jr	00131$
00124$:
;main.c:500: else if (bonus.pattern==BONUS4) bonus.colour = 13;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x3C
	jr	NZ,00121$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0D
	jr	00131$
00121$:
;main.c:501: else if (bonus.pattern==BONUS5) bonus.colour = 12;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x40
	jr	NZ,00118$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0C
	jr	00131$
00118$:
;main.c:502: else if (bonus.pattern==BONUS6) bonus.colour = 10;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x44
	jr	NZ,00115$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0A
	jr	00131$
00115$:
;main.c:503: else if (bonus.pattern==BONUS7) bonus.colour = 7;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x48
	jr	NZ,00112$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x07
	jr	00131$
00112$:
;main.c:504: else if (bonus.pattern==BONUS8) bonus.colour = 15;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x4C
	jr	NZ,00109$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0F
	jr	00131$
00109$:
;main.c:505: else if (bonus.pattern==BONUS9) bonus.colour = 14;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x50
	jr	NZ,00106$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x0E
	jr	00131$
00106$:
;main.c:506: else if (bonus.pattern==BONUS10) bonus.colour = 6;
	ld	a,(#0x0006 + _bonus)
	sub	a,#0x54
	jr	NZ,00131$
	ld	hl,#0x0007 + _bonus
	ld	(hl),#0x06
00131$:
;main.c:508: bonus.px = 120;bonus.py = 72;
	ld	hl,#0x0004 + _bonus
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x48
;main.c:509: if ( (player.py>=72) && (player.py<=88) ) { bonus.px = 120;bonus.py = 104; }
	ld	hl,#0x0001 + _player
	ld	l,(hl)
	ld	a,l
	sub	a,#0x48
	jr	C,00133$
	ld	a,#0x58
	sub	a,l
	jr	C,00133$
	ld	hl,#0x0004 + _bonus
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x68
00133$:
;main.c:510: player.nbMoveForBonus = levelParamBonusShowTime;
	ld	hl,#0x001a + _player
	ld	iy,#_levelParamBonusShowTime
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
	ret
_createBonus_end::
;main.c:514: void renderBonus()
;	---------------------------------
; Function renderBonus
; ---------------------------------
_renderBonus_start::
_renderBonus:
;main.c:516: if (bonus.actif == OK)
	ld	a,(#_bonus)
	or	a,a
	ret	NZ
;main.c:518: if (player.nbMoveForBonus==0) {desactivateBonus();} else {player.nbMoveForBonus --;}
	ld	hl,#0x001a + _player
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,c
	or	a,b
	jr	NZ,00102$
	call	_desactivateBonus
	jr	00103$
00102$:
	dec	bc
	ld	hl,#0x001a + _player
	ld	(hl),c
	inc	hl
	ld	(hl),b
00103$:
;main.c:521: if (bonus.affiche = NOK)
	ld	hl,#0x0001 + _bonus
	ld	(hl),#0x01
;main.c:523: sprites[SPRITE6].pattern = bonus.pattern;
	ld	a,(#0x0006 + _bonus)
	ld	(#0x000e + _sprites),a
;main.c:524: sprites[SPRITE6].colour = bonus.colour;
	ld	a,(#0x0007 + _bonus)
	ld	(#0x000f + _sprites),a
;main.c:525: sprites[SPRITE6].x = bonus.px;
	ld	a,(#0x0004 + _bonus)
	ld	(#0x000d + _sprites),a
;main.c:526: sprites[SPRITE6].y = bonus.py;
	ld	a,(#0x0005 + _bonus)
	ld	(#0x000c + _sprites),a
;main.c:528: bonus.affiche = OK;			
	ld	hl,#0x0001 + _bonus
	ld	(hl),#0x00
	ret
_renderBonus_end::
;main.c:534: void renderPlayerScore(void)
;	---------------------------------
; Function renderPlayerScore
; ---------------------------------
_renderPlayerScore_start::
_renderPlayerScore:
;main.c:537: pointage = str(player.score);
	ld	hl,#0x0017 + _player
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_str
	pop	af
	ld	c,l
	ld	b,h
;main.c:539: put_char(2,3,pointage[0]);
	ld	a,(bc)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x0302
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:540: put_char(2,4,pointage[1]);
	ld	e,c
	ld	d,b
	inc	de
	ld	a,(de)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x0402
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:541: put_char(2,5,pointage[2]);
	ld	e,c
	ld	d,b
	inc	de
	inc	de
	ld	a,(de)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x0502
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:542: put_char(2,6,pointage[3]);
	ld	hl,#0x0003
	add	hl,bc
	ld	l, (hl)
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x0602
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:543: put_char(2,7,pointage[4]);
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	push	af
	inc	sp
	ld	hl,#0x0702
	push	hl
	call	_put_char
	pop	af
	inc	sp
	ret
_renderPlayerScore_end::
;main.c:547: void renderPlayerHiScore(void)
;	---------------------------------
; Function renderPlayerHiScore
; ---------------------------------
_renderPlayerHiScore_start::
_renderPlayerHiScore:
;main.c:550: pointage = str(hiscore);
	ld	hl,(_hiscore)
	push	hl
	call	_str
	pop	af
	ld	c,l
	ld	b,h
;main.c:552: put_char(30,3,pointage[0]);
	ld	a,(bc)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x031E
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:553: put_char(30,4,pointage[1]);
	ld	e,c
	ld	d,b
	inc	de
	ld	a,(de)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x041E
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:554: put_char(30,5,pointage[2]);
	ld	e,c
	ld	d,b
	inc	de
	inc	de
	ld	a,(de)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x051E
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:555: put_char(30,6,pointage[3]);
	ld	hl,#0x0003
	add	hl,bc
	ld	l, (hl)
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x061E
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:556: put_char(30,7,pointage[4]);
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	push	af
	inc	sp
	ld	hl,#0x071E
	push	hl
	call	_put_char
	pop	af
	inc	sp
	ret
_renderPlayerHiScore_end::
;main.c:560: void renderPlayerNbLives(void)
;	---------------------------------
; Function renderPlayerNbLives
; ---------------------------------
_renderPlayerNbLives_start::
_renderPlayerNbLives:
;main.c:563: pointage = str(player.nbLives);
	ld	hl,#0x001d + _player
	ld	l,(hl)
	ld	a,l
	rla	
	sbc	a,a
	ld	h,a
	push	hl
	call	_str
	pop	af
;main.c:565: put_char(3,19,pointage[4]);
	ld	bc, #0x0004
	add	hl,bc
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#0x1303
	push	hl
	call	_put_char
	pop	af
	inc	sp
	ret
_renderPlayerNbLives_end::
;main.c:569: void renderPlayerLevel(void)
;	---------------------------------
; Function renderPlayerLevel
; ---------------------------------
_renderPlayerLevel_start::
_renderPlayerLevel:
;main.c:572: pointage = str(currentLevel);
	ld	hl,#_currentLevel + 0
	ld	c,(hl)
	ld	b,#0x00
	push	bc
	call	_str
	pop	af
	ld	c,l
	ld	b,h
;main.c:574: put_char(29,20,pointage[2]);
	ld	e,c
	ld	d,b
	inc	de
	inc	de
	ld	a,(de)
	ld	l,a
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x141D
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:575: put_char(29,21,pointage[3]);	
	ld	hl,#0x0003
	add	hl,bc
	ld	l, (hl)
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	hl,#0x151D
	push	hl
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:576: put_char(29,22,pointage[4]);
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	push	af
	inc	sp
	ld	hl,#0x161D
	push	hl
	call	_put_char
	pop	af
	inc	sp
	ret
_renderPlayerLevel_end::
;main.c:581: byte isCollision(byte x1,byte y1,byte h1,byte l1,byte x2,byte y2,byte h2,byte l2)
;	---------------------------------
; Function isCollision
; ---------------------------------
_isCollision_start::
_isCollision:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:583: if(x1 > x2+l2) return NOK;
	ld	c,8 (ix)
	ld	b,#0x00
	ld	l,11 (ix)
	ld	h,#0x00
	add	hl,bc
	ex	de,hl
	ld	l,4 (ix)
	ld	h,#0x00
	ld	a,e
	sub	a,l
	ld	a,d
	sbc	a,h
	jp	PO,00115$
	xor	a,#0x80
00115$:
	jp	P,00102$
	ld	l,#0x01
	jr	00109$
00102$:
;main.c:584: if(x1+l1 < x2) return NOK;
	ld	e,7 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a, l
	ld	d, h
	sub	a,c
	ld	a,d
	sbc	a,b
	jp	PO,00116$
	xor	a,#0x80
00116$:
	jp	P,00104$
	ld	l,#0x01
	jr	00109$
00104$:
;main.c:585: if(y1 > y2+h2) return NOK;
	ld	c,9 (ix)
	ld	b,#0x00
	ld	l,10 (ix)
	ld	h,#0x00
	add	hl,bc
	ex	de,hl
	ld	l,5 (ix)
	ld	h,#0x00
	ld	a,e
	sub	a,l
	ld	a,d
	sbc	a,h
	jp	PO,00117$
	xor	a,#0x80
00117$:
	jp	P,00106$
	ld	l,#0x01
	jr	00109$
00106$:
;main.c:586: if(y1+h1 < y2) return NOK;
	ld	e,6 (ix)
	ld	d,#0x00
	add	hl,de
	ld	a, l
	ld	d, h
	sub	a,c
	ld	a,d
	sbc	a,b
	jp	PO,00118$
	xor	a,#0x80
00118$:
	jp	P,00108$
	ld	l,#0x01
	jr	00109$
00108$:
;main.c:588: return OK;
	ld	l,#0x00
00109$:
	pop	ix
	ret
_isCollision_end::
;main.c:591: byte peekGhostGameZone(byte x,byte y)
;	---------------------------------
; Function peekGhostGameZone
; ---------------------------------
_peekGhostGameZone_start::
_peekGhostGameZone:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:593: if (extend==0)
	xor	a,a
	ld	hl,#_extend + 0
	or	a,(hl)
	jr	NZ,00108$
;main.c:595: return GHOSTGAMEZONE[x+(y<<5)];
	ld	l,4 (ix)
	ld	h,#0x00
	ld	c,5 (ix)
	ld	b,#0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	add	hl,bc
	ld	bc,#_GHOSTGAMEZONE
	add	hl,bc
	ld	l, (hl)
	jp	00110$
00108$:
;main.c:599: if (currentAbsoluteLevel==3) 
	ld	a,(#_currentAbsoluteLevel + 0)
	sub	a,#0x03
	jr	NZ,00105$
;main.c:601: return GHOSTGAMEZONE_LEVEL3[x+(y<<5)];
	ld	l,4 (ix)
	ld	h,#0x00
	ld	c,5 (ix)
	ld	b,#0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	add	hl,bc
	ld	bc,#_GHOSTGAMEZONE_LEVEL3
	add	hl,bc
	ld	l, (hl)
	jr	00110$
00105$:
;main.c:604: if (currentAbsoluteLevel==2) 
	ld	a,(#_currentAbsoluteLevel + 0)
	sub	a,#0x02
	jr	NZ,00102$
;main.c:606: return GHOSTGAMEZONE_LEVEL2[x+(y<<5)];
	ld	l,4 (ix)
	ld	h,#0x00
	ld	c,5 (ix)
	ld	b,#0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	add	hl,bc
	ld	bc,#_GHOSTGAMEZONE_LEVEL2
	add	hl,bc
	ld	l, (hl)
	jr	00110$
00102$:
;main.c:609: return GHOSTGAMEZONE[x+(y<<5)];
	ld	l,4 (ix)
	ld	h,#0x00
	ld	c,5 (ix)
	ld	b,#0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	add	hl,bc
	ld	bc,#_GHOSTGAMEZONE
	add	hl,bc
	ld	l, (hl)
00110$:
	pop	ix
	ret
_peekGhostGameZone_end::
;main.c:614: void initAutoDoor(void)
;	---------------------------------
; Function initAutoDoor
; ---------------------------------
_initAutoDoor_start::
_initAutoDoor:
;main.c:617: s_autoDoors *d0 = &autoDoors[0];
;main.c:618: s_autoDoors *d1 = &autoDoors[1];
;main.c:619: s_autoDoors *d2 = &autoDoors[2];
;main.c:620: s_autoDoors *d3 = &autoDoors[3];
;main.c:622: byte *d0_cx = &d0->cx;
;main.c:623: byte *d0_cy = &d0->cy;
;main.c:624: byte *d0_px = &d0->px;
;main.c:625: byte *d0_py = &d0->py;
;main.c:627: byte *d1_cx = &d1->cx;
;main.c:628: byte *d1_cy = &d1->cy;
;main.c:629: byte *d1_px = &d1->px;
;main.c:630: byte *d1_py = &d1->py;
;main.c:632: byte *d2_cx = &d2->cx;
;main.c:633: byte *d2_cy = &d2->cy;
;main.c:634: byte *d2_px = &d2->px;
;main.c:635: byte *d2_py = &d2->py;
;main.c:637: byte *d3_cx = &d3->cx;
;main.c:638: byte *d3_cy = &d3->cy;
;main.c:639: byte *d3_px = &d3->px;
;main.c:640: byte *d3_py = &d3->py;
;main.c:642: h = rnd_byte(0,2);
	ld	hl,#0x0200
	push	hl
	call	_rnd_byte
	pop	af
	ld	c,l
;main.c:643: autoDoorTimer=0;
	ld	iy,#_autoDoorTimer
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:644: autoDoorCurrentMove=0;
	ld	iy,#_autoDoorCurrentMove
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:645: autoDoorCurrentGfx=0;
	ld	hl,#_autoDoorCurrentGfx + 0
	ld	(hl), #0x00
;main.c:647: if (h==0)
	xor	a,a
	or	a,c
	jr	NZ,00105$
;main.c:649: (*d0_cx) = 9;						// Démarrage de la porte
	ld	hl,#_autoDoors
	ld	(hl),#0x09
;main.c:650: (*d0_cy) = 8;
	ld	hl,#0x0001 + _autoDoors
	ld	(hl),#0x08
;main.c:651: (*d0_px) = 72;						// Démarrage de la porte
	inc	hl
	ld	(hl),#0x48
;main.c:652: (*d0_py) = 64;
	inc	hl
	ld	(hl),#0x40
;main.c:654: (*d1_cx) = 13;
	inc	hl
	ld	(hl),#0x0D
;main.c:655: (*d1_cy) = 12;
	ld	hl,#0x0001 + 0x0004 + _autoDoors
	ld	(hl),#0x0C
;main.c:656: (*d1_px) = 104;
	inc	hl
	ld	(hl),#0x68
;main.c:657: (*d1_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:660: (*d2_cx) = 17;
	ld	hl,#0x0008 + _autoDoors
	ld	(hl),#0x11
;main.c:661: (*d2_cy) = 12;
	ld	hl,#0x0001 + 0x0008 + _autoDoors
	ld	(hl),#0x0C
;main.c:662: (*d2_px) = 136;
	inc	hl
	ld	(hl),#0x88
;main.c:663: (*d2_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:666: (*d3_cx) = 17;
	ld	hl,#0x000c + _autoDoors
	ld	(hl),#0x11
;main.c:667: (*d3_cy) = 16;
	ld	hl,#0x0001 + 0x000c + _autoDoors
	ld	(hl),#0x10
;main.c:668: (*d3_px) = 136;
	inc	hl
	ld	(hl),#0x88
;main.c:669: (*d3_py) = 128;
	inc	hl
	ld	(hl),#0x80
	ret
00105$:
;main.c:672: if (h==1)
	ld	a,c
	sub	a,#0x01
	jr	NZ,00102$
;main.c:674: (*d0_cx) = 9;						// Démarrage de la porte
	ld	hl,#_autoDoors
	ld	(hl),#0x09
;main.c:675: (*d0_cy) = 12;
	ld	hl,#0x0001 + _autoDoors
	ld	(hl),#0x0C
;main.c:676: (*d0_px) = 72;						// Démarrage de la porte
	inc	hl
	ld	(hl),#0x48
;main.c:677: (*d0_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:679: (*d1_cx) = 13;
	inc	hl
	ld	(hl),#0x0D
;main.c:680: (*d1_cy) = 12;
	ld	hl,#0x0001 + 0x0004 + _autoDoors
	ld	(hl),#0x0C
;main.c:681: (*d1_px) = 104;
	inc	hl
	ld	(hl),#0x68
;main.c:682: (*d1_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:685: (*d2_cx) = 17;
	ld	hl,#0x0008 + _autoDoors
	ld	(hl),#0x11
;main.c:686: (*d2_cy) = 12;
	ld	hl,#0x0001 + 0x0008 + _autoDoors
	ld	(hl),#0x0C
;main.c:687: (*d2_px) = 136;
	inc	hl
	ld	(hl),#0x88
;main.c:688: (*d2_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:691: (*d3_cx) = 21;
	ld	hl,#0x000c + _autoDoors
	ld	(hl),#0x15
;main.c:692: (*d3_cy) = 12;
	ld	hl,#0x0001 + 0x000c + _autoDoors
	ld	(hl),#0x0C
;main.c:693: (*d3_px) = 252;
	inc	hl
	ld	(hl),#0xFC
;main.c:694: (*d3_py) = 96;
	inc	hl
	ld	(hl),#0x60
	ret
00102$:
;main.c:698: (*d0_cx) = 5;						// Démarrage de la porte
	ld	hl,#_autoDoors
	ld	(hl),#0x05
;main.c:699: (*d0_cy) = 12;
	ld	hl,#0x0001 + _autoDoors
	ld	(hl),#0x0C
;main.c:700: (*d0_px) = 40;						// Démarrage de la porte
	inc	hl
	ld	(hl),#0x28
;main.c:701: (*d0_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:703: (*d1_cx) = 13;
	inc	hl
	ld	(hl),#0x0D
;main.c:704: (*d1_cy) = 12;
	ld	hl,#0x0001 + 0x0004 + _autoDoors
	ld	(hl),#0x0C
;main.c:705: (*d1_px) = 104;
	inc	hl
	ld	(hl),#0x68
;main.c:706: (*d1_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:709: (*d2_cx) = 17;
	ld	hl,#0x0008 + _autoDoors
	ld	(hl),#0x11
;main.c:710: (*d2_cy) = 12;
	ld	hl,#0x0001 + 0x0008 + _autoDoors
	ld	(hl),#0x0C
;main.c:711: (*d2_px) = 136;
	inc	hl
	ld	(hl),#0x88
;main.c:712: (*d2_py) = 96;
	inc	hl
	ld	(hl),#0x60
;main.c:715: (*d3_cx) = 25;
	ld	hl,#0x000c + _autoDoors
	ld	(hl),#0x19
;main.c:716: (*d3_cy) = 12;
	ld	hl,#0x0001 + 0x000c + _autoDoors
	ld	(hl),#0x0C
;main.c:717: (*d3_px) = 200;
	inc	hl
	ld	(hl),#0xC8
;main.c:718: (*d3_py) = 96;	
	inc	hl
	ld	(hl),#0x60
	ret
_initAutoDoor_end::
;main.c:723: void renderAutoDoor(void)
;	---------------------------------
; Function renderAutoDoor
; ---------------------------------
_renderAutoDoor_start::
_renderAutoDoor:
;main.c:725: s_autoDoors *d0 = &autoDoors[0];
;main.c:726: s_autoDoors *d1 = &autoDoors[1];
;main.c:727: s_autoDoors *d2 = &autoDoors[2];
;main.c:728: s_autoDoors *d3 = &autoDoors[3];
;main.c:730: byte *d0_cx = &d0->cx;
;main.c:731: byte *d0_cy = &d0->cy;
;main.c:733: byte *d1_cx = &d1->cx;
;main.c:734: byte *d1_cy = &d1->cy;
;main.c:736: byte *d2_cx = &d2->cx;
;main.c:737: byte *d2_cy = &d2->cy;
;main.c:739: byte *d3_cx = &d3->cx;
;main.c:740: byte *d3_cy = &d3->cy;
;main.c:742: if (autoDoorTimer==0) // On va avancer les portes
	ld	iy,#_autoDoorTimer
	ld	a,0 (iy)
	or	a,1 (iy)
	ret	NZ
;main.c:744: disable_nmi();
	call	_disable_nmi
;main.c:745: put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d0_cx),(*d0_cy),2,1);	
	ld	hl,#0x0001 + _autoDoors
	ld	c,(hl)
	ld	hl,#_autoDoors
	ld	b,(hl)
	ld	a,(#_autoDoorCurrentGfx + 0)
	add	a,a
	add	a,#<(_gfxAutoDoor)
	ld	e,a
	ld	a,#>(_gfxAutoDoor)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0102
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_put_frame
	pop	af
	pop	af
	pop	af
;main.c:746: put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d1_cx),(*d1_cy),2,1);	
	ld	hl,#0x0001 + 0x0004 + _autoDoors
	ld	c,(hl)
	ld	hl,#0x0004 + _autoDoors
	ld	b,(hl)
	ld	a,(#_autoDoorCurrentGfx + 0)
	add	a,a
	add	a,#<(_gfxAutoDoor)
	ld	e,a
	ld	a,#>(_gfxAutoDoor)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0102
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_put_frame
	pop	af
	pop	af
	pop	af
;main.c:747: put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d2_cx),(*d2_cy),2,1);	
	ld	hl,#0x0001 + 0x0008 + _autoDoors
	ld	c,(hl)
	ld	hl,#0x0008 + _autoDoors
	ld	b,(hl)
	ld	a,(#_autoDoorCurrentGfx + 0)
	add	a,a
	add	a,#<(_gfxAutoDoor)
	ld	e,a
	ld	a,#>(_gfxAutoDoor)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0102
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_put_frame
	pop	af
	pop	af
	pop	af
;main.c:748: put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d3_cx),(*d3_cy),2,1);
	ld	hl,#0x0001 + 0x000c + _autoDoors
	ld	c,(hl)
	ld	hl,#0x000c + _autoDoors
	ld	b,(hl)
	ld	a,(#_autoDoorCurrentGfx + 0)
	add	a,a
	add	a,#<(_gfxAutoDoor)
	ld	e,a
	ld	a,#>(_gfxAutoDoor)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0102
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_put_frame
	pop	af
	pop	af
	pop	af
;main.c:749: enable_nmi();
	call	_enable_nmi
;main.c:751: if (autoDoorCurrentGfx<17) autoDoorCurrentGfx++; else {autoDoorCurrentGfx=0;initAutoDoor();}
	ld	iy,#_autoDoorCurrentGfx
	ld	a,0 (iy)
	sub	a,#0x11
	jr	NC,00102$
	inc	0 (iy)
	jr	00103$
00102$:
	ld	hl,#_autoDoorCurrentGfx + 0
	ld	(hl), #0x00
	call	_initAutoDoor
00103$:
;main.c:753: autoDoorTimer = 10;
	ld	iy,#_autoDoorTimer
	ld	0 (iy),#0x0A
	ld	1 (iy),#0x00
	ret
_renderAutoDoor_end::
;main.c:759: byte isPlayerDirectionFree(char direction)
;	---------------------------------
; Function isPlayerDirectionFree
; ---------------------------------
_isPlayerDirectionFree_start::
_isPlayerDirectionFree:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;main.c:766: s_autoDoors *d0 = &autoDoors[0];
;main.c:767: s_autoDoors *d1 = &autoDoors[1];
;main.c:768: s_autoDoors *d2 = &autoDoors[2];
;main.c:769: s_autoDoors *d3 = &autoDoors[3];
;main.c:771: byte *d0_cx = &d0->cx;
;main.c:772: byte *d0_cy = &d0->cy;
;main.c:774: byte *d1_cx = &d1->cx;
;main.c:775: byte *d1_cy = &d1->cy;
;main.c:777: byte *d2_cx = &d2->cx;
;main.c:778: byte *d2_cy = &d2->cy;
;main.c:780: byte *d3_cx = &d3->cx;
;main.c:781: byte *d3_cy = &d3->cy;
;main.c:783: s_playerDoors *pd0 = &playerDoors[0];
;main.c:784: s_playerDoors *pd1 = &playerDoors[1];
;main.c:786: byte *pd0_affiche = &pd0->affiche;
;main.c:787: byte *pd0_c1x = &pd0->c1x;
;main.c:788: byte *pd0_c1y = &pd0->c1y;
;main.c:789: byte *pd0_c2x = &pd0->c2x;
;main.c:790: byte *pd0_c2y = &pd0->c2y;
;main.c:791: byte *pd0_doorGlobalPxStart = &pd0->doorGlobalPxStart;
;main.c:792: byte *pd0_doorGlobalPyStart = &pd0->doorGlobalPyStart;
;main.c:793: byte *pd0_doorGlobalHauteur = &pd0->doorGlobalHauteur;
;main.c:794: byte *pd0_doorGlobalLargeur = &pd0->doorGlobalLargeur;
;main.c:796: byte *pd1_affiche = &pd1->affiche;
;main.c:797: byte *pd1_c1x = &pd1->c1x;
;main.c:798: byte *pd1_c1y = &pd1->c1y;
;main.c:799: byte *pd1_c2x = &pd1->c2x;
;main.c:800: byte *pd1_c2y = &pd1->c2y;
;main.c:801: byte *pd1_doorGlobalPxStart = &pd1->doorGlobalPxStart;
;main.c:802: byte *pd1_doorGlobalPyStart = &pd1->doorGlobalPyStart;
;main.c:803: byte *pd1_doorGlobalHauteur = &pd1->doorGlobalHauteur;
;main.c:804: byte *pd1_doorGlobalLargeur = &pd1->doorGlobalLargeur;
;main.c:807: tx3=ty3=tx1=tx2=ty1=ty2=tx1Center=tx2Center=ty1Center=ty2Center=0;
	ld	-11 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-10 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-3 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
;main.c:809: res = NOK;
	ld	-5 (ix),#0x01
;main.c:812: if (direction==DROITE)
	ld	a,4 (ix)
	sub	a,#0x03
	jr	NZ,00110$
;main.c:814: tx1 = (player.px+16) >> 3;
	ld	a,(#_player)
	ld	h, #0x00
	add	a,#0x10
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, c
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
;main.c:815: ty1 = (player.py) >> 3;
	ld	hl,#0x0001 + _player
	ld	c,(hl)
	ld	b,c
	srl	b
	srl	b
	srl	b
	ld	-2 (ix),b
;main.c:816: tx2 = (player.px+16) >> 3;
	ld	a,(#_player)
	ld	-12 (ix), a
	ld	h, #0x00
	add	a,#0x10
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-3 (ix),l
;main.c:817: ty2 = (player.py+15) >> 3;
	ld	a, c
	ld	h, #0x00
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-4 (ix),l
;main.c:819: tx1Center = (player.px) >> 3;
	ld	c,-12 (ix)
	srl	c
	srl	c
	srl	c
	ld	-8 (ix),c
;main.c:820: ty1Center = (player.py) >> 3;
	ld	-9 (ix),b
;main.c:821: tx2Center = (player.px) >> 3;
	ld	-10 (ix),c
;main.c:822: ty2Center = (player.py+15) >> 3;	
	ld	-11 (ix),l
	jp	00111$
00110$:
;main.c:825: if (direction==GAUCHE)
	ld	a,4 (ix)
	sub	a,#0x02
	jr	NZ,00107$
;main.c:827: tx1 = (player.px-1) >> 3;
	ld	hl,#_player
	ld	l,(hl)
	ld	h,#0x00
	dec	hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
;main.c:828: ty1 = (player.py) >> 3;
	ld	hl,#0x0001 + _player
	ld	c,(hl)
	ld	a,c
	srl	a
	srl	a
	srl	a
	ld	-13 (ix), a
	ld	-2 (ix),a
;main.c:829: tx2 = (player.px-1) >> 3;
	ld	hl,#_player
	ld	e, (hl)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	dec	hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-3 (ix),l
;main.c:830: ty2 = (player.py+15) >> 3;
	ld	a, c
	ld	h, #0x00
	add	a,#0x0F
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, c
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	-4 (ix),c
;main.c:832: tx1Center = (player.px+15) >> 3;
	ld	hl,#0x000F
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-8 (ix),l
;main.c:833: ty1Center = (player.py) >> 3;
	ld	a,-13 (ix)
	ld	-9 (ix),a
;main.c:834: tx2Center = (player.px+15) >> 3;
	ld	-10 (ix),l
;main.c:835: ty2Center = (player.py+15) >> 3;	
	ld	-11 (ix),c
	jp	00111$
00107$:
;main.c:838: if (direction==BAS)
	ld	a,4 (ix)
	sub	a,#0x01
	jr	NZ,00104$
;main.c:840: tx1 = (player.px) >> 3;
	ld	a,(#_player)
	srl	a
	srl	a
	srl	a
	ld	-1 (ix),a
;main.c:841: ty1 = (player.py+16) >> 3;
	ld	hl,#0x0001 + _player
	ld	c,(hl)
	ld	a, c
	ld	h, #0x00
	add	a,#0x10
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	-2 (ix),b
;main.c:842: tx2 = (player.px+15) >> 3;
	ld	a,(#_player)
	ld	-13 (ix), a
	ld	h, #0x00
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-3 (ix),l
;main.c:843: ty2 = (player.py+16) >> 3;
	ld	-4 (ix),b
;main.c:845: tx3=tx1;
	ld	a,-1 (ix)
	ld	-6 (ix),a
;main.c:846: ty3=ty1;
	ld	a,-2 (ix)
	ld	-7 (ix),a
;main.c:848: tx1Center = (player.px) >> 3;
	ld	a,-13 (ix)
	srl	a
	srl	a
	srl	a
	ld	-8 (ix),a
;main.c:849: ty1Center = (player.py) >> 3;
	srl	c
	srl	c
	srl	c
	ld	-9 (ix),c
;main.c:850: tx2Center = (player.px+15) >> 3;
	ld	-10 (ix),l
;main.c:851: ty2Center = (player.py) >> 3;
	ld	-11 (ix),c
	jp	00111$
00104$:
;main.c:854: if (direction==HAUT)
	xor	a,a
	or	a,4 (ix)
	jp	NZ,00111$
;main.c:856: tx1 = (player.px) >> 3;
	ld	a,(#_player)
	srl	a
	srl	a
	srl	a
	ld	-1 (ix),a
;main.c:857: ty1 = (player.py-1) >> 3;
	ld	hl,#0x0001 + _player
	ld	c, (hl)
	ld	b,#0x00
	ld	l,c
	ld	h,b
	dec	hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-12 (ix), l
	ld	-2 (ix), l
;main.c:858: tx2 = (player.px+15) >> 3;
	ld	a,(#_player)
	ld	-13 (ix), a
	ld	h, #0x00
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-14 (ix), l
	ld	-3 (ix), l
;main.c:859: ty2 = (player.py-1) >> 3;
	ld	a,-12 (ix)
	ld	-4 (ix),a
;main.c:861: tx3 = tx1;
	ld	a,-1 (ix)
	ld	-6 (ix),a
;main.c:862: ty3 = (player.py+8) >> 3;
	ld	hl,#0x0008
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-7 (ix),l
;main.c:864: tx1Center = (player.px) >> 3;
	ld	a,-13 (ix)
	srl	a
	srl	a
	srl	a
	ld	-8 (ix),a
;main.c:865: ty1Center = (player.py+15) >> 3;
	ld	hl,#0x000F
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-9 (ix),l
;main.c:866: tx2Center = (player.px+15) >> 3;
	ld	a,-14 (ix)
	ld	-10 (ix),a
;main.c:867: ty2Center = (player.py+15) >> 3;
	ld	-11 (ix),l
00111$:
;main.c:870: res1 = peekGhostGameZone(tx1,ty1);
	ld	h,-2 (ix)
	ld	l,-1 (ix)
	push	hl
	call	_peekGhostGameZone
	pop	af
	ld	c,l
;main.c:871: res2 = peekGhostGameZone(tx2,ty2);
	push	bc
	ld	h,-4 (ix)
	ld	l,-3 (ix)
	push	hl
	call	_peekGhostGameZone
	pop	af
	pop	bc
	ld	b,l
;main.c:873: res1Center = peekGhostGameZone(tx1Center,ty1Center);
	push	bc
	ld	h,-9 (ix)
	ld	l,-8 (ix)
	push	hl
	call	_peekGhostGameZone
	pop	af
	pop	bc
	ld	e,l
;main.c:874: res2Center = peekGhostGameZone(tx2Center,ty2Center);
	push	bc
	push	de
	ld	h,-11 (ix)
	ld	l,-10 (ix)
	push	hl
	call	_peekGhostGameZone
	pop	af
	pop	de
	pop	bc
	ld	d,l
;main.c:876: if ((res1==253) && (res2==253) && (player.doorOpen==OK))
	ld	a,c
	sub	a,#0xFD
	jr	NZ,00113$
	ld	a,b
	sub	a,#0xFD
	jr	NZ,00113$
	ld	a,(#0x0006 + _player)
	or	a,a
	jr	NZ,00113$
;main.c:878: res = OK;
	ld	-5 (ix),#0x00
00113$:
;main.c:881: if ( (res1>253) && (res2>253) ) // Zones franchissables
	ld	a,#0xFD
	cp	a,c
	jr	NC,00117$
	sub	a,b
	jr	NC,00117$
;main.c:883: res = OK;
	ld	-5 (ix),#0x00
00117$:
;main.c:889: if ( (res1Center==254) && (res2Center==254) )// Zone de construction de porte possible
	ld	a,e
	sub	a,#0xFE
	jr	NZ,00123$
	ld	a,d
	sub	a,#0xFE
	jr	NZ,00123$
;main.c:891: player.lastDoor1Cx = tx1Center;player.lastDoor1Cy = ty1Center;
	ld	hl,#0x000f + _player
	ld	a,-8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-9 (ix)
	ld	(hl),a
;main.c:892: player.lastDoor2Cx = tx2Center;player.lastDoor2Cy = ty2Center;
	inc	hl
	ld	a,-10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-11 (ix)
	ld	(hl),a
;main.c:894: player.lastDoorGlobalPxStart = tx1Center<<3;
	ld	a,-8 (ix)
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	c,a
	inc	hl
	ld	(hl),c
;main.c:895: player.lastDoorGlobalPyStart = ty1Center<<3;
	ld	a,-9 (ix)
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	c,a
	inc	hl
	ld	(hl),c
;main.c:897: if (tx2>tx1) // on est en horizontal !
	ld	a,-1 (ix)
	sub	a,-3 (ix)
	jr	NC,00120$
;main.c:899: player.lastDoorGlobalHauteur = 2;
	inc	hl
	ld	(hl),#0x02
;main.c:900: player.lastDoorGlobalLargeur = 16;
	inc	hl
	ld	(hl),#0x10
	jr	00123$
00120$:
;main.c:904: player.lastDoorGlobalHauteur = 16;
	ld	hl,#0x0015 + _player
	ld	(hl),#0x10
;main.c:905: player.lastDoorGlobalLargeur = 2;
	inc	hl
	ld	(hl),#0x02
00123$:
;main.c:910: if ((*pd0_affiche)==OK)
	ld	a,(#0x0008 + _playerDoors)
	or	a,a
	jp	NZ,00134$
;main.c:912: if (((tx1==(*pd0_c1x)) && (ty1==(*pd0_c1y))) &&	((tx2==(*pd0_c2x)) && (ty2==(*pd0_c2y))))
	ld	hl,#0x0002 + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-1 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00226$
	pop	bc
	jr	00227$
00226$:
	pop	bc
	jp	00134$
00227$:
	ld	hl,#0x0003 + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-2 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00228$
	pop	bc
	jr	00229$
00228$:
	pop	bc
	jr	00134$
00229$:
	ld	hl,#0x0004 + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-3 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00230$
	pop	bc
	jr	00231$
00230$:
	pop	bc
	jr	00134$
00231$:
	ld	hl,#0x0005 + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-4 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00232$
	pop	bc
	jr	00233$
00232$:
	pop	bc
	jr	00134$
00233$:
;main.c:914: res = isCollision(player.px,player.py,16,16,(*pd0_doorGlobalPxStart),(*pd0_doorGlobalPyStart),(*pd0_doorGlobalHauteur),(*pd0_doorGlobalLargeur));
	ld	hl,#0x000c + _playerDoors
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	dec	hl
	ld	a,(hl)
	ld	-14 (ix),a
	ld	a,(#0x0001 + _player)
	ld	-13 (ix),a
	ld	hl,#_player
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,-14 (ix)
	push	af
	inc	sp
	ld	hl,#0x1010
	push	hl
	ld	a,-13 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-5 (ix),l
;main.c:915: if (res==OK) res = NOK; else res = OK;				
	xor	a,a
	or	a,-5 (ix)
	jr	NZ,00126$
	ld	-5 (ix),#0x01
	jr	00134$
00126$:
	ld	-5 (ix),#0x00
00134$:
;main.c:919: if ((*pd1_affiche)==OK)
	ld	hl,#0x0008 + 0x000d + _playerDoors
	ld	a,(hl)
	or	a,a
	jp	NZ,00144$
;main.c:921: if (((tx1==(*pd1_c1x)) && (ty1==(*pd1_c1y))) &&	((tx2==(*pd1_c2x)) && (ty2==(*pd1_c2y))))
	ld	hl,#0x0002 + 0x000d + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-1 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00234$
	pop	bc
	jr	00235$
00234$:
	pop	bc
	jp	00144$
00235$:
	ld	hl,#0x0003 + 0x000d + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-2 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00236$
	pop	bc
	jr	00237$
00236$:
	pop	bc
	jr	00144$
00237$:
	ld	hl,#0x0004 + 0x000d + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-3 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00238$
	pop	bc
	jr	00239$
00238$:
	pop	bc
	jr	00144$
00239$:
	ld	hl,#0x0005 + 0x000d + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-4 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00240$
	pop	bc
	jr	00241$
00240$:
	pop	bc
	jr	00144$
00241$:
;main.c:923: res = isCollision(player.px,player.py,16,16,(*pd1_doorGlobalPxStart),(*pd1_doorGlobalPyStart),(*pd1_doorGlobalHauteur),(*pd1_doorGlobalLargeur));
	ld	hl,#0x000c + 0x000d + _playerDoors
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	dec	hl
	ld	a,(hl)
	ld	-14 (ix),a
	ld	a,(#0x0001 + _player)
	ld	-13 (ix),a
	ld	hl,#_player
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,-14 (ix)
	push	af
	inc	sp
	ld	hl,#0x1010
	push	hl
	ld	a,-13 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-5 (ix),l
;main.c:924: if (res==OK) res = NOK; else res = OK;				
	xor	a,a
	or	a,-5 (ix)
	jr	NZ,00136$
	ld	-5 (ix),#0x01
	jr	00144$
00136$:
	ld	-5 (ix),#0x00
00144$:
;main.c:930: if ( (autoDoorCurrentGfx>2) && (autoDoorCurrentGfx<15) )
	ld	a,#0x02
	ld	iy,#_autoDoorCurrentGfx
	sub	a,0 (iy)
	jp	NC,00161$
	ld	a,0 (iy)
	sub	a,#0x0F
	jp	NC,00161$
;main.c:932: if ( (tx3==(*d0_cx)) && (ty3==(*d0_cy)) ) {res=NOK;}
	ld	hl,#_autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-6 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00242$
	pop	bc
	jr	00243$
00242$:
	pop	bc
	jr	00157$
00243$:
	ld	hl,#0x0001 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-7 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00244$
	pop	bc
	jr	00245$
00244$:
	pop	bc
	jr	00157$
00245$:
	ld	-5 (ix),#0x01
	jp	00161$
00157$:
;main.c:933: else if ( (tx3==(*d1_cx)) && (ty3==(*d1_cy)) ) {res=NOK;}
	ld	hl,#0x0004 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-6 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00246$
	pop	bc
	jr	00247$
00246$:
	pop	bc
	jr	00153$
00247$:
	ld	hl,#0x0001 + 0x0004 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-7 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00248$
	pop	bc
	jr	00249$
00248$:
	pop	bc
	jr	00153$
00249$:
	ld	-5 (ix),#0x01
	jr	00161$
00153$:
;main.c:934: else if ( (tx3==(*d2_cx)) && (ty3==(*d2_cy)) ) {res=NOK;}
	ld	hl,#0x0008 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-6 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00250$
	pop	bc
	jr	00251$
00250$:
	pop	bc
	jr	00149$
00251$:
	ld	hl,#0x0001 + 0x0008 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-7 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00252$
	pop	bc
	jr	00253$
00252$:
	pop	bc
	jr	00149$
00253$:
	ld	-5 (ix),#0x01
	jr	00161$
00149$:
;main.c:935: else if ( (tx3==(*d3_cx)) && (ty3==(*d3_cy)) ) {res=NOK;}
	ld	hl,#0x000c + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-6 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00254$
	pop	bc
	jr	00255$
00254$:
	pop	bc
	jr	00161$
00255$:
	ld	hl,#0x0001 + 0x000c + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,-7 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00256$
	pop	bc
	jr	00257$
00256$:
	pop	bc
	jr	00161$
00257$:
	ld	-5 (ix),#0x01
00161$:
;main.c:938: return res;
	ld	l,-5 (ix)
	ld	sp,ix
	pop	ix
	ret
_isPlayerDirectionFree_end::
;main.c:941: byte isCopDirectionFree(char c,char direction)
;	---------------------------------
; Function isCopDirectionFree
; ---------------------------------
_isCopDirectionFree_start::
_isCopDirectionFree:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;main.c:945: s_cop *mycop = &cop[c];	
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_cop)
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	b,a
;main.c:946: byte *cop_py = &mycop->py;
	ld	hl,#0x0001
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;main.c:949: s_playerDoors *pd0 = &playerDoors[0];
;main.c:950: s_playerDoors *pd1 = &playerDoors[1];
;main.c:952: byte *pd0_affiche = &pd0->affiche;
;main.c:953: byte *pd0_c1x = &pd0->c1x;
;main.c:954: byte *pd0_c1y = &pd0->c1y;
;main.c:957: byte *pd1_affiche = &pd1->affiche;
;main.c:958: byte *pd1_c1x = &pd1->c1x;
;main.c:959: byte *pd1_c1y = &pd1->c1y;
;main.c:962: s_autoDoors *ad0 = &autoDoors[0];
;main.c:963: s_autoDoors *ad1 = &autoDoors[1];
;main.c:964: s_autoDoors *ad2 = &autoDoors[2];
;main.c:965: s_autoDoors *ad3 = &autoDoors[3];
;main.c:967: byte *ad0_cx = &ad0->cx;
;main.c:968: byte *ad0_cy = &ad0->cy;
;main.c:969: byte *ad1_cx = &ad1->cx;
;main.c:970: byte *ad1_cy = &ad1->cy;
;main.c:971: byte *ad2_cx = &ad2->cx;
;main.c:972: byte *ad2_cy = &ad2->cy;
;main.c:973: byte *ad3_cx = &ad3->cx;
;main.c:974: byte *ad3_cy = &ad3->cy;
;main.c:978: res = NOK;	
	ld	-2 (ix),#0x01
;main.c:981: if (direction==DROITE)
	ld	a,5 (ix)
	sub	a,#0x03
	jr	NZ,00108$
;main.c:983: tx1 = ((*cop_px)+16) >> 3;
	ld	a,(bc)
	ld	c, a
	ld	b,#0x00
	ld	hl,#0x0010
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,l
	ld	-9 (ix),e
;main.c:984: ty1 = ((*cop_py)) >> 3;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	a,l
	srl	a
	srl	a
	srl	a
	ld	-1 (ix), a
	ld	-7 (ix),a
;main.c:985: tx2 = ((*cop_px)+16) >> 3;
	ld	-8 (ix),e
;main.c:986: ty2 = ((*cop_py)+15) >> 3;		
	ld	h,#0x00
	ld	a,l
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-10 (ix),l
;main.c:988: tx3 = ((*cop_px)+13) >> 3;
	ld	hl,#0x000D
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,l
;main.c:989: ty3 = ((*cop_py)) >> 3;
	ld	d,-1 (ix)
	jp	00109$
00108$:
;main.c:992: if (direction==GAUCHE)
	ld	a,5 (ix)
	sub	a,#0x02
	jr	NZ,00105$
;main.c:994: tx1 = ((*cop_px)-1) >> 3;
	ld	a,(bc)
	ld	c, a
	ld	b, #0x00
	ld	l, a
	ld	h,b
	dec	hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,l
	ld	-9 (ix),e
;main.c:995: ty1 = ((*cop_py)) >> 3;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	a,l
	srl	a
	srl	a
	srl	a
	ld	-1 (ix), a
	ld	-7 (ix),a
;main.c:996: tx2 = ((*cop_px)-1) >> 3;
	ld	-8 (ix),e
;main.c:997: ty2 = ((*cop_py)+15) >> 3;
	ld	h,#0x00
	ld	a,l
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-10 (ix),l
;main.c:999: tx3 = ((*cop_px)+6) >> 3;
	ld	hl,#0x0006
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,l
;main.c:1000: ty3 = ((*cop_py)) >> 3;
	ld	d,-1 (ix)
	jp	00109$
00105$:
;main.c:1003: if (direction==BAS)
	ld	a,5 (ix)
	sub	a,#0x01
	jr	NZ,00102$
;main.c:1005: tx1 = ((*cop_px)) >> 3;
	ld	a,(bc)
	ld	e,a
	ld	d,e
	srl	d
	srl	d
	srl	d
	ld	-9 (ix),d
;main.c:1006: ty1 = ((*cop_py)+16) >> 3;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	-6 (ix),l
	ld	-5 (ix),#0x00
	ld	a,-6 (ix)
	add	a,#0x10
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix), l
	ld	-7 (ix), l
;main.c:1007: tx2 = ((*cop_px)+15) >> 3;
	ld	a, e
	ld	h, #0x00
	add	a,#0x0F
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, c
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-8 (ix),l
;main.c:1008: ty2 = ((*cop_py)+16) >> 3;
	ld	a,-1 (ix)
	ld	-10 (ix),a
;main.c:1010: tx3 = ((*cop_px)) >> 3;
	ld	e,d
;main.c:1011: ty3 = ((*cop_py)+14) >> 3;
	ld	a,-6 (ix)
	add	a,#0x0E
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	d,l
	jr	00109$
00102$:
;main.c:1015: tx1 = ((*cop_px)) >> 3;
	ld	a,(bc)
	ld	c,a
	ld	d,c
	srl	d
	srl	d
	srl	d
	ld	-9 (ix),d
;main.c:1016: ty1 = ((*cop_py)-1) >> 3;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	-6 (ix),l
	ld	-5 (ix),#0x00
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	dec	hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	e,l
	ld	-7 (ix),e
;main.c:1017: tx2 = ((*cop_px)+15) >> 3;
	ld	a, c
	ld	h, #0x00
	add	a,#0x0F
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, c
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-8 (ix),l
;main.c:1018: ty2 = ((*cop_py)-1) >> 3;
	ld	-10 (ix),e
;main.c:1020: tx3 = ((*cop_px)) >> 3;
	ld	e,d
;main.c:1021: ty3 = ((*cop_py)+6) >> 3;
	ld	a,-6 (ix)
	add	a,#0x06
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	d,l
00109$:
;main.c:1024: res1 = peekGhostGameZone(tx1,ty1);
	push	de
	ld	h,-7 (ix)
	ld	l,-9 (ix)
	push	hl
	call	_peekGhostGameZone
	pop	af
	pop	de
	ld	c,l
;main.c:1025: res2 = peekGhostGameZone(tx2,ty2);
	push	bc
	push	de
	ld	h,-10 (ix)
	ld	l,-8 (ix)
	push	hl
	call	_peekGhostGameZone
	pop	af
	pop	de
	pop	bc
	ld	b,l
;main.c:1027: res3 = peekGhostGameZone(tx3,ty3);
	push	bc
	push	de
	push	de
	call	_peekGhostGameZone
	pop	af
	pop	de
	pop	bc
;main.c:1029: if ( (res1>253) && (res2>253) )
	ld	a,#0xFD
	cp	a,c
	jr	NC,00111$
	sub	a,b
	jr	NC,00111$
;main.c:1031: res = OK;
	ld	-2 (ix),#0x00
00111$:
;main.c:1034: if ((*pd0_affiche)==OK)
	ld	a,(#0x0008 + _playerDoors)
	or	a,a
	jr	NZ,00117$
;main.c:1036: if ((tx3==(*pd0_c1x)) && (ty3==(*pd0_c1y)))
	ld	hl,#0x0002 + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,e
	ld	a,l
	sub	a,c
	jr	NZ,00180$
	pop	bc
	jr	00181$
00180$:
	pop	bc
	jr	00117$
00181$:
	ld	hl,#0x0003 + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,d
	ld	a,l
	sub	a,c
	jr	NZ,00182$
	pop	bc
	jr	00183$
00182$:
	pop	bc
	jr	00117$
00183$:
;main.c:1038: res=NOK;
	ld	-2 (ix),#0x01
;main.c:1039: addScore(1);
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_addScore
	inc	sp
	pop	de
00117$:
;main.c:1042: if ((*pd1_affiche)==OK)
	ld	hl,#0x0008 + 0x000d + _playerDoors
	ld	a,(hl)
	or	a,a
	jr	NZ,00122$
;main.c:1044: if ((tx3==(*pd1_c1x)) && (ty3==(*pd1_c1y)))
	ld	hl,#0x0002 + 0x000d + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,e
	ld	a,l
	sub	a,c
	jr	NZ,00184$
	pop	bc
	jr	00185$
00184$:
	pop	bc
	jr	00122$
00185$:
	ld	hl,#0x0003 + 0x000d + _playerDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,d
	ld	a,l
	sub	a,c
	jr	NZ,00186$
	pop	bc
	jr	00187$
00186$:
	pop	bc
	jr	00122$
00187$:
;main.c:1046: res=NOK;
	ld	-2 (ix),#0x01
00122$:
;main.c:1051: if (autoDoorCurrentGfx>4) // Ca fait tout ramer si le cop est bloqué dans la porte !!!!!!
	ld	a,#0x04
	ld	iy,#_autoDoorCurrentGfx
	sub	a,0 (iy)
	jp	NC,00139$
;main.c:1053: if ((tx3==(*ad0_cx)) && (ty3==(*ad0_cy))) {res=NOK;}
	ld	hl,#_autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,e
	ld	a,l
	sub	a,c
	jr	NZ,00188$
	pop	bc
	jr	00189$
00188$:
	pop	bc
	jr	00135$
00189$:
	ld	hl,#0x0001 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,d
	ld	a,l
	sub	a,c
	jr	NZ,00190$
	pop	bc
	jr	00191$
00190$:
	pop	bc
	jr	00135$
00191$:
	ld	-2 (ix),#0x01
	jp	00139$
00135$:
;main.c:1054: else if ((tx3==(*ad1_cx)) && (ty3==(*ad1_cy))) {res=NOK;}
	ld	hl,#0x0004 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,e
	ld	a,l
	sub	a,c
	jr	NZ,00192$
	pop	bc
	jr	00193$
00192$:
	pop	bc
	jr	00131$
00193$:
	ld	hl,#0x0001 + 0x0004 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,d
	ld	a,l
	sub	a,c
	jr	NZ,00194$
	pop	bc
	jr	00195$
00194$:
	pop	bc
	jr	00131$
00195$:
	ld	-2 (ix),#0x01
	jr	00139$
00131$:
;main.c:1055: else if ((tx3==(*ad2_cx)) && (ty3==(*ad2_cy))) {res=NOK;}
	ld	hl,#0x0008 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,e
	ld	a,l
	sub	a,c
	jr	NZ,00196$
	pop	bc
	jr	00197$
00196$:
	pop	bc
	jr	00127$
00197$:
	ld	hl,#0x0001 + 0x0008 + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,d
	ld	a,l
	sub	a,c
	jr	NZ,00198$
	pop	bc
	jr	00199$
00198$:
	pop	bc
	jr	00127$
00199$:
	ld	-2 (ix),#0x01
	jr	00139$
00127$:
;main.c:1056: else if ((tx3==(*ad3_cx)) && (ty3==(*ad3_cy))) {res=NOK;}
	ld	hl,#0x000c + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,e
	ld	a,l
	sub	a,c
	jr	NZ,00200$
	pop	bc
	jr	00201$
00200$:
	pop	bc
	jr	00139$
00201$:
	ld	hl,#0x0001 + 0x000c + _autoDoors
	ld	l,(hl)
	push	bc
;	direct compare
	ld	c,d
	ld	a,l
	sub	a,c
	jr	NZ,00202$
	pop	bc
	jr	00203$
00202$:
	pop	bc
	jr	00139$
00203$:
	ld	-2 (ix),#0x01
00139$:
;main.c:1059: return res;
	ld	l,-2 (ix)
	ld	sp,ix
	pop	ix
	ret
_isCopDirectionFree_end::
;main.c:1062: void changePlayerDirection(char direction)
;	---------------------------------
; Function changePlayerDirection
; ---------------------------------
_changePlayerDirection_start::
_changePlayerDirection:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:1064: if (isPlayerDirectionFree(direction)==OK) 
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isPlayerDirectionFree
	inc	sp
	xor	a,a
	or	a,l
	jr	NZ,00103$
;main.c:1066: player.oldDirection = player.direction;
	ld	hl,#0x000c + _player
	ld	a,(hl)
	dec	hl
	ld	(hl),a
;main.c:1067: player.direction = direction;
	ld	a,4 (ix)
	inc	hl
	ld	(hl),a
00103$:
	pop	ix
	ret
_changePlayerDirection_end::
;main.c:1072: void movePlayer(void)
;	---------------------------------
; Function movePlayer
; ---------------------------------
_movePlayer_start::
_movePlayer:
;main.c:1076: direction = player.direction;
	ld	hl,#0x000c + _player
	ld	c, (hl)
;main.c:1077: player.lastMvt = 99;
	ld	hl,#0x001e + _player
	ld	(hl),#0x63
;main.c:1079: if (direction==DROITE)
;main.c:1081: if (isPlayerDirectionFree(direction)!=NOK)		
	ld	a,c
	cp	a,#0x03
	jr	NZ,00140$
	push	af
	inc	sp
	call	_isPlayerDirectionFree
	inc	sp
	ld	a,l
	sub	a,#0x01
	ret	Z
;main.c:1083: if (player.px>=232) // Teleport droite
	ld	a,(#_player)
	sub	a,#0xE8
	jr	C,00106$
;main.c:1084: player.px=0;
	ld	hl,#_player
	ld	(hl),#0x00
	jr	00107$
00106$:
;main.c:1086: if ((player.oldDirection==HAUT) || (player.oldDirection==BAS)) {player.px+=2;player.oldDirection=STOP;} else player.px++;
	ld	hl,#0x000b + _player
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00101$
	ld	a,l
	sub	a,#0x01
	jr	NZ,00102$
00101$:
	ld	a,(#_player)
	add	a,#0x02
	ld	(#_player),a
	ld	hl,#0x000b + _player
	ld	(hl),#0x04
	jr	00107$
00102$:
	ld	a,(#_player)
	inc	a
	ld	(#_player),a
00107$:
;main.c:1088: player.lastMvt = HORIZONTAL;
	ld	hl,#0x001e + _player
	ld	(hl),#0x00
	ret
00140$:
;main.c:1093: if (direction==GAUCHE)
;main.c:1095: if (isPlayerDirectionFree(direction)!=NOK)		
	ld	a,c
	cp	a,#0x02
	jr	NZ,00137$
	push	af
	inc	sp
	call	_isPlayerDirectionFree
	inc	sp
	ld	a,l
	sub	a,#0x01
	ret	Z
;main.c:1097: if (player.px<=8)
	ld	hl,#_player
	ld	l,(hl)
	ld	a,#0x08
	sub	a,l
	jr	C,00115$
;main.c:1098: player.px=30<<3;
	ld	hl,#_player
	ld	(hl),#0xF0
	jr	00116$
00115$:
;main.c:1100: if ((player.oldDirection==HAUT) || (player.oldDirection==BAS)) {player.px-=2;player.oldDirection=STOP;} else player.px--;
	ld	hl,#0x000b + _player
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00110$
	ld	a,l
	sub	a,#0x01
	jr	NZ,00111$
00110$:
	ld	a,(#_player)
	add	a,#0xFE
	ld	(#_player),a
	ld	hl,#0x000b + _player
	ld	(hl),#0x04
	jr	00116$
00111$:
	ld	a,(#_player)
	dec	a
	ld	(#_player),a
00116$:
;main.c:1102: player.lastMvt = HORIZONTAL;
	ld	hl,#0x001e + _player
	ld	(hl),#0x00
	ret
00137$:
;main.c:1106: if (direction==BAS)
;main.c:1108: if (isPlayerDirectionFree(direction)!=NOK)
	ld	a,c
	cp	a,#0x01
	jr	NZ,00134$
	push	af
	inc	sp
	call	_isPlayerDirectionFree
	inc	sp
	ld	a,l
	sub	a,#0x01
	ret	Z
;main.c:1110: if ((player.oldDirection==GAUCHE) || (player.oldDirection==DROITE)) {player.py+=2;player.oldDirection=STOP;} else player.py++;
	ld	hl,#0x000b + _player
	ld	l,(hl)
	ld	a,l
	cp	a,#0x02
	jr	Z,00119$
	sub	a,#0x03
	jr	NZ,00120$
00119$:
	ld	a,(#0x0001 + _player)
	add	a,#0x02
	ld	(#0x0001 + _player),a
	ld	hl,#0x000b + _player
	ld	(hl),#0x04
	jr	00121$
00120$:
	ld	a,(#0x0001 + _player)
	inc	a
	ld	(#0x0001 + _player),a
00121$:
;main.c:1112: player.lastMvt = VERTICAL;
	ld	hl,#0x001e + _player
	ld	(hl),#0x01
	ret
00134$:
;main.c:1116: if (direction==HAUT)
	xor	a,a
	or	a,c
	ret	NZ
;main.c:1118: if (isPlayerDirectionFree(direction)!=NOK)
	ld	a,c
	push	af
	inc	sp
	call	_isPlayerDirectionFree
	inc	sp
	ld	a,l
	sub	a,#0x01
	ret	Z
;main.c:1120: if ((player.oldDirection==GAUCHE) || (player.oldDirection==DROITE)) {player.py-=2;player.oldDirection=STOP;} else player.py--;
	ld	hl,#0x000b + _player
	ld	l,(hl)
	ld	a,l
	cp	a,#0x02
	jr	Z,00125$
	sub	a,#0x03
	jr	NZ,00126$
00125$:
	ld	a,(#0x0001 + _player)
	add	a,#0xFE
	ld	(#0x0001 + _player),a
	ld	hl,#0x000b + _player
	ld	(hl),#0x04
	jr	00127$
00126$:
	ld	a,(#0x0001 + _player)
	dec	a
	ld	(#0x0001 + _player),a
00127$:
;main.c:1122: player.lastMvt = VERTICAL;
	ld	hl,#0x001e + _player
	ld	(hl),#0x01
	ret
_movePlayer_end::
;main.c:1128: void animatePlayer()
;	---------------------------------
; Function animatePlayer
; ---------------------------------
_animatePlayer_start::
_animatePlayer:
;main.c:1130: if (animateSprite%10==0) player.currentAnim+=4;
	ld	a,#0x0A
	push	af
	inc	sp
	ld	a,(_animateSprite)
	push	af
	inc	sp
	call	__moduchar_rrx_s
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00102$
	ld	a,(#0x001f + _player)
	add	a,#0x04
	ld	(#0x001f + _player),a
00102$:
;main.c:1131: if (player.currentAnim==8) player.currentAnim=0;
	ld	a,(#0x001f + _player)
	sub	a,#0x08
	jr	NZ,00104$
	ld	hl,#0x001f + _player
	ld	(hl),#0x00
00104$:
;main.c:1133: if (player.regard==GAUCHE)
	ld	a,(#0x000d + _player)
	sub	a,#0x02
	jr	NZ,00116$
;main.c:1135: if (player.lastMvt!=99)
	ld	hl,#0x001e + _player
	ld	l,(hl)
	ld	a,l
	sub	a,#0x63
	jr	Z,00109$
;main.c:1136: if (player.lastMvt==HORIZONTAL)  player.pattern2=112+player.currentAnim;
	xor	a,a
	or	a,l
	jr	NZ,00106$
	ld	a,(#0x001f + _player)
	add	a,#0x70
	ld	(#0x0008 + _player),a
	jr	00109$
00106$:
;main.c:1137: else player.pattern2=120+player.currentAnim;
	ld	a,(#0x001f + _player)
	add	a,#0x78
	ld	(#0x0008 + _player),a
00109$:
;main.c:1138: player.pattern1 = 24;
	ld	hl,#0x0007 + _player
	ld	(hl),#0x18
	jr	00117$
00116$:
;main.c:1142: if (player.lastMvt!=99)
	ld	hl,#0x001e + _player
	ld	l,(hl)
	ld	a,l
	sub	a,#0x63
	jr	Z,00114$
;main.c:1143: if (player.lastMvt==HORIZONTAL)  player.pattern2=96+player.currentAnim;
	xor	a,a
	or	a,l
	jr	NZ,00111$
	ld	a,(#0x001f + _player)
	add	a,#0x60
	ld	(#0x0008 + _player),a
	jr	00114$
00111$:
;main.c:1144: else player.pattern2=104+player.currentAnim;
	ld	a,(#0x001f + _player)
	add	a,#0x68
	ld	(#0x0008 + _player),a
00114$:
;main.c:1145: player.pattern1 = 32;
	ld	hl,#0x0007 + _player
	ld	(hl),#0x20
00117$:
;main.c:1148: player.colour1 = 7;
	ld	hl,#0x0009 + _player
	ld	(hl),#0x07
;main.c:1149: player.colour2 = 6;
	inc	hl
	ld	(hl),#0x06
	ret
_animatePlayer_end::
;main.c:1152: void renderPlayerDeath()
;	---------------------------------
; Function renderPlayerDeath
; ---------------------------------
_renderPlayerDeath_start::
_renderPlayerDeath:
;main.c:1154: sprites[SPRITE2].y = 204;
	ld	hl,#0x0004 + _sprites
	ld	(hl),#0xCC
;main.c:1155: sprites[SPRITE3].y = 204;
	ld	hl,#0x0078 + _sprites
	ld	(hl),#0xCC
;main.c:1156: sprites[SPRITE4].y = 204;
	ld	hl,#0x0008 + _sprites
	ld	(hl),#0xCC
;main.c:1157: sprites[SPRITE5].y = 204;
	ld	hl,#0x0074 + _sprites
	ld	(hl),#0xCC
;main.c:1158: sprites[SPRITE6].y = 204;
	ld	hl,#0x000c + _sprites
	ld	(hl),#0xCC
;main.c:1160: delay(10);
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
;main.c:1161: sprites[SPRITE0].pattern = 33*4;
	ld	hl,#0x0002 + _sprites
	ld	(hl),#0x84
;main.c:1162: sprites[SPRITE1].pattern = 32*4;
	ld	hl,#0x007e + _sprites
	ld	(hl),#0x80
;main.c:1163: sprites[SPRITE0].y +=1;
	ld	a,(#_sprites)
	inc	a
	ld	(#_sprites),a
;main.c:1165: delay(10);
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
;main.c:1166: sprites[SPRITE0].pattern = 33*4;
	ld	hl,#0x0002 + _sprites
	ld	(hl),#0x84
;main.c:1167: sprites[SPRITE1].pattern = 34*4;
	ld	hl,#0x007e + _sprites
	ld	(hl),#0x88
;main.c:1168: sprites[SPRITE0].y +=1;
	ld	a,(#_sprites)
	inc	a
	ld	(#_sprites),a
;main.c:1170: delay(10);
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
;main.c:1171: sprites[SPRITE0].pattern = 38*4;
	ld	hl,#0x0002 + _sprites
	ld	(hl),#0x98
;main.c:1172: sprites[SPRITE1].pattern = 35*4;
	ld	hl,#0x007e + _sprites
	ld	(hl),#0x8C
;main.c:1173: sprites[SPRITE0].y +=1;
	ld	a,(#_sprites)
	inc	a
	ld	(#_sprites),a
;main.c:1175: delay(10);
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
;main.c:1176: sprites[SPRITE0].pattern = 38*4;
	ld	hl,#0x0002 + _sprites
	ld	(hl),#0x98
;main.c:1177: sprites[SPRITE1].pattern = 36*4;
	ld	hl,#0x007e + _sprites
	ld	(hl),#0x90
;main.c:1178: sprites[SPRITE0].y +=1;
	ld	a,(#_sprites)
	inc	a
	ld	(#_sprites),a
;main.c:1180: delay(10);
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
;main.c:1181: sprites[SPRITE0].pattern = 38*4;
	ld	hl,#0x0002 + _sprites
	ld	(hl),#0x98
;main.c:1182: sprites[SPRITE1].pattern = 37*4;
	ld	hl,#0x007e + _sprites
	ld	(hl),#0x94
;main.c:1183: sprites[SPRITE0].y +=1;
	ld	a,(#_sprites)
	inc	a
	ld	(#_sprites),a
;main.c:1185: delay(10);
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
;main.c:1186: sprites[SPRITE0].pattern = 38*4;
	ld	hl,#0x0002 + _sprites
	ld	(hl),#0x98
;main.c:1187: sprites[SPRITE1].pattern = 37*4;
	ld	hl,#0x007e + _sprites
	ld	(hl),#0x94
;main.c:1189: delay(50);
	ld	hl,#0x0032
	push	hl
	call	_delay
	pop	af
	ret
_renderPlayerDeath_end::
;main.c:1192: void checkPlayerGameCollisions(void)
;	---------------------------------
; Function checkPlayerGameCollisions
; ---------------------------------
_checkPlayerGameCollisions_start::
_checkPlayerGameCollisions:
;main.c:1198: s_cop *mycop0 = &cop[0];	
;main.c:1199: byte *cop0_py = &mycop0->py;
;main.c:1200: byte *cop0_px = &mycop0->px;
;main.c:1202: s_cop *mycop1 = &cop[1];	
;main.c:1203: byte *cop1_py = &mycop1->py;
;main.c:1204: byte *cop1_px = &mycop1->px;
;main.c:1206: s_cop *mycop2 = &cop[2];	
;main.c:1207: byte *cop2_py = &mycop2->py;
;main.c:1208: byte *cop2_px = &mycop2->px;
;main.c:1210: s_cop *mycop3 = &cop[3];	
;main.c:1211: byte *cop3_py = &mycop3->py;
;main.c:1212: byte *cop3_px = &mycop3->px;
;main.c:1220: tx1 = (player.px+12) >> 3;
	ld	a,(#_player)
	ld	h, #0x00
	add	a,#0x0C
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, c
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
;main.c:1221: ty1 = (player.py+12) >> 3;
	ld	a,(#0x0001 + _player)
	ld	h, #0x00
	add	a,#0x0C
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h, a
	ld	l, e
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
;main.c:1248: disable_nmi();
	push	bc
	call	_disable_nmi
	pop	bc
;main.c:1249: res1 = get_char(tx1,ty1);
	push	bc
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_get_char
	pop	af
	pop	bc
;main.c:1250: if (res1==CHAR_PILL)
	ld	a, l
;main.c:1252: put_char(tx1,ty1,CHAR_VIDE);			
	sub	a,#0x3B
	jr	NZ,00108$
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:1253: addScore(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_addScore
	inc	sp
;main.c:1254: player.nbPillsLevel++;
	ld	a,(#0x0019 + _player)
	inc	a
	ld	(#0x0019 + _player),a
;main.c:1255: if (sfxEnCours==NON) startsfx(sfx_piece);
	xor	a,a
	ld	hl,#_sfxEnCours + 0
	or	a,(hl)
	jr	NZ,00102$
	ld	hl,#_sfx_piece
	push	hl
	call	_startsfx
	pop	af
00102$:
;main.c:1257: if (player.nbPillsLevel % 40 ==0) {scatterModeTimer=levelParamScatterModeTime;}
	ld	hl,#0x0019 + _player
	ld	c,(hl)
	push	bc
	ld	b, #0x28
	push	bc
	call	__moduchar_rrx_s
	pop	af
	ld	a, l
	pop	bc
	or	a,a
	jr	NZ,00104$
	ld	a,(#_levelParamScatterModeTime + 0)
	ld	(#_scatterModeTimer + 0),a
	ld	a,(#_levelParamScatterModeTime + 1)
	ld	(#_scatterModeTimer + 1),a
00104$:
;main.c:1258: if (player.nbPillsLevel % 35 ==0) {createBonus();}
	ld	b, #0x23
	push	bc
	call	__moduchar_rrx_s
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00108$
	call	_createBonus
00108$:
;main.c:1260: enable_nmi();
	call	_enable_nmi
;main.c:1265: if 	(	(isCollision(player.px+7,player.py+7,2,2,(*cop0_px)+4,(*cop0_py)+4,7,7)==OK) 
	ld	hl,#0x0001 + _cop
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
	inc	c
	ld	hl,#_cop
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a,(#0x0001 + _player)
	add	a,#0x07
	ld	e,a
	ld	a,(#_player)
	add	a,#0x07
	ld	d,a
	ld	hl,#0x0707
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0x0202
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jp	Z,00109$
;main.c:1266: || (isCollision(player.px+7,player.py+7,2,2,(*cop1_px)+4,(*cop1_py)+4,7,7)==OK) 
	ld	hl,#0x0001 + 0x000d + _cop
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
	inc	c
	ld	hl,#0x000d + _cop
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a,(#0x0001 + _player)
	add	a,#0x07
	ld	e,a
	ld	a,(#_player)
	add	a,#0x07
	ld	d,a
	ld	hl,#0x0707
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0x0202
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00109$
;main.c:1267: || (isCollision(player.px+7,player.py+7,2,2,(*cop2_px)+4,(*cop2_py)+4,7,7)==OK) 
	ld	hl,#0x0001 + 0x001a + _cop
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
	inc	c
	ld	hl,#0x001a + _cop
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a,(#0x0001 + _player)
	add	a,#0x07
	ld	e,a
	ld	a,(#_player)
	add	a,#0x07
	ld	d,a
	ld	hl,#0x0707
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0x0202
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00109$
;main.c:1268: || (isCollision(player.px+7,player.py+7,2,2,(*cop3_px)+4,(*cop3_py)+4,7,7)==OK)  )
	ld	hl,#0x0001 + 0x0027 + _cop
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
	inc	c
	ld	hl,#0x0027 + _cop
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a,(#0x0001 + _player)
	add	a,#0x07
	ld	e,a
	ld	a,(#_player)
	add	a,#0x07
	ld	d,a
	ld	hl,#0x0707
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0x0202
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00110$
00109$:
;main.c:1272: stopmusic();
	call	_stopmusic
;main.c:1273: startmusic(music_looseLife,LOOP_OFF);
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#_music_looseLife
	push	hl
	call	_startmusic
	pop	af
	inc	sp
;main.c:1274: renderPlayerDeath();
	call	_renderPlayerDeath
;main.c:1275: workflow = W_RETRY;
	ld	hl,#_workflow + 0
	ld	(hl), #0x06
;main.c:1276: player.direction=STOP;
	ld	hl,#0x000c + _player
	ld	(hl),#0x04
00110$:
;main.c:1279: if ((isCollision(player.px+4,player.py+4,8,8,bonus.px,bonus.py,16,16)==OK) && (bonus.actif==OK) )
	ld	hl,#0x0005 + _bonus
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	ld	hl,#0x0001 + _player
	ld	e, (hl)
	inc	e
	inc	e
	inc	e
	inc	e
	ld	hl,#_player
	ld	d, (hl)
	inc	d
	inc	d
	inc	d
	inc	d
	ld	hl,#0x1010
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0x0808
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_isCollision
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	ret	NZ
	ld	a,(#_bonus)
	or	a,a
	ret	NZ
;main.c:1281: if (bonus.pattern==BONUS1)
	ld	hl,#0x0006 + _bonus
	ld	c,(hl)
	ld	a,c
	sub	a,#0x30
	jr	NZ,00174$
	ld	a,#0x01
	jr	00175$
00174$:
	xor	a,a
00175$:
	ld	b,a
	or	a,a
	jr	Z,00115$
;main.c:1283: cop[0].pause=levelParamCopFreezeBonus;
	ld	hl,#_levelParamCopFreezeBonus + 0
	ld	e,(hl)
	ld	hl,#0x000c + _cop
	ld	(hl),e
;main.c:1284: cop[1].pause=levelParamCopFreezeBonus;
	ld	hl,#0x0019 + _cop
	ld	(hl),e
;main.c:1285: cop[2].pause=levelParamCopFreezeBonus;
	ld	hl,#0x0026 + _cop
	ld	(hl),e
;main.c:1286: cop[3].pause=levelParamCopFreezeBonus;
	ld	hl,#0x0033 + _cop
	ld	(hl),e
00115$:
;main.c:1290: if (bonus.pattern==BONUS1) addScore(10);
	xor	a,a
	or	a,b
	jr	Z,00143$
	ld	a,#0x0A
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jp	00144$
00143$:
;main.c:1291: else if (bonus.pattern==BONUS2) addScore(20);
	ld	a,c
	sub	a,#0x34
	jr	NZ,00140$
	ld	a,#0x14
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jp	00144$
00140$:
;main.c:1292: else if (bonus.pattern==BONUS3) addScore(30);
	ld	a,c
	sub	a,#0x38
	jr	NZ,00137$
	ld	a,#0x1E
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00137$:
;main.c:1293: else if (bonus.pattern==BONUS4) addScore(50);
	ld	a,c
	sub	a,#0x3C
	jr	NZ,00134$
	ld	a,#0x32
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00134$:
;main.c:1294: else if (bonus.pattern==BONUS5) addScore(60);
	ld	a,c
	sub	a,#0x40
	jr	NZ,00131$
	ld	a,#0x3C
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00131$:
;main.c:1295: else if (bonus.pattern==BONUS6) addScore(70);
	ld	a,c
	sub	a,#0x44
	jr	NZ,00128$
	ld	a,#0x46
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00128$:
;main.c:1296: else if (bonus.pattern==BONUS7) addScore(100);
	ld	a,c
	sub	a,#0x48
	jr	NZ,00125$
	ld	a,#0x64
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00125$:
;main.c:1297: else if (bonus.pattern==BONUS8) addScore(150);
	ld	a,c
	sub	a,#0x4C
	jr	NZ,00122$
	ld	a,#0x96
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00122$:
;main.c:1298: else if (bonus.pattern==BONUS9) addScore(200);
	ld	a,c
	sub	a,#0x50
	jr	NZ,00119$
	ld	a,#0xC8
	push	af
	inc	sp
	call	_addScore
	inc	sp
	jr	00144$
00119$:
;main.c:1299: else if (bonus.pattern==BONUS10) addScore(500);	
	ld	a,c
	sub	a,#0x54
	jr	NZ,00144$
	ld	a,#0xF4
	push	af
	inc	sp
	call	_addScore
	inc	sp
00144$:
;main.c:1302: startsfxPrio(sfx_bonus);
	ld	hl,#_sfx_bonus
	push	hl
	call	_startsfxPrio
	pop	af
;main.c:1303: desactivateBonus();
	call	_desactivateBonus
	ret
_checkPlayerGameCollisions_end::
;main.c:1310: void renderSprite()
;	---------------------------------
; Function renderSprite
; ---------------------------------
_renderSprite_start::
_renderSprite:
;main.c:1312: sprites[SPRITE0].x = player.px;
	ld	a,(#_player)
	ld	(#0x0001 + _sprites),a
;main.c:1313: sprites[SPRITE0].y = player.py;		
	ld	hl,#0x0001 + _player
	ld	c,(hl)
	ld	hl,#_sprites
	ld	(hl),c
;main.c:1314: sprites[SPRITE0].pattern = player.pattern1;
	ld	a,(#0x0007 + _player)
	ld	(#0x0002 + _sprites),a
;main.c:1315: sprites[SPRITE0].colour = player.colour1;
	ld	a,(#0x0009 + _player)
	ld	(#0x0003 + _sprites),a
;main.c:1317: sprites[SPRITE1].x = player.px;
	ld	a,(#_player)
	ld	hl,#0x007d + _sprites
	ld	(hl),a
;main.c:1318: sprites[SPRITE1].y = player.py;		
	dec	hl
	ld	(hl),c
;main.c:1319: sprites[SPRITE1].pattern = player.pattern2;
	ld	a,(#0x0008 + _player)
	ld	(#0x007e + _sprites),a
;main.c:1320: sprites[SPRITE1].colour = player.colour2;
	ld	a,(#0x000a + _player)
	ld	(#0x007f + _sprites),a
	ret
_renderSprite_end::
;main.c:1323: void initPlayer(void)
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer_start::
_initPlayer:
;main.c:1325: player.px = 21*8;
	ld	hl,#_player
	ld	(hl),#0xA8
;main.c:1326: player.py = 21*8;
	ld	hl,#0x0001 + _player
	ld	(hl),#0xA8
;main.c:1327: player.cx = 21;
	inc	hl
	ld	(hl),#0x15
;main.c:1328: player.cy = 21;
	inc	hl
	ld	(hl),#0x15
;main.c:1329: player.oldcx = 0;
	inc	hl
	ld	(hl),#0x00
;main.c:1330: player.oldcy = 0;
	inc	hl
	ld	(hl),#0x00
;main.c:1331: player.regard = GAUCHE;
	ld	hl,#0x000d + _player
	ld	(hl),#0x02
;main.c:1332: player.lastMvt = HORIZONTAL;
	ld	hl,#0x001e + _player
	ld	(hl),#0x00
;main.c:1333: player.oldDirection=STOP;
	ld	hl,#0x000b + _player
	ld	(hl),#0x04
;main.c:1334: player.direction=STOP;
	inc	hl
	ld	(hl),#0x04
;main.c:1335: player.nbpills=0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;main.c:1336: player.lastDoor1Cx=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1337: player.lastDoor1Cy=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1338: player.lastDoor2Cx=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1339: player.lastDoor2Cy=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1341: player.doorOpen = NOK;
	ld	hl,#0x0006 + _player
	ld	(hl),#0x01
;main.c:1344: player.nbPillsLevel = 0;
	ld	hl,#0x0019 + _player
	ld	(hl),#0x00
;main.c:1345: player.nbMoveForBonus = 0;
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:1347: player.pause=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1349: player.currentAnim=0;
	ld	hl,#0x001f + _player
	ld	(hl),#0x00
;main.c:1351: player.pattern1=120;
	ld	hl,#0x0007 + _player
	ld	(hl),#0x78
;main.c:1352: player.pattern2=28;
	inc	hl
	ld	(hl),#0x1C
;main.c:1353: player.colour1=7;
	inc	hl
	ld	(hl),#0x07
;main.c:1354: player.colour2=6;
	inc	hl
	ld	(hl),#0x06
	ret
_initPlayer_end::
;main.c:1358: void reInitPlayer(void)
;	---------------------------------
; Function reInitPlayer
; ---------------------------------
_reInitPlayer_start::
_reInitPlayer:
;main.c:1360: player.px = 21*8;
	ld	hl,#_player
	ld	(hl),#0xA8
;main.c:1361: player.py = 21*8;
	ld	hl,#0x0001 + _player
	ld	(hl),#0xA8
;main.c:1362: player.cx = 21;
	inc	hl
	ld	(hl),#0x15
;main.c:1363: player.cy = 21;
	inc	hl
	ld	(hl),#0x15
;main.c:1364: player.oldcx = 0;
	inc	hl
	ld	(hl),#0x00
;main.c:1365: player.oldcy = 0;
	inc	hl
	ld	(hl),#0x00
;main.c:1366: player.regard = GAUCHE;
	ld	hl,#0x000d + _player
	ld	(hl),#0x02
;main.c:1367: player.lastMvt = HORIZONTAL;
	ld	hl,#0x001e + _player
	ld	(hl),#0x00
;main.c:1368: player.oldDirection=STOP;
	ld	hl,#0x000b + _player
	ld	(hl),#0x04
;main.c:1369: player.direction=STOP;
	inc	hl
	ld	(hl),#0x04
;main.c:1370: player.nbpills=0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;main.c:1371: player.lastDoor1Cx=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1372: player.lastDoor1Cy=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1373: player.lastDoor2Cx=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1374: player.lastDoor2Cy=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1379: player.nbMoveForBonus = 0;
	ld	hl,#0x001a + _player
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:1381: player.pause=0;
	inc	hl
	ld	(hl),#0x00
;main.c:1382: player.currentAnim=0;
	ld	hl,#0x001f + _player
	ld	(hl),#0x00
;main.c:1384: player.pattern1=120;
	ld	hl,#0x0007 + _player
	ld	(hl),#0x78
;main.c:1385: player.pattern2=28;
	inc	hl
	ld	(hl),#0x1C
;main.c:1386: player.colour1=7;
	inc	hl
	ld	(hl),#0x07
;main.c:1387: player.colour2=6;
	inc	hl
	ld	(hl),#0x06
	ret
_reInitPlayer_end::
;main.c:1390: void initCop(byte c)
;	---------------------------------
; Function initCop
; ---------------------------------
_initCop_start::
_initCop:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;main.c:1392: if (c==0)
	xor	a,a
	or	a,4 (ix)
	jr	NZ,00110$
;main.c:1395: cop[c].px = 27<<3;
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(_cop)
	ld	e,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	d,a
	ld	a,#0xD8
	ld	(de),a
;main.c:1396: cop[c].py = 9<<3;
	ld	a,#<(_cop)
	add	a,c
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	b, a
	ld	e, c
	ld	d, a
	inc	de
	ld	a,#0x48
	ld	(de),a
;main.c:1397: cop[c].targetx = 5;
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	a,#0x05
	ld	(de),a
;main.c:1398: cop[c].targety = 1;
	ld	hl,#0x0005
	add	hl,bc
	ex	de,hl
	ld	a,#0x01
	ld	(de),a
;main.c:1399: cop[c].pattern1 = 0;
	ld	hl,#0x0006
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;main.c:1400: cop[c].col = 6;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0x06
	ld	(de),a
;main.c:1401: cop[c].direction = GAUCHE;
	ld	hl,#0x0007
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
;main.c:1402: cop[c].regard = GAUCHE;
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
;main.c:1403: cop[c].sprno = SPRITE2;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x01
	ld	(de),a
;main.c:1404: cop[c].pause=levelParamCop0FreezeStart;
	ld	hl,#0x000C
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#_levelParamCop0FreezeStart + 0)
	ld	(bc),a
	jp	00111$
00110$:
;main.c:1406: if (c==1)
	ld	a,4 (ix)
	sub	a,#0x01
	jr	NZ,00107$
;main.c:1409: cop[c].px = 27<<3;
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(_cop)
	ld	e,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	d,a
	ld	a,#0xD8
	ld	(de),a
;main.c:1410: cop[c].py = 13<<3;
	ld	a,#<(_cop)
	add	a,c
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	b, a
	ld	e, c
	ld	d, a
	inc	de
	ld	a,#0x68
	ld	(de),a
;main.c:1411: cop[c].pattern1 = 12;
	ld	hl,#0x0006
	add	hl,bc
	ex	de,hl
	ld	a,#0x0C
	ld	(de),a
;main.c:1412: cop[c].col = 7;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0x07
	ld	(de),a
;main.c:1413: cop[c].direction = GAUCHE;
	ld	hl,#0x0007
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
;main.c:1414: cop[c].regard = GAUCHE;
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
;main.c:1415: cop[c].sprno = SPRITE3;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x1E
	ld	(de),a
;main.c:1416: cop[c].pause=levelParamCop1FreezeStart;
	ld	hl,#0x000C
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#_levelParamCop1FreezeStart + 0)
	ld	(bc),a
	jp	00111$
00107$:
;main.c:1418: if (c==2)
	ld	a,4 (ix)
	sub	a,#0x02
	jr	NZ,00104$
;main.c:1421: cop[c].px = 3<<3;
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(_cop)
	ld	e,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	d,a
	ld	a,#0x18
	ld	(de),a
;main.c:1422: cop[c].py = 9<<3;
	ld	a,#<(_cop)
	add	a,c
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	b, a
	ld	e, c
	ld	d, a
	inc	de
	ld	a,#0x48
	ld	(de),a
;main.c:1423: cop[c].pattern1 = 12;
	ld	hl,#0x0006
	add	hl,bc
	ex	de,hl
	ld	a,#0x0C
	ld	(de),a
;main.c:1424: cop[c].col = 2;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
;main.c:1425: cop[c].direction = DROITE;
	ld	hl,#0x0007
	add	hl,bc
	ex	de,hl
	ld	a,#0x03
	ld	(de),a
;main.c:1426: cop[c].regard = DROITE;
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	a,#0x03
	ld	(de),a
;main.c:1427: cop[c].sprno = SPRITE4;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
;main.c:1428: cop[c].pause=levelParamCop2FreezeStart;
	ld	hl,#0x000C
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#_levelParamCop2FreezeStart + 0)
	ld	(bc),a
	jr	00111$
00104$:
;main.c:1430: if (c==3)
	ld	a,4 (ix)
	sub	a,#0x03
	jr	NZ,00111$
;main.c:1433: cop[c].px = 3<<3;
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(_cop)
	ld	e,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	d,a
	ld	a,#0x18
	ld	(de),a
;main.c:1434: cop[c].py = 13<<3;
	ld	a,#<(_cop)
	add	a,c
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	b, a
	ld	e, c
	ld	d, a
	inc	de
	ld	a,#0x68
	ld	(de),a
;main.c:1435: cop[c].pattern1 = 0;
	ld	hl,#0x0006
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;main.c:1436: cop[c].col = 13;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0x0D
	ld	(de),a
;main.c:1437: cop[c].direction = DROITE;
	ld	hl,#0x0007
	add	hl,bc
	ex	de,hl
	ld	a,#0x03
	ld	(de),a
;main.c:1438: cop[c].regard = DROITE;
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	a,#0x03
	ld	(de),a
;main.c:1439: cop[c].sprno = SPRITE5;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x1D
	ld	(de),a
;main.c:1440: cop[c].pause=levelParamCop3FreezeStart;
	ld	hl,#0x000C
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#_levelParamCop3FreezeStart + 0)
	ld	(bc),a
00111$:
;main.c:1443: cop[c].cx = cop[c].px >> 3;
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_cop)
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,(bc)
	ld	e,a
	srl	e
	srl	e
	srl	e
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
;main.c:1444: cop[c].cy = cop[c].py >> 3;
	ld	hl,#0x0003
	add	hl,bc
	ex	de,hl
	inc	bc
	ld	a,(bc)
	srl	a
	srl	a
	srl	a
	ld	(de),a
	ld	sp,ix
	pop	ix
	ret
_initCop_end::
;main.c:1449: byte moveCop0()
;	---------------------------------
; Function moveCop0
; ---------------------------------
_moveCop0_start::
_moveCop0:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;main.c:1455: s_cop *mycop_0 = &cop[0];	
;main.c:1456: byte *cop_0_py = &mycop_0->py;
;main.c:1457: byte *cop_0_px = &mycop_0->px;
;main.c:1458: byte *cop_0_direction = &mycop_0->direction;
;main.c:1459: byte *cop_0_targetx = &mycop_0->targetx;
;main.c:1460: byte *cop_0_targety = &mycop_0->targety;
;main.c:1461: byte *cop_0_lastMvt = &mycop_0->lastMvt;
;main.c:1462: byte *cop_0_regard = &mycop_0->regard;
;main.c:1463: byte *cop_0_pattern1 = &mycop_0->pattern1;
;main.c:1464: byte *cop_0_cy = &mycop_0->cy;
;main.c:1465: byte *cop_0_cx = &mycop_0->cx;	
;main.c:1466: byte *cop_0_pause = &mycop_0->pause;
;main.c:1468: if ((*cop_0_pause)>0) {(*cop_0_pause)--;return OK;}
	ld	hl,#0x000c + _cop
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00102$
	ld	a,l
	dec	a
	ld	(#0x000c + _cop),a
	ld	l,#0x00
	jp	00158$
00102$:
;main.c:1471: movOk = NOK;
	ld	c,#0x01
;main.c:1472: directionDesiree = (*cop_0_direction);
	ld	hl,#0x0007 + _cop
	ld	b,(hl)
	ld	e,b
;main.c:1476: if ( (((*cop_0_px) % 8)==0)&& (((*cop_0_py) % 8)==0) )
	ld	a,(#_cop)
	and	a,#0x07
	jp	NZ,00124$
	ld	a,(#0x0001 + _cop)
	and	a,#0x07
	jp	NZ,00124$
;main.c:1478: if (scatterModeTimer==0)
	ld	iy,#_scatterModeTimer
	ld	a,0 (iy)
	or	a,1 (iy)
	jr	NZ,00104$
;main.c:1480: playercx = player.px>>3;
	ld	a,(#_player)
	srl	a
	srl	a
	srl	a
	ld	-1 (ix),a
;main.c:1481: playercy = player.py>>3;
	ld	hl,#0x0001 + _player
	ld	d, (hl)
	srl	d
	srl	d
	srl	d
;main.c:1483: (*cop_0_targetx) = playercx;
	ld	hl,#0x0004 + _cop
	ld	a,-1 (ix)
	ld	(hl),a
;main.c:1484: (*cop_0_targety) = playercy;
	inc	hl
	ld	(hl),d
	jr	00105$
00104$:
;main.c:1487: (*cop_0_targetx) = 25;
	ld	hl,#0x0004 + _cop
	ld	(hl),#0x19
;main.c:1488: (*cop_0_targety) = 21;
	inc	hl
	ld	(hl),#0x15
00105$:
;main.c:1491: if ( ((*cop_0_targety)<(*cop_0_cy)) && ((*cop_0_direction)!=BAS) /*&& (haut==OK)*/ ) // Le joueur est au dessus de nous.
	ld	hl,#0x0005 + _cop
	ld	d,(hl)
	dec	hl
	dec	hl
	ld	a,(hl)
	ld	-2 (ix),a
	ld	a,d
	sub	a,-2 (ix)
	jr	NC,00118$
	ld	a,b
	sub	a,#0x01
	jr	Z,00118$
;main.c:1493: directionDesiree = HAUT;
	ld	e,#0x00
	jr	00119$
00118$:
;main.c:1496: if ( ((*cop_0_targetx)<(*cop_0_cx)) && ((*cop_0_direction)!=DROITE) /*&& (gauche==OK)*/ )
	ld	hl,#0x0004 + _cop
	ld	a,(hl)
	ld	-3 (ix),a
	dec	hl
	dec	hl
	ld	l,(hl)
	ld	a,-3 (ix)
	sub	a,l
	jr	NC,00114$
	ld	a,b
	sub	a,#0x03
	jr	Z,00114$
;main.c:1498: directionDesiree = GAUCHE;
	ld	e,#0x02
	jr	00119$
00114$:
;main.c:1501: if ( ((*cop_0_targety)>(*cop_0_cy)) && ((*cop_0_direction)!=HAUT) /*&& (bas==OK)*/ )
	ld	a,-2 (ix)
	sub	a,d
	jr	NC,00110$
	xor	a,a
	or	a,b
	jr	Z,00110$
;main.c:1503: directionDesiree = BAS;
	ld	e,#0x01
	jr	00119$
00110$:
;main.c:1506: if ( ((*cop_0_targetx)>(*cop_0_cx)) && ((*cop_0_direction)!=GAUCHE) )
	ld	a,l
	sub	a,-3 (ix)
	jr	NC,00119$
	ld	a,b
	sub	a,#0x02
	jr	Z,00119$
;main.c:1508: directionDesiree = DROITE;
	ld	e,#0x03
00119$:
;main.c:1511: if (isCopDirectionFree(0,directionDesiree)==OK) 
	push	bc
	push	de
	ld	d, e
	ld	e,#0x00
	push	de
	call	_isCopDirectionFree
	pop	af
	pop	de
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00124$
;main.c:1513: (*cop_0_direction) = directionDesiree;
	ld	hl,#0x0007 + _cop
	ld	(hl),e
00124$:
;main.c:1518: if ( ((*cop_0_direction)==HAUT) && isCopDirectionFree(0,HAUT)==OK ) 
	ld	a,(#0x0007 + _cop)
	or	a,a
	jr	NZ,00142$
	push	bc
	ld	hl,#0x0000
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00142$
;main.c:1520: (*cop_0_py)--;
	ld	a,(#0x0001 + _cop)
	dec	a
	ld	(#0x0001 + _cop),a
;main.c:1521: (*cop_0_lastMvt) = VERTICAL;
	ld	hl,#0x000b + _cop
	ld	(hl),#0x01
;main.c:1522: movOk = OK;
	ld	c,#0x00
	jp	00143$
00142$:
;main.c:1525: if ( ((*cop_0_direction)==BAS) && isCopDirectionFree(0,BAS)==OK ) 
	ld	a,(#0x0007 + _cop)
	sub	a,#0x01
	jr	NZ,00138$
	push	bc
	ld	hl,#0x0100
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00138$
;main.c:1527: (*cop_0_py)++;
	ld	a,(#0x0001 + _cop)
	inc	a
	ld	(#0x0001 + _cop),a
;main.c:1528: (*cop_0_lastMvt) = VERTICAL;
	ld	hl,#0x000b + _cop
	ld	(hl),#0x01
;main.c:1529: movOk = OK;
	ld	c,#0x00
	jr	00143$
00138$:
;main.c:1532: if ( ((*cop_0_direction)==GAUCHE) && isCopDirectionFree(0,GAUCHE)==OK ) 
	ld	a,(#0x0007 + _cop)
	sub	a,#0x02
	jr	NZ,00134$
	push	bc
	ld	hl,#0x0200
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00134$
;main.c:1534: (*cop_0_px)--;
	ld	a,(#_cop)
	dec	a
	ld	(#_cop),a
;main.c:1535: (*cop_0_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + _cop
	ld	(hl),#0x00
;main.c:1536: if ((*cop_0_regard)==DROITE) (*cop_0_pattern1) = 0; // On passe le regard à gauche
	ld	a,(#0x0008 + _cop)
	sub	a,#0x03
	jr	NZ,00127$
	ld	hl,#0x0006 + _cop
	ld	(hl),#0x00
00127$:
;main.c:1537: (*cop_0_regard) = GAUCHE;
	ld	hl,#0x0008 + _cop
	ld	(hl),#0x02
;main.c:1538: movOk = OK;
	ld	c,#0x00
	jr	00143$
00134$:
;main.c:1541: if ( ((*cop_0_direction)==DROITE) && isCopDirectionFree(0,DROITE)==OK ) 
	ld	a,(#0x0007 + _cop)
	sub	a,#0x03
	jr	NZ,00143$
	push	bc
	ld	hl,#0x0300
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00143$
;main.c:1543: (*cop_0_px)++;
	ld	a,(#_cop)
	inc	a
	ld	(#_cop),a
;main.c:1544: (*cop_0_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + _cop
	ld	(hl),#0x00
;main.c:1545: if ((*cop_0_regard)==GAUCHE) (*cop_0_pattern1) = 12; // On passe le regard à droite
	ld	a,(#0x0008 + _cop)
	sub	a,#0x02
	jr	NZ,00129$
	ld	hl,#0x0006 + _cop
	ld	(hl),#0x0C
00129$:
;main.c:1546: (*cop_0_regard) = DROITE;
	ld	hl,#0x0008 + _cop
	ld	(hl),#0x03
;main.c:1547: movOk = OK;
	ld	c,#0x00
00143$:
;main.c:1550: if (((*cop_0_direction)==GAUCHE) && ((*cop_0_px)==8))
	ld	hl,#0x0007 + _cop
	ld	b,(hl)
	ld	a,b
	sub	a,#0x02
	jr	NZ,00153$
	ld	a,(#_cop)
	sub	a,#0x08
	jr	NZ,00153$
;main.c:1552: (*cop_0_px) = 240; //30<<3;
	ld	hl,#_cop
	ld	(hl),#0xF0
;main.c:1553: (*cop_0_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + _cop
	ld	(hl),#0x00
;main.c:1554: if ((*cop_0_regard)==DROITE) (*cop_0_pattern1) = 0; // On passe le regard à gauche
	ld	a,(#0x0008 + _cop)
	sub	a,#0x03
	jr	NZ,00146$
	ld	hl,#0x0006 + _cop
	ld	(hl),#0x00
00146$:
;main.c:1555: (*cop_0_regard) = GAUCHE;
	ld	hl,#0x0008 + _cop
	ld	(hl),#0x02
;main.c:1556: movOk = OK;
	ld	c,#0x00
	jr	00154$
00153$:
;main.c:1559: if (((*cop_0_direction)==DROITE) && ((*cop_0_px)==232))
	ld	a,b
	sub	a,#0x03
	jr	NZ,00154$
	ld	a,(#_cop)
	sub	a,#0xE8
	jr	NZ,00154$
;main.c:1561: (*cop_0_px) = 0;
	ld	hl,#_cop
	ld	(hl),#0x00
;main.c:1562: (*cop_0_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + _cop
	ld	(hl),#0x00
;main.c:1563: if ((*cop_0_regard)==GAUCHE) (*cop_0_pattern1) = 12; // On passe le regard à droite
	ld	a,(#0x0008 + _cop)
	sub	a,#0x02
	jr	NZ,00148$
	ld	hl,#0x0006 + _cop
	ld	(hl),#0x0C
00148$:
;main.c:1564: (*cop_0_regard) = DROITE;
	ld	hl,#0x0008 + _cop
	ld	(hl),#0x03
;main.c:1565: movOk = OK;
	ld	c,#0x00
00154$:
;main.c:1568: (*cop_0_cx) = (*cop_0_px) >> 3;
	ld	hl,#_cop
	ld	b, (hl)
	srl	b
	srl	b
	srl	b
	ld	hl,#0x0002 + _cop
	ld	(hl),b
;main.c:1569: (*cop_0_cy) = (*cop_0_py) >> 3;
	dec	hl
	ld	b, (hl)
	srl	b
	srl	b
	srl	b
	inc	hl
	inc	hl
	ld	(hl),b
;main.c:1571: if (movOk==NOK) (*cop_0_direction) = rnd_byte(0,3);
	ld	a,c
	sub	a,#0x01
	jr	NZ,00157$
	ld	hl,#0x0300
	push	hl
	call	_rnd_byte
	pop	af
	ld	c,l
	ld	hl,#0x0007 + _cop
	ld	(hl),c
00157$:
;main.c:1573: return OK;
	ld	l,#0x00
00158$:
	ld	sp,ix
	pop	ix
	ret
_moveCop0_end::
;main.c:1577: byte moveCop1()
;	---------------------------------
; Function moveCop1
; ---------------------------------
_moveCop1_start::
_moveCop1:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;main.c:1583: s_cop *mycop_1 = &cop[1];	
;main.c:1584: byte *cop_1_py = &mycop_1->py;
;main.c:1585: byte *cop_1_px = &mycop_1->px;
;main.c:1586: byte *cop_1_direction = &mycop_1->direction;
;main.c:1589: byte *cop_1_lastMvt = &mycop_1->lastMvt;
;main.c:1590: byte *cop_1_regard = &mycop_1->regard;
;main.c:1591: byte *cop_1_pattern1 = &mycop_1->pattern1;
;main.c:1592: byte *cop_1_cy = &mycop_1->cy;
;main.c:1593: byte *cop_1_cx = &mycop_1->cx;	
;main.c:1594: byte *cop_1_pause = &mycop_1->pause;
;main.c:1596: if ((*cop_1_pause)>0) {(*cop_1_pause)--;return OK;}
	ld	hl,#0x000c + 0x000d + _cop
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00102$
	ld	a,l
	dec	a
	ld	hl,#0x000c + 0x000d + _cop
	ld	(hl),a
	ld	l,#0x00
	jp	00155$
00102$:
;main.c:1598: movOk = NOK;
	ld	c,#0x01
;main.c:1599: directionDesiree = (*cop_1_direction);
	ld	hl,#0x0007 + 0x000d + _cop
	ld	b,(hl)
	ld	e,b
;main.c:1603: if ( (((*cop_1_px) % 8)==0)&& (((*cop_1_py) % 8)==0) )
	ld	a,(#0x000d + _cop)
	and	a,#0x07
	jr	NZ,00121$
	ld	hl,#0x0001 + 0x000d + _cop
	ld	a,(hl)
	and	a,#0x07
	jr	NZ,00121$
;main.c:1606: playercy = (player.py>>3) +8;
	ld	a,(#0x0001 + _player)
	srl	a
	srl	a
	srl	a
	add	a,#0x08
	ld	d,a
;main.c:1608: if ( (playercy<(*cop_1_cy)) && ((*cop_1_direction)!=BAS)) // Le joueur est au dessus de nous.
	ld	hl,#0x0003 + 0x000d + _cop
	ld	a,(hl)
	ld	-1 (ix),a
	ld	a,d
	sub	a,-1 (ix)
	jr	NC,00115$
	ld	a,b
	sub	a,#0x01
	jr	Z,00115$
;main.c:1610: directionDesiree = HAUT;
	ld	e,#0x00
	jr	00116$
00115$:
;main.c:1613: if ( (playercy<(*cop_1_cx)) && ((*cop_1_direction)!=DROITE))
	ld	hl,#0x0002 + 0x000d + _cop
	ld	l,(hl)
	ld	a,d
	sub	a,l
	jr	NC,00111$
	ld	a,b
	sub	a,#0x03
	jr	Z,00111$
;main.c:1615: directionDesiree = GAUCHE;
	ld	e,#0x02
	jr	00116$
00111$:
;main.c:1618: if ( (playercy>(*cop_1_cy)) && ((*cop_1_direction)!=HAUT))
	ld	a,-1 (ix)
	sub	a,d
	jr	NC,00107$
	xor	a,a
	or	a,b
	jr	Z,00107$
;main.c:1620: directionDesiree = BAS;
	ld	e,#0x01
	jr	00116$
00107$:
;main.c:1623: if ( (playercy>(*cop_1_cx)) && ((*cop_1_direction)!=GAUCHE))
	ld	a,l
	sub	a,d
	jr	NC,00116$
	ld	a,b
	sub	a,#0x02
	jr	Z,00116$
;main.c:1625: directionDesiree = DROITE;
	ld	e,#0x03
00116$:
;main.c:1628: if (isCopDirectionFree(1,directionDesiree)==OK) 
	push	bc
	push	de
	ld	d, e
	ld	e,#0x01
	push	de
	call	_isCopDirectionFree
	pop	af
	pop	de
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00121$
;main.c:1630: (*cop_1_direction) = directionDesiree;
	ld	hl,#0x0007 + 0x000d + _cop
	ld	(hl),e
00121$:
;main.c:1634: if ( ((*cop_1_direction)==HAUT) && isCopDirectionFree(1,HAUT)==OK ) 
	ld	hl,#0x0007 + 0x000d + _cop
	ld	a,(hl)
	or	a,a
	jr	NZ,00139$
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00139$
;main.c:1636: (*cop_1_py)--;
	ld	hl,#0x0001 + 0x000d + _cop
	ld	a, (hl)
	dec	a
	ld	hl,#0x0001 + 0x000d + _cop
	ld	(hl),a
;main.c:1637: (*cop_1_lastMvt) = VERTICAL;
	ld	hl,#0x000b + 0x000d + _cop
	ld	(hl),#0x01
;main.c:1638: movOk = OK;
	ld	c,#0x00
	jp	00140$
00139$:
;main.c:1641: if ( ((*cop_1_direction)==BAS) && isCopDirectionFree(1,BAS)==OK ) 
	ld	hl,#0x0007 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x01
	jr	NZ,00135$
	push	bc
	ld	hl,#0x0101
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00135$
;main.c:1643: (*cop_1_py)++;
	ld	hl,#0x0001 + 0x000d + _cop
	ld	a, (hl)
	inc	a
	ld	hl,#0x0001 + 0x000d + _cop
	ld	(hl),a
;main.c:1644: (*cop_1_lastMvt) = VERTICAL;
	ld	hl,#0x000b + 0x000d + _cop
	ld	(hl),#0x01
;main.c:1645: movOk = OK;
	ld	c,#0x00
	jr	00140$
00135$:
;main.c:1648: if ( ((*cop_1_direction)==GAUCHE) && isCopDirectionFree(1,GAUCHE)==OK ) 
	ld	hl,#0x0007 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00131$
	push	bc
	ld	hl,#0x0201
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00131$
;main.c:1650: (*cop_1_px)--;
	ld	a,(#0x000d + _cop)
	dec	a
	ld	(#0x000d + _cop),a
;main.c:1651: (*cop_1_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x000d + _cop
	ld	(hl),#0x00
;main.c:1652: if ((*cop_1_regard)==DROITE) (*cop_1_pattern1) = 0; // On passe le regard à gauche
	ld	hl,#0x0008 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00124$
	ld	hl,#0x0006 + 0x000d + _cop
	ld	(hl),#0x00
00124$:
;main.c:1653: (*cop_1_regard) = GAUCHE;
	ld	hl,#0x0008 + 0x000d + _cop
	ld	(hl),#0x02
;main.c:1654: movOk = OK;
	ld	c,#0x00
	jr	00140$
00131$:
;main.c:1657: if ( ((*cop_1_direction)==DROITE) && isCopDirectionFree(1,DROITE)==OK ) 
	ld	hl,#0x0007 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00140$
	push	bc
	ld	hl,#0x0301
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00140$
;main.c:1659: (*cop_1_px)++;
	ld	a,(#0x000d + _cop)
	inc	a
	ld	(#0x000d + _cop),a
;main.c:1660: (*cop_1_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x000d + _cop
	ld	(hl),#0x00
;main.c:1661: if ((*cop_1_regard)==GAUCHE) (*cop_1_pattern1) = 12; // On passe le regard à droite
	ld	hl,#0x0008 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00126$
	ld	hl,#0x0006 + 0x000d + _cop
	ld	(hl),#0x0C
00126$:
;main.c:1662: (*cop_1_regard) = DROITE;
	ld	hl,#0x0008 + 0x000d + _cop
	ld	(hl),#0x03
;main.c:1663: movOk = OK;
	ld	c,#0x00
00140$:
;main.c:1666: if (((*cop_1_direction)==GAUCHE) && ((*cop_1_px)==8))
	ld	hl,#0x0007 + 0x000d + _cop
	ld	b,(hl)
	ld	a,b
	sub	a,#0x02
	jr	NZ,00150$
	ld	a,(#0x000d + _cop)
	sub	a,#0x08
	jr	NZ,00150$
;main.c:1668: (*cop_1_px) = 240; //30<<3;
	ld	hl,#0x000d + _cop
	ld	(hl),#0xF0
;main.c:1669: (*cop_1_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x000d + _cop
	ld	(hl),#0x00
;main.c:1670: if ((*cop_1_regard)==DROITE) (*cop_1_pattern1) = 0; // On passe le regard à gauche
	ld	hl,#0x0008 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00143$
	ld	hl,#0x0006 + 0x000d + _cop
	ld	(hl),#0x00
00143$:
;main.c:1671: (*cop_1_regard) = GAUCHE;
	ld	hl,#0x0008 + 0x000d + _cop
	ld	(hl),#0x02
;main.c:1672: movOk = OK;
	ld	c,#0x00
	jr	00151$
00150$:
;main.c:1675: if (((*cop_1_direction)==DROITE) && ((*cop_1_px)==232))
	ld	a,b
	sub	a,#0x03
	jr	NZ,00151$
	ld	a,(#0x000d + _cop)
	sub	a,#0xE8
	jr	NZ,00151$
;main.c:1677: (*cop_1_px) = 0;
	ld	hl,#0x000d + _cop
	ld	(hl),#0x00
;main.c:1678: (*cop_1_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x000d + _cop
	ld	(hl),#0x00
;main.c:1679: if ((*cop_1_regard)==GAUCHE) (*cop_1_pattern1) = 12; // On passe le regard à droite
	ld	hl,#0x0008 + 0x000d + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00145$
	ld	hl,#0x0006 + 0x000d + _cop
	ld	(hl),#0x0C
00145$:
;main.c:1680: (*cop_1_regard) = DROITE;
	ld	hl,#0x0008 + 0x000d + _cop
	ld	(hl),#0x03
;main.c:1681: movOk = OK;
	ld	c,#0x00
00151$:
;main.c:1684: (*cop_1_cx) = (*cop_1_px) >> 3;
	ld	hl,#0x000d + _cop
	ld	b, (hl)
	srl	b
	srl	b
	srl	b
	ld	hl,#0x0002 + 0x000d + _cop
	ld	(hl),b
;main.c:1685: (*cop_1_cy) = (*cop_1_py) >> 3;
	dec	hl
	ld	b, (hl)
	srl	b
	srl	b
	srl	b
	inc	hl
	inc	hl
	ld	(hl),b
;main.c:1687: if (movOk==NOK) (*cop_1_direction) = rnd_byte(0,3);
	ld	a,c
	sub	a,#0x01
	jr	NZ,00154$
	ld	hl,#0x0300
	push	hl
	call	_rnd_byte
	pop	af
	ld	c,l
	ld	hl,#0x0007 + 0x000d + _cop
	ld	(hl),c
00154$:
;main.c:1689: return OK;
	ld	l,#0x00
00155$:
	ld	sp,ix
	pop	ix
	ret
_moveCop1_end::
;main.c:1693: byte moveCop2()
;	---------------------------------
; Function moveCop2
; ---------------------------------
_moveCop2_start::
_moveCop2:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;main.c:1698: s_cop *mycop_2 = &cop[2];	
;main.c:1699: byte *cop_2_py = &mycop_2->py;
;main.c:1700: byte *cop_2_px = &mycop_2->px;
;main.c:1701: byte *cop_2_direction = &mycop_2->direction;
;main.c:1702: byte *cop_2_targetx = &mycop_2->targetx;
;main.c:1703: byte *cop_2_targety = &mycop_2->targety;
;main.c:1704: byte *cop_2_lastMvt = &mycop_2->lastMvt;
;main.c:1705: byte *cop_2_regard = &mycop_2->regard;
;main.c:1706: byte *cop_2_pattern1 = &mycop_2->pattern1;
;main.c:1707: byte *cop_2_cy = &mycop_2->cy;
;main.c:1708: byte *cop_2_cx = &mycop_2->cx;	
;main.c:1709: byte *cop_2_pause = &mycop_2->pause;
;main.c:1711: if ((*cop_2_pause)>0) {(*cop_2_pause)--;return OK;}
	ld	hl,#0x000c + 0x001a + _cop
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00102$
	ld	a,l
	dec	a
	ld	hl,#0x000c + 0x001a + _cop
	ld	(hl),a
	ld	l,#0x00
	jp	00155$
00102$:
;main.c:1713: movOk = NOK;
	ld	c,#0x01
;main.c:1714: directionDesiree = (*cop_2_direction);
	ld	hl,#0x0007 + 0x001a + _cop
	ld	b, (hl)
;main.c:1718: if ( (((*cop_2_px) % 8)==0)&& (((*cop_2_py) % 8)==0) )
	ld	a,(#0x001a + _cop)
	and	a,#0x07
	jp	NZ,00121$
	ld	hl,#0x0001 + 0x001a + _cop
	ld	a,(hl)
	and	a,#0x07
	jp	NZ,00121$
;main.c:1720: (*cop_2_targetx) = rnd(0,32);
	push	bc
	ld	hl,#0x0020
	push	hl
	ld	l, #0x00
	push	hl
	call	_rnd
	pop	af
	pop	af
	pop	bc
	ld	a,l
	ld	hl,#0x0004 + 0x001a + _cop
	ld	(hl),a
;main.c:1721: (*cop_2_targety) = rnd(0,24);
	push	bc
	ld	hl,#0x0018
	push	hl
	ld	l, #0x00
	push	hl
	call	_rnd
	pop	af
	pop	af
	pop	bc
	ld	e,l
	ld	hl,#0x0005 + 0x001a + _cop
	ld	(hl),e
;main.c:1723: if ( ((*cop_2_targety)<=(*cop_2_cy)) && ((*cop_2_direction)!=BAS) /*&& (haut==OK)*/ ) // Le joueur est au dessus de nous.
	ld	d,(hl)
	dec	hl
	dec	hl
	ld	a,(hl)
	ld	-1 (ix), a
	sub	a,e
	jr	C,00115$
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x01
	jr	Z,00115$
;main.c:1725: directionDesiree = HAUT;
	ld	b,#0x00
	jr	00116$
00115$:
;main.c:1728: if ( ((*cop_2_targetx)<=(*cop_2_cx)) && ((*cop_2_direction)!=DROITE) /*&& (gauche==OK)*/ )
	ld	hl,#0x0004 + 0x001a + _cop
	ld	e,(hl)
	dec	hl
	dec	hl
	ld	a,(hl)
	ld	-2 (ix), a
	sub	a,e
	jr	C,00111$
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	Z,00111$
;main.c:1730: directionDesiree = GAUCHE;
	ld	b,#0x02
	jr	00116$
00111$:
;main.c:1733: if ( ((*cop_2_targety)>=(*cop_2_cy)) && ((*cop_2_direction)!=HAUT) /*&& (bas==OK)*/ )
	ld	a,d
	sub	a,-1 (ix)
	jr	C,00107$
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a,(hl)
	or	a,a
	jr	Z,00107$
;main.c:1735: directionDesiree = BAS;
	ld	b,#0x01
	jr	00116$
00107$:
;main.c:1738: if ( ((*cop_2_targetx)>=(*cop_2_cx)) && ((*cop_2_direction)!=GAUCHE) /*&& (droite==OK)*/ )
	ld	a,e
	sub	a,-2 (ix)
	jr	C,00116$
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	Z,00116$
;main.c:1740: directionDesiree = DROITE;
	ld	b,#0x03
00116$:
;main.c:1743: if (isCopDirectionFree(2,directionDesiree)==OK) 
	push	bc
	push	bc
	inc	sp
	ld	a,#0x02
	push	af
	inc	sp
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00121$
;main.c:1745: (*cop_2_direction) = directionDesiree;
	ld	hl,#0x0007 + 0x001a + _cop
	ld	(hl),b
00121$:
;main.c:1750: if ( ((*cop_2_direction)==HAUT) && isCopDirectionFree(2,HAUT)==OK ) 
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a,(hl)
	or	a,a
	jr	NZ,00139$
	push	bc
	ld	hl,#0x0002
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00139$
;main.c:1752: (*cop_2_py)--;
	ld	hl,#0x0001 + 0x001a + _cop
	ld	a, (hl)
	dec	a
	ld	hl,#0x0001 + 0x001a + _cop
	ld	(hl),a
;main.c:1753: (*cop_2_lastMvt) = VERTICAL;
	ld	hl,#0x000b + 0x001a + _cop
	ld	(hl),#0x01
;main.c:1754: movOk = OK;
	ld	c,#0x00
	jp	00140$
00139$:
;main.c:1757: if ( ((*cop_2_direction)==BAS) && isCopDirectionFree(2,BAS)==OK ) 
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x01
	jr	NZ,00135$
	push	bc
	ld	hl,#0x0102
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00135$
;main.c:1759: (*cop_2_py)++;
	ld	hl,#0x0001 + 0x001a + _cop
	ld	a, (hl)
	inc	a
	ld	hl,#0x0001 + 0x001a + _cop
	ld	(hl),a
;main.c:1760: (*cop_2_lastMvt) = VERTICAL;
	ld	hl,#0x000b + 0x001a + _cop
	ld	(hl),#0x01
;main.c:1761: movOk = OK;
	ld	c,#0x00
	jr	00140$
00135$:
;main.c:1764: if ( ((*cop_2_direction)==GAUCHE) && isCopDirectionFree(2,GAUCHE)==OK ) 
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00131$
	push	bc
	ld	hl,#0x0202
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00131$
;main.c:1766: (*cop_2_px)--;
	ld	a,(#0x001a + _cop)
	dec	a
	ld	(#0x001a + _cop),a
;main.c:1767: (*cop_2_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x001a + _cop
	ld	(hl),#0x00
;main.c:1768: if ((*cop_2_regard)==DROITE) (*cop_2_pattern1) = 0; // On passe le regard à gauche
	ld	hl,#0x0008 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00124$
	ld	hl,#0x0006 + 0x001a + _cop
	ld	(hl),#0x00
00124$:
;main.c:1769: (*cop_2_regard) = GAUCHE;
	ld	hl,#0x0008 + 0x001a + _cop
	ld	(hl),#0x02
;main.c:1770: movOk = OK;
	ld	c,#0x00
	jr	00140$
00131$:
;main.c:1773: if ( ((*cop_2_direction)==DROITE) && isCopDirectionFree(2,DROITE)==OK ) 
	ld	hl,#0x0007 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00140$
	push	bc
	ld	hl,#0x0302
	push	hl
	call	_isCopDirectionFree
	pop	af
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00140$
;main.c:1775: (*cop_2_px)++;
	ld	a,(#0x001a + _cop)
	inc	a
	ld	(#0x001a + _cop),a
;main.c:1776: (*cop_2_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x001a + _cop
	ld	(hl),#0x00
;main.c:1777: if ((*cop_2_regard)==GAUCHE) (*cop_2_pattern1) = 12; // On passe le regard à droite
	ld	hl,#0x0008 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00126$
	ld	hl,#0x0006 + 0x001a + _cop
	ld	(hl),#0x0C
00126$:
;main.c:1778: (*cop_2_regard) = DROITE;
	ld	hl,#0x0008 + 0x001a + _cop
	ld	(hl),#0x03
;main.c:1779: movOk = OK;
	ld	c,#0x00
00140$:
;main.c:1782: if (((*cop_2_direction)==GAUCHE) && ((*cop_2_px)==8))
	ld	hl,#0x0007 + 0x001a + _cop
	ld	b,(hl)
	ld	a,b
	sub	a,#0x02
	jr	NZ,00150$
	ld	a,(#0x001a + _cop)
	sub	a,#0x08
	jr	NZ,00150$
;main.c:1784: (*cop_2_px) = 240; //30<<3;
	ld	hl,#0x001a + _cop
	ld	(hl),#0xF0
;main.c:1785: (*cop_2_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x001a + _cop
	ld	(hl),#0x00
;main.c:1786: if ((*cop_2_regard)==DROITE) (*cop_2_pattern1) = 0; // On passe le regard à gauche
	ld	hl,#0x0008 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00143$
	ld	hl,#0x0006 + 0x001a + _cop
	ld	(hl),#0x00
00143$:
;main.c:1787: (*cop_2_regard) = GAUCHE;
	ld	hl,#0x0008 + 0x001a + _cop
	ld	(hl),#0x02
;main.c:1788: movOk = OK;
	ld	c,#0x00
	jr	00151$
00150$:
;main.c:1791: if (((*cop_2_direction)==DROITE) && ((*cop_2_px)==232))
	ld	a,b
	sub	a,#0x03
	jr	NZ,00151$
	ld	a,(#0x001a + _cop)
	sub	a,#0xE8
	jr	NZ,00151$
;main.c:1793: (*cop_2_px) = 0;
	ld	hl,#0x001a + _cop
	ld	(hl),#0x00
;main.c:1794: (*cop_2_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x001a + _cop
	ld	(hl),#0x00
;main.c:1795: if ((*cop_2_regard)==GAUCHE) (*cop_2_pattern1) = 12; // On passe le regard à droite
	ld	hl,#0x0008 + 0x001a + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00145$
	ld	hl,#0x0006 + 0x001a + _cop
	ld	(hl),#0x0C
00145$:
;main.c:1796: (*cop_2_regard) = DROITE;
	ld	hl,#0x0008 + 0x001a + _cop
	ld	(hl),#0x03
;main.c:1797: movOk = OK;
	ld	c,#0x00
00151$:
;main.c:1800: (*cop_2_cx) = (*cop_2_px) >> 3;
	ld	hl,#0x001a + _cop
	ld	b, (hl)
	srl	b
	srl	b
	srl	b
	ld	hl,#0x0002 + 0x001a + _cop
	ld	(hl),b
;main.c:1801: (*cop_2_cy) = (*cop_2_py) >> 3;
	dec	hl
	ld	b, (hl)
	srl	b
	srl	b
	srl	b
	inc	hl
	inc	hl
	ld	(hl),b
;main.c:1803: if (movOk==NOK) (*cop_2_direction) = rnd_byte(0,3);
	ld	a,c
	sub	a,#0x01
	jr	NZ,00154$
	ld	hl,#0x0300
	push	hl
	call	_rnd_byte
	pop	af
	ld	c,l
	ld	hl,#0x0007 + 0x001a + _cop
	ld	(hl),c
00154$:
;main.c:1805: return OK;
	ld	l,#0x00
00155$:
	ld	sp,ix
	pop	ix
	ret
_moveCop2_end::
;main.c:1809: byte moveCop3()
;	---------------------------------
; Function moveCop3
; ---------------------------------
_moveCop3_start::
_moveCop3:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;main.c:1815: s_cop *mycop_3 = &cop[3];	
;main.c:1816: byte *cop_3_py = &mycop_3->py;
;main.c:1817: byte *cop_3_px = &mycop_3->px;
;main.c:1818: byte *cop_3_direction = &mycop_3->direction;
;main.c:1819: byte *cop_3_targetx = &mycop_3->targetx;
;main.c:1820: byte *cop_3_targety = &mycop_3->targety;
;main.c:1821: byte *cop_3_lastMvt = &mycop_3->lastMvt;
;main.c:1822: byte *cop_3_regard = &mycop_3->regard;
;main.c:1823: byte *cop_3_pattern1 = &mycop_3->pattern1;
;main.c:1824: byte *cop_3_cy = &mycop_3->cy;
;main.c:1825: byte *cop_3_cx = &mycop_3->cx;	
;main.c:1826: byte *cop_3_pause = &mycop_3->pause;
;main.c:1828: if ((*cop_3_pause)>0) {(*cop_3_pause)--;return OK;}
	ld	hl,#0x000c + 0x0027 + _cop
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00102$
	ld	a,l
	dec	a
	ld	hl,#0x000c + 0x0027 + _cop
	ld	(hl),a
	ld	l,#0x00
	jp	00178$
00102$:
;main.c:1830: movOk = NOK;
	ld	-1 (ix),#0x01
;main.c:1831: directionDesiree = (*cop_3_direction);
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	b,(hl)
	ld	e,b
;main.c:1835: if ( (((*cop_3_px) % 8)==0)&& (((*cop_3_py) % 8)==0) )
	ld	a,(#0x0027 + _cop)
	and	a,#0x07
	jp	NZ,00144$
	ld	hl,#0x0001 + 0x0027 + _cop
	ld	a,(hl)
	and	a,#0x07
	jp	NZ,00144$
;main.c:1837: if (scatterModeTimer==0)
	ld	iy,#_scatterModeTimer
	ld	a,0 (iy)
	or	a,1 (iy)
	jp	NZ,00124$
;main.c:1839: playercx = player.px>>3;
	ld	hl,#_player
	ld	d, (hl)
	srl	d
	srl	d
	srl	d
;main.c:1840: playercy = player.py>>3;
	ld	hl,#0x0001 + _player
	ld	c, (hl)
	srl	c
	srl	c
	srl	c
;main.c:1842: if (player.direction==HAUT)
	ld	a,(#0x000c + _player)
	ld	-2 (ix),a
	xor	a,a
	or	a,-2 (ix)
	jr	NZ,00121$
;main.c:1844: (*cop_3_targetx) = playercx;
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),d
;main.c:1845: if ((playercy) >= 4)
;main.c:1846: (*cop_3_targety) = playercy - 4;
	ld	a,c
	cp	a,#0x04
	jr	C,00104$
	add	a,#0xFC
	inc	hl
	ld	(hl),a
	jr	00125$
00104$:
;main.c:1848: (*cop_3_targety) = 0;
	ld	hl,#0x0005 + 0x0027 + _cop
	ld	(hl),#0x00
	jr	00125$
00121$:
;main.c:1851: if (player.direction==GAUCHE)
	ld	a,-2 (ix)
	sub	a,#0x02
	jr	NZ,00118$
;main.c:1853: if (playercx >= 4)
;main.c:1854: (*cop_3_targetx) = playercx - 4;
	ld	a,d
	cp	a,#0x04
	jr	C,00107$
	add	a,#0xFC
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),a
	jr	00108$
00107$:
;main.c:1856: (*cop_3_targetx) = 0;
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),#0x00
00108$:
;main.c:1858: (*cop_3_targety) = playercy;
	ld	hl,#0x0005 + 0x0027 + _cop
	ld	(hl),c
	jr	00125$
00118$:
;main.c:1861: if (player.direction==BAS)
	ld	a,-2 (ix)
	sub	a,#0x01
	jr	NZ,00115$
;main.c:1863: (*cop_3_targetx) = playercx;
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),d
;main.c:1864: (*cop_3_targety) = playercy + 4;
	ld	a,c
	add	a,#0x04
	inc	hl
	ld	(hl),a
	jr	00125$
00115$:
;main.c:1868: if (player.direction==DROITE)
	ld	a,-2 (ix)
	sub	a,#0x03
	jr	NZ,00112$
;main.c:1870: (*cop_3_targetx) = playercx+4;
	ld	a,d
	add	a,#0x04
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),a
;main.c:1871: (*cop_3_targety) = playercy;
	inc	hl
	ld	(hl),c
	jr	00125$
00112$:
;main.c:1874: if (player.direction==STOP)
	ld	a,-2 (ix)
	sub	a,#0x04
	jr	NZ,00125$
;main.c:1876: (*cop_3_targetx) = playercx;
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),d
;main.c:1877: (*cop_3_targety) = playercy;
	inc	hl
	ld	(hl),c
	jr	00125$
00124$:
;main.c:1882: (*cop_3_targetx) = 25;
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	(hl),#0x19
;main.c:1883: (*cop_3_targety) = 1;
	inc	hl
	ld	(hl),#0x01
00125$:
;main.c:1885: if ( ((*cop_3_targety)<(*cop_3_cy)) && ((*cop_3_direction)!=BAS)) // Le joueur est au dessus de nous.
	ld	hl,#0x0005 + 0x0027 + _cop
	ld	c,(hl)
	dec	hl
	dec	hl
	ld	d,(hl)
	ld	a,c
	sub	a,d
	jr	NC,00138$
	ld	a,b
	sub	a,#0x01
	jr	Z,00138$
;main.c:1887: directionDesiree = HAUT;
	ld	e,#0x00
	jr	00139$
00138$:
;main.c:1890: if ( ((*cop_3_targetx)<(*cop_3_cx)) && ((*cop_3_direction)!=DROITE))
	ld	hl,#0x0004 + 0x0027 + _cop
	ld	a,(hl)
	ld	-2 (ix),a
	dec	hl
	dec	hl
	ld	l,(hl)
	ld	a,-2 (ix)
	sub	a,l
	jr	NC,00134$
	ld	a,b
	sub	a,#0x03
	jr	Z,00134$
;main.c:1892: directionDesiree = GAUCHE;
	ld	e,#0x02
	jr	00139$
00134$:
;main.c:1895: if ( ((*cop_3_targety)>(*cop_3_cy)) && ((*cop_3_direction)!=HAUT))
	ld	a,d
	sub	a,c
	jr	NC,00130$
	xor	a,a
	or	a,b
	jr	Z,00130$
;main.c:1897: directionDesiree = BAS;
	ld	e,#0x01
	jr	00139$
00130$:
;main.c:1900: if ( ((*cop_3_targetx)>(*cop_3_cx)) && ((*cop_3_direction)!=GAUCHE))
	ld	a,l
	sub	a,-2 (ix)
	jr	NC,00139$
	ld	a,b
	sub	a,#0x02
	jr	Z,00139$
;main.c:1902: directionDesiree = DROITE;
	ld	e,#0x03
00139$:
;main.c:1905: if (isCopDirectionFree(3,directionDesiree)==OK) 
	push	de
	ld	d, e
	ld	e,#0x03
	push	de
	call	_isCopDirectionFree
	pop	af
	pop	de
	xor	a,a
	or	a,l
	jr	NZ,00144$
;main.c:1907: (*cop_3_direction) = directionDesiree;
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	(hl),e
00144$:
;main.c:1912: if ( ((*cop_3_direction)==HAUT) && isCopDirectionFree(3,HAUT)==OK ) 
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	a,(hl)
	or	a,a
	jr	NZ,00162$
	ld	hl,#0x0003
	push	hl
	call	_isCopDirectionFree
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00162$
;main.c:1914: (*cop_3_py)--;
	ld	hl,#0x0001 + 0x0027 + _cop
	ld	a, (hl)
	dec	a
	ld	hl,#0x0001 + 0x0027 + _cop
	ld	(hl),a
;main.c:1915: (*cop_3_lastMvt) = VERTICAL;
	ld	hl,#0x000b + 0x0027 + _cop
	ld	(hl),#0x01
;main.c:1916: movOk = OK;
	ld	-1 (ix),#0x00
	jp	00163$
00162$:
;main.c:1919: if ( ((*cop_3_direction)==BAS) && isCopDirectionFree(3,BAS)==OK ) 
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x01
	jr	NZ,00158$
	ld	hl,#0x0103
	push	hl
	call	_isCopDirectionFree
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00158$
;main.c:1921: (*cop_3_py)++;
	ld	hl,#0x0001 + 0x0027 + _cop
	ld	a, (hl)
	inc	a
	ld	hl,#0x0001 + 0x0027 + _cop
	ld	(hl),a
;main.c:1922: (*cop_3_lastMvt) = VERTICAL;
	ld	hl,#0x000b + 0x0027 + _cop
	ld	(hl),#0x01
;main.c:1923: movOk = OK;
	ld	-1 (ix),#0x00
	jr	00163$
00158$:
;main.c:1926: if ( ((*cop_3_direction)==GAUCHE) && isCopDirectionFree(3,GAUCHE)==OK ) 
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00154$
	ld	hl,#0x0203
	push	hl
	call	_isCopDirectionFree
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00154$
;main.c:1928: (*cop_3_px)--;
	ld	a,(#0x0027 + _cop)
	dec	a
	ld	(#0x0027 + _cop),a
;main.c:1929: (*cop_3_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x0027 + _cop
	ld	(hl),#0x00
;main.c:1930: if ((*cop_3_regard)==DROITE) (*cop_3_pattern1) = 0; // On passe le regard à gauche
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00147$
	ld	hl,#0x0006 + 0x0027 + _cop
	ld	(hl),#0x00
00147$:
;main.c:1931: (*cop_3_regard) = GAUCHE;
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	(hl),#0x02
;main.c:1932: movOk = OK;
	ld	-1 (ix),#0x00
	jr	00163$
00154$:
;main.c:1935: if ( ((*cop_3_direction)==DROITE) && isCopDirectionFree(3,DROITE)==OK ) 
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00163$
	ld	hl,#0x0303
	push	hl
	call	_isCopDirectionFree
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00163$
;main.c:1937: (*cop_3_px)++;
	ld	a,(#0x0027 + _cop)
	inc	a
	ld	(#0x0027 + _cop),a
;main.c:1938: (*cop_3_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x0027 + _cop
	ld	(hl),#0x00
;main.c:1939: if ((*cop_3_regard)==GAUCHE) (*cop_3_pattern1) = 12; // On passe le regard à droite
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00149$
	ld	hl,#0x0006 + 0x0027 + _cop
	ld	(hl),#0x0C
00149$:
;main.c:1940: (*cop_3_regard) = DROITE;
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	(hl),#0x03
;main.c:1941: movOk = OK;
	ld	-1 (ix),#0x00
00163$:
;main.c:1944: if (((*cop_3_direction)==GAUCHE) && ((*cop_3_px)==8))
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	c,(hl)
	ld	a,c
	sub	a,#0x02
	jr	NZ,00173$
	ld	a,(#0x0027 + _cop)
	sub	a,#0x08
	jr	NZ,00173$
;main.c:1946: (*cop_3_px) = 240;
	ld	hl,#0x0027 + _cop
	ld	(hl),#0xF0
;main.c:1947: (*cop_3_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x0027 + _cop
	ld	(hl),#0x00
;main.c:1948: if ((*cop_3_regard)==DROITE) (*cop_3_pattern1) = 0; // On passe le regard à gauche
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00166$
	ld	hl,#0x0006 + 0x0027 + _cop
	ld	(hl),#0x00
00166$:
;main.c:1949: (*cop_3_regard) = GAUCHE;
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	(hl),#0x02
;main.c:1950: movOk = OK;
	ld	-1 (ix),#0x00
	jr	00174$
00173$:
;main.c:1953: if (((*cop_3_direction)==DROITE) && ((*cop_3_px)==232))
	ld	a,c
	sub	a,#0x03
	jr	NZ,00174$
	ld	a,(#0x0027 + _cop)
	sub	a,#0xE8
	jr	NZ,00174$
;main.c:1955: (*cop_3_px) = 0;
	ld	hl,#0x0027 + _cop
	ld	(hl),#0x00
;main.c:1956: (*cop_3_lastMvt) = HORIZONTAL;
	ld	hl,#0x000b + 0x0027 + _cop
	ld	(hl),#0x00
;main.c:1957: if ((*cop_3_regard)==GAUCHE) (*cop_3_pattern1) = 12; // On passe le regard à droite
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	a, (hl)
	sub	a,#0x02
	jr	NZ,00168$
	ld	hl,#0x0006 + 0x0027 + _cop
	ld	(hl),#0x0C
00168$:
;main.c:1958: (*cop_3_regard) = DROITE;
	ld	hl,#0x0008 + 0x0027 + _cop
	ld	(hl),#0x03
;main.c:1959: movOk = OK;
	ld	-1 (ix),#0x00
00174$:
;main.c:1962: (*cop_3_cx) = (*cop_3_px) >> 3;
	ld	hl,#0x0027 + _cop
	ld	c, (hl)
	srl	c
	srl	c
	srl	c
	ld	hl,#0x0002 + 0x0027 + _cop
	ld	(hl),c
;main.c:1963: (*cop_3_cy) = (*cop_3_py) >> 3;
	dec	hl
	ld	c, (hl)
	srl	c
	srl	c
	srl	c
	inc	hl
	inc	hl
	ld	(hl),c
;main.c:1965: if (movOk==NOK) (*cop_3_direction) = rnd_byte(0,3);
	ld	a,-1 (ix)
	sub	a,#0x01
	jr	NZ,00177$
	ld	hl,#0x0300
	push	hl
	call	_rnd_byte
	pop	af
	ld	c,l
	ld	hl,#0x0007 + 0x0027 + _cop
	ld	(hl),c
00177$:
;main.c:1967: return OK;
	ld	l,#0x00
00178$:
	ld	sp,ix
	pop	ix
	ret
_moveCop3_end::
;main.c:1970: void renderCop(byte c)
;	---------------------------------
; Function renderCop
; ---------------------------------
_renderCop_start::
_renderCop:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;main.c:1974: s_cop *mycop = &cop[c];	
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_cop)
	ld	c,a
	ld	a,#>(_cop)
	adc	a,#0x00
	ld	-2 (ix), c
	ld	-1 (ix), a
;main.c:1975: byte *cop_py = &mycop->py;
	ld	a,-2 (ix)
	add	a,#0x01
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
;main.c:1978: byte *cop_sprno = &mycop->sprno;
	ld	a,-2 (ix)
	add	a,#0x09
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b,a
;main.c:1979: byte *cop_pattern1 = &mycop->pattern1;
	ld	a,-2 (ix)
	add	a,#0x06
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-5 (ix),a
;main.c:1980: byte *cop_colour = &mycop->col;
	ld	a,-2 (ix)
	add	a,#0x0A
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-7 (ix),a
;main.c:1981: byte *cop_regard = &mycop->regard;
	ld	a,-2 (ix)
	add	a,#0x08
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
;main.c:2031: sprites[(*cop_sprno)].y = (*cop_py); // Non on l'affiche
	ld	a,(bc)
	add	a,a
	add	a,a
	ld	c, a
	add	a,#<(_sprites)
	ld	b,a
	ld	a,#>(_sprites)
	adc	a,#0x00
	ld	e,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	l,b
	ld	h,e
	ld	(hl),a
;main.c:2033: sprites[(*cop_sprno)].x = (*cop_px);		
	ld	a,#<(_sprites)
	add	a,c
	ld	c,a
	ld	a,#>(_sprites)
	adc	a,#0x00
	ld	b, a
	ld	e, c
	ld	d, a
	inc	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	(de),a
;main.c:2036: if (animateSprite==0)
	xor	a,a
	ld	hl,#_animateSprite + 0
	or	a,(hl)
	jr	NZ,00109$
;main.c:2038: (*cop_pattern1)+=4;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	add	a,#0x04
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;main.c:2039: if ((*cop_regard)==DROITE)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a, (hl)
	sub	a,#0x03
	jr	NZ,00106$
;main.c:2041: if ((*cop_pattern1)>20) (*cop_pattern1)=12; 
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	l,(hl)
	ld	a,#0x14
	sub	a,l
	jr	NC,00109$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x0C
	jr	00109$
00106$:
;main.c:2044: if ((*cop_pattern1)>8) (*cop_pattern1)=0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	l,(hl)
	ld	a,#0x08
	sub	a,l
	jr	NC,00109$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
00109$:
;main.c:2047: sprites[(*cop_sprno)].pattern = (*cop_pattern1);
	ld	e,c
	ld	d,b
	inc	de
	inc	de
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	(de),a
;main.c:2048: sprites[(*cop_sprno)].colour = (*cop_colour);	
	inc	bc
	inc	bc
	inc	bc
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	(bc),a
	ld	sp,ix
	pop	ix
	ret
_renderCop_end::
;main.c:2052: void renderDoors()
;	---------------------------------
; Function renderDoors
; ---------------------------------
_renderDoors_start::
_renderDoors:
;main.c:2054: s_playerDoors *pd0 = &playerDoors[0];
;main.c:2055: s_playerDoors *pd1 = &playerDoors[1];
;main.c:2057: byte *pd0_affiche = &pd0->affiche;
;main.c:2058: unsigned *pd0_timer = &pd0->timer;
;main.c:2059: byte *pd0_c1x = &pd0->c1x;
;main.c:2060: byte *pd0_c1y = &pd0->c1y;
;main.c:2061: byte *pd0_c2x = &pd0->c2x;
;main.c:2062: byte *pd0_c2y = &pd0->c2y;
;main.c:2063: byte *pd0_c1 = &pd0->c1;
;main.c:2064: byte *pd0_c2 = &pd0->c2;
;main.c:2066: byte *pd1_affiche = &pd1->affiche;
;main.c:2067: unsigned *pd1_timer = &pd1->timer;
;main.c:2068: byte *pd1_c1x = &pd1->c1x;
;main.c:2069: byte *pd1_c1y = &pd1->c1y;
;main.c:2070: byte *pd1_c2x = &pd1->c2x;
;main.c:2071: byte *pd1_c2y = &pd1->c2y;
;main.c:2072: byte *pd1_c1 = &pd1->c1;
;main.c:2073: byte *pd1_c2 = &pd1->c2;
;main.c:2076: if ( ((*pd0_timer) == 0) && ((*pd0_affiche) == OK) ) // On efface la porte
	ld	hl,#_playerDoors
	ld	a,(hl)
	inc	hl
	or	a,(hl)
	jr	NZ,00102$
	ld	a,(#0x0008 + _playerDoors)
	or	a,a
	jr	NZ,00102$
;main.c:2078: disable_nmi();
	call	_disable_nmi
;main.c:2079: put_char((*pd0_c1x),(*pd0_c1y),105);
	ld	hl,#0x0003 + _playerDoors
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	ld	a,#0x69
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2080: put_char((*pd0_c2x),(*pd0_c2y),105);
	ld	hl,#0x0005 + _playerDoors
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	ld	a,#0x69
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2081: enable_nmi();
	call	_enable_nmi
;main.c:2082: (*pd0_affiche) = NOK;
	ld	hl,#0x0008 + _playerDoors
	ld	(hl),#0x01
00102$:
;main.c:2084: if ( ((*pd0_timer) > 0) && ((*pd0_affiche) == NOK) )
	ld	hl,#_playerDoors
	ld	a,(hl)
	inc	hl
	or	a,(hl)
	jr	Z,00105$
	ld	a,(#0x0008 + _playerDoors)
	sub	a,#0x01
	jr	NZ,00105$
;main.c:2086: disable_nmi();
	call	_disable_nmi
;main.c:2087: put_char((*pd0_c1x),(*pd0_c1y),(*pd0_c1));
	ld	hl,#0x0006 + _playerDoors
	ld	c,(hl)
	ld	hl,#0x0003 + _playerDoors
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2088: put_char((*pd0_c2x),(*pd0_c2y),(*pd0_c2));
	ld	hl,#0x0007 + _playerDoors
	ld	c,(hl)
	dec	hl
	dec	hl
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2089: enable_nmi();
	call	_enable_nmi
;main.c:2090: (*pd0_affiche) = OK;
	ld	hl,#0x0008 + _playerDoors
	ld	(hl),#0x00
00105$:
;main.c:2092: if ((*pd0_timer)>0) (*pd0_timer)--;
	ld	hl,#_playerDoors
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	or	a,h
	jr	Z,00108$
	ld	c,l
	ld	b,h
	dec	bc
	ld	hl,#_playerDoors
	ld	(hl),c
	inc	hl
	ld	(hl),b
00108$:
;main.c:2094: if ( ((*pd1_timer) == 0) && ((*pd1_affiche) == OK) ) // On efface la porte
	ld	hl,#0x000d + _playerDoors
	ld	a,(hl)
	inc	hl
	or	a,(hl)
	jr	NZ,00110$
	ld	hl,#0x0008 + 0x000d + _playerDoors
	ld	a,(hl)
	or	a,a
	jr	NZ,00110$
;main.c:2096: disable_nmi();
	call	_disable_nmi
;main.c:2097: put_char((*pd1_c1x),(*pd1_c1y),105);
	ld	hl,#0x0003 + 0x000d + _playerDoors
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	ld	a,#0x69
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2098: put_char((*pd1_c2x),(*pd1_c2y),105);
	ld	hl,#0x0005 + 0x000d + _playerDoors
	ld	c,(hl)
	dec	hl
	ld	b,(hl)
	ld	a,#0x69
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2099: enable_nmi();
	call	_enable_nmi
;main.c:2100: (*pd1_affiche) = NOK;
	ld	hl,#0x0008 + 0x000d + _playerDoors
	ld	(hl),#0x01
00110$:
;main.c:2102: if ( ((*pd1_timer) > 0) && ((*pd1_affiche) == NOK) )
	ld	hl,#0x000d + _playerDoors
	ld	a,(hl)
	inc	hl
	or	a,(hl)
	jr	Z,00113$
	ld	hl,#0x0008 + 0x000d + _playerDoors
	ld	a, (hl)
	sub	a,#0x01
	jr	NZ,00113$
;main.c:2104: disable_nmi();
	call	_disable_nmi
;main.c:2105: put_char((*pd1_c1x),(*pd1_c1y),(*pd1_c1));
	ld	hl,#0x0006 + 0x000d + _playerDoors
	ld	c,(hl)
	ld	hl,#0x0003 + 0x000d + _playerDoors
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2106: put_char((*pd1_c2x),(*pd1_c2y),(*pd1_c2));
	ld	hl,#0x0007 + 0x000d + _playerDoors
	ld	c,(hl)
	dec	hl
	dec	hl
	ld	b,(hl)
	dec	hl
	ld	e,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
;main.c:2107: enable_nmi();
	call	_enable_nmi
;main.c:2108: (*pd1_affiche) = OK;
	ld	hl,#0x0008 + 0x000d + _playerDoors
	ld	(hl),#0x00
00113$:
;main.c:2110: if ((*pd1_timer)>0) (*pd1_timer)--;
	ld	hl,#0x000d + _playerDoors
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	or	a,h
	ret	Z
	ld	c,l
	ld	b,h
	dec	bc
	ld	hl,#0x000d + _playerDoors
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ret
_renderDoors_end::
;main.c:2114: void createDoor(void)
;	---------------------------------
; Function createDoor
; ---------------------------------
_createDoor_start::
_createDoor:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;main.c:2118: if (player.lastDoor1Cx!=0)
	ld	hl,#0x000f + _player
	ld	a,(hl)
	ld	-6 (ix),a
	xor	a,a
	or	a,-6 (ix)
	jp	Z,00127$
;main.c:2121: i=NOK; // Il n'y à pas collision
	ld	c,#0x01
;main.c:2124: for (k=0;k<2;k++) // y a t'il déja une porte à cet emplacement ?
	inc	hl
	ld	a,(hl)
	ld	-5 (ix),a
	ld	-2 (ix),#0x00
	ld	e,#0x00
00106$:
	ld	a,-2 (ix)
	sub	a,#0x02
	jr	NC,00109$
;main.c:2126: if (playerDoors[k].affiche==OK)
	ld	a,#<(_playerDoors)
	add	a,e
	ld	-4 (ix),a
	ld	a,#>(_playerDoors)
	adc	a,#0x00
	ld	-3 (ix),a
	ld	a,-4 (ix)
	add	a,#0x08
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	or	a,a
	jr	NZ,00108$
;main.c:2128: if ((playerDoors[k].c1x == player.lastDoor1Cx) && (playerDoors[k].c1y == player.lastDoor1Cy))
	ld	a,-4 (ix)
	add	a,#0x02
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	sub	a,-6 (ix)
	jr	NZ,00108$
	ld	a,-4 (ix)
	add	a,#0x03
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	sub	a,-5 (ix)
	jr	NZ,00108$
;main.c:2129: {i=OK;break;} // OK = Il y a collision !!
	ld	c,#0x00
	jr	00109$
00108$:
;main.c:2124: for (k=0;k<2;k++) // y a t'il déja une porte à cet emplacement ?
	ld	a,e
	add	a,#0x0D
	ld	e,a
	inc	-2 (ix)
	jr	00106$
00109$:
;main.c:2134: if (i==NOK) // Si pas de collision
	ld	a,c
	sub	a,#0x01
	jp	NZ,00127$
;main.c:2136: k=2;j=0;
	ld	-2 (ix),#0x02
	ld	e,#0x00
;main.c:2137: for (i=0;i<2;i++)
	ld	c,#0x00
	ld	-1 (ix),#0x00
	ld	-4 (ix),#0x00
00113$:
	ld	a,-1 (ix)
	sub	a,#0x02
	jr	NC,00116$
;main.c:2139: if ((playerDoors[i].timer==0) && (playerDoors[i].affiche==NOK))  // y a t'il une porte de libre ?
	ld	a,#<(_playerDoors)
	add	a,-4 (ix)
	ld	l, a
	ld	a, #>(_playerDoors)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	or	a,(hl)
	jr	NZ,00115$
	ld	a,#<(_playerDoors)
	add	a,-4 (ix)
	ld	b,a
	ld	a,#>(_playerDoors)
	adc	a,#0x00
	ld	d,a
	ld	a,b
	add	a,#0x08
	ld	b,a
	ld	a,d
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	a, (hl)
	sub	a,#0x01
	jr	NZ,00115$
;main.c:2141: k=i;
	ld	-2 (ix),c
;main.c:2142: j=1;
	ld	e,#0x01
;main.c:2143: break;
	jr	00116$
00115$:
;main.c:2137: for (i=0;i<2;i++)
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	-4 (ix),a
	inc	-1 (ix)
	ld	c,-1 (ix)
	jr	00113$
00116$:
;main.c:2147: if (j==1) // Une zone de libre
	ld	a,e
	sub	a,#0x01
	jp	NZ,00127$
;main.c:2150: playerDoors[k].timer = levelParamShowPlayerDoors;
	ld	a,-2 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(_playerDoors)
	ld	l, a
	ld	a, #>(_playerDoors)
	adc	a, #0x00
	ld	h, a
	ld	iy,#_levelParamShowPlayerDoors
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
;main.c:2151: playerDoors[k].c1x = player.lastDoor1Cx;
	ld	a,#<(_playerDoors)
	add	a,c
	ld	b,a
	ld	a,#>(_playerDoors)
	adc	a,#0x00
	ld	d,a
	ld	a,b
	add	a,#0x02
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	h, a
	ld	l, e
	ld	a,-6 (ix)
	ld	(hl),a
;main.c:2152: playerDoors[k].c1y = player.lastDoor1Cy;
	ld	a,b
	add	a,#0x03
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	h, a
	ld	l, c
	ld	a,-5 (ix)
	ld	(hl),a
;main.c:2153: playerDoors[k].c2x = player.lastDoor2Cx;
	ld	a,b
	add	a,#0x04
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	e,a
	ld	a,(#0x0011 + _player)
	ld	-5 (ix),a
	ld	l,c
	ld	h,e
	ld	a,-5 (ix)
	ld	(hl),a
;main.c:2154: playerDoors[k].c2y = player.lastDoor2Cy;
	ld	a,b
	add	a,#0x05
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	c,a
	ld	a,(#0x0012 + _player)
	ld	l,e
	ld	h,c
	ld	(hl),a
;main.c:2155: playerDoors[k].doorGlobalPxStart = player.lastDoorGlobalPxStart;
	ld	a,b
	add	a,#0x09
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	e,a
	ld	a,(#0x0013 + _player)
	ld	l,c
	ld	h,e
	ld	(hl),a
;main.c:2156: playerDoors[k].doorGlobalPyStart = player.lastDoorGlobalPyStart;
	ld	a,b
	add	a,#0x0A
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	e,a
	ld	a,(#0x0014 + _player)
	ld	l,c
	ld	h,e
	ld	(hl),a
;main.c:2157: playerDoors[k].doorGlobalHauteur = player.lastDoorGlobalHauteur;
	ld	a,b
	add	a,#0x0B
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	e,a
	ld	a,(#0x0015 + _player)
	ld	l,c
	ld	h,e
	ld	(hl),a
;main.c:2158: playerDoors[k].doorGlobalLargeur = player.lastDoorGlobalLargeur;
	ld	a,b
	add	a,#0x0C
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	e,a
	ld	a,(#0x0016 + _player)
	ld	l,c
	ld	h,e
	ld	(hl),a
;main.c:2160: playerDoors[k].affiche = NOK;
	ld	a,b
	add	a,#0x08
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	h, a
	ld	l, c
	ld	(hl),#0x01
;main.c:2162: if ((player.lastDoor1Cx==player.lastDoor2Cx-1) || (player.lastDoor1Cx==player.lastDoor2Cx+1)) // Horizontal
	ld	l,-5 (ix)
	ld	h,#0x00
	ld	a,l
	add	a,#0xFF
	ld	c,a
	ld	a,h
	adc	a,#0xFF
	ld	e,a
	ld	a,-6 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-4 (ix)
	sub	a,c
	jr	NZ,00152$
	ld	a,-3 (ix)
	sub	a,e
	jr	Z,00117$
00152$:
	ld	a,l
	add	a,#0x01
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	e,a
	ld	a,-4 (ix)
	sub	a,c
	jr	NZ,00118$
	ld	a,-3 (ix)
	sub	a,e
	jr	NZ,00118$
00117$:
;main.c:2164: playerDoors[k].c1=playerDoors[k].c2=107;
	ld	a,b
	add	a,#0x06
	ld	-4 (ix),a
	ld	a,d
	adc	a,#0x00
	ld	-3 (ix),a
	ld	a,b
	add	a,#0x07
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	h, a
	ld	l, c
	ld	(hl),#0x6B
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x6B
	jr	00119$
00118$:
;main.c:2168: playerDoors[k].c1=playerDoors[k].c2=106;
	ld	a,b
	add	a,#0x06
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x07
	ld	b,a
	ld	a,d
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	(hl),#0x6A
	ld	l,c
	ld	h,e
	ld	(hl),#0x6A
00119$:
;main.c:2171: player.lastDoor1Cx = 0;
	ld	hl,#0x000f + _player
	ld	(hl),#0x00
;main.c:2173: startsfxPrio(sfx_porte);
	ld	hl,#_sfx_porte
	push	hl
	call	_startsfxPrio
	pop	af
00127$:
	ld	sp,ix
	pop	ix
	ret
_createDoor_end::
;main.c:2180: void openDoors()
;	---------------------------------
; Function openDoors
; ---------------------------------
_openDoors_start::
_openDoors:
;main.c:2182: disable_nmi();
	call	_disable_nmi
;main.c:2183: put_frame(&horizontalSpace,9,0,2,1);
	ld	hl,#0x0102
	push	hl
	ld	hl,#0x0009
	push	hl
	ld	hl,#_horizontalSpace
	push	hl
	call	_put_frame
	pop	af
	pop	af
;main.c:2184: put_frame(&horizontalSpace,21,23,2,1);
	ld	hl,#0x0102
	ex	(sp),hl
	ld	hl,#0x1715
	push	hl
	ld	hl,#_horizontalSpace
	push	hl
	call	_put_frame
	pop	af
	pop	af
	pop	af
;main.c:2185: enable_nmi();
	call	_enable_nmi
;main.c:2186: player.doorOpen = OK;
	ld	hl,#0x0006 + _player
	ld	(hl),#0x00
	ret
_openDoors_end::
;main.c:2189: void initLevel(byte lvl)
;	---------------------------------
; Function initLevel
; ---------------------------------
_initLevel_start::
_initLevel:
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:2191: if (lvl%2==0)
	ld	a,4 (ix)
	and	a,#0x01
	jr	NZ,00102$
;main.c:2193: levelParamScatterModeTime = 100;
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2194: levelParamCopFreezeBonus = 200;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2195: levelParamCop0FreezeStart = 100;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2196: levelParamCop1FreezeStart = 200;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2197: levelParamCop2FreezeStart = 300;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
;main.c:2198: levelParamCop3FreezeStart = 300;	
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
	jr	00103$
00102$:
;main.c:2202: levelParamScatterModeTime = 300;
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
;main.c:2203: levelParamCopFreezeBonus = 200;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2204: levelParamCop0FreezeStart = 100;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2205: levelParamCop1FreezeStart = 200;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2206: levelParamCop2FreezeStart = 300;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
;main.c:2207: levelParamCop3FreezeStart = 300;					
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
00103$:
;main.c:2210: if (lvl==1)
	ld	a,4 (ix)
	sub	a,#0x01
	jr	NZ,00176$
;main.c:2212: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2213: levelParamCop1Speed = 7;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x07
;main.c:2214: levelParamCop2Speed = 7;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x07
;main.c:2215: levelParamCop3Speed = 7;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x07
	jp	00177$
00176$:
;main.c:2217: if (lvl==2)
	ld	a,4 (ix)
	sub	a,#0x02
	jr	NZ,00173$
;main.c:2219: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2220: levelParamCop1Speed = 7;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x07
;main.c:2221: levelParamCop2Speed = 7;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x07
;main.c:2222: levelParamCop3Speed = 7;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x07
	jp	00177$
00173$:
;main.c:2225: if (lvl==3)
	ld	a,4 (ix)
	sub	a,#0x03
	jr	NZ,00170$
;main.c:2228: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2229: levelParamCop1Speed = 7;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x07
;main.c:2230: levelParamCop2Speed = 7;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x07
;main.c:2231: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00170$:
;main.c:2233: if (lvl==4)
	ld	a,4 (ix)
	sub	a,#0x04
	jr	NZ,00167$
;main.c:2236: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2237: levelParamCop1Speed = 7;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x07
;main.c:2238: levelParamCop2Speed = 7;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x07
;main.c:2239: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00167$:
;main.c:2241: if (lvl==5)
	ld	a,4 (ix)
	sub	a,#0x05
	jr	NZ,00164$
;main.c:2243: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2244: levelParamCop1Speed = 7;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x07
;main.c:2245: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2246: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00164$:
;main.c:2248: if (lvl==6)
	ld	a,4 (ix)
	sub	a,#0x06
	jr	NZ,00161$
;main.c:2250: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2251: levelParamCop1Speed = 7;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x07
;main.c:2252: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2253: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00161$:
;main.c:2255: if (lvl==7)
	ld	a,4 (ix)
	sub	a,#0x07
	jr	NZ,00158$
;main.c:2257: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2258: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2259: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2260: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00158$:
;main.c:2262: if (lvl==8)
	ld	a,4 (ix)
	sub	a,#0x08
	jr	NZ,00155$
;main.c:2264: levelParamCop0Speed = 7;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x07
;main.c:2265: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2266: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2267: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00155$:
;main.c:2269: if (lvl==9)
	ld	a,4 (ix)
	sub	a,#0x09
	jr	NZ,00152$
;main.c:2271: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2272: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2273: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2274: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00152$:
;main.c:2276: if (lvl==10)
	ld	a,4 (ix)
	sub	a,#0x0A
	jr	NZ,00149$
;main.c:2278: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2279: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2280: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2281: levelParamCop3Speed = 8;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x08
	jp	00177$
00149$:
;main.c:2283: if (lvl==11)
	ld	a,4 (ix)
	sub	a,#0x0B
	jr	NZ,00146$
;main.c:2285: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2286: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2287: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2288: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00146$:
;main.c:2290: if (lvl==12)
	ld	a,4 (ix)
	sub	a,#0x0C
	jr	NZ,00143$
;main.c:2292: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2293: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2294: levelParamCop2Speed = 8;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x08
;main.c:2295: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00143$:
;main.c:2297: if (lvl==13)
	ld	a,4 (ix)
	sub	a,#0x0D
	jr	NZ,00140$
;main.c:2299: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2300: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2301: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2302: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00140$:
;main.c:2304: if (lvl==14)
	ld	a,4 (ix)
	sub	a,#0x0E
	jr	NZ,00137$
;main.c:2306: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2307: levelParamCop1Speed = 8;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x08
;main.c:2308: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2309: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00137$:
;main.c:2311: if (lvl==15)
	ld	a,4 (ix)
	sub	a,#0x0F
	jr	NZ,00134$
;main.c:2313: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2314: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2315: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2316: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00134$:
;main.c:2318: if (lvl==16)
	ld	a,4 (ix)
	sub	a,#0x10
	jr	NZ,00131$
;main.c:2320: levelParamCop0Speed = 8;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x08
;main.c:2321: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2322: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2323: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00131$:
;main.c:2325: if (lvl==17)
	ld	a,4 (ix)
	sub	a,#0x11
	jr	NZ,00128$
;main.c:2327: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2328: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2329: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2330: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00128$:
;main.c:2332: if (lvl==18)
	ld	a,4 (ix)
	sub	a,#0x12
	jr	NZ,00125$
;main.c:2334: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2335: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2336: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2337: levelParamCop3Speed = 9;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x09
	jp	00177$
00125$:
;main.c:2339: if (lvl==19)
	ld	a,4 (ix)
	sub	a,#0x13
	jr	NZ,00122$
;main.c:2341: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2342: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2343: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2344: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
	jp	00177$
00122$:
;main.c:2347: if (lvl==20)
	ld	a,4 (ix)
	sub	a,#0x14
	jr	NZ,00119$
;main.c:2349: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2350: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2351: levelParamCop2Speed = 9;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x09
;main.c:2352: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
;main.c:2353: levelParamScatterModeTime = 200; // On baisse le scatter
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2354: levelParamCopFreezeBonus = 200;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2355: levelParamCop0FreezeStart = 100;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2356: levelParamCop1FreezeStart = 200;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2357: levelParamCop2FreezeStart = 300;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
;main.c:2358: levelParamCop3FreezeStart = 300;				
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
	jp	00177$
00119$:
;main.c:2361: if (lvl==21)
	ld	a,4 (ix)
	sub	a,#0x15
	jr	NZ,00116$
;main.c:2363: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2364: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2365: levelParamCop2Speed = 10;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x0A
;main.c:2366: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
;main.c:2367: levelParamScatterModeTime = 100; // On baisse le scatter
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2368: levelParamCopFreezeBonus = 200;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2369: levelParamCop0FreezeStart = 100;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2370: levelParamCop1FreezeStart = 200;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2371: levelParamCop2FreezeStart = 300;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
;main.c:2372: levelParamCop3FreezeStart = 300;				
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
	jp	00177$
00116$:
;main.c:2375: if (lvl==22)
	ld	a,4 (ix)
	sub	a,#0x16
	jr	NZ,00113$
;main.c:2377: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2378: levelParamCop1Speed = 9;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x09
;main.c:2379: levelParamCop2Speed = 10;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x0A
;main.c:2380: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
;main.c:2381: levelParamScatterModeTime = 100; // On baisse le scatter
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2382: levelParamCopFreezeBonus = 100;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2383: levelParamCop0FreezeStart = 100;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2384: levelParamCop1FreezeStart = 200;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2385: levelParamCop2FreezeStart = 300;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
;main.c:2386: levelParamCop3FreezeStart = 300;				
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x2C
	ld	1 (iy),#0x01
	jp	00177$
00113$:
;main.c:2389: if (lvl==23)
	ld	a,4 (ix)
	sub	a,#0x17
	jr	NZ,00110$
;main.c:2391: levelParamCop0Speed = 9;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x09
;main.c:2392: levelParamCop1Speed = 10;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x0A
;main.c:2393: levelParamCop2Speed = 10;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x0A
;main.c:2394: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
;main.c:2395: levelParamScatterModeTime = 100; // On baisse le scatter
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2396: levelParamCopFreezeBonus = 100;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2397: levelParamCop0FreezeStart = 50;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x32
	ld	1 (iy),#0x00
;main.c:2398: levelParamCop1FreezeStart = 100;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2399: levelParamCop2FreezeStart = 150;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x96
	ld	1 (iy),#0x00
;main.c:2400: levelParamCop3FreezeStart = 150;				
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x96
	ld	1 (iy),#0x00
	jp	00177$
00110$:
;main.c:2403: if (lvl==24)
	ld	a,4 (ix)
	sub	a,#0x18
	jr	NZ,00107$
;main.c:2405: levelParamCop0Speed = 10;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x0A
;main.c:2406: levelParamCop1Speed = 10;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x0A
;main.c:2407: levelParamCop2Speed = 10;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x0A
;main.c:2408: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
;main.c:2409: levelParamScatterModeTime = 100; // On baisse le scatter
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2410: levelParamCopFreezeBonus = 100;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2411: levelParamCop0FreezeStart = 50;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x32
	ld	1 (iy),#0x00
;main.c:2412: levelParamCop1FreezeStart = 100;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2413: levelParamCop2FreezeStart = 150;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x96
	ld	1 (iy),#0x00
;main.c:2414: levelParamCop3FreezeStart = 150;				
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x96
	ld	1 (iy),#0x00
	jr	00177$
00107$:
;main.c:2417: if (lvl>=25)
	ld	a,4 (ix)
	sub	a,#0x19
	jr	C,00177$
;main.c:2419: levelParamCop0Speed = 10;
	ld	hl,#_levelParamCop0Speed + 0
	ld	(hl), #0x0A
;main.c:2420: levelParamCop1Speed = 10;
	ld	hl,#_levelParamCop1Speed + 0
	ld	(hl), #0x0A
;main.c:2421: levelParamCop2Speed = 10;
	ld	hl,#_levelParamCop2Speed + 0
	ld	(hl), #0x0A
;main.c:2422: levelParamCop3Speed = 10;
	ld	hl,#_levelParamCop3Speed + 0
	ld	(hl), #0x0A
;main.c:2423: levelParamScatterModeTime = 0; // On baisse le scatter
	ld	iy,#_levelParamScatterModeTime
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:2424: levelParamCopFreezeBonus = 100;
	ld	iy,#_levelParamCopFreezeBonus
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2425: levelParamCop0FreezeStart = 50;
	ld	iy,#_levelParamCop0FreezeStart
	ld	0 (iy),#0x32
	ld	1 (iy),#0x00
;main.c:2426: levelParamCop1FreezeStart = 100;
	ld	iy,#_levelParamCop1FreezeStart
	ld	0 (iy),#0x64
	ld	1 (iy),#0x00
;main.c:2427: levelParamCop2FreezeStart = 150;
	ld	iy,#_levelParamCop2FreezeStart
	ld	0 (iy),#0x96
	ld	1 (iy),#0x00
;main.c:2428: levelParamCop3FreezeStart = 150;				
	ld	iy,#_levelParamCop3FreezeStart
	ld	0 (iy),#0x96
	ld	1 (iy),#0x00
00177$:
;main.c:2431: levelParamBonusShowTime = 400;
	ld	iy,#_levelParamBonusShowTime
	ld	0 (iy),#0x90
	ld	1 (iy),#0x01
;main.c:2432: levelParamShowPlayerDoors = 200;
	ld	iy,#_levelParamShowPlayerDoors
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2436: sprites[SPRITE0].y = 204;
	ld	hl,#_sprites
	ld	(hl),#0xCC
;main.c:2437: sprites[SPRITE1].y = 204;
	ld	hl,#0x007c + _sprites
	ld	(hl),#0xCC
;main.c:2438: sprites[SPRITE2].y = 204;
	ld	hl,#0x0004 + _sprites
	ld	(hl),#0xCC
;main.c:2439: sprites[SPRITE3].y = 204;
	ld	hl,#0x0078 + _sprites
	ld	(hl),#0xCC
;main.c:2440: sprites[SPRITE4].y = 204;
	ld	hl,#0x0008 + _sprites
	ld	(hl),#0xCC
;main.c:2441: sprites[SPRITE5].y = 204;
	ld	hl,#0x0074 + _sprites
	ld	(hl),#0xCC
;main.c:2442: sprites[SPRITE6].y = 204;
	ld	hl,#0x000c + _sprites
	ld	(hl),#0xCC
;main.c:2444: playerDoors[0].timer=0;
	ld	hl,#_playerDoors
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:2445: playerDoors[0].c1x=0;
	ld	hl,#0x0002 + _playerDoors
	ld	(hl),#0x00
;main.c:2446: playerDoors[0].c1x=0;
	ld	(hl),#0x00
;main.c:2447: playerDoors[0].c2x=0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;main.c:2448: playerDoors[0].c2y=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2449: playerDoors[0].c1=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2450: playerDoors[0].c2=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2451: playerDoors[0].affiche=NOK;
	inc	hl
	ld	(hl),#0x01
;main.c:2453: playerDoors[1].timer=0;
	ld	hl,#0x000d + _playerDoors
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:2454: playerDoors[1].c1x=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2455: playerDoors[1].c1x=0;
	ld	(hl),#0x00
;main.c:2456: playerDoors[1].c2x=0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;main.c:2457: playerDoors[1].c2y=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2458: playerDoors[1].c1=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2459: playerDoors[1].c2=0;
	inc	hl
	ld	(hl),#0x00
;main.c:2460: playerDoors[1].affiche=NOK;
	inc	hl
	ld	(hl),#0x01
;main.c:2462: initAutoDoor();
	call	_initAutoDoor
;main.c:2465: animateSprite = 0;
	ld	hl,#_animateSprite + 0
	ld	(hl), #0x00
;main.c:2466: scatterModeTimer=0;
	ld	iy,#_scatterModeTimer
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:2468: directionDemandee=NOK;
	ld	hl,#_directionDemandee + 0
	ld	(hl), #0x01
;main.c:2470: reInitPlayer();
	call	_reInitPlayer
	pop	ix
	ret
_initLevel_end::
;main.c:2474: void gameLoop(void)
;	---------------------------------
; Function gameLoop
; ---------------------------------
_gameLoop_start::
_gameLoop:
;main.c:2477: toucheRelachee = 0;
	ld	c,#0x00
;main.c:2479: reInitPlayer();
	push	bc
	call	_reInitPlayer
	pop	bc
;main.c:2480: while (1)
00186$:
;main.c:2483: if (joypad_1!=0)
	xor	a,a
	ld	iy,#_joypad_1
	or	a,0 (iy)
	jr	Z,00117$
;main.c:2485: if (joypad_1 & LEFT) {player.regard = GAUCHE;directionDemandee=GAUCHE;timerDirectionDemandee=16;}
	ld	a,0 (iy)
	and	a,#0x08
	jr	Z,00110$
	ld	hl,#0x000d + _player
	ld	(hl),#0x02
	ld	hl,#_directionDemandee + 0
	ld	(hl), #0x02
	ld	hl,#_timerDirectionDemandee + 0
	ld	(hl), #0x10
	jr	00111$
00110$:
;main.c:2487: if (joypad_1 & RIGHT) {player.regard = DROITE;directionDemandee=DROITE;timerDirectionDemandee=16;}	
	ld	a,(#_joypad_1 + 0)
	and	a,#0x02
	jr	Z,00107$
	ld	hl,#0x000d + _player
	ld	(hl),#0x03
	ld	hl,#_directionDemandee + 0
	ld	(hl), #0x03
	ld	hl,#_timerDirectionDemandee + 0
	ld	(hl), #0x10
	jr	00111$
00107$:
;main.c:2489: if (joypad_1 & UP){directionDemandee=HAUT;timerDirectionDemandee=16;}
	ld	a,(#_joypad_1 + 0)
	and	a,#0x01
	jr	Z,00104$
	ld	hl,#_directionDemandee + 0
	ld	(hl), #0x00
	ld	hl,#_timerDirectionDemandee + 0
	ld	(hl), #0x10
	jr	00111$
00104$:
;main.c:2491: if (joypad_1 & DOWN) {directionDemandee=BAS;timerDirectionDemandee=16;}
	ld	a,(#_joypad_1 + 0)
	and	a,#0x04
	jr	Z,00111$
	ld	hl,#_directionDemandee + 0
	ld	(hl), #0x01
	ld	hl,#_timerDirectionDemandee + 0
	ld	(hl), #0x10
00111$:
;main.c:2493: if ( ((joypad_1 & FIRE1) || (joypad_1 & FIRE2) )&& (toucheRelachee==0))
	ld	a,(#_joypad_1 + 0)
	and	a,#0x80
	jr	NZ,00115$
	ld	a,(#_joypad_1 + 0)
	and	a,#0x40
	jr	Z,00117$
00115$:
	xor	a,a
	or	a,c
	jr	NZ,00117$
;main.c:2495: createDoor();
	call	_createDoor
;main.c:2496: toucheRelachee = 8;
	ld	c,#0x08
00117$:
;main.c:2502: if ((directionDemandee==GAUCHE) && (timerDirectionDemandee!=0)) {changePlayerDirection(GAUCHE);}
	ld	a,(#_directionDemandee + 0)
	sub	a,#0x02
	jr	NZ,00130$
	xor	a,a
	ld	hl,#_timerDirectionDemandee + 0
	or	a,(hl)
	jr	Z,00130$
	push	bc
	ld	a,#0x02
	push	af
	inc	sp
	call	_changePlayerDirection
	inc	sp
	pop	bc
	jr	00131$
00130$:
;main.c:2504: if ((directionDemandee==DROITE) && (timerDirectionDemandee!=0)) {changePlayerDirection(DROITE);}
	ld	a,(#_directionDemandee + 0)
	sub	a,#0x03
	jr	NZ,00126$
	xor	a,a
	ld	hl,#_timerDirectionDemandee + 0
	or	a,(hl)
	jr	Z,00126$
	push	bc
	ld	a,#0x03
	push	af
	inc	sp
	call	_changePlayerDirection
	inc	sp
	pop	bc
	jr	00131$
00126$:
;main.c:2506: if ((directionDemandee==HAUT) && (timerDirectionDemandee!=0)) {changePlayerDirection(HAUT);}
	xor	a,a
	ld	hl,#_directionDemandee + 0
	or	a,(hl)
	jr	NZ,00122$
	xor	a,a
	ld	hl,#_timerDirectionDemandee + 0
	or	a,(hl)
	jr	Z,00122$
	push	bc
	ld	a,#0x00
	push	af
	inc	sp
	call	_changePlayerDirection
	inc	sp
	pop	bc
	jr	00131$
00122$:
;main.c:2508: if ((directionDemandee==BAS) && (timerDirectionDemandee!=0)) {changePlayerDirection(BAS);}
	ld	a,(#_directionDemandee + 0)
	sub	a,#0x01
	jr	NZ,00131$
	xor	a,a
	ld	hl,#_timerDirectionDemandee + 0
	or	a,(hl)
	jr	Z,00131$
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	call	_changePlayerDirection
	inc	sp
	pop	bc
00131$:
;main.c:2510: if (timerDirectionDemandee>0) timerDirectionDemandee--; else directionDemandee=NOK;
	xor	a,a
	ld	iy,#_timerDirectionDemandee
	or	a,0 (iy)
	jr	Z,00134$
	dec	0 (iy)
	jr	00135$
00134$:
	ld	hl,#_directionDemandee + 0
	ld	(hl), #0x01
00135$:
;main.c:2512: if (toucheRelachee>0) toucheRelachee--;
	xor	a,a
	or	a,c
	jr	Z,00137$
	dec	c
00137$:
;main.c:2514: checkPlayerGameCollisions();
	push	bc
	call	_checkPlayerGameCollisions
	call	_movePlayer
	call	_animatePlayer
	call	_renderSprite
	call	_renderDoors
	pop	bc
;main.c:2521: if (animateSprite<levelParamCop0Speed)
	ld	hl,#_levelParamCop0Speed
	ld	a,(#_animateSprite + 0)
	sub	a,(hl)
	jr	NC,00139$
;main.c:2523: moveCop0();
	push	bc
	call	_moveCop0
	ld	a,#0x00
	push	af
	inc	sp
	call	_renderCop
	inc	sp
	pop	bc
00139$:
;main.c:2526: if (animateSprite<levelParamCop1Speed)
	ld	hl,#_levelParamCop1Speed
	ld	a,(#_animateSprite + 0)
	sub	a,(hl)
	jr	NC,00141$
;main.c:2528: moveCop1();
	push	bc
	call	_moveCop1
	ld	a,#0x01
	push	af
	inc	sp
	call	_renderCop
	inc	sp
	pop	bc
00141$:
;main.c:2531: if (animateSprite<levelParamCop2Speed)
	ld	hl,#_levelParamCop2Speed
	ld	a,(#_animateSprite + 0)
	sub	a,(hl)
	jr	NC,00143$
;main.c:2533: moveCop2();
	push	bc
	call	_moveCop2
	ld	a,#0x02
	push	af
	inc	sp
	call	_renderCop
	inc	sp
	pop	bc
00143$:
;main.c:2536: if (animateSprite<levelParamCop3Speed)
	ld	hl,#_levelParamCop3Speed
	ld	a,(#_animateSprite + 0)
	sub	a,(hl)
	jr	NC,00145$
;main.c:2538: moveCop3();
	push	bc
	call	_moveCop3
	ld	a,#0x03
	push	af
	inc	sp
	call	_renderCop
	inc	sp
	pop	bc
00145$:
;main.c:2542: renderBonus();
	push	bc
	call	_renderBonus
	pop	bc
;main.c:2544: if (extend==1)
	ld	a,(#_extend + 0)
	sub	a,#0x01
	jr	NZ,00161$
;main.c:2546: if (currentAbsoluteLevel==3)
	ld	a,(#_currentAbsoluteLevel + 0)
	sub	a,#0x03
	jr	NZ,00156$
;main.c:2548: if (player.nbPillsLevel==125) {openDoors();player.nbPillsLevel++;}
	ld	a,(#0x0019 + _player)
	sub	a,#0x7D
	jr	NZ,00162$
	push	bc
	call	_openDoors
	pop	bc
	ld	a,(#0x0019 + _player)
	inc	a
	ld	(#0x0019 + _player),a
	jr	00162$
00156$:
;main.c:2551: if (currentAbsoluteLevel==2)
	ld	a,(#_currentAbsoluteLevel + 0)
	sub	a,#0x02
	jr	NZ,00153$
;main.c:2553: if (player.nbPillsLevel==131) {openDoors();player.nbPillsLevel++;}
	ld	a,(#0x0019 + _player)
	sub	a,#0x83
	jr	NZ,00162$
	push	bc
	call	_openDoors
	pop	bc
	ld	a,(#0x0019 + _player)
	inc	a
	ld	(#0x0019 + _player),a
	jr	00162$
00153$:
;main.c:2557: if (player.nbPillsLevel==135) {openDoors();player.nbPillsLevel++;}
	ld	a,(#0x0019 + _player)
	sub	a,#0x87
	jr	NZ,00162$
	push	bc
	call	_openDoors
	pop	bc
	ld	a,(#0x0019 + _player)
	inc	a
	ld	(#0x0019 + _player),a
	jr	00162$
00161$:
;main.c:2561: if (player.nbPillsLevel==135) {openDoors();player.nbPillsLevel++;}
	ld	a,(#0x0019 + _player)
	sub	a,#0x87
	jr	NZ,00162$
	push	bc
	call	_openDoors
	pop	bc
	ld	a,(#0x0019 + _player)
	inc	a
	ld	(#0x0019 + _player),a
00162$:
;main.c:2563: if (player.score>nextLifeBonus) 
	ld	hl,#0x0017 + _player
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#_nextLifeBonus
	ld	a,(hl)
	sub	a,e
	inc	hl
	ld	a,(hl)
	sbc	a,d
	jr	NC,00169$
;main.c:2565: if (player.nbLives<9) {player.nbLives++;}
	ld	hl,#0x001d + _player
	ld	l,(hl)
	ld	a,l
	sub	a,#0x09
	jp	PO,00256$
	xor	a,#0x80
00256$:
	jp	P,00164$
	ld	a,l
	inc	a
	ld	(#0x001d + _player),a
00164$:
;main.c:2567: if (nextLifeBonus<8000)  
	ld	iy,#_nextLifeBonus
	ld	a,0 (iy)
	sub	a,#0x40
	ld	a,1 (iy)
	sbc	a,#0x1F
	jr	NC,00166$
;main.c:2569: nextLifeBonus+=1500;renderPlayerNbLives();delay(1);
	ld	hl,#_nextLifeBonus
	ld	a,(hl)
	add	a,#0xDC
	push	bc
	ld	c, a
	inc	hl
	ld	b, (hl)
	ld	a, c
	dec	hl
	ld	(hl), a
	ld	a, b
	pop	bc
	adc	a,#0x05
	inc	hl
	ld	(hl),a
	push	bc
	call	_renderPlayerNbLives
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
	pop	bc
	jr	00169$
00166$:
;main.c:2571: else nextLifeBonus=65200;
	ld	iy,#_nextLifeBonus
	ld	0 (iy),#0xB0
	ld	1 (iy),#0xFE
00169$:
;main.c:2573: if ((player.py==0) || (player.py==176)) {
	ld	hl,#0x0001 + _player
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00170$
	ld	a,l
	sub	a,#0xB0
	jr	NZ,00171$
00170$:
;main.c:2577: workflow=W_NEXTLEVEL;
	ld	hl,#_workflow + 0
	ld	(hl), #0x04
00171$:
;main.c:2581: if (keypad_1==10)
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x0A
	jr	NZ,00180$
;main.c:2590: while (keypad_1==10) {delay(1);}
00173$:
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x0A
	jr	NZ,00175$
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
	pop	bc
	jr	00173$
00175$:
;main.c:2591: delay(2);
	push	bc
	ld	hl,#0x0002
	push	hl
	call	_delay
	pop	af
	pop	bc
;main.c:2592: while(keypad_1!=10) {delay(1);}
00176$:
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x0A
	jr	Z,00178$
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
	pop	bc
	jr	00176$
00178$:
;main.c:2593: delay(2);
	push	bc
	ld	hl,#0x0002
	push	hl
	call	_delay
	ld	hl,#0x0005
	ex	(sp),hl
	call	_delay
	pop	af
	pop	bc
00180$:
;main.c:2599: renderAutoDoor();
	push	bc
	call	_renderAutoDoor
	pop	bc
;main.c:2600: if (workflow==W_RETRY) break;
	ld	iy,#_workflow
	ld	a,0 (iy)
	sub	a,#0x06
	ret	Z
;main.c:2601: if (workflow==W_NEXTLEVEL) break;
	ld	a,0 (iy)
	sub	a,#0x04
	ret	Z
;main.c:2602: delay(1);
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
	pop	bc
	jp	00186$
_gameLoop_end::
;main.c:2614: void menu()
;	---------------------------------
; Function menu
; ---------------------------------
_menu_start::
_menu:
;main.c:2616: disable_nmi();
	call	_disable_nmi
;main.c:2617: center_string(10,"PRESS FIRE TO START");			
	ld	hl,#__str_1
	push	hl
	ld	a,#0x0A
	push	af
	inc	sp
	call	_center_string
	pop	af
	inc	sp
;main.c:2618: pause();
	call	_pause
;main.c:2619: enable_nmi();
	call	_enable_nmi
;main.c:2620: currentLevel = 1;
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x01
;main.c:2621: currentAbsoluteLevel=1;
	ld	hl,#_currentAbsoluteLevel + 0
	ld	(hl), #0x01
	ret
_menu_end::
__str_1:
	.ascii "PRESS FIRE TO START"
	.db 0x00
;main.c:2624: void resetSprites()
;	---------------------------------
; Function resetSprites
; ---------------------------------
_resetSprites_start::
_resetSprites:
;main.c:2627: for (i=0;i<32;i++)
	ld	bc,#0x0000
00101$:
	ld	a,c
	sub	a,#0x20
	ld	a,b
	sbc	a,#0x00
	jp	PO,00110$
	xor	a,#0x80
00110$:
	ret	P
;main.c:2628: sprites[i].y = 204;
	ld	l,c
	ld	h,b
	add	hl,hl
	add	hl,hl
	ld	a,#<(_sprites)
	add	a,l
	ld	e,a
	ld	a,#>(_sprites)
	adc	a,h
	ld	d,a
	ld	a,#0xCC
	ld	(de),a
;main.c:2627: for (i=0;i<32;i++)
	inc	bc
	jr	00101$
_resetSprites_end::
;main.c:2631: void playIntro()
;	---------------------------------
; Function playIntro
; ---------------------------------
_playIntro_start::
_playIntro:
;main.c:2637: cpt = 0;
	ld	c,#0x00
;main.c:2639: disable_nmi();
	push	bc
	call	_disable_nmi
	call	_screen_off
	ld	hl,#_PATTERNRLE
	push	hl
	call	_load_patternrle
	pop	af
	call	_duplicate_pattern
	ld	hl,#0x1800
	push	hl
	ld	hl,#_NAMERLE_INTRO
	push	hl
	call	_rle2vram
	pop	af
	ld	hl,#0x2000
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
	pop	af
	call	_screen_on
	call	_enable_nmi
	call	_stopmusic
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#_music_nextLevel
	push	hl
	call	_startmusic
	pop	af
	inc	sp
	pop	bc
;main.c:2656: for (x=0;x<22;x++)
	ld	b,#0x00
00115$:
	ld	a,b
	sub	a,#0x16
	ret	NC
;main.c:2658: disable_nmi();		
	push	bc
	call	_disable_nmi
	pop	bc
;main.c:2659: if (x>0) put_frame(&frm[2],x-1,y,4,2);
	xor	a,a
	or	a,b
	jr	Z,00102$
	ld	a,b
	dec	a
	ld	e,a
	push	bc
	ld	hl,#0x0204
	push	hl
	ld	d,#0x15
	push	de
	ld	hl,#0x0010 + _frm
	push	hl
	call	_put_frame
	pop	af
	pop	af
	pop	af
	pop	bc
00102$:
;main.c:2660: if (x==5)
	ld	a,b
;main.c:2662: for (i=0;i<4;i++)
	sub	a,#0x05
	jr	NZ,00104$
	ld	e,a
00111$:
	ld	a,e
	sub	a,#0x04
	jr	NC,00114$
;main.c:2663: for (j=20;j<24;j++)
	ld	d,#0x14
00107$:
	ld	a,d
	sub	a,#0x18
	jr	NC,00113$
;main.c:2664: put_char(i,j,0);
	push	bc
	push	de
	ld	a,#0x00
	push	af
	inc	sp
	push	de
	call	_put_char
	pop	af
	inc	sp
	pop	de
	pop	bc
;main.c:2663: for (j=20;j<24;j++)
	inc	d
	jr	00107$
00113$:
;main.c:2662: for (i=0;i<4;i++)
	inc	e
	jr	00111$
00114$:
;main.c:2666: put_char(4,20,193);
	push	bc
	ld	hl,#0xC114
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_put_char
	inc	sp
	ld	hl,#0xC115
	ex	(sp),hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_put_char
	inc	sp
	ld	hl,#0xC116
	ex	(sp),hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_put_char
	inc	sp
	ld	hl,#0x0317
	ex	(sp),hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
	pop	bc
00104$:
;main.c:2672: put_frame(&frm[cpt],x,y,4,2);
	ld	a,c
	rlca
	rlca
	rlca
	and	a,#0xF8
	add	a,#<(_frm)
	ld	e,a
	ld	a,#>(_frm)
	adc	a,#0x00
	ld	d,a
	push	bc
	ld	hl,#0x0204
	push	hl
	ld	a,#0x15
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_put_frame
	pop	af
	pop	af
	pop	af
	call	_enable_nmi
	ld	hl,#0x000F
	push	hl
	call	_delay
	pop	af
	pop	bc
;main.c:2675: cpt++;
	inc	c
;main.c:2676: if (cpt>1) cpt = 0;
	ld	a,#0x01
	sub	a,c
	jr	NC,00117$
	ld	c,#0x00
00117$:
;main.c:2656: for (x=0;x<22;x++)
	inc	b
	jp	00115$
_playIntro_end::
;main.c:2680: void eraseScreen(void)
;	---------------------------------
; Function eraseScreen
; ---------------------------------
_eraseScreen_start::
_eraseScreen:
;main.c:2684: for (i=0;i<32;i++)
	ld	c,#0x00
00105$:
	ld	a,c
	sub	a,#0x20
	jp	PO,00117$
	xor	a,#0x80
00117$:
	ret	P
;main.c:2685: for (j=0;j<24;j++)
	ld	b,#0x00
00101$:
	ld	a,b
	sub	a,#0x18
	jp	PO,00118$
	xor	a,#0x80
00118$:
	jp	P,00107$
;main.c:2686: put_char(i,j,32);
	push	bc
	ld	a,#0x20
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_put_char
	pop	af
	inc	sp
	pop	bc
;main.c:2685: for (j=0;j<24;j++)
	inc	b
	jr	00101$
00107$:
;main.c:2684: for (i=0;i<32;i++)
	inc	c
	jr	00105$
_eraseScreen_end::
;main.c:2689: byte comptePills()
;	---------------------------------
; Function comptePills
; ---------------------------------
_comptePills_start::
_comptePills:
;main.c:2693: c=0;
;main.c:2695: for (x=0;x<32;x++)
	ld	bc,#0x0000
00107$:
	ld	a,b
	sub	a,#0x20
	jr	NC,00110$
;main.c:2696: for (y=0;y<24;y++)
	ld	e,c
	ld	d,#0x00
00103$:
	ld	a,d
	sub	a,#0x18
	jr	NC,00118$
;main.c:2698: delay(1);
	push	bc
	push	de
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
	pop	de
	pop	bc
;main.c:2699: if (get_char(x,y)==CHAR_PILL) c++;
	push	bc
	push	de
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_get_char
	pop	af
	pop	de
	pop	bc
	ld	a,l
	sub	a,#0x3B
	jr	NZ,00105$
	inc	e
00105$:
;main.c:2696: for (y=0;y<24;y++)
	inc	d
	jr	00103$
00118$:
	ld	c,e
;main.c:2695: for (x=0;x<32;x++)
	inc	b
	jr	00107$
00110$:
;main.c:2702: return c;
	ld	l,c
	ret
_comptePills_end::
;main.c:2705: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;main.c:2710: j=0;odd=0;currentFlicker=0;
	ld	hl,#_odd + 0
	ld	(hl), #0x00
	ld	hl,#_currentFlicker + 0
	ld	(hl), #0x00
;main.c:2711: hiscore = 200;
	ld	iy,#_hiscore
	ld	0 (iy),#0xC8
	ld	1 (iy),#0x00
;main.c:2712: workflow = W_SPLASH0;
	ld	hl,#_workflow + 0
	ld	(hl), #0x00
;main.c:2713: screen_mode_2_bitmap();
	call	_screen_mode_2_bitmap
;main.c:2714: activateNmi=NOK;
	ld	hl,#_activateNmi + 0
	ld	(hl), #0x01
;main.c:2715: extend=0;
	ld	hl,#_extend + 0
	ld	(hl), #0x00
;main.c:2716: for (i=0;i<32;i++) sprites[i].y = 204;
	ld	bc,#0x0000
00166$:
	ld	a,c
	sub	a,#0x20
	ld	a,b
	sbc	a,#0x00
	jr	NC,00164$
	ld	l,c
	ld	h,b
	add	hl,hl
	add	hl,hl
	ld	a,#<(_sprites)
	add	a,l
	ld	e,a
	ld	a,#>(_sprites)
	adc	a,h
	ld	d,a
	ld	a,#0xCC
	ld	(de),a
	inc	bc
	jr	00166$
;main.c:2720: while (1)
00164$:
;main.c:2722: if (workflow==W_SPLASH0)
	xor	a,a
	ld	hl,#_workflow + 0
	or	a,(hl)
	jp	NZ,00161$
;main.c:2725: disable_nmi();
	call	_disable_nmi
;main.c:2726: screen_off();
	call	_screen_off
;main.c:2727: rle2vram(BIOS0NAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_BIOS0NAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2729: load_patternrle(BIOS0PATTERNRLE);
	ld	hl,#_BIOS0PATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:2730: duplicate_pattern();
	call	_duplicate_pattern
;main.c:2732: screen_on();
	call	_screen_on
;main.c:2733: for(i=0;i<4;i++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00174$:
	ld	a,-2 (ix)
	sub	a,#0x04
	ld	a,-1 (ix)
	sbc	a,#0x00
	jr	NC,00177$
;main.c:2735: for (j=0;j<6;j++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00170$:
	ld	a,-4 (ix)
	sub	a,#0x06
	ld	a,-3 (ix)
	sbc	a,#0x00
	jr	NC,00176$
;main.c:2737: rle2vram(BIOS0COLORS[j],coltab);
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	sla	c
	rl	b
	ld	hl,#_BIOS0COLORS
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	ld	hl,#0x2000
	push	hl
	push	de
	call	_rle2vram
	pop	af
	pop	af
	pop	bc
;main.c:2738: rle2vram(BIOS0COLORS[j],coltab+2048);
	ld	hl,#_BIOS0COLORS
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	ld	hl,#0x2800
	push	hl
	push	de
	call	_rle2vram
	pop	af
	pop	af
	pop	bc
;main.c:2739: rle2vram(BIOS0COLORS[j],coltab+4096);
	ld	hl,#_BIOS0COLORS
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x3000
	push	hl
	push	bc
	call	_rle2vram
	pop	af
;main.c:2740: delay(5);
	ld	hl,#0x0005
	ex	(sp),hl
	call	_delay
	pop	af
;main.c:2735: for (j=0;j<6;j++)
	inc	-4 (ix)
	jr	NZ,00170$
	inc	-3 (ix)
	jr	00170$
00176$:
;main.c:2733: for(i=0;i<4;i++)
	inc	-2 (ix)
	jr	NZ,00174$
	inc	-1 (ix)
	jp	00174$
00177$:
;main.c:2743: screen_off();
	call	_screen_off
;main.c:2744: rle2vram(BIOS1NAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_BIOS1NAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2746: load_patternrle(BIOS1PATTERNRLE);
	ld	hl,#_BIOS1PATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:2747: duplicate_pattern();
	call	_duplicate_pattern
;main.c:2750: rle2vram(BIOS1COLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_BIOS1COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2751: rle2vram(BIOS1COLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_BIOS1COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2752: rle2vram(BIOS1COLORRLE,coltab+4096);	
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_BIOS1COLORRLE
	push	hl
	call	_rle2vram
	pop	af
	pop	af
;main.c:2753: screen_on();
	call	_screen_on
;main.c:2754: enable_nmi();
	call	_enable_nmi
;main.c:2755: pause();
	call	_pause
;main.c:2756: workflow=W_MENU;
	ld	hl,#_workflow + 0
	ld	(hl), #0x02
	jp	00164$
00161$:
;main.c:2759: if (workflow==W_MENU)
	ld	a,(#_workflow + 0)
	sub	a,#0x02
	jp	NZ,00158$
;main.c:2761: activateNmi=NOK;
	ld	hl,#_activateNmi + 0
	ld	(hl), #0x01
;main.c:2762: resetSprites();
	call	_resetSprites
;main.c:2763: updatesprites(0,6);
	ld	hl,#0x0600
	push	hl
	call	_updatesprites
;main.c:2764: delay(1);
	ld	hl,#0x0001
	ex	(sp),hl
	call	_delay
	pop	af
;main.c:2765: screen_off();
	call	_screen_off
;main.c:2766: rle2vram(TITLENAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_TITLENAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2768: load_patternrle(TITLEPATTERNRLE);
	ld	hl,#_TITLEPATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:2769: duplicate_pattern();
	call	_duplicate_pattern
;main.c:2772: rle2vram(TITLECOLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2773: rle2vram(TITLECOLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2774: rle2vram(TITLECOLORRLE,coltab+4096);	
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2775: print_at(5,1,"TO SELECT GAME OPTION,");
	ld	hl,#__str_2
	ex	(sp),hl
	ld	hl,#0x0105
	push	hl
	call	_print_at
	pop	af
;main.c:2776: print_at(5,3,"PRESS BUTTON ON KEYPAD.");
	ld	hl,#__str_3
	ex	(sp),hl
	ld	hl,#0x0305
	push	hl
	call	_print_at
	pop	af
;main.c:2778: print_at(1,7,"1 = SKILL 1/ONE PLAYER/CLASSIC");
	ld	hl,#__str_4
	ex	(sp),hl
	ld	hl,#0x0701
	push	hl
	call	_print_at
	pop	af
;main.c:2779: print_at(1,9,"2 = SKILL 2/ONE PLAYER/CLASSIC");
	ld	hl,#__str_5
	ex	(sp),hl
	ld	hl,#0x0901
	push	hl
	call	_print_at
	pop	af
;main.c:2780: print_at(1,11,"3 = SKILL 3/ONE PLAYER/CLASSIC");
	ld	hl,#__str_6
	ex	(sp),hl
	ld	hl,#0x0B01
	push	hl
	call	_print_at
	pop	af
;main.c:2781: print_at(1,13,"4 = SKILL 4/ONE PLAYER/CLASSIC");
	ld	hl,#__str_7
	ex	(sp),hl
	ld	hl,#0x0D01
	push	hl
	call	_print_at
	pop	af
;main.c:2783: print_at(1,15,"5 = SKILL 1/ONE PLAYER/EXTEND");
	ld	hl,#__str_8
	ex	(sp),hl
	ld	hl,#0x0F01
	push	hl
	call	_print_at
	pop	af
;main.c:2784: print_at(1,17,"6 = SKILL 2/ONE PLAYER/EXTEND");
	ld	hl,#__str_9
	ex	(sp),hl
	ld	hl,#0x1101
	push	hl
	call	_print_at
	pop	af
;main.c:2785: print_at(1,19,"7 = SKILL 3/ONE PLAYER/EXTEND");
	ld	hl,#__str_10
	ex	(sp),hl
	ld	hl,#0x1301
	push	hl
	call	_print_at
	pop	af
;main.c:2786: print_at(1,21,"8 = SKILL 4/ONE PLAYER/EXTEND");
	ld	hl,#__str_11
	ex	(sp),hl
	ld	hl,#0x1501
	push	hl
	call	_print_at
	pop	af
	pop	af
;main.c:2788: screen_on();
	call	_screen_on
;main.c:2790: enable_nmi();
	call	_enable_nmi
;main.c:2792: while(1)
00118$:
;main.c:2794: if (keypad_1==1) {currentLevel = 1;extend=0;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x01
	jr	NZ,00102$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x01
	ld	hl,#_extend + 0
	ld	(hl), #0x00
	jp	00119$
00102$:
;main.c:2795: if (keypad_1==2) {currentLevel = 5;extend=0;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x02
	jr	NZ,00104$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x05
	ld	hl,#_extend + 0
	ld	(hl), #0x00
	jp	00119$
00104$:
;main.c:2796: if (keypad_1==3) {currentLevel = 10;extend=0;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x03
	jr	NZ,00106$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x0A
	ld	hl,#_extend + 0
	ld	(hl), #0x00
	jr	00119$
00106$:
;main.c:2797: if (keypad_1==4) {currentLevel = 15;extend=0;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x04
	jr	NZ,00108$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x0F
	ld	hl,#_extend + 0
	ld	(hl), #0x00
	jr	00119$
00108$:
;main.c:2800: if (keypad_1==5) {currentLevel = 1;extend=1;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x05
	jr	NZ,00110$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x01
	ld	hl,#_extend + 0
	ld	(hl), #0x01
	jr	00119$
00110$:
;main.c:2801: if (keypad_1==6) {currentLevel = 5;extend=1;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x06
	jr	NZ,00112$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x05
	ld	hl,#_extend + 0
	ld	(hl), #0x01
	jr	00119$
00112$:
;main.c:2802: if (keypad_1==7) {currentLevel = 10;extend=1;break;}
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x07
	jr	NZ,00114$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x0A
	ld	hl,#_extend + 0
	ld	(hl), #0x01
	jr	00119$
00114$:
;main.c:2803: if (keypad_1==8) {currentLevel = 15;extend=1;break;}	
	ld	a,(#_keypad_1 + 0)
	sub	a,#0x08
	jr	NZ,00116$
	ld	hl,#_currentLevel + 0
	ld	(hl), #0x0F
	ld	hl,#_extend + 0
	ld	(hl), #0x01
	jr	00119$
00116$:
;main.c:2804: currentAbsoluteLevel=1;				
	ld	hl,#_currentAbsoluteLevel + 0
	ld	(hl), #0x01
	jp	00118$
00119$:
;main.c:2822: disable_nmi();
	call	_disable_nmi
;main.c:2824: eraseScreen();			
	call	_eraseScreen
;main.c:2825: changeFontColor(15,1);
	ld	hl,#0x010F
	push	hl
	call	_changeFontColor
	pop	af
;main.c:2828: while (j>0)
	ld	bc,#0x0004
00120$:
	ld	a,c
	or	a,b
	jr	Z,00122$
;main.c:2830: center_string(12,grp1);
	push	bc
	ld	hl,#_grp1
	push	hl
	ld	a,#0x0C
	push	af
	inc	sp
	call	_center_string
	inc	sp
	ld	hl,#0x000A
	ex	(sp),hl
	call	_delay
	ld	hl,#__str_12
	ex	(sp),hl
	ld	a,#0x0C
	push	af
	inc	sp
	call	_center_string
	inc	sp
	ld	hl,#0x000A
	ex	(sp),hl
	call	_delay
	pop	af
	pop	bc
;main.c:2834: j--;
	dec	bc
	jr	00120$
00122$:
;main.c:2836: enable_nmi();
	call	_enable_nmi
;main.c:2837: levelParamNbLives = 3;	
	ld	iy,#_levelParamNbLives
	ld	0 (iy),#0x03
	ld	1 (iy),#0x00
;main.c:2838: for (i=0;i<4;i++)
	ld	bc,#0x0000
00178$:
	ld	a,c
	sub	a,#0x04
	ld	a,b
	sbc	a,#0x00
	jr	NC,00181$
;main.c:2839: initCop(i);
	ld	l,c
	push	bc
	ld	a,l
	push	af
	inc	sp
	call	_initCop
	inc	sp
	pop	bc
;main.c:2838: for (i=0;i<4;i++)
	inc	bc
	jr	00178$
00181$:
;main.c:2840: initPlayer();
	call	_initPlayer
;main.c:2841: initBonus();
	call	_initBonus
;main.c:2843: bigTimer = 0;
	ld	iy,#_bigTimer
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:2844: currentBonus = 0;	
	ld	hl,#_currentBonus + 0
	ld	(hl), #0x00
;main.c:2846: player.score = 0;	
	ld	hl,#0x0017 + _player
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:2847: player.doorOpen = NOK;
	ld	hl,#0x0006 + _player
	ld	(hl),#0x01
;main.c:2848: player.nbLives=levelParamNbLives;
	ld	a,(#_levelParamNbLives + 0)
	ld	(#0x001d + _player),a
;main.c:2850: playIntro();
	call	_playIntro
;main.c:2853: screen_off();
	call	_screen_off
;main.c:2855: rle2vram(NAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_NAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2857: load_patternrle(PATTERNRLE);
	ld	hl,#_PATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:2858: duplicate_pattern();
	call	_duplicate_pattern
;main.c:2861: rle2vram(COLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2862: rle2vram(COLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2863: rle2vram(COLORRLE,coltab+4096);	
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2865: rle2vram(SPATTERNRLE,sprtab);	
	ld	hl,#0x3800
	ex	(sp),hl
	ld	hl,#_SPATTERNRLE
	push	hl
	call	_rle2vram
	pop	af
	pop	af
;main.c:2866: renderPlayerLevel();
	call	_renderPlayerLevel
;main.c:2867: renderPlayerNbLives();
	call	_renderPlayerNbLives
;main.c:2868: renderPlayerScore();
	call	_renderPlayerScore
;main.c:2869: renderPlayerHiScore();
	call	_renderPlayerHiScore
;main.c:2871: screen_on();
	call	_screen_on
;main.c:2872: enable_nmi();
	call	_enable_nmi
;main.c:2873: delay(1);
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
;main.c:2874: nextLifeBonus=500;
	ld	iy,#_nextLifeBonus
	ld	0 (iy),#0xF4
	ld	1 (iy),#0x01
;main.c:2876: workflow=W_INGAME;
	ld	hl,#_workflow + 0
	ld	(hl), #0x03
	jp	00164$
00158$:
;main.c:2880: if (workflow==W_INGAME)
	ld	a,(#_workflow + 0)
	sub	a,#0x03
	jr	NZ,00155$
;main.c:2882: screen_off();
	call	_screen_off
;main.c:2883: initLevel(currentLevel); 			
	ld	a,(_currentLevel)
	push	af
	inc	sp
	call	_initLevel
	inc	sp
;main.c:2884: for (i=0;i<4;i++)
	ld	bc,#0x0000
00182$:
	ld	a,c
	sub	a,#0x04
	ld	a,b
	sbc	a,#0x00
	jr	NC,00185$
;main.c:2885: initCop(i);
	ld	l,c
	push	bc
	ld	a,l
	push	af
	inc	sp
	call	_initCop
	inc	sp
	pop	bc
;main.c:2884: for (i=0;i<4;i++)
	inc	bc
	jr	00182$
00185$:
;main.c:2886: screen_on();
	call	_screen_on
;main.c:2887: activateNmi=OK;
	ld	hl,#_activateNmi + 0
	ld	(hl), #0x00
;main.c:2888: enable_nmi();
	call	_enable_nmi
;main.c:2889: stopmusic();
	call	_stopmusic
;main.c:2890: startmusic(music_inGame,LOOP_ON);
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#_music_inGame
	push	hl
	call	_startmusic
	pop	af
	inc	sp
;main.c:2891: gameLoop(); // C'est lui qui va définir le prochaine workflow --> W_NEXTLEVEL	
	call	_gameLoop
	jp	00164$
00155$:
;main.c:2896: if (workflow==W_RETRY)
	ld	a,(#_workflow + 0)
	sub	a,#0x06
	jp	NZ,00152$
;main.c:2898: if (player.nbLives>0) {player.nbLives--;	workflow=W_INGAME;}		else workflow = W_GAMEOVER;												
	ld	hl,#0x001d + _player
	ld	l,(hl)
	ld	a,#0x00
	sub	a,l
	jp	PO,00270$
	xor	a,#0x80
00270$:
	jp	P,00124$
	ld	a,l
	dec	a
	ld	(#0x001d + _player),a
	ld	hl,#_workflow + 0
	ld	(hl), #0x03
	jr	00125$
00124$:
	ld	hl,#_workflow + 0
	ld	(hl), #0x05
00125$:
;main.c:2900: screen_off();
	call	_screen_off
;main.c:2901: for (i=0;i<4;i++)
	ld	bc,#0x0000
00186$:
	ld	a,c
	sub	a,#0x04
	ld	a,b
	sbc	a,#0x00
	jr	NC,00189$
;main.c:2902: initCop(i);
	ld	l,c
	push	bc
	ld	a,l
	push	af
	inc	sp
	call	_initCop
	inc	sp
	pop	bc
;main.c:2901: for (i=0;i<4;i++)
	inc	bc
	jr	00186$
00189$:
;main.c:2905: autoDoorTimer=0;
	ld	iy,#_autoDoorTimer
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;main.c:2906: autoDoorCurrentGfx=17;			
	ld	hl,#_autoDoorCurrentGfx + 0
	ld	(hl), #0x11
;main.c:2907: playerDoors[0].affiche=OK;
	ld	hl,#0x0008 + _playerDoors
	ld	(hl),#0x00
;main.c:2908: playerDoors[0].timer=0;
	ld	hl,#_playerDoors
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:2909: playerDoors[1].affiche=OK;
	ld	hl,#0x0015 + _playerDoors
	ld	(hl),#0x00
;main.c:2910: playerDoors[1].timer=0;
	ld	hl,#0x000d + _playerDoors
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;main.c:2911: renderDoors();		
	call	_renderDoors
;main.c:2912: renderAutoDoor();		
	call	_renderAutoDoor
;main.c:2913: renderPlayerLevel();
	call	_renderPlayerLevel
;main.c:2914: renderPlayerNbLives();
	call	_renderPlayerNbLives
;main.c:2915: renderPlayerScore();	
	call	_renderPlayerScore
;main.c:2916: renderPlayerHiScore	();	
	call	_renderPlayerHiScore
;main.c:2917: screen_on();
	call	_screen_on
;main.c:2918: enable_nmi();
	call	_enable_nmi
;main.c:2919: delay(1);
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
	jp	00164$
00152$:
;main.c:2924: if (workflow==W_NEXTLEVEL)
	ld	a,(#_workflow + 0)
	sub	a,#0x04
	jp	NZ,00149$
;main.c:2926: stopmusic();
	call	_stopmusic
;main.c:2927: delay(5);
	ld	hl,#0x0005
	push	hl
	call	_delay
	pop	af
;main.c:2928: screen_off();
	call	_screen_off
;main.c:2929: disable_nmi();
	call	_disable_nmi
;main.c:2930: rle2vram(TITLENAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_TITLENAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2932: load_patternrle(TITLEPATTERNRLE);
	ld	hl,#_TITLEPATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:2933: duplicate_pattern();
	call	_duplicate_pattern
;main.c:2936: rle2vram(TITLECOLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2937: rle2vram(TITLECOLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2938: rle2vram(TITLECOLORRLE,coltab+4096);
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:2939: changeFontColor(15,1);
	ld	hl,#0x010F
	ex	(sp),hl
	call	_changeFontColor
	pop	af
;main.c:2943: eraseScreen();
	call	_eraseScreen
;main.c:2944: resetSprites();
	call	_resetSprites
;main.c:2945: updatesprites(0,6);
	ld	hl,#0x0600
	push	hl
	call	_updatesprites
;main.c:2946: delay(1);
	ld	hl,#0x0001
	ex	(sp),hl
	call	_delay
	pop	af
;main.c:2947: activateNmi=NOK;
	ld	hl,#_activateNmi + 0
	ld	(hl), #0x01
;main.c:2948: screen_on();			
	call	_screen_on
;main.c:2951: center_string(8,"CONGRATULATIONS !!");
	ld	hl,#__str_13
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_center_string
;main.c:2952: center_string(10,"PRESS FIRE FOR NEXT-LEVEL");
	inc	sp
	ld	hl,#__str_14
	ex	(sp),hl
	ld	a,#0x0A
	push	af
	inc	sp
	call	_center_string
	pop	af
	inc	sp
;main.c:2954: enable_nmi();
	call	_enable_nmi
;main.c:2955: stopmusic();
	call	_stopmusic
;main.c:2956: startmusic(music_nextLevel,LOOP_OFF);
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#_music_nextLevel
	push	hl
	call	_startmusic
	pop	af
	inc	sp
;main.c:2970: pause();
	call	_pause
;main.c:2972: stopmusic();
	call	_stopmusic
;main.c:2976: for (i=0;i<4;i++)
	ld	bc,#0x0000
00190$:
	ld	a,c
	sub	a,#0x04
	ld	a,b
	sbc	a,#0x00
	jr	NC,00193$
;main.c:2977: initCop(i);
	ld	l,c
	push	bc
	ld	a,l
	push	af
	inc	sp
	call	_initCop
	inc	sp
	pop	bc
;main.c:2976: for (i=0;i<4;i++)
	inc	bc
	jr	00190$
00193$:
;main.c:2978: currentLevel++;
	ld	iy,#_currentLevel
	inc	0 (iy)
;main.c:2979: if (currentLevel>3)
	ld	a,#0x03
	sub	a,0 (iy)
	jr	NC,00133$
;main.c:2981: if ((currentLevel%3)==0) currentAbsoluteLevel=3;
	ld	a,#0x03
	push	af
	inc	sp
	ld	a,(_currentLevel)
	push	af
	inc	sp
	call	__moduchar_rrx_s
	pop	af
	xor	a,a
	or	a,l
	jr	NZ,00130$
	ld	hl,#_currentAbsoluteLevel + 0
	ld	(hl), #0x03
	jr	00134$
00130$:
;main.c:2983: if ((currentLevel%2)==0) currentAbsoluteLevel=2;
	ld	a,(#_currentLevel + 0)
	and	a,#0x01
	jr	NZ,00127$
	ld	hl,#_currentAbsoluteLevel + 0
	ld	(hl), #0x02
	jr	00134$
00127$:
;main.c:2985: currentAbsoluteLevel=1;
	ld	hl,#_currentAbsoluteLevel + 0
	ld	(hl), #0x01
	jr	00134$
00133$:
;main.c:2989: currentAbsoluteLevel = currentLevel;
	ld	a,(#_currentLevel + 0)
	ld	(#_currentAbsoluteLevel + 0),a
00134$:
;main.c:2992: player.doorOpen = NOK; // Les portes sont de nouveaux fermées			
	ld	hl,#0x0006 + _player
	ld	(hl),#0x01
;main.c:2994: disable_nmi();
	call	_disable_nmi
;main.c:2995: screen_off();
	call	_screen_off
;main.c:2999: if (extend==1)
	ld	a,(#_extend + 0)
	sub	a,#0x01
	jp	NZ,00142$
;main.c:3001: if ((currentAbsoluteLevel)==3)
	ld	a,(#_currentAbsoluteLevel + 0)
	sub	a,#0x03
	jr	NZ,00139$
;main.c:3003: rle2vram(NAMERLE_LEVEL3,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_NAMERLE_LEVEL3
	push	hl
	call	_rle2vram
	pop	af
;main.c:3005: load_patternrle(PATTERNRLE_LEVEL3);
	ld	hl,#_PATTERNRLE_LEVEL3
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:3006: duplicate_pattern();
	call	_duplicate_pattern
;main.c:3009: rle2vram(COLORRLE_LEVEL3,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_COLORRLE_LEVEL3
	push	hl
	call	_rle2vram
	pop	af
;main.c:3010: rle2vram(COLORRLE_LEVEL3,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_COLORRLE_LEVEL3
	push	hl
	call	_rle2vram
	pop	af
;main.c:3011: rle2vram(COLORRLE_LEVEL3,coltab+4096);					
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_COLORRLE_LEVEL3
	push	hl
	call	_rle2vram
	pop	af
	pop	af
	jp	00143$
00139$:
;main.c:3013: else if ((currentAbsoluteLevel)==2)
	ld	a,(#_currentAbsoluteLevel + 0)
	sub	a,#0x02
	jr	NZ,00136$
;main.c:3015: rle2vram(NAMERLE_LEVEL2,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_NAMERLE_LEVEL2
	push	hl
	call	_rle2vram
	pop	af
;main.c:3017: load_patternrle(PATTERNRLE_LEVEL2);
	ld	hl,#_PATTERNRLE_LEVEL2
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:3018: duplicate_pattern();
	call	_duplicate_pattern
;main.c:3021: rle2vram(COLORRLE_LEVEL2,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_COLORRLE_LEVEL2
	push	hl
	call	_rle2vram
	pop	af
;main.c:3022: rle2vram(COLORRLE_LEVEL2,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_COLORRLE_LEVEL2
	push	hl
	call	_rle2vram
	pop	af
;main.c:3023: rle2vram(COLORRLE_LEVEL2,coltab+4096);					
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_COLORRLE_LEVEL2
	push	hl
	call	_rle2vram
	pop	af
	pop	af
	jr	00143$
00136$:
;main.c:3027: rle2vram(NAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_NAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3029: load_patternrle(PATTERNRLE);
	ld	hl,#_PATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:3030: duplicate_pattern();
	call	_duplicate_pattern
;main.c:3033: rle2vram(COLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3034: rle2vram(COLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3035: rle2vram(COLORRLE,coltab+4096);						
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
	pop	af
	jr	00143$
00142$:
;main.c:3040: rle2vram(NAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_NAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3042: load_patternrle(PATTERNRLE);
	ld	hl,#_PATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:3043: duplicate_pattern();
	call	_duplicate_pattern
;main.c:3046: rle2vram(COLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3047: rle2vram(COLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3048: rle2vram(COLORRLE,coltab+4096);	
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_COLORRLE
	push	hl
	call	_rle2vram
	pop	af
	pop	af
00143$:
;main.c:3051: renderPlayerLevel();
	call	_renderPlayerLevel
;main.c:3052: renderPlayerNbLives();
	call	_renderPlayerNbLives
;main.c:3053: renderPlayerScore();	
	call	_renderPlayerScore
;main.c:3054: renderPlayerHiScore	();		
	call	_renderPlayerHiScore
;main.c:3055: screen_on();
	call	_screen_on
;main.c:3056: enable_nmi();
	call	_enable_nmi
;main.c:3058: delay(1);
	ld	hl,#0x0001
	push	hl
	call	_delay
	pop	af
;main.c:3059: initPlayer();
	call	_initPlayer
;main.c:3060: workflow=W_INGAME;
	ld	hl,#_workflow + 0
	ld	(hl), #0x03
	jp	00164$
00149$:
;main.c:3063: if (workflow==W_GAMEOVER)
	ld	a,(#_workflow + 0)
	sub	a,#0x05
	jp	NZ,00164$
;main.c:3065: activateNmi=NOK;
	ld	hl,#_activateNmi + 0
	ld	(hl), #0x01
;main.c:3066: screen_off();
	call	_screen_off
;main.c:3067: disable_nmi();
	call	_disable_nmi
;main.c:3068: rle2vram(TITLENAMERLE,chrtab);	
	ld	hl,#0x1800
	push	hl
	ld	hl,#_TITLENAMERLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3070: load_patternrle(TITLEPATTERNRLE);
	ld	hl,#_TITLEPATTERNRLE
	ex	(sp),hl
	call	_load_patternrle
	pop	af
;main.c:3071: duplicate_pattern();
	call	_duplicate_pattern
;main.c:3074: rle2vram(TITLECOLORRLE,coltab);
	ld	hl,#0x2000
	push	hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3075: rle2vram(TITLECOLORRLE,coltab+2048);
	ld	hl,#0x2800
	ex	(sp),hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3076: rle2vram(TITLECOLORRLE,coltab+4096);
	ld	hl,#0x3000
	ex	(sp),hl
	ld	hl,#_TITLECOLORRLE
	push	hl
	call	_rle2vram
	pop	af
;main.c:3077: changeFontColor(15,1);
	ld	hl,#0x010F
	ex	(sp),hl
	call	_changeFontColor
	pop	af
;main.c:3081: eraseScreen();
	call	_eraseScreen
;main.c:3082: resetSprites();
	call	_resetSprites
;main.c:3083: updatesprites(0,6);
	ld	hl,#0x0600
	push	hl
	call	_updatesprites
;main.c:3084: center_string(8,"GAME OVER");
	ld	hl,#__str_15
	ex	(sp),hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_center_string
;main.c:3085: center_string(10,"FINAL SCORE");
	inc	sp
	ld	hl,#__str_16
	ex	(sp),hl
	ld	a,#0x0A
	push	af
	inc	sp
	call	_center_string
	pop	af
	inc	sp
;main.c:3086: center_string(12,str(player.score));
	ld	hl,#0x0017 + _player
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_str
	ex	(sp),hl
	ld	a,#0x0C
	push	af
	inc	sp
	call	_center_string
	pop	af
	inc	sp
;main.c:3087: if (player.score>hiscore) 
	ld	hl,#0x0017 + _player
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_hiscore
	ld	a,(hl)
	sub	a,c
	inc	hl
	ld	a,(hl)
	sbc	a,b
	jr	NC,00145$
;main.c:3089: center_string(15,"YOU'VE GOT HIGH SCORE !!");
	ld	hl,#__str_17
	push	hl
	ld	a,#0x0F
	push	af
	inc	sp
	call	_center_string
	pop	af
	inc	sp
;main.c:3090: hiscore=player.score;
	ld	hl,#0x0017 + _player
	ld	a,(hl)
	ld	iy,#_hiscore
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	1 (iy),a
00145$:
;main.c:3092: screen_on();
	call	_screen_on
;main.c:3093: enable_nmi();
	call	_enable_nmi
;main.c:3094: stopmusic();
	call	_stopmusic
;main.c:3095: startmusic(music_gameOver,LOOP_OFF);
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#_music_gameOver
	push	hl
	call	_startmusic
	pop	af
	inc	sp
;main.c:3096: pause();
	call	_pause
;main.c:3097: workflow=W_MENU;
	ld	hl,#_workflow + 0
	ld	(hl), #0x02
	jp	00164$
_main_end::
__str_2:
	.ascii "TO SELECT GAME OPTION,"
	.db 0x00
__str_3:
	.ascii "PRESS BUTTON ON KEYPAD."
	.db 0x00
__str_4:
	.ascii "1 = SKILL 1/ONE PLAYER/CLASSIC"
	.db 0x00
__str_5:
	.ascii "2 = SKILL 2/ONE PLAYER/CLASSIC"
	.db 0x00
__str_6:
	.ascii "3 = SKILL 3/ONE PLAYER/CLASSIC"
	.db 0x00
__str_7:
	.ascii "4 = SKILL 4/ONE PLAYER/CLASSIC"
	.db 0x00
__str_8:
	.ascii "5 = SKILL 1/ONE PLAYER/EXTEND"
	.db 0x00
__str_9:
	.ascii "6 = SKILL 2/ONE PLAYER/EXTEND"
	.db 0x00
__str_10:
	.ascii "7 = SKILL 3/ONE PLAYER/EXTEND"
	.db 0x00
__str_11:
	.ascii "8 = SKILL 4/ONE PLAYER/EXTEND"
	.db 0x00
__str_12:
	.ascii "                  "
	.db 0x00
__str_13:
	.ascii "CONGRATULATIONS !!"
	.db 0x00
__str_14:
	.ascii "PRESS FIRE FOR NEXT-LEVEL"
	.db 0x00
__str_15:
	.ascii "GAME OVER"
	.db 0x00
__str_16:
	.ascii "FINAL SCORE"
	.db 0x00
__str_17:
	.ascii "YOU'VE GOT HIGH SCORE !!"
	.db 0x00
;main.c:3106: void nmi(void)
;	---------------------------------
; Function nmi
; ---------------------------------
_nmi_start::
_nmi:
;main.c:3109: if (activateNmi==OK)
	xor	a,a
	ld	hl,#_activateNmi + 0
	or	a,(hl)
	jp	NZ,00115$
;main.c:3111: if (autoDoorTimer!=0) autoDoorTimer--; // Le temps que dure une animation d'autoDoor (8 animation pour une fermeture, 8 pour une ouverture)
	ld	iy,#_autoDoorTimer
	ld	a,0 (iy)
	or	a,1 (iy)
	jr	Z,00102$
	ld	hl,(_autoDoorTimer)
	dec	hl
	ld	(_autoDoorTimer),hl
00102$:
;main.c:3112: if (scatterModeTimer!=0) scatterModeTimer--;	
	ld	iy,#_scatterModeTimer
	ld	a,0 (iy)
	or	a,1 (iy)
	jr	Z,00104$
	ld	hl,(_scatterModeTimer)
	dec	hl
	ld	(_scatterModeTimer),hl
00104$:
;main.c:3114: if (animateSprite!=9) animateSprite++; else {animateSprite = 0;renderPlayerScore();}
	ld	iy,#_animateSprite
	ld	a,0 (iy)
	sub	a,#0x09
	jr	Z,00106$
	inc	0 (iy)
	jr	00107$
00106$:
	ld	hl,#_animateSprite + 0
	ld	(hl), #0x00
	call	_renderPlayerScore
00107$:
;main.c:3116: if (currentFlicker<2) currentFlicker++; else currentFlicker=1;
	ld	iy,#_currentFlicker
	ld	a,0 (iy)
	sub	a,#0x02
	jr	NC,00109$
	inc	0 (iy)
	jr	00110$
00109$:
	ld	hl,#_currentFlicker + 0
	ld	(hl), #0x01
00110$:
;main.c:3117: if (currentFlicker==2) put_vram (0x1b00,sprites,128); 
	ld	a,(#_currentFlicker + 0)
	sub	a,#0x02
	jr	NZ,00112$
	ld	hl,#0x0080
	push	hl
	ld	hl,#_sprites
	push	hl
	ld	hl,#0x1B00
	push	hl
	call	_put_vram
	pop	af
	pop	af
	pop	af
	jr	00115$
00112$:
;main.c:3120: memcpyb(bsprites,sprites+16,64);
	ld	hl,#0x0040
	push	hl
	ld	hl,#0x0040 + _sprites
	push	hl
	ld	hl,#_bsprites
	push	hl
	call	_memcpyb
	pop	af
	pop	af
;main.c:3121: memcpyb(bsprites+16,sprites,64);
	ld	hl,#0x0040
	ex	(sp),hl
	ld	hl,#_sprites
	push	hl
	ld	hl,#0x0040 + _bsprites
	push	hl
	call	_memcpyb
	pop	af
	pop	af
;main.c:3122: put_vram (0x1b00,bsprites,128);				
	ld	hl,#0x0080
	ex	(sp),hl
	ld	hl,#_bsprites
	push	hl
	ld	hl,#0x1B00
	push	hl
	call	_put_vram
	pop	af
	pop	af
	pop	af
00115$:
;main.c:3128: G_TickCount++;
	ld	iy,#_G_TickCount
	inc	0 (iy)
	jr	NZ,00127$
	inc	1 (iy)
00127$:
;main.c:3129: G_count++;
	ld	iy,#_G_count
	inc	0 (iy)
	jr	NZ,00128$
	inc	1 (iy)
00128$:
;main.c:3132: sound_nmi();
	call	_sound_nmi
	ret
_nmi_end::
	.area _CODE
	.area _CABS
