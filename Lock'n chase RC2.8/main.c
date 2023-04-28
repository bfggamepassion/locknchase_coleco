#include <string.h>
#include <coleco.h>
#include <getput1.h>
#include <math.h>

#define chrtab  0x1800 /* écran en linéaire */
#define chrgen  0x0000 /* table des caractères */
#define coltab  0x2000 /* couleur des caractères */
#define sprtab  0x3800 /* sprite_pattern_table */
#define sprgen  0x1b00 /* sprite_attribute_table */
#define buffer  0x1c00 /* buffer screen 2 */

#define LOOP_ON 1
#define LOOP_OFF 0

#define HAUT 0
#define BAS 1
#define GAUCHE 2
#define DROITE 3
#define STOP 4

#define OUI 1
#define NON 0

#define OK 0
#define NOK 1

#define CHAR_VIDE	0
#define CHAR_PILL	59
#define CHAR_ZONEDOOR 105
#define TELEPORTD   103
#define TELEPORTG   104

#define CHASE 0
#define SCATTER 1

#define HORIZONTAL 0
#define VERTICAL 1

#define BONUS1 48
#define BONUS2 52
#define BONUS3 56
#define BONUS4 60
#define BONUS5 64
#define BONUS6 68
#define BONUS7 72
#define BONUS8 76
#define BONUS9 80
#define BONUS10 84

#define W_SPLASH0	0
#define W_SPLASH1	1
#define W_MENU	2
#define	W_INGAME 3
#define W_NEXTLEVEL 4
#define W_GAMEOVER 5
#define W_RETRY 6

#define SPRITE0 0
#define SPRITE1 31
#define SPRITE2 1
#define SPRITE3 30
#define SPRITE4 2
#define SPRITE5 29
#define SPRITE6 3

extern const byte NAMERLE[];
extern const byte NAMERLE_INTRO[];
extern const byte PATTERNRLE[];
extern const byte COLORRLE[];
extern const byte SPATTERNRLE[];
extern const byte GHOSTGAMEZONE[];

extern const byte NAMERLE_LEVEL2[];
extern const byte PATTERNRLE_LEVEL2[];
extern const byte COLORRLE_LEVEL2[];
extern const byte GHOSTGAMEZONE_LEVEL2[];

extern const byte NAMERLE_LEVEL3[];
extern const byte PATTERNRLE_LEVEL3[];
extern const byte COLORRLE_LEVEL3[];
extern const byte GHOSTGAMEZONE_LEVEL3[];

extern const void direct_sound(byte sound);

extern const unsigned char music_nextLevel[];
extern const unsigned char music_gameOver[];
extern const unsigned char music_inGame[];
extern const unsigned char music_looseLife[];
extern const unsigned char sfx_piece[];
extern const unsigned char sfx_bonus[];
extern const unsigned char sfx_porte[];


extern const byte BIOS0NAMERLE[];
extern const byte BIOS0PATTERNRLE[];

extern const byte* BIOS0COLORS[];


extern const byte BIOS1NAMERLE[];
extern const byte BIOS1PATTERNRLE[];
extern const byte BIOS1COLORRLE[];

extern const byte TITLENAMERLE[];
extern const byte TITLEPATTERNRLE[];
extern const byte TITLECOLORRLE[];

static const byte BONUS[72] = 
{
	BONUS1,BONUS2,BONUS3,BONUS1,BONUS2,BONUS3,BONUS1,BONUS2,BONUS3,
	BONUS1,BONUS2,BONUS4,BONUS1,BONUS2,BONUS4,BONUS1,BONUS2,BONUS4,
	BONUS1,BONUS2,BONUS5,BONUS1,BONUS2,BONUS5,BONUS1,BONUS2,BONUS5,
	BONUS1,BONUS2,BONUS6,BONUS1,BONUS2,BONUS6,BONUS1,BONUS2,BONUS6,
	BONUS1,BONUS2,BONUS7,BONUS1,BONUS2,BONUS7,BONUS1,BONUS2,BONUS7,
	BONUS1,BONUS2,BONUS8,BONUS1,BONUS2,BONUS8,BONUS1,BONUS2,BONUS8,
	BONUS1,BONUS2,BONUS9,BONUS1,BONUS2,BONUS9,BONUS1,BONUS2,BONUS9,
	BONUS1,BONUS2,BONUS10,BONUS1,BONUS2,BONUS10,BONUS1,BONUS2,BONUS2};

static const byte horizontalSpace[2] = {0,0};

static const byte gfxAutoDoor[18][2] = {
	{128,136},
	{129,137},
	{130,138},
	{131,139},
	{132,140},
	{133,141},
	{134,142},
	{135,143},
	{135,143},
	{135,143},
	{134,142},
	{133,141},
	{132,140},
	{131,139},
	{130,138},
	{129,137},
	{128,136},
	{0,0}
};

static const char grp1[] = "GET READY PLAYER 1";

typedef struct
{
	byte px,py;
	byte cx,cy,oldcx,oldcy;
	
	byte doorOpen;   // Les portes de sorties pour terminer le niveau sont elles ouvertes ?
	
	byte pattern1,pattern2,colour1,colour2;
	byte oldDirection; // Sert pout le speed turn
	byte direction;
	byte regard;
	byte nbpills;
	byte lastDoor1Cx,lastDoor1Cy;
	byte lastDoor2Cx,lastDoor2Cy;
	
	byte lastDoorGlobalPxStart,lastDoorGlobalPyStart;
	byte lastDoorGlobalHauteur,lastDoorGlobalLargeur;
	
	unsigned score;
	
	byte nbPillsLevel;
	unsigned nbMoveForBonus;
	byte pause;
	char nbLives;
	byte lastMvt;
	byte currentAnim;
	
} s_player;

unsigned hiscore;

s_player player;

typedef struct
{
	byte px,py;    // Position x et y en pixels
	byte cx,cy;    // Position x et y en caractères
	byte targetx,targety;	// Destination x et y en caractères
	byte pattern1;
	byte direction;
	byte regard;
	byte sprno;
	byte col;
	byte lastMvt;
	//byte flicker; // Va t'il flicker ?	
	byte pause;
} s_cop;

s_cop cop[4];

typedef struct 
{
	unsigned timer;
	byte c1x,c1y;
	byte c2x,c2y;
	char c1,c2;
	char affiche;
	
	byte doorGlobalPxStart,doorGlobalPyStart;
	byte doorGlobalHauteur,doorGlobalLargeur;
} s_playerDoors;

s_playerDoors playerDoors[2]; // 0-1 : Portes gérables par le joueur

typedef struct
{
	byte cx,cy;
	byte px,py;
} s_autoDoors;

s_autoDoors autoDoors[4]; 

byte autoDoorCurrentGfx;

typedef struct
{
	byte actif;
	byte affiche;
	byte cx,cy;
	byte px,py;
	byte pattern;
	byte colour;
	byte sprno;
} s_bonus;

s_bonus bonus;

char extend;
byte currentBonus;

//byte flickerTimer;
byte animateSprite;
unsigned scatterModeTimer;

unsigned autoDoorTimer; // Le temps que dure une animation d'autoDoor (8 animation pour une fermeture, 8 pour une ouverture)
unsigned autoDoorCurrentFrame; // Image courante de l'autoDoor
unsigned autoDoorCurrentMove; // 0 - Fermeture 1 - Ouverture 2 - On réinitialise tout !!

//byte dernierFlicker;
unsigned bigTimer;
byte currentLevel;
byte currentAbsoluteLevel;
byte workflow;

byte currentFlicker;
sprite_t bsprites[32];
byte odd;


/* Paramètres pour régler le niveau de difficulté*/
/* Vitesse des flics 0-10 */
byte levelParamCop0Speed;
byte levelParamCop1Speed;
byte levelParamCop2Speed;
byte levelParamCop3Speed;
/* Durée du scatterMode */
unsigned levelParamScatterModeTime;
/* Durée de freeze des ennemis/joueur (l'attente du joueur doit être inférieure) lors de la prise d'un bonus */
unsigned levelParamCopFreezeBonus;
/* Combien de temps reste le bonus affiché ? */
unsigned levelParamBonusShowTime;
/* Affiche t'on les porte automatiques ? */
byte levelParamShowAutoDoors;
/* Durée d'attente des ennemis au début du jeu */
unsigned levelParamCop0FreezeStart;
unsigned levelParamCop1FreezeStart;
unsigned levelParamCop2FreezeStart;
unsigned levelParamCop3FreezeStart;
/* Nb de vie*/
unsigned levelParamNbLives;
/* Temps de fermeture des portes */
unsigned levelParamShowPlayerDoors;

byte directionDemandee;
byte timerDirectionDemandee;

byte activateNmi;

unsigned nextLifeBonus;

// Images de la voiture
const byte frm[3][8] = {
							{224,231,235,239,225,232,236,240},
							{226,233,237,241,227,234,238,242},
							{230,230,230,230,230,230,230,230}
						};

/* ******************************************************************************* */
/* ***************** ROUTINES SONORES ******************************************** */
/* ******************************************************************************* */
unsigned int G_TickCount = 0;
unsigned int G_LastTick = 0;
unsigned int G_count = 0;
unsigned int G_ATATTick = 0;
unsigned int G_ATATTickShoot = 0;
unsigned int G_KILLTick = 0;
byte loopMusic;
byte sfxEnCours;
volatile char vola=0;
volatile unsigned char *pPlayList=NULL;		// audio playlist
volatile unsigned char *pPlayListForLoop=NULL;		// audio playlist
unsigned char nPlayDelay=1;
volatile unsigned char *pSfxList=NULL;		// sfx audio playlist
unsigned char nSfxDelay=1;
const byte snd_table[]={0};

int modulo(int a,int b)
{
	return a%b;
}

void sound_nmi(void)
{
	unsigned char nDat;
	//unsigned int startadress;

	// scramble random number
	//rand();

	// release any waiting code
//	step = true;

	
	

	// handle music - format ripped from an MSX emulator:
	// first byte: frame count (8 bits)
	// second byte: data
	// third byte: only if tone data in second byte
	// repeat until frame count is in the future
	if (NULL != pPlayList) {
		nPlayDelay++;
		if (nPlayDelay == *(pPlayList))
		{
    		while (nPlayDelay==*(pPlayList))
			{
				nDat=*(++pPlayList);
				if (0 == nDat) {
				
					if (loopMusic==LOOP_OFF) pPlayList=NULL;
					else {pPlayList=pPlayListForLoop;nPlayDelay=(*pPlayListForLoop)-1;}
					break;
				}
				switch (nDat&0x90) {
					case 0x80:		// load sample
						//audport=nDat;
						//audport=*(++pPlayList);
						direct_sound(nDat);
						if ((nDat&0xe0) != 0xe0) direct_sound(*(++pPlayList));
						break;
					case 0x90:		// load volume
						//audport=nDat;
						direct_sound(nDat);
						break;
					default:		// don't know what this is, should abort
						pPlayList=NULL;
						break;
				}
				// point to next frame count
				pPlayList++;
			}
		}
	}

	if (NULL != pSfxList)
  {
		nSfxDelay++;
		if (nSfxDelay == *(pSfxList))
    {
			while (nSfxDelay==*(pSfxList))
      {
				nDat=*(++pSfxList);
				if (0 == nDat) {
					pSfxList=NULL;
					sfxEnCours = NON;
					break;
				}
				switch (nDat&0x90) {
					case 0x80:		// load sample
						//audport=nDat;
						//audport=*(++pSfxList);
						direct_sound(nDat);
						if ((nDat&0xe0) != 0xe0) direct_sound(*(++pSfxList));
						break;
					case 0x90:		// load volume
						direct_sound(nDat);
						break;
					default:		// don't know what this is, should abort
						pSfxList=NULL;
						sfxEnCours=NON;
						break;
				}
				// point to next frame count
				/*if (pSfxList!=NULL)*/ pSfxList++;
			}
		}
	}

}

// stops sfx too
void stopmusic() {
	pPlayList=NULL;
	pPlayListForLoop=NULL;
	pSfxList=NULL;
	direct_sound(0x9F);
	direct_sound(0xAF);
	direct_sound(0xDF);
	direct_sound(0xFF);
}

void startmusic(unsigned char *pDat,byte loop) {
	// order here is important
	loopMusic = loop;
	if (NULL != pPlayList) {
		stopmusic();
	}

	nPlayDelay=(*pDat)-1;
	pPlayList=pDat;
	pPlayListForLoop=pDat;

}

void startsfxPrio(unsigned char *pDat) {
	// order here is important
	if (NULL != pSfxList) {
		pSfxList=NULL;
	}

	nSfxDelay=(*pDat)-1;
	pSfxList=pDat;
	sfxEnCours = OUI;
}

void startsfx(unsigned char *pDat) {
	// order here is important
	if (NULL != pSfxList) {
		pSfxList=NULL;
	}

	nSfxDelay=(*pDat)-1;
	pSfxList=pDat;
}
/* ******************************************************************************* */
/* ***************** FIN ROUTINES SONORES **************************************** */
/* ******************************************************************************* */

void changeFontColor(byte col1,byte col2)
{
	byte finalColor;
	
	finalColor = col1 << 4;
	finalColor+= col2;
	
	fill_vram(coltab+(32*8),finalColor,59*8);
	fill_vram(coltab+(32*8)+2048,finalColor,59*8);
	fill_vram(coltab+(32*8)+4096,finalColor,59*8);
}

void addScore(byte s)
{
	if (player.score<=65000) player.score+=s;
}

void initBonus()
{
	sprites[SPRITE6].y = 204;
	bonus.py=204;
	bonus.actif = NOK;
	bonus.affiche = NOK;
	currentBonus = 0;
}

void desactivateBonus()
{
	bonus.py = 204;
	sprites[SPRITE6].y = 204;
	
	bonus.actif = NOK;
	bonus.affiche = NOK;
}

void createBonus()
{
	if (bonus.actif==NOK)
	{
		bonus.actif = OK;
		bonus.pattern = BONUS[currentBonus];
		currentBonus++;
		if (currentBonus==72) currentBonus = 69;
		
		if (bonus.pattern==BONUS1) bonus.colour = 10;
		else if (bonus.pattern==BONUS2) bonus.colour = 4;
		else if (bonus.pattern==BONUS3) bonus.colour = 10;
		else if (bonus.pattern==BONUS4) bonus.colour = 13;
		else if (bonus.pattern==BONUS5) bonus.colour = 12;
		else if (bonus.pattern==BONUS6) bonus.colour = 10;
		else if (bonus.pattern==BONUS7) bonus.colour = 7;
		else if (bonus.pattern==BONUS8) bonus.colour = 15;
		else if (bonus.pattern==BONUS9) bonus.colour = 14;
		else if (bonus.pattern==BONUS10) bonus.colour = 6;
		
		bonus.px = 120;bonus.py = 72;
		if ( (player.py>=72) && (player.py<=88) ) { bonus.px = 120;bonus.py = 104; }
		player.nbMoveForBonus = levelParamBonusShowTime;
	}
}

void renderBonus()
{
	if (bonus.actif == OK)
	{
		if (player.nbMoveForBonus==0) {desactivateBonus();} else {player.nbMoveForBonus --;}

		// Déplacé dans le if (PERF) + flag affiche pour ne pas réaffecter à chaque tour.
		if (bonus.affiche = NOK)
		{
			sprites[SPRITE6].pattern = bonus.pattern;
			sprites[SPRITE6].colour = bonus.colour;
			sprites[SPRITE6].x = bonus.px;
			sprites[SPRITE6].y = bonus.py;

			bonus.affiche = OK;			
		}		
	}
}


void renderPlayerScore(void)
{
	char *pointage;
	pointage = str(player.score);
	
	put_char(2,3,pointage[0]);
	put_char(2,4,pointage[1]);
	put_char(2,5,pointage[2]);
	put_char(2,6,pointage[3]);
	put_char(2,7,pointage[4]);
	
}

void renderPlayerHiScore(void)
{
	char *pointage;
	pointage = str(hiscore);

	put_char(30,3,pointage[0]);
	put_char(30,4,pointage[1]);
	put_char(30,5,pointage[2]);
	put_char(30,6,pointage[3]);
	put_char(30,7,pointage[4]);

} 

void renderPlayerNbLives(void)
{
	char *pointage;
	pointage = str(player.nbLives);

	put_char(3,19,pointage[4]);

}

void renderPlayerLevel(void)
{
	char *pointage;
	pointage = str(currentLevel);

	put_char(29,20,pointage[2]);
	put_char(29,21,pointage[3]);	
	put_char(29,22,pointage[4]);

}

// OK _ Collision    NOK_PAS DE COLLISION
byte isCollision(byte x1,byte y1,byte h1,byte l1,byte x2,byte y2,byte h2,byte l2)
{
	if(x1 > x2+l2) return NOK;
	if(x1+l1 < x2) return NOK;
	if(y1 > y2+h2) return NOK;
	if(y1+h1 < y2) return NOK;
	
	return OK;
}

byte peekGhostGameZone(byte x,byte y)
{
	if (extend==0)
	{
		return GHOSTGAMEZONE[x+(y<<5)];
	}
	else
	{
		if (currentAbsoluteLevel==3) 
		{			
			return GHOSTGAMEZONE_LEVEL3[x+(y<<5)];
		}
		else
		if (currentAbsoluteLevel==2) 
		{			
			return GHOSTGAMEZONE_LEVEL2[x+(y<<5)];
		}
		else
			return GHOSTGAMEZONE[x+(y<<5)];
	}
}


void initAutoDoor(void)
{
	byte h;				
	s_autoDoors *d0 = &autoDoors[0];
	s_autoDoors *d1 = &autoDoors[1];
	s_autoDoors *d2 = &autoDoors[2];
	s_autoDoors *d3 = &autoDoors[3];
	
	byte *d0_cx = &d0->cx;
	byte *d0_cy = &d0->cy;
	byte *d0_px = &d0->px;
	byte *d0_py = &d0->py;

	byte *d1_cx = &d1->cx;
	byte *d1_cy = &d1->cy;
	byte *d1_px = &d1->px;
	byte *d1_py = &d1->py;

	byte *d2_cx = &d2->cx;
	byte *d2_cy = &d2->cy;
	byte *d2_px = &d2->px;
	byte *d2_py = &d2->py;
	
	byte *d3_cx = &d3->cx;
	byte *d3_cy = &d3->cy;
	byte *d3_px = &d3->px;
	byte *d3_py = &d3->py;
	
	h = rnd_byte(0,2);
	autoDoorTimer=0;
	autoDoorCurrentMove=0;
	autoDoorCurrentGfx=0;
	
	if (h==0)
	{
		(*d0_cx) = 9;						// Démarrage de la porte
		(*d0_cy) = 8;
		(*d0_px) = 72;						// Démarrage de la porte
		(*d0_py) = 64;

		(*d1_cx) = 13;
		(*d1_cy) = 12;
		(*d1_px) = 104;
		(*d1_py) = 96;

		
		(*d2_cx) = 17;
		(*d2_cy) = 12;
		(*d2_px) = 136;
		(*d2_py) = 96;

		
		(*d3_cx) = 17;
		(*d3_cy) = 16;
		(*d3_px) = 136;
		(*d3_py) = 128;

	} else
	if (h==1)
	{
		(*d0_cx) = 9;						// Démarrage de la porte
		(*d0_cy) = 12;
		(*d0_px) = 72;						// Démarrage de la porte
		(*d0_py) = 96;

		(*d1_cx) = 13;
		(*d1_cy) = 12;
		(*d1_px) = 104;
		(*d1_py) = 96;

		
		(*d2_cx) = 17;
		(*d2_cy) = 12;
		(*d2_px) = 136;
		(*d2_py) = 96;

		
		(*d3_cx) = 21;
		(*d3_cy) = 12;
		(*d3_px) = 252;
		(*d3_py) = 96;
	}	
	else
	{
		(*d0_cx) = 5;						// Démarrage de la porte
		(*d0_cy) = 12;
		(*d0_px) = 40;						// Démarrage de la porte
		(*d0_py) = 96;

		(*d1_cx) = 13;
		(*d1_cy) = 12;
		(*d1_px) = 104;
		(*d1_py) = 96;

		
		(*d2_cx) = 17;
		(*d2_cy) = 12;
		(*d2_px) = 136;
		(*d2_py) = 96;

		
		(*d3_cx) = 25;
		(*d3_cy) = 12;
		(*d3_px) = 200;
		(*d3_py) = 96;	
	}
	
}

void renderAutoDoor(void)
{
	s_autoDoors *d0 = &autoDoors[0];
	s_autoDoors *d1 = &autoDoors[1];
	s_autoDoors *d2 = &autoDoors[2];
	s_autoDoors *d3 = &autoDoors[3];
	
	byte *d0_cx = &d0->cx;
	byte *d0_cy = &d0->cy;

	byte *d1_cx = &d1->cx;
	byte *d1_cy = &d1->cy;

	byte *d2_cx = &d2->cx;
	byte *d2_cy = &d2->cy;

	byte *d3_cx = &d3->cx;
	byte *d3_cy = &d3->cy;
	
	if (autoDoorTimer==0) // On va avancer les portes
	{	
		disable_nmi();
		put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d0_cx),(*d0_cy),2,1);	
		put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d1_cx),(*d1_cy),2,1);	
		put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d2_cx),(*d2_cy),2,1);	
		put_frame(&gfxAutoDoor[autoDoorCurrentGfx],(*d3_cx),(*d3_cy),2,1);
		enable_nmi();

		if (autoDoorCurrentGfx<17) autoDoorCurrentGfx++; else {autoDoorCurrentGfx=0;initAutoDoor();}
		
		autoDoorTimer = 10;
	}
	
}


byte isPlayerDirectionFree(char direction)
{
	byte tx1,ty1,tx2,ty2,res1,res2,res,i;
	byte tx3,ty3;
	byte tx1Center,ty1Center,res1Center;
	byte tx2Center,ty2Center,res2Center;
	
	s_autoDoors *d0 = &autoDoors[0];
	s_autoDoors *d1 = &autoDoors[1];
	s_autoDoors *d2 = &autoDoors[2];
	s_autoDoors *d3 = &autoDoors[3];
	
	byte *d0_cx = &d0->cx;
	byte *d0_cy = &d0->cy;

	byte *d1_cx = &d1->cx;
	byte *d1_cy = &d1->cy;

	byte *d2_cx = &d2->cx;
	byte *d2_cy = &d2->cy;

	byte *d3_cx = &d3->cx;
	byte *d3_cy = &d3->cy;

	s_playerDoors *pd0 = &playerDoors[0];
	s_playerDoors *pd1 = &playerDoors[1];
	
	byte *pd0_affiche = &pd0->affiche;
	byte *pd0_c1x = &pd0->c1x;
	byte *pd0_c1y = &pd0->c1y;
	byte *pd0_c2x = &pd0->c2x;
	byte *pd0_c2y = &pd0->c2y;
	byte *pd0_doorGlobalPxStart = &pd0->doorGlobalPxStart;
	byte *pd0_doorGlobalPyStart = &pd0->doorGlobalPyStart;
	byte *pd0_doorGlobalHauteur = &pd0->doorGlobalHauteur;
	byte *pd0_doorGlobalLargeur = &pd0->doorGlobalLargeur;

	byte *pd1_affiche = &pd1->affiche;
	byte *pd1_c1x = &pd1->c1x;
	byte *pd1_c1y = &pd1->c1y;
	byte *pd1_c2x = &pd1->c2x;
	byte *pd1_c2y = &pd1->c2y;
	byte *pd1_doorGlobalPxStart = &pd1->doorGlobalPxStart;
	byte *pd1_doorGlobalPyStart = &pd1->doorGlobalPyStart;
	byte *pd1_doorGlobalHauteur = &pd1->doorGlobalHauteur;
	byte *pd1_doorGlobalLargeur = &pd1->doorGlobalLargeur;
	
	
	tx3=ty3=tx1=tx2=ty1=ty2=tx1Center=tx2Center=ty1Center=ty2Center=0;
	i=0;
	res = NOK;
	res1Center=0;res2Center=0;
	
	if (direction==DROITE)
	{
		tx1 = (player.px+16) >> 3;
		ty1 = (player.py) >> 3;
		tx2 = (player.px+16) >> 3;
		ty2 = (player.py+15) >> 3;
		
		tx1Center = (player.px) >> 3;
		ty1Center = (player.py) >> 3;
		tx2Center = (player.px) >> 3;
		ty2Center = (player.py+15) >> 3;	

	} else
	if (direction==GAUCHE)
	{
		tx1 = (player.px-1) >> 3;
		ty1 = (player.py) >> 3;
		tx2 = (player.px-1) >> 3;
		ty2 = (player.py+15) >> 3;
		
		tx1Center = (player.px+15) >> 3;
		ty1Center = (player.py) >> 3;
		tx2Center = (player.px+15) >> 3;
		ty2Center = (player.py+15) >> 3;	
	}
	else
	if (direction==BAS)
	{
		tx1 = (player.px) >> 3;
		ty1 = (player.py+16) >> 3;
		tx2 = (player.px+15) >> 3;
		ty2 = (player.py+16) >> 3;
		
		tx3=tx1;
		ty3=ty1;
		
		tx1Center = (player.px) >> 3;
		ty1Center = (player.py) >> 3;
		tx2Center = (player.px+15) >> 3;
		ty2Center = (player.py) >> 3;
	}
	else
	if (direction==HAUT)
	{
		tx1 = (player.px) >> 3;
		ty1 = (player.py-1) >> 3;
		tx2 = (player.px+15) >> 3;
		ty2 = (player.py-1) >> 3;
		
		tx3 = tx1;
		ty3 = (player.py+8) >> 3;
		
		tx1Center = (player.px) >> 3;
		ty1Center = (player.py+15) >> 3;
		tx2Center = (player.px+15) >> 3;
		ty2Center = (player.py+15) >> 3;
	}

	res1 = peekGhostGameZone(tx1,ty1);
	res2 = peekGhostGameZone(tx2,ty2);
	
	res1Center = peekGhostGameZone(tx1Center,ty1Center);
	res2Center = peekGhostGameZone(tx2Center,ty2Center);

	if ((res1==253) && (res2==253) && (player.doorOpen==OK))
	{
		res = OK;
	}
	
	if ( (res1>253) && (res2>253) ) // Zones franchissables
	{
		res = OK;
	}

	// ------------------------------------------
	// RECUPERATION DE LA ZONE DE PORTE COURANTE
	// ------------------------------------------
	if ( (res1Center==254) && (res2Center==254) )// Zone de construction de porte possible
	{
		player.lastDoor1Cx = tx1Center;player.lastDoor1Cy = ty1Center;
		player.lastDoor2Cx = tx2Center;player.lastDoor2Cy = ty2Center;
		
		player.lastDoorGlobalPxStart = tx1Center<<3;
		player.lastDoorGlobalPyStart = ty1Center<<3;
		
		if (tx2>tx1) // on est en horizontal !
		{
			player.lastDoorGlobalHauteur = 2;
			player.lastDoorGlobalLargeur = 16;
		}
		else
		{
			player.lastDoorGlobalHauteur = 16;
			player.lastDoorGlobalLargeur = 2;
		}
	}		
	
	// Bute t'on sur une porte ?
	if ((*pd0_affiche)==OK)
	{		
		if (((tx1==(*pd0_c1x)) && (ty1==(*pd0_c1y))) &&	((tx2==(*pd0_c2x)) && (ty2==(*pd0_c2y))))
		{
			res = isCollision(player.px,player.py,16,16,(*pd0_doorGlobalPxStart),(*pd0_doorGlobalPyStart),(*pd0_doorGlobalHauteur),(*pd0_doorGlobalLargeur));
			if (res==OK) res = NOK; else res = OK;				
		}			
	}

	if ((*pd1_affiche)==OK)
	{		
		if (((tx1==(*pd1_c1x)) && (ty1==(*pd1_c1y))) &&	((tx2==(*pd1_c2x)) && (ty2==(*pd1_c2y))))
		{
			res = isCollision(player.px,player.py,16,16,(*pd1_doorGlobalPxStart),(*pd1_doorGlobalPyStart),(*pd1_doorGlobalHauteur),(*pd1_doorGlobalLargeur));
			if (res==OK) res = NOK; else res = OK;				
		}			
	}
	
	
	// Bute t'in sur une autoDoor
	if ( (autoDoorCurrentGfx>2) && (autoDoorCurrentGfx<15) )
	{
		if ( (tx3==(*d0_cx)) && (ty3==(*d0_cy)) ) {res=NOK;}
		else if ( (tx3==(*d1_cx)) && (ty3==(*d1_cy)) ) {res=NOK;}
		else if ( (tx3==(*d2_cx)) && (ty3==(*d2_cy)) ) {res=NOK;}
		else if ( (tx3==(*d3_cx)) && (ty3==(*d3_cy)) ) {res=NOK;}
	}	
	
	return res;
}

byte isCopDirectionFree(char c,char direction)
{
	byte tx1,ty1,tx2,ty2,tx3,ty3,res3,res1,res2,res,i;
	
	s_cop *mycop = &cop[c];	
	byte *cop_py = &mycop->py;
	byte *cop_px = &mycop->px;

	s_playerDoors *pd0 = &playerDoors[0];
	s_playerDoors *pd1 = &playerDoors[1];
	
	byte *pd0_affiche = &pd0->affiche;
	byte *pd0_c1x = &pd0->c1x;
	byte *pd0_c1y = &pd0->c1y;
	unsigned *pd0_timer = &pd0->timer;

	byte *pd1_affiche = &pd1->affiche;
	byte *pd1_c1x = &pd1->c1x;
	byte *pd1_c1y = &pd1->c1y;
	unsigned *pd1_timer = &pd1->timer;
	
	s_autoDoors *ad0 = &autoDoors[0];
	s_autoDoors *ad1 = &autoDoors[1];
	s_autoDoors *ad2 = &autoDoors[2];
	s_autoDoors *ad3 = &autoDoors[3];
	
	byte *ad0_cx = &ad0->cx;
	byte *ad0_cy = &ad0->cy;
	byte *ad1_cx = &ad1->cx;
	byte *ad1_cy = &ad1->cy;
	byte *ad2_cx = &ad2->cx;
	byte *ad2_cy = &ad2->cy;
	byte *ad3_cx = &ad3->cx;
	byte *ad3_cy = &ad3->cy;

	
	tx1=tx2=ty1=ty2=tx3=ty3=0;
	res = NOK;	
	i=0;
	
	if (direction==DROITE)
	{
		tx1 = ((*cop_px)+16) >> 3;
		ty1 = ((*cop_py)) >> 3;
		tx2 = ((*cop_px)+16) >> 3;
		ty2 = ((*cop_py)+15) >> 3;		
		
		tx3 = ((*cop_px)+13) >> 3;
		ty3 = ((*cop_py)) >> 3;
		
	} else
	if (direction==GAUCHE)
	{
		tx1 = ((*cop_px)-1) >> 3;
		ty1 = ((*cop_py)) >> 3;
		tx2 = ((*cop_px)-1) >> 3;
		ty2 = ((*cop_py)+15) >> 3;
		
		tx3 = ((*cop_px)+6) >> 3;
		ty3 = ((*cop_py)) >> 3;
	}
	else
	if (direction==BAS)
	{
		tx1 = ((*cop_px)) >> 3;
		ty1 = ((*cop_py)+16) >> 3;
		tx2 = ((*cop_px)+15) >> 3;
		ty2 = ((*cop_py)+16) >> 3;
		
		tx3 = ((*cop_px)) >> 3;
		ty3 = ((*cop_py)+14) >> 3;
	}
	else
	{
		tx1 = ((*cop_px)) >> 3;
		ty1 = ((*cop_py)-1) >> 3;
		tx2 = ((*cop_px)+15) >> 3;
		ty2 = ((*cop_py)-1) >> 3;
		
		tx3 = ((*cop_px)) >> 3;
		ty3 = ((*cop_py)+6) >> 3;
	}

	res1 = peekGhostGameZone(tx1,ty1);
	res2 = peekGhostGameZone(tx2,ty2);
	
	res3 = peekGhostGameZone(tx3,ty3);
	
	if ( (res1>253) && (res2>253) )
	{
		res = OK;
	}
	
	if ((*pd0_affiche)==OK)
	{		
		if ((tx3==(*pd0_c1x)) && (ty3==(*pd0_c1y)))
		{	
			res=NOK;
			addScore(1);
		}			
	}
	if ((*pd1_affiche)==OK)
	{		
		if ((tx3==(*pd1_c1x)) && (ty3==(*pd1_c1y)))
		{	
			res=NOK;
		}			
	}

	
	if (autoDoorCurrentGfx>4) // Ca fait tout ramer si le cop est bloqué dans la porte !!!!!!
	{
		if ((tx3==(*ad0_cx)) && (ty3==(*ad0_cy))) {res=NOK;}
		else if ((tx3==(*ad1_cx)) && (ty3==(*ad1_cy))) {res=NOK;}
		else if ((tx3==(*ad2_cx)) && (ty3==(*ad2_cy))) {res=NOK;}
		else if ((tx3==(*ad3_cx)) && (ty3==(*ad3_cy))) {res=NOK;}
	}	
	
	return res;
}

void changePlayerDirection(char direction)
{
	if (isPlayerDirectionFree(direction)==OK) 
	{
		player.oldDirection = player.direction;
		player.direction = direction;
	}
}


void movePlayer(void)
{
	byte direction;
	
	direction = player.direction;
	player.lastMvt = 99;
	
	if (direction==DROITE)
	{
		if (isPlayerDirectionFree(direction)!=NOK)		
		{
			if (player.px>=232) // Teleport droite
			player.px=0;
			else
			if ((player.oldDirection==HAUT) || (player.oldDirection==BAS)) {player.px+=2;player.oldDirection=STOP;} else player.px++;
			
			player.lastMvt = HORIZONTAL;
		}
		
	} 
	else
	if (direction==GAUCHE)
	{
		if (isPlayerDirectionFree(direction)!=NOK)		
		{
			if (player.px<=8)
			player.px=30<<3;
			else
			if ((player.oldDirection==HAUT) || (player.oldDirection==BAS)) {player.px-=2;player.oldDirection=STOP;} else player.px--;
			
			player.lastMvt = HORIZONTAL;
		}
	}
	else
	if (direction==BAS)
	{
		if (isPlayerDirectionFree(direction)!=NOK)
		{
			if ((player.oldDirection==GAUCHE) || (player.oldDirection==DROITE)) {player.py+=2;player.oldDirection=STOP;} else player.py++;
			
			player.lastMvt = VERTICAL;
		}
	}
	else
	if (direction==HAUT)
	{
		if (isPlayerDirectionFree(direction)!=NOK)
		{
			if ((player.oldDirection==GAUCHE) || (player.oldDirection==DROITE)) {player.py-=2;player.oldDirection=STOP;} else player.py--;
			
			player.lastMvt = VERTICAL;
		}
	}
	
}

void animatePlayer()
{
	if (animateSprite%10==0) player.currentAnim+=4;
	if (player.currentAnim==8) player.currentAnim=0;
	
	if (player.regard==GAUCHE)
	{
		if (player.lastMvt!=99)
		if (player.lastMvt==HORIZONTAL)  player.pattern2=112+player.currentAnim;
		else player.pattern2=120+player.currentAnim;
		player.pattern1 = 24;
	}
	else
	{
		if (player.lastMvt!=99)
		if (player.lastMvt==HORIZONTAL)  player.pattern2=96+player.currentAnim;
		else player.pattern2=104+player.currentAnim;
		player.pattern1 = 32;
	}	
	
	player.colour1 = 7;
	player.colour2 = 6;
}

void renderPlayerDeath()
{
	sprites[SPRITE2].y = 204;
	sprites[SPRITE3].y = 204;
	sprites[SPRITE4].y = 204;
	sprites[SPRITE5].y = 204;
	sprites[SPRITE6].y = 204;
	
	delay(10);
	sprites[SPRITE0].pattern = 33*4;
	sprites[SPRITE1].pattern = 32*4;
	sprites[SPRITE0].y +=1;

	delay(10);
	sprites[SPRITE0].pattern = 33*4;
	sprites[SPRITE1].pattern = 34*4;
	sprites[SPRITE0].y +=1;
	
	delay(10);
	sprites[SPRITE0].pattern = 38*4;
	sprites[SPRITE1].pattern = 35*4;
	sprites[SPRITE0].y +=1;
	
	delay(10);
	sprites[SPRITE0].pattern = 38*4;
	sprites[SPRITE1].pattern = 36*4;
	sprites[SPRITE0].y +=1;
	
	delay(10);
	sprites[SPRITE0].pattern = 38*4;
	sprites[SPRITE1].pattern = 37*4;
	sprites[SPRITE0].y +=1;
	
	delay(10);
	sprites[SPRITE0].pattern = 38*4;
	sprites[SPRITE1].pattern = 37*4;
	
	delay(50);

}
void checkPlayerGameCollisions(void)
{
	byte tx1,ty1,res1;
	byte direction;
	byte i,res;

	s_cop *mycop0 = &cop[0];	
	byte *cop0_py = &mycop0->py;
	byte *cop0_px = &mycop0->px;
	
	s_cop *mycop1 = &cop[1];	
	byte *cop1_py = &mycop1->py;
	byte *cop1_px = &mycop1->px;

	s_cop *mycop2 = &cop[2];	
	byte *cop2_py = &mycop2->py;
	byte *cop2_px = &mycop2->px;
	
	s_cop *mycop3 = &cop[3];	
	byte *cop3_py = &mycop3->py;
	byte *cop3_px = &mycop3->px;
	
	i=res=0;
	
	tx1=ty1=0;
	res1=99;
	direction = player.direction;

		tx1 = (player.px+12) >> 3;
		ty1 = (player.py+12) >> 3;
	
	// Collision avec les PILLS
/*
	if (direction==DROITE)
	{
		tx1 = (player.px+12) >> 3;
		ty1 = (player.py+12) >> 3;

	} else
	if (direction==GAUCHE)
	{
		tx1 = (player.px+4) >> 3;
		ty1 = (player.py+12) >> 3;
	}
	else
	if (direction==BAS)
	{
		tx1 = (player.px+12) >> 3;
		ty1 = (player.py+12) >> 3;
	}
	else
	{
		tx1 = (player.px+12) >> 3;
		ty1 = (player.py+4) >> 3;
	}*/

	disable_nmi();
	res1 = get_char(tx1,ty1);
	if (res1==CHAR_PILL)
	{
		put_char(tx1,ty1,CHAR_VIDE);			
		addScore(2);
		player.nbPillsLevel++;
		if (sfxEnCours==NON) startsfx(sfx_piece);
		//play_sound(2);
		if (player.nbPillsLevel % 40 ==0) {scatterModeTimer=levelParamScatterModeTime;}
		if (player.nbPillsLevel % 35 ==0) {createBonus();}
	}
	enable_nmi();
	
	// Check avec les autres sprites
	
	
	if 	(	(isCollision(player.px+7,player.py+7,2,2,(*cop0_px)+4,(*cop0_py)+4,7,7)==OK) 
	|| (isCollision(player.px+7,player.py+7,2,2,(*cop1_px)+4,(*cop1_py)+4,7,7)==OK) 
	|| (isCollision(player.px+7,player.py+7,2,2,(*cop2_px)+4,(*cop2_py)+4,7,7)==OK) 
	|| (isCollision(player.px+7,player.py+7,2,2,(*cop3_px)+4,(*cop3_py)+4,7,7)==OK)  )
	{
		res = OK;
		//play_sound(5);
		stopmusic();
        startmusic(music_looseLife,LOOP_OFF);
		renderPlayerDeath();
		workflow = W_RETRY;
		player.direction=STOP;
	}
	
	if ((isCollision(player.px+4,player.py+4,8,8,bonus.px,bonus.py,16,16)==OK) && (bonus.actif==OK) )
	{
		if (bonus.pattern==BONUS1)
		{
			cop[0].pause=levelParamCopFreezeBonus;
			cop[1].pause=levelParamCopFreezeBonus;
			cop[2].pause=levelParamCopFreezeBonus;
			cop[3].pause=levelParamCopFreezeBonus;
		}
		
		// Score du Bonus
		if (bonus.pattern==BONUS1) addScore(10);
		else if (bonus.pattern==BONUS2) addScore(20);
		else if (bonus.pattern==BONUS3) addScore(30);
		else if (bonus.pattern==BONUS4) addScore(50);
		else if (bonus.pattern==BONUS5) addScore(60);
		else if (bonus.pattern==BONUS6) addScore(70);
		else if (bonus.pattern==BONUS7) addScore(100);
		else if (bonus.pattern==BONUS8) addScore(150);
		else if (bonus.pattern==BONUS9) addScore(200);
		else if (bonus.pattern==BONUS10) addScore(500);	
		
		//play_sound(4);
		startsfxPrio(sfx_bonus);
		desactivateBonus();
		
		
		
		
	}
}
void renderSprite()
{
	sprites[SPRITE0].x = player.px;
	sprites[SPRITE0].y = player.py;		
	sprites[SPRITE0].pattern = player.pattern1;
	sprites[SPRITE0].colour = player.colour1;

	sprites[SPRITE1].x = player.px;
	sprites[SPRITE1].y = player.py;		
	sprites[SPRITE1].pattern = player.pattern2;
	sprites[SPRITE1].colour = player.colour2;
}

void initPlayer(void)
{
	player.px = 21*8;
	player.py = 21*8;
	player.cx = 21;
	player.cy = 21;
	player.oldcx = 0;
	player.oldcy = 0;
	player.regard = GAUCHE;
	player.lastMvt = HORIZONTAL;
	player.oldDirection=STOP;
	player.direction=STOP;
	player.nbpills=0;
	player.lastDoor1Cx=0;
	player.lastDoor1Cy=0;
	player.lastDoor2Cx=0;
	player.lastDoor2Cy=0;
	
	player.doorOpen = NOK;
	//player.score = 0;

	player.nbPillsLevel = 0;
	player.nbMoveForBonus = 0;
	
	player.pause=0;
	//player.nbLives=levelParamNbLives;
	player.currentAnim=0;
	
	player.pattern1=120;
	player.pattern2=28;
	player.colour1=7;
	player.colour2=6;
	
}

void reInitPlayer(void)
{
	player.px = 21*8;
	player.py = 21*8;
	player.cx = 21;
	player.cy = 21;
	player.oldcx = 0;
	player.oldcy = 0;
	player.regard = GAUCHE;
	player.lastMvt = HORIZONTAL;
	player.oldDirection=STOP;
	player.direction=STOP;
	player.nbpills=0;
	player.lastDoor1Cx=0;
	player.lastDoor1Cy=0;
	player.lastDoor2Cx=0;
	player.lastDoor2Cy=0;
	
	//player.doorOpen = NOK;

	//player.nbPillsLevel = 0;
	player.nbMoveForBonus = 0;
	
	player.pause=0;
	player.currentAnim=0;
	
	player.pattern1=120;
	player.pattern2=28;
	player.colour1=7;
	player.colour2=6;
}

void initCop(byte c)
{
	if (c==0)
	{
		//25*8=200,21*8=168
		cop[c].px = 27<<3;
		cop[c].py = 9<<3;
		cop[c].targetx = 5;
		cop[c].targety = 1;
		cop[c].pattern1 = 0;
		cop[c].col = 6;
		cop[c].direction = GAUCHE;
		cop[c].regard = GAUCHE;
		cop[c].sprno = SPRITE2;
		cop[c].pause=levelParamCop0FreezeStart;
	} else
	if (c==1)
	{
		//5*8=40,1*8=8
		cop[c].px = 27<<3;
		cop[c].py = 13<<3;
		cop[c].pattern1 = 12;
		cop[c].col = 7;
		cop[c].direction = GAUCHE;
		cop[c].regard = GAUCHE;
		cop[c].sprno = SPRITE3;
		cop[c].pause=levelParamCop1FreezeStart;
	} else
	if (c==2)
	{
		//5*8=40,21*8=168
		cop[c].px = 3<<3;
		cop[c].py = 9<<3;
		cop[c].pattern1 = 12;
		cop[c].col = 2;
		cop[c].direction = DROITE;
		cop[c].regard = DROITE;
		cop[c].sprno = SPRITE4;
		cop[c].pause=levelParamCop2FreezeStart;
	} else
	if (c==3)
	{
		//25*8=200,1*8=8
		cop[c].px = 3<<3;
		cop[c].py = 13<<3;
		cop[c].pattern1 = 0;
		cop[c].col = 13;
		cop[c].direction = DROITE;
		cop[c].regard = DROITE;
		cop[c].sprno = SPRITE5;
		cop[c].pause=levelParamCop3FreezeStart;
	}	

	cop[c].cx = cop[c].px >> 3;
	cop[c].cy = cop[c].py >> 3;
	//cop[c].flicker = 99; // Pas de flicker pour ce sprite !
}

// Tracker
byte moveCop0()
{
	byte directionDesiree;
	byte playercx,playercy;	
	char movOk;

	s_cop *mycop_0 = &cop[0];	
	byte *cop_0_py = &mycop_0->py;
	byte *cop_0_px = &mycop_0->px;
	byte *cop_0_direction = &mycop_0->direction;
	byte *cop_0_targetx = &mycop_0->targetx;
	byte *cop_0_targety = &mycop_0->targety;
	byte *cop_0_lastMvt = &mycop_0->lastMvt;
	byte *cop_0_regard = &mycop_0->regard;
	byte *cop_0_pattern1 = &mycop_0->pattern1;
	byte *cop_0_cy = &mycop_0->cy;
	byte *cop_0_cx = &mycop_0->cx;	
	byte *cop_0_pause = &mycop_0->pause;
	
	if ((*cop_0_pause)>0) {(*cop_0_pause)--;return OK;}
	
	
	movOk = NOK;
	directionDesiree = (*cop_0_direction);
	
	// Cop 0 --> Poursuit le joueur (HAUT/GAUCHE/BAS/DROITE)
	// Cop 1 --> Tente de le prendre en tenaille
	if ( (((*cop_0_px) % 8)==0)&& (((*cop_0_py) % 8)==0) )
	{
		if (scatterModeTimer==0)
		{
			playercx = player.px>>3;
			playercy = player.py>>3;
			
			(*cop_0_targetx) = playercx;
			(*cop_0_targety) = playercy;
		} else
		{
			(*cop_0_targetx) = 25;
			(*cop_0_targety) = 21;
		}
		
		if ( ((*cop_0_targety)<(*cop_0_cy)) && ((*cop_0_direction)!=BAS) /*&& (haut==OK)*/ ) // Le joueur est au dessus de nous.
		{
			directionDesiree = HAUT;
		}
		else
		if ( ((*cop_0_targetx)<(*cop_0_cx)) && ((*cop_0_direction)!=DROITE) /*&& (gauche==OK)*/ )
		{
			directionDesiree = GAUCHE;
		}
		else
		if ( ((*cop_0_targety)>(*cop_0_cy)) && ((*cop_0_direction)!=HAUT) /*&& (bas==OK)*/ )
		{
			directionDesiree = BAS;
		}
		else
		if ( ((*cop_0_targetx)>(*cop_0_cx)) && ((*cop_0_direction)!=GAUCHE) )
		{
			directionDesiree = DROITE;
		}
		
		if (isCopDirectionFree(0,directionDesiree)==OK) 
		{
			(*cop_0_direction) = directionDesiree;
		}
		
	}
	
	if ( ((*cop_0_direction)==HAUT) && isCopDirectionFree(0,HAUT)==OK ) 
	{
		(*cop_0_py)--;
		(*cop_0_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_0_direction)==BAS) && isCopDirectionFree(0,BAS)==OK ) 
	{
		(*cop_0_py)++;
		(*cop_0_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_0_direction)==GAUCHE) && isCopDirectionFree(0,GAUCHE)==OK ) 
	{
		(*cop_0_px)--;
		(*cop_0_lastMvt) = HORIZONTAL;
		if ((*cop_0_regard)==DROITE) (*cop_0_pattern1) = 0; // On passe le regard à gauche
		(*cop_0_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if ( ((*cop_0_direction)==DROITE) && isCopDirectionFree(0,DROITE)==OK ) 
	{
		(*cop_0_px)++;
		(*cop_0_lastMvt) = HORIZONTAL;
		if ((*cop_0_regard)==GAUCHE) (*cop_0_pattern1) = 12; // On passe le regard à droite
		(*cop_0_regard) = DROITE;
		movOk = OK;
	}
	
	if (((*cop_0_direction)==GAUCHE) && ((*cop_0_px)==8))
	{
		(*cop_0_px) = 240; //30<<3;
		(*cop_0_lastMvt) = HORIZONTAL;
		if ((*cop_0_regard)==DROITE) (*cop_0_pattern1) = 0; // On passe le regard à gauche
		(*cop_0_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if (((*cop_0_direction)==DROITE) && ((*cop_0_px)==232))
	{
		(*cop_0_px) = 0;
		(*cop_0_lastMvt) = HORIZONTAL;
		if ((*cop_0_regard)==GAUCHE) (*cop_0_pattern1) = 12; // On passe le regard à droite
		(*cop_0_regard) = DROITE;
		movOk = OK;
	}
	
	(*cop_0_cx) = (*cop_0_px) >> 3;
	(*cop_0_cy) = (*cop_0_py) >> 3;
	
	if (movOk==NOK) (*cop_0_direction) = rnd_byte(0,3);
	
	return OK;
}

// Fuit vers le bas ...
byte moveCop1()
{
	byte directionDesiree;
	byte playercx,playercy;	
	char movOk;

	s_cop *mycop_1 = &cop[1];	
	byte *cop_1_py = &mycop_1->py;
	byte *cop_1_px = &mycop_1->px;
	byte *cop_1_direction = &mycop_1->direction;
	byte *cop_1_targetx = &mycop_1->targetx;
	byte *cop_1_targety = &mycop_1->targety;
	byte *cop_1_lastMvt = &mycop_1->lastMvt;
	byte *cop_1_regard = &mycop_1->regard;
	byte *cop_1_pattern1 = &mycop_1->pattern1;
	byte *cop_1_cy = &mycop_1->cy;
	byte *cop_1_cx = &mycop_1->cx;	
	byte *cop_1_pause = &mycop_1->pause;
	
	if ((*cop_1_pause)>0) {(*cop_1_pause)--;return OK;}
	
	movOk = NOK;
	directionDesiree = (*cop_1_direction);
	
	// Cop 0 --> Poursuit le joueur (HAUT/GAUCHE/BAS/DROITE)
	// Cop 1 --> Tente de le prendre en tenaille
	if ( (((*cop_1_px) % 8)==0)&& (((*cop_1_py) % 8)==0) )
	{
		playercx = (player.px>>3) +8; // Remplace les target, trop la flemme de changer
		playercy = (player.py>>3) +8;
		
		if ( (playercy<(*cop_1_cy)) && ((*cop_1_direction)!=BAS)) // Le joueur est au dessus de nous.
		{
			directionDesiree = HAUT;
		}
		else
		if ( (playercy<(*cop_1_cx)) && ((*cop_1_direction)!=DROITE))
		{
			directionDesiree = GAUCHE;
		}
		else
		if ( (playercy>(*cop_1_cy)) && ((*cop_1_direction)!=HAUT))
		{
			directionDesiree = BAS;
		}
		else
		if ( (playercy>(*cop_1_cx)) && ((*cop_1_direction)!=GAUCHE))
		{
			directionDesiree = DROITE;
		}
		
		if (isCopDirectionFree(1,directionDesiree)==OK) 
		{
			(*cop_1_direction) = directionDesiree;
		}
	}
	
	if ( ((*cop_1_direction)==HAUT) && isCopDirectionFree(1,HAUT)==OK ) 
	{
		(*cop_1_py)--;
		(*cop_1_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_1_direction)==BAS) && isCopDirectionFree(1,BAS)==OK ) 
	{
		(*cop_1_py)++;
		(*cop_1_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_1_direction)==GAUCHE) && isCopDirectionFree(1,GAUCHE)==OK ) 
	{
		(*cop_1_px)--;
		(*cop_1_lastMvt) = HORIZONTAL;
		if ((*cop_1_regard)==DROITE) (*cop_1_pattern1) = 0; // On passe le regard à gauche
		(*cop_1_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if ( ((*cop_1_direction)==DROITE) && isCopDirectionFree(1,DROITE)==OK ) 
	{
		(*cop_1_px)++;
		(*cop_1_lastMvt) = HORIZONTAL;
		if ((*cop_1_regard)==GAUCHE) (*cop_1_pattern1) = 12; // On passe le regard à droite
		(*cop_1_regard) = DROITE;
		movOk = OK;
	}
	
	if (((*cop_1_direction)==GAUCHE) && ((*cop_1_px)==8))
	{
		(*cop_1_px) = 240; //30<<3;
		(*cop_1_lastMvt) = HORIZONTAL;
		if ((*cop_1_regard)==DROITE) (*cop_1_pattern1) = 0; // On passe le regard à gauche
		(*cop_1_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if (((*cop_1_direction)==DROITE) && ((*cop_1_px)==232))
	{
		(*cop_1_px) = 0;
		(*cop_1_lastMvt) = HORIZONTAL;
		if ((*cop_1_regard)==GAUCHE) (*cop_1_pattern1) = 12; // On passe le regard à droite
		(*cop_1_regard) = DROITE;
		movOk = OK;
	}
	
	(*cop_1_cx) = (*cop_1_px) >> 3;
	(*cop_1_cy) = (*cop_1_py) >> 3;
	
	if (movOk==NOK) (*cop_1_direction) = rnd_byte(0,3);
	
	return OK;
}

// Cop bourré qui va au hasard
byte moveCop2()
{
	byte directionDesiree;
	char movOk;

	s_cop *mycop_2 = &cop[2];	
	byte *cop_2_py = &mycop_2->py;
	byte *cop_2_px = &mycop_2->px;
	byte *cop_2_direction = &mycop_2->direction;
	byte *cop_2_targetx = &mycop_2->targetx;
	byte *cop_2_targety = &mycop_2->targety;
	byte *cop_2_lastMvt = &mycop_2->lastMvt;
	byte *cop_2_regard = &mycop_2->regard;
	byte *cop_2_pattern1 = &mycop_2->pattern1;
	byte *cop_2_cy = &mycop_2->cy;
	byte *cop_2_cx = &mycop_2->cx;	
	byte *cop_2_pause = &mycop_2->pause;
	
	if ((*cop_2_pause)>0) {(*cop_2_pause)--;return OK;}
	
	movOk = NOK;
	directionDesiree = (*cop_2_direction);
	
	// Cop 0 --> Poursuit le joueur (HAUT/GAUCHE/BAS/DROITE)
	// Cop 1 --> Tente de le prendre en tenaille
	if ( (((*cop_2_px) % 8)==0)&& (((*cop_2_py) % 8)==0) )
	{
		(*cop_2_targetx) = rnd(0,32);
		(*cop_2_targety) = rnd(0,24);
		
		if ( ((*cop_2_targety)<=(*cop_2_cy)) && ((*cop_2_direction)!=BAS) /*&& (haut==OK)*/ ) // Le joueur est au dessus de nous.
		{
			directionDesiree = HAUT;
		}
		else
		if ( ((*cop_2_targetx)<=(*cop_2_cx)) && ((*cop_2_direction)!=DROITE) /*&& (gauche==OK)*/ )
		{
			directionDesiree = GAUCHE;
		}
		else
		if ( ((*cop_2_targety)>=(*cop_2_cy)) && ((*cop_2_direction)!=HAUT) /*&& (bas==OK)*/ )
		{
			directionDesiree = BAS;
		}
		else
		if ( ((*cop_2_targetx)>=(*cop_2_cx)) && ((*cop_2_direction)!=GAUCHE) /*&& (droite==OK)*/ )
		{
			directionDesiree = DROITE;
		}
		
		if (isCopDirectionFree(2,directionDesiree)==OK) 
		{
			(*cop_2_direction) = directionDesiree;
		}
		
	}
	
	if ( ((*cop_2_direction)==HAUT) && isCopDirectionFree(2,HAUT)==OK ) 
	{
		(*cop_2_py)--;
		(*cop_2_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_2_direction)==BAS) && isCopDirectionFree(2,BAS)==OK ) 
	{
		(*cop_2_py)++;
		(*cop_2_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_2_direction)==GAUCHE) && isCopDirectionFree(2,GAUCHE)==OK ) 
	{
		(*cop_2_px)--;
		(*cop_2_lastMvt) = HORIZONTAL;
		if ((*cop_2_regard)==DROITE) (*cop_2_pattern1) = 0; // On passe le regard à gauche
		(*cop_2_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if ( ((*cop_2_direction)==DROITE) && isCopDirectionFree(2,DROITE)==OK ) 
	{
		(*cop_2_px)++;
		(*cop_2_lastMvt) = HORIZONTAL;
		if ((*cop_2_regard)==GAUCHE) (*cop_2_pattern1) = 12; // On passe le regard à droite
		(*cop_2_regard) = DROITE;
		movOk = OK;
	}
	
	if (((*cop_2_direction)==GAUCHE) && ((*cop_2_px)==8))
	{
		(*cop_2_px) = 240; //30<<3;
		(*cop_2_lastMvt) = HORIZONTAL;
		if ((*cop_2_regard)==DROITE) (*cop_2_pattern1) = 0; // On passe le regard à gauche
		(*cop_2_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if (((*cop_2_direction)==DROITE) && ((*cop_2_px)==232))
	{
		(*cop_2_px) = 0;
		(*cop_2_lastMvt) = HORIZONTAL;
		if ((*cop_2_regard)==GAUCHE) (*cop_2_pattern1) = 12; // On passe le regard à droite
		(*cop_2_regard) = DROITE;
		movOk = OK;
	}
	
	(*cop_2_cx) = (*cop_2_px) >> 3;
	(*cop_2_cy) = (*cop_2_py) >> 3;
	
	if (movOk==NOK) (*cop_2_direction) = rnd_byte(0,3);
	
	return OK;
}

// Tracker qui essaye de prendre de front
byte moveCop3()
{
	byte directionDesiree;
	byte playercx,playercy;
	char movOk;

	s_cop *mycop_3 = &cop[3];	
	byte *cop_3_py = &mycop_3->py;
	byte *cop_3_px = &mycop_3->px;
	byte *cop_3_direction = &mycop_3->direction;
	byte *cop_3_targetx = &mycop_3->targetx;
	byte *cop_3_targety = &mycop_3->targety;
	byte *cop_3_lastMvt = &mycop_3->lastMvt;
	byte *cop_3_regard = &mycop_3->regard;
	byte *cop_3_pattern1 = &mycop_3->pattern1;
	byte *cop_3_cy = &mycop_3->cy;
	byte *cop_3_cx = &mycop_3->cx;	
	byte *cop_3_pause = &mycop_3->pause;
	
	if ((*cop_3_pause)>0) {(*cop_3_pause)--;return OK;}
	
	movOk = NOK;
	directionDesiree = (*cop_3_direction);
	
	// Cop 0 --> Poursuit le joueur (HAUT/GAUCHE/BAS/DROITE)
	// Cop 1 --> Tente de le prendre en tenaille
	if ( (((*cop_3_px) % 8)==0)&& (((*cop_3_py) % 8)==0) )
	{
		if (scatterModeTimer==0)
		{
			playercx = player.px>>3;
			playercy = player.py>>3;
			
			if (player.direction==HAUT)
			{
				(*cop_3_targetx) = playercx;
				if ((playercy) >= 4)
				(*cop_3_targety) = playercy - 4;
				else
				(*cop_3_targety) = 0;
			}
			else
			if (player.direction==GAUCHE)
			{
				if (playercx >= 4)
				(*cop_3_targetx) = playercx - 4;
				else
				(*cop_3_targetx) = 0;
				
				(*cop_3_targety) = playercy;
			}
			else
			if (player.direction==BAS)
			{
				(*cop_3_targetx) = playercx;
				(*cop_3_targety) = playercy + 4;

			}
			else
			if (player.direction==DROITE)
			{
				(*cop_3_targetx) = playercx+4;
				(*cop_3_targety) = playercy;
			}
			else
			if (player.direction==STOP)
			{
				(*cop_3_targetx) = playercx;
				(*cop_3_targety) = playercy;
			}
		}
		else
		{
			(*cop_3_targetx) = 25;
			(*cop_3_targety) = 1;
		}
		if ( ((*cop_3_targety)<(*cop_3_cy)) && ((*cop_3_direction)!=BAS)) // Le joueur est au dessus de nous.
		{
			directionDesiree = HAUT;
		}
		else
		if ( ((*cop_3_targetx)<(*cop_3_cx)) && ((*cop_3_direction)!=DROITE))
		{
			directionDesiree = GAUCHE;
		}
		else
		if ( ((*cop_3_targety)>(*cop_3_cy)) && ((*cop_3_direction)!=HAUT))
		{
			directionDesiree = BAS;
		}
		else
		if ( ((*cop_3_targetx)>(*cop_3_cx)) && ((*cop_3_direction)!=GAUCHE))
		{
			directionDesiree = DROITE;
		}
		
		if (isCopDirectionFree(3,directionDesiree)==OK) 
		{
			(*cop_3_direction) = directionDesiree;
		}
		
	}
	
	if ( ((*cop_3_direction)==HAUT) && isCopDirectionFree(3,HAUT)==OK ) 
	{
		(*cop_3_py)--;
		(*cop_3_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_3_direction)==BAS) && isCopDirectionFree(3,BAS)==OK ) 
	{
		(*cop_3_py)++;
		(*cop_3_lastMvt) = VERTICAL;
		movOk = OK;
	}
	else
	if ( ((*cop_3_direction)==GAUCHE) && isCopDirectionFree(3,GAUCHE)==OK ) 
	{
		(*cop_3_px)--;
		(*cop_3_lastMvt) = HORIZONTAL;
		if ((*cop_3_regard)==DROITE) (*cop_3_pattern1) = 0; // On passe le regard à gauche
		(*cop_3_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if ( ((*cop_3_direction)==DROITE) && isCopDirectionFree(3,DROITE)==OK ) 
	{
		(*cop_3_px)++;
		(*cop_3_lastMvt) = HORIZONTAL;
		if ((*cop_3_regard)==GAUCHE) (*cop_3_pattern1) = 12; // On passe le regard à droite
		(*cop_3_regard) = DROITE;
		movOk = OK;
	}
	
	if (((*cop_3_direction)==GAUCHE) && ((*cop_3_px)==8))
	{
		(*cop_3_px) = 240;
		(*cop_3_lastMvt) = HORIZONTAL;
		if ((*cop_3_regard)==DROITE) (*cop_3_pattern1) = 0; // On passe le regard à gauche
		(*cop_3_regard) = GAUCHE;
		movOk = OK;
	}
	else
	if (((*cop_3_direction)==DROITE) && ((*cop_3_px)==232))
	{
		(*cop_3_px) = 0;
		(*cop_3_lastMvt) = HORIZONTAL;
		if ((*cop_3_regard)==GAUCHE) (*cop_3_pattern1) = 12; // On passe le regard à droite
		(*cop_3_regard) = DROITE;
		movOk = OK;
	}
	
	(*cop_3_cx) = (*cop_3_px) >> 3;
	(*cop_3_cy) = (*cop_3_py) >> 3;
	
	if (movOk==NOK) (*cop_3_direction) = rnd_byte(0,3);
	
	return OK;
}

void renderCop(byte c)
{
	//byte testFlick;

	s_cop *mycop = &cop[c];	
	byte *cop_py = &mycop->py;
	byte *cop_px = &mycop->px;
	//byte *cop_flicker = &mycop->flicker;
	byte *cop_sprno = &mycop->sprno;
	byte *cop_pattern1 = &mycop->pattern1;
	byte *cop_colour = &mycop->col;
	byte *cop_regard = &mycop->regard;
	
	s_cop *mycop0 = &cop[0];	
	byte *cop0_py = &mycop0->py;
	byte *cop0_px = &mycop0->px;

	s_cop *mycop1 = &cop[1];	
	byte *cop1_py = &mycop1->py;
	byte *cop1_px = &mycop1->px;

	s_cop *mycop2 = &cop[2];	
	byte *cop2_py = &mycop2->py;
	byte *cop2_px = &mycop2->px;

	s_cop *mycop3 = &cop[3];	
	byte *cop3_py = &mycop3->py;
	byte *cop3_px = &mycop3->px;
	
	//testFlick=0;
	
	// Si un "cop" est à coté du joueur il est à coté de 2 sprite
	//if (((*cop_py)>=player.py-16) && ((*cop_py)<=player.py+16)) testFlick+=2;
	
	//if (c!=0) 
	//if (((*cop_py)>=(*cop0_py)-16) && ((*cop_py)<=(*cop0_py)+16) && ((*cop_flicker)==99)) testFlick+=1;
	//if (c!=1) 
	//if (((*cop_py)>=(*cop1_py)-16) && ((*cop_py)<=(*cop1_py)+16) && ((*cop_flicker)==99)) testFlick+=1;
	//if (c!=2) 
	//if (((*cop_py)>=(*cop2_py)-16) && ((*cop_py)<=(*cop2_py)+16) && ((*cop_flicker)==99)) testFlick+=1;
	//if (c!=3) 
	//if (((*cop_py)>=(*cop3_py)-16) && ((*cop_py)<=(*cop3_py)+16) && ((*cop_flicker)==99)) testFlick+=1;
	
	// Le but du jeu est de faire flicker des sprites en timer 0 et des sprites en timer 1
	// Sinon ça sert à rien, on les fait tous apparaitre et disparaitre en mème temps,
	// il n'y à pas d'intérêt.
	
	// Si il à été à coté de plus de 3 sprites
	
	//if (testFlick>3)
	//{
//		if ((*cop_flicker)==99) // Est-il déja programmé pour flicker ?
		//{							// NON
//			(*cop_flicker)=dernierFlicker; // Il va flicker en timer dernierFlicker
			//if (dernierFlicker<1) dernierFlicker++; else dernierFlicker=0;
		//}
	//} else (*cop_flicker)=99; //Il n'est pas à coté de plus de 3 sprites, pas besoin de le faire flicker.
	
	//if (flickerTimer==(*cop_flicker)) // Est ce que le timer de flicking = à la valeur de flicking du "cop"
	//sprites[(*cop_sprno)].y = 204;	// Oui, on ne l'affiche plus
	//else
	sprites[(*cop_sprno)].y = (*cop_py); // Non on l'affiche
	
	sprites[(*cop_sprno)].x = (*cop_px);		
	
	// Gestion de l'animation
	if (animateSprite==0)
	{
		(*cop_pattern1)+=4;
		if ((*cop_regard)==DROITE)
		{
			if ((*cop_pattern1)>20) (*cop_pattern1)=12; 
		}
		else
		if ((*cop_pattern1)>8) (*cop_pattern1)=0;
	}
	
	sprites[(*cop_sprno)].pattern = (*cop_pattern1);
	sprites[(*cop_sprno)].colour = (*cop_colour);	
}

// Affiche les portes du joueurs
void renderDoors()
{
	s_playerDoors *pd0 = &playerDoors[0];
	s_playerDoors *pd1 = &playerDoors[1];
	
	byte *pd0_affiche = &pd0->affiche;
	unsigned *pd0_timer = &pd0->timer;
	byte *pd0_c1x = &pd0->c1x;
	byte *pd0_c1y = &pd0->c1y;
	byte *pd0_c2x = &pd0->c2x;
	byte *pd0_c2y = &pd0->c2y;
	byte *pd0_c1 = &pd0->c1;
	byte *pd0_c2 = &pd0->c2;

	byte *pd1_affiche = &pd1->affiche;
	unsigned *pd1_timer = &pd1->timer;
	byte *pd1_c1x = &pd1->c1x;
	byte *pd1_c1y = &pd1->c1y;
	byte *pd1_c2x = &pd1->c2x;
	byte *pd1_c2y = &pd1->c2y;
	byte *pd1_c1 = &pd1->c1;
	byte *pd1_c2 = &pd1->c2;
	

	if ( ((*pd0_timer) == 0) && ((*pd0_affiche) == OK) ) // On efface la porte
	{
		disable_nmi();
		put_char((*pd0_c1x),(*pd0_c1y),105);
		put_char((*pd0_c2x),(*pd0_c2y),105);
		enable_nmi();
		(*pd0_affiche) = NOK;
	}
	if ( ((*pd0_timer) > 0) && ((*pd0_affiche) == NOK) )
	{
		disable_nmi();
		put_char((*pd0_c1x),(*pd0_c1y),(*pd0_c1));
		put_char((*pd0_c2x),(*pd0_c2y),(*pd0_c2));
		enable_nmi();
		(*pd0_affiche) = OK;
	}
	if ((*pd0_timer)>0) (*pd0_timer)--;

	if ( ((*pd1_timer) == 0) && ((*pd1_affiche) == OK) ) // On efface la porte
	{
		disable_nmi();
		put_char((*pd1_c1x),(*pd1_c1y),105);
		put_char((*pd1_c2x),(*pd1_c2y),105);
		enable_nmi();
		(*pd1_affiche) = NOK;
	}
	if ( ((*pd1_timer) > 0) && ((*pd1_affiche) == NOK) )
	{
		disable_nmi();
		put_char((*pd1_c1x),(*pd1_c1y),(*pd1_c1));
		put_char((*pd1_c2x),(*pd1_c2y),(*pd1_c2));
		enable_nmi();
		(*pd1_affiche) = OK;
	}
	if ((*pd1_timer)>0) (*pd1_timer)--;
	
}

void createDoor(void)
{
	byte i,k,j;
	i=j=k=0;
	if (player.lastDoor1Cx!=0)
	{
		
		i=NOK; // Il n'y à pas collision
		
		// Pas besoin d'optimiser le createDoor, il n'agit qu'en 1 tour ...
		for (k=0;k<2;k++) // y a t'il déja une porte à cet emplacement ?
		{
			if (playerDoors[k].affiche==OK)
			{
				if ((playerDoors[k].c1x == player.lastDoor1Cx) && (playerDoors[k].c1y == player.lastDoor1Cy))
				{i=OK;break;} // OK = Il y a collision !!
			}
			
		}

		if (i==NOK) // Si pas de collision
		{
			k=2;j=0;
			for (i=0;i<2;i++)
			{
				if ((playerDoors[i].timer==0) && (playerDoors[i].affiche==NOK))  // y a t'il une porte de libre ?
				{
					k=i;
					j=1;
					break;
				}
			}

			if (j==1) // Une zone de libre
			{
				
				playerDoors[k].timer = levelParamShowPlayerDoors;
				playerDoors[k].c1x = player.lastDoor1Cx;
				playerDoors[k].c1y = player.lastDoor1Cy;
				playerDoors[k].c2x = player.lastDoor2Cx;
				playerDoors[k].c2y = player.lastDoor2Cy;
				playerDoors[k].doorGlobalPxStart = player.lastDoorGlobalPxStart;
				playerDoors[k].doorGlobalPyStart = player.lastDoorGlobalPyStart;
				playerDoors[k].doorGlobalHauteur = player.lastDoorGlobalHauteur;
				playerDoors[k].doorGlobalLargeur = player.lastDoorGlobalLargeur;
				
				playerDoors[k].affiche = NOK;
				
				if ((player.lastDoor1Cx==player.lastDoor2Cx-1) || (player.lastDoor1Cx==player.lastDoor2Cx+1)) // Horizontal
				{
					playerDoors[k].c1=playerDoors[k].c2=107;
				}
				else // Vertical
				{
					playerDoors[k].c1=playerDoors[k].c2=106;
				}
				
				player.lastDoor1Cx = 0;
				//play_sound(3);
				startsfxPrio(sfx_porte);
			}
		}
	}

}

void openDoors()
{
	disable_nmi();
	put_frame(&horizontalSpace,9,0,2,1);
	put_frame(&horizontalSpace,21,23,2,1);
	enable_nmi();
	player.doorOpen = OK;
}

void initLevel(byte lvl)
{
	if (lvl%2==0)
	{
		levelParamScatterModeTime = 100;
		levelParamCopFreezeBonus = 200;
		levelParamCop0FreezeStart = 100;
		levelParamCop1FreezeStart = 200;
		levelParamCop2FreezeStart = 300;
		levelParamCop3FreezeStart = 300;	
	}
	else
	{
		levelParamScatterModeTime = 300;
		levelParamCopFreezeBonus = 200;
		levelParamCop0FreezeStart = 100;
		levelParamCop1FreezeStart = 200;
		levelParamCop2FreezeStart = 300;
		levelParamCop3FreezeStart = 300;					
	}
	
	if (lvl==1)
	{
		levelParamCop0Speed = 7;
		levelParamCop1Speed = 7;
		levelParamCop2Speed = 7;
		levelParamCop3Speed = 7;
	} else
	if (lvl==2)
	{
		levelParamCop0Speed = 7;
		levelParamCop1Speed = 7;
		levelParamCop2Speed = 7;
		levelParamCop3Speed = 7;
			
	} else	
	if (lvl==3)
	{

		levelParamCop0Speed = 7;
		levelParamCop1Speed = 7;
		levelParamCop2Speed = 7;
		levelParamCop3Speed = 8;
	} else
	if (lvl==4)
	{

		levelParamCop0Speed = 7;
		levelParamCop1Speed = 7;
		levelParamCop2Speed = 7;
		levelParamCop3Speed = 8;
	} else
	if (lvl==5)
	{
		levelParamCop0Speed = 7;
		levelParamCop1Speed = 7;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 8;
	} else
	if (lvl==6)
	{
		levelParamCop0Speed = 7;
		levelParamCop1Speed = 7;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 8;
	} else
	if (lvl==7)
	{
		levelParamCop0Speed = 7;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 8;
	} else
	if (lvl==8)
	{
		levelParamCop0Speed = 7;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 8;
	} else
	if (lvl==9)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 8;
	} else
	if (lvl==10)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 8;
	} else
	if (lvl==11)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 9;
	} else
	if (lvl==12)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 8;
		levelParamCop3Speed = 9;
	} else
	if (lvl==13)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 9;
	} else
	if (lvl==14)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 8;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 9;
	} else
	if (lvl==15)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 9;
	} else
	if (lvl==16)
	{
		levelParamCop0Speed = 8;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 9;
	} else
	if (lvl==17)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 9;
	} else
	if (lvl==18)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 9;
	} else
	if (lvl==19)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 10;
	} 	
	else
	if (lvl==20)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 9;
		levelParamCop3Speed = 10;
		levelParamScatterModeTime = 200; // On baisse le scatter
		levelParamCopFreezeBonus = 200;
		levelParamCop0FreezeStart = 100;
		levelParamCop1FreezeStart = 200;
		levelParamCop2FreezeStart = 300;
		levelParamCop3FreezeStart = 300;				
	} 	
	else
	if (lvl==21)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 10;
		levelParamCop3Speed = 10;
		levelParamScatterModeTime = 100; // On baisse le scatter
		levelParamCopFreezeBonus = 200;
		levelParamCop0FreezeStart = 100;
		levelParamCop1FreezeStart = 200;
		levelParamCop2FreezeStart = 300;
		levelParamCop3FreezeStart = 300;				
	} 
	else
	if (lvl==22)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 9;
		levelParamCop2Speed = 10;
		levelParamCop3Speed = 10;
		levelParamScatterModeTime = 100; // On baisse le scatter
		levelParamCopFreezeBonus = 100;
		levelParamCop0FreezeStart = 100;
		levelParamCop1FreezeStart = 200;
		levelParamCop2FreezeStart = 300;
		levelParamCop3FreezeStart = 300;				
	} 		
	else
	if (lvl==23)
	{
		levelParamCop0Speed = 9;
		levelParamCop1Speed = 10;
		levelParamCop2Speed = 10;
		levelParamCop3Speed = 10;
		levelParamScatterModeTime = 100; // On baisse le scatter
		levelParamCopFreezeBonus = 100;
		levelParamCop0FreezeStart = 50;
		levelParamCop1FreezeStart = 100;
		levelParamCop2FreezeStart = 150;
		levelParamCop3FreezeStart = 150;				
	} 
	else
	if (lvl==24)
	{
		levelParamCop0Speed = 10;
		levelParamCop1Speed = 10;
		levelParamCop2Speed = 10;
		levelParamCop3Speed = 10;
		levelParamScatterModeTime = 100; // On baisse le scatter
		levelParamCopFreezeBonus = 100;
		levelParamCop0FreezeStart = 50;
		levelParamCop1FreezeStart = 100;
		levelParamCop2FreezeStart = 150;
		levelParamCop3FreezeStart = 150;				
	} 
	else
	if (lvl>=25)
	{		
		levelParamCop0Speed = 10;
		levelParamCop1Speed = 10;
		levelParamCop2Speed = 10;
		levelParamCop3Speed = 10;
		levelParamScatterModeTime = 0; // On baisse le scatter
		levelParamCopFreezeBonus = 100;
		levelParamCop0FreezeStart = 50;
		levelParamCop1FreezeStart = 100;
		levelParamCop2FreezeStart = 150;
		levelParamCop3FreezeStart = 150;				
	} 
	
	levelParamBonusShowTime = 400;
	levelParamShowPlayerDoors = 200;
	
	//dernierFlicker = 0;
	
	sprites[SPRITE0].y = 204;
	sprites[SPRITE1].y = 204;
	sprites[SPRITE2].y = 204;
	sprites[SPRITE3].y = 204;
	sprites[SPRITE4].y = 204;
	sprites[SPRITE5].y = 204;
	sprites[SPRITE6].y = 204;
	
	playerDoors[0].timer=0;
	playerDoors[0].c1x=0;
	playerDoors[0].c1x=0;
	playerDoors[0].c2x=0;
	playerDoors[0].c2y=0;
	playerDoors[0].c1=0;
	playerDoors[0].c2=0;
	playerDoors[0].affiche=NOK;
	
	playerDoors[1].timer=0;
	playerDoors[1].c1x=0;
	playerDoors[1].c1x=0;
	playerDoors[1].c2x=0;
	playerDoors[1].c2y=0;
	playerDoors[1].c1=0;
	playerDoors[1].c2=0;
	playerDoors[1].affiche=NOK;
	
	initAutoDoor();
	
	//flickerTimer = 0;
	animateSprite = 0;
	scatterModeTimer=0;
	
	directionDemandee=NOK;
	
	reInitPlayer();
	
}

void gameLoop(void)
{
	byte toucheRelachee;
	toucheRelachee = 0;
	//play_music(music);
	reInitPlayer();
	while (1)
	{		
		// A voir si on gagne du cycle
		if (joypad_1!=0)
		{
			if (joypad_1 & LEFT) {player.regard = GAUCHE;directionDemandee=GAUCHE;timerDirectionDemandee=16;}
			else
			if (joypad_1 & RIGHT) {player.regard = DROITE;directionDemandee=DROITE;timerDirectionDemandee=16;}	
			else
			if (joypad_1 & UP){directionDemandee=HAUT;timerDirectionDemandee=16;}
			else
			if (joypad_1 & DOWN) {directionDemandee=BAS;timerDirectionDemandee=16;}
			
			if ( ((joypad_1 & FIRE1) || (joypad_1 & FIRE2) )&& (toucheRelachee==0))
			{
				createDoor();
				toucheRelachee = 8;
			}		

			//if (joypad_1 & FIRE1) workflow = W_NEXTLEVEL;
		}
		
		if ((directionDemandee==GAUCHE) && (timerDirectionDemandee!=0)) {changePlayerDirection(GAUCHE);}
		else
		if ((directionDemandee==DROITE) && (timerDirectionDemandee!=0)) {changePlayerDirection(DROITE);}
		else
		if ((directionDemandee==HAUT) && (timerDirectionDemandee!=0)) {changePlayerDirection(HAUT);}
		else
		if ((directionDemandee==BAS) && (timerDirectionDemandee!=0)) {changePlayerDirection(BAS);}

		if (timerDirectionDemandee>0) timerDirectionDemandee--; else directionDemandee=NOK;
		
		if (toucheRelachee>0) toucheRelachee--;
		
		checkPlayerGameCollisions();
		movePlayer();
		animatePlayer();
		renderSprite();
		renderDoors(); 

		
		if (animateSprite<levelParamCop0Speed)
		{
			moveCop0();
			renderCop(0);
		}
		if (animateSprite<levelParamCop1Speed)
		{		
			moveCop1();
			renderCop(1);
		}
		if (animateSprite<levelParamCop2Speed)
		{		
			moveCop2();
			renderCop(2);
		}
		if (animateSprite<levelParamCop3Speed)
		{		
			moveCop3();
			renderCop(3);
		}
		
		renderBonus();
		
		if (extend==1)
		{
			if (currentAbsoluteLevel==3)
			{
				if (player.nbPillsLevel==125) {openDoors();player.nbPillsLevel++;}
			}
			else
			if (currentAbsoluteLevel==2)
			{
				if (player.nbPillsLevel==131) {openDoors();player.nbPillsLevel++;}
			}
			else
			{
				if (player.nbPillsLevel==135) {openDoors();player.nbPillsLevel++;}
			}
		}
		else
			if (player.nbPillsLevel==135) {openDoors();player.nbPillsLevel++;}
		
		if (player.score>nextLifeBonus) 
		{
			if (player.nbLives<9) {player.nbLives++;}
			
			if (nextLifeBonus<8000)  
			{
				nextLifeBonus+=1500;renderPlayerNbLives();delay(1);
			} 
			else nextLifeBonus=65200;
		}
		if ((player.py==0) || (player.py==176)) {
			/*stop_music();
			startmusic(music_nextLevel,LOOP_OFF);
			delay(320);*/
			workflow=W_NEXTLEVEL;
		}
		//if (keypad_1 == 1) {stop_music();play_sound(6);delay(120);workflow=W_NEXTLEVEL;}
		
		if (keypad_1==10)
		{
				/*stop_music();				
				stop_sound(1);
				stop_sound(2);
				stop_sound(3);
				stop_sound(4);
				stop_sound(5);
				stop_sound(6);*/
				while (keypad_1==10) {delay(1);}
				delay(2);
				while(keypad_1!=10) {delay(1);}
				delay(2);
				//play_music(music);
				delay(5);
		}

		
		renderAutoDoor();
		if (workflow==W_RETRY) break;
		if (workflow==W_NEXTLEVEL) break;
		delay(1);
		
	}
	/*stop_music();
	stop_sound(1);
	stop_sound(2);
	stop_sound(3);
	stop_sound(4);
	stop_sound(5);
	stop_sound(6);*/

}
void menu()
{
	disable_nmi();
	center_string(10,"PRESS FIRE TO START");			
	pause();
	enable_nmi();
	currentLevel = 1;
	currentAbsoluteLevel=1;
}

void resetSprites()
{
	int i;
	for (i=0;i<32;i++)
		sprites[i].y = 204;
}

void playIntro()
{
	byte x,y,i,j,cpt;
	
	x=0; //juska x = 21
	y=21;
	cpt = 0;
	
	disable_nmi();
	screen_off();
		
	load_patternrle(PATTERNRLE);
	duplicate_pattern();
	
	rle2vram(NAMERLE_INTRO,chrtab);	
						
	/* Chargement des couleurs */
	rle2vram(COLORRLE,coltab);
	rle2vram(COLORRLE,coltab+2048);
	rle2vram(COLORRLE,coltab+4096);	
	screen_on();
	enable_nmi();
	stopmusic();
	startmusic(music_nextLevel,LOOP_OFF);
	
	for (x=0;x<22;x++)
	{
		disable_nmi();		
		if (x>0) put_frame(&frm[2],x-1,y,4,2);
		if (x==5)
		{
			for (i=0;i<4;i++)
			for (j=20;j<24;j++)
				put_char(i,j,0);
				
			put_char(4,20,193);
			put_char(4,21,193);
			put_char(4,22,193);
			put_char(4,23,3);
		}

		put_frame(&frm[cpt],x,y,4,2);
		enable_nmi();
		delay(15);
		cpt++;
		if (cpt>1) cpt = 0;
	}
}

void eraseScreen(void)
{
	char i,j;
	
			for (i=0;i<32;i++)
			 for (j=0;j<24;j++)
				put_char(i,j,32);
}

byte comptePills()
{
	byte x,y,c;
	
	c=0;
	
	for (x=0;x<32;x++)
	for (y=0;y<24;y++)
	{
		delay(1);
		if (get_char(x,y)==CHAR_PILL) c++;
	}
	
	return c;
	
}
void main(void)
{
	unsigned i,j;
	char tmp;
	tmp=0;
	j=0;odd=0;currentFlicker=0;
	hiscore = 200;
	workflow = W_SPLASH0;
	screen_mode_2_bitmap();
	activateNmi=NOK;
	extend=0;
	for (i=0;i<32;i++) sprites[i].y = 204;
	i=0;
//	set_snd_table(snd_table);
	
	while (1)
	{
		if (workflow==W_SPLASH0)
		{
		
			disable_nmi();
			screen_off();
			rle2vram(BIOS0NAMERLE,chrtab);	
			
			load_patternrle(BIOS0PATTERNRLE);
			duplicate_pattern();
						
			screen_on();
			for(i=0;i<4;i++)
			{
				for (j=0;j<6;j++)
				{
					rle2vram(BIOS0COLORS[j],coltab);
					rle2vram(BIOS0COLORS[j],coltab+2048);
					rle2vram(BIOS0COLORS[j],coltab+4096);
					delay(5);
				}						
			}
			screen_off();
			rle2vram(BIOS1NAMERLE,chrtab);	
			
			load_patternrle(BIOS1PATTERNRLE);
			duplicate_pattern();
			
			
			rle2vram(BIOS1COLORRLE,coltab);
			rle2vram(BIOS1COLORRLE,coltab+2048);
			rle2vram(BIOS1COLORRLE,coltab+4096);	
			screen_on();
			enable_nmi();
			pause();
			workflow=W_MENU;
		}
		else
		if (workflow==W_MENU)
		{
			activateNmi=NOK;
			resetSprites();
			updatesprites(0,6);
			delay(1);
			screen_off();
			rle2vram(TITLENAMERLE,chrtab);	
			
			load_patternrle(TITLEPATTERNRLE);
			duplicate_pattern();
			
			/* Chargement des couleurs */
			rle2vram(TITLECOLORRLE,coltab);
			rle2vram(TITLECOLORRLE,coltab+2048);
			rle2vram(TITLECOLORRLE,coltab+4096);	
			print_at(5,1,"TO SELECT GAME OPTION,");
			print_at(5,3,"PRESS BUTTON ON KEYPAD.");

			print_at(1,7,"1 = SKILL 1/ONE PLAYER/CLASSIC");
			print_at(1,9,"2 = SKILL 2/ONE PLAYER/CLASSIC");
			print_at(1,11,"3 = SKILL 3/ONE PLAYER/CLASSIC");
			print_at(1,13,"4 = SKILL 4/ONE PLAYER/CLASSIC");

			print_at(1,15,"5 = SKILL 1/ONE PLAYER/EXTEND");
			print_at(1,17,"6 = SKILL 2/ONE PLAYER/EXTEND");
			print_at(1,19,"7 = SKILL 3/ONE PLAYER/EXTEND");
			print_at(1,21,"8 = SKILL 4/ONE PLAYER/EXTEND");

			screen_on();
			
			enable_nmi();

			while(1)
			{
				if (keypad_1==1) {currentLevel = 1;extend=0;break;}
				if (keypad_1==2) {currentLevel = 5;extend=0;break;}
				if (keypad_1==3) {currentLevel = 10;extend=0;break;}
				if (keypad_1==4) {currentLevel = 15;extend=0;break;}
				
				
				if (keypad_1==5) {currentLevel = 1;extend=1;break;}
				if (keypad_1==6) {currentLevel = 5;extend=1;break;}
				if (keypad_1==7) {currentLevel = 10;extend=1;break;}
				if (keypad_1==8) {currentLevel = 15;extend=1;break;}	
				currentAbsoluteLevel=1;				
/*
				if (currentLevel>3)
				{
					if ((currentLevel%3)==0) currentAbsoluteLevel=3;
					else
					if ((currentLevel%2)==0) currentAbsoluteLevel=2;
					else
					currentAbsoluteLevel=1;
				}
				else
				{
					currentAbsoluteLevel = currentLevel;
				}*/
				
				
			}

			disable_nmi();

			eraseScreen();			
			changeFontColor(15,1);
						
			j=4;
			while (j>0)
			{
				center_string(12,grp1);
				delay(10);
				center_string(12,"                  ");
				delay(10);
				j--;
			}
			enable_nmi();
			levelParamNbLives = 3;	
			for (i=0;i<4;i++)
				initCop(i);
			initPlayer();
			initBonus();
			//workflow = W_SPLASH0;
			bigTimer = 0;
			currentBonus = 0;	
			//menu();
			player.score = 0;	
			player.doorOpen = NOK;
			player.nbLives=levelParamNbLives;
			
			playIntro();
			
			
			screen_off();

			rle2vram(NAMERLE,chrtab);	
			
			load_patternrle(PATTERNRLE);
			duplicate_pattern();
			
			/* Chargement des couleurs */
			rle2vram(COLORRLE,coltab);
			rle2vram(COLORRLE,coltab+2048);
			rle2vram(COLORRLE,coltab+4096);	
			
			rle2vram(SPATTERNRLE,sprtab);	
			renderPlayerLevel();
			renderPlayerNbLives();
			renderPlayerScore();
			renderPlayerHiScore();
			
			screen_on();
			enable_nmi();
			delay(1);
			nextLifeBonus=500;
			
			workflow=W_INGAME;

		}
		else 
		if (workflow==W_INGAME)
		{	
			screen_off();
				initLevel(currentLevel); 			
				for (i=0;i<4;i++)
					initCop(i);
			screen_on();
			activateNmi=OK;
			enable_nmi();
			stopmusic();
			startmusic(music_inGame,LOOP_ON);
			gameLoop(); // C'est lui qui va définir le prochaine workflow --> W_NEXTLEVEL	
			// ou W_RETRY
			//stop_music();
		}
		else 
		if (workflow==W_RETRY)
		{
			if (player.nbLives>0) {player.nbLives--;	workflow=W_INGAME;}		else workflow = W_GAMEOVER;												

			screen_off();
			for (i=0;i<4;i++)
				initCop(i);
			//initBonus();
			// On efface les portes restantes			
			autoDoorTimer=0;
			autoDoorCurrentGfx=17;			
			playerDoors[0].affiche=OK;
			playerDoors[0].timer=0;
			playerDoors[1].affiche=OK;
			playerDoors[1].timer=0;
			renderDoors();		
			renderAutoDoor();		
			renderPlayerLevel();
			renderPlayerNbLives();
			renderPlayerScore();	
			renderPlayerHiScore	();	
			screen_on();
			enable_nmi();
			delay(1);

			
		}		
		else 
		if (workflow==W_NEXTLEVEL)
		{
			stopmusic();
			delay(5);
			screen_off();
			disable_nmi();
			rle2vram(TITLENAMERLE,chrtab);	
			
			load_patternrle(TITLEPATTERNRLE);
			duplicate_pattern();
			
			/* Chargement des couleurs */
			rle2vram(TITLECOLORRLE,coltab);
			rle2vram(TITLECOLORRLE,coltab+2048);
			rle2vram(TITLECOLORRLE,coltab+4096);
			changeFontColor(15,1);
			/*for (i=0;i<32;i++)
			 for (j=0;j<24;j++)
				put_char(i,j,32);*/
				eraseScreen();
			resetSprites();
			updatesprites(0,6);
			delay(1);
			activateNmi=NOK;
			screen_on();			
			j=4;

			center_string(8,"CONGRATULATIONS !!");
			center_string(10,"PRESS FIRE FOR NEXT-LEVEL");
			
			enable_nmi();
			stopmusic();
			startmusic(music_nextLevel,LOOP_OFF);
/*
			while (j>0)
			{
				delay(10);
				center_string(12,"                  ");			
				delay(10);
				center_string(12,grp1);
				
				j--;
			}
*/
			
			
			pause();
			
			stopmusic();
			//delay(1);
			//playIntro();
			
			for (i=0;i<4;i++)
			initCop(i);
			currentLevel++;
							if (currentLevel>3)
				{
					if ((currentLevel%3)==0) currentAbsoluteLevel=3;
					else
					if ((currentLevel%2)==0) currentAbsoluteLevel=2;
					else
					currentAbsoluteLevel=1;
				}
				else
				{
					currentAbsoluteLevel = currentLevel;
				}

			player.doorOpen = NOK; // Les portes sont de nouveaux fermées			
			
			disable_nmi();
			screen_off();

			
			/* Ici selon version, on affiche un autre level */
			if (extend==1)
			{
				if ((currentAbsoluteLevel)==3)
				{
					rle2vram(NAMERLE_LEVEL3,chrtab);	
			
					load_patternrle(PATTERNRLE_LEVEL3);
					duplicate_pattern();
			
					/* Chargement des couleurs */
					rle2vram(COLORRLE_LEVEL3,coltab);
					rle2vram(COLORRLE_LEVEL3,coltab+2048);
					rle2vram(COLORRLE_LEVEL3,coltab+4096);					
				}
				else if ((currentAbsoluteLevel)==2)
				{
					rle2vram(NAMERLE_LEVEL2,chrtab);	
			
					load_patternrle(PATTERNRLE_LEVEL2);
					duplicate_pattern();
			
					/* Chargement des couleurs */
					rle2vram(COLORRLE_LEVEL2,coltab);
					rle2vram(COLORRLE_LEVEL2,coltab+2048);
					rle2vram(COLORRLE_LEVEL2,coltab+4096);					
				}
				else
				{
					rle2vram(NAMERLE,chrtab);	
			
					load_patternrle(PATTERNRLE);
					duplicate_pattern();
			
					/* Chargement des couleurs */
					rle2vram(COLORRLE,coltab);
					rle2vram(COLORRLE,coltab+2048);
					rle2vram(COLORRLE,coltab+4096);						
				}
			}
			else
			{			
				rle2vram(NAMERLE,chrtab);	
			
				load_patternrle(PATTERNRLE);
				duplicate_pattern();
			
				/* Chargement des couleurs */
				rle2vram(COLORRLE,coltab);
				rle2vram(COLORRLE,coltab+2048);
				rle2vram(COLORRLE,coltab+4096);	
			}
			
			renderPlayerLevel();
			renderPlayerNbLives();
			renderPlayerScore();	
			renderPlayerHiScore	();		
			screen_on();
			enable_nmi();
			
			delay(1);
			initPlayer();
			workflow=W_INGAME;
		}
		else 
		if (workflow==W_GAMEOVER)
		{
			activateNmi=NOK;
			screen_off();
			disable_nmi();
			rle2vram(TITLENAMERLE,chrtab);	
			
			load_patternrle(TITLEPATTERNRLE);
			duplicate_pattern();
			
			/* Chargement des couleurs */
			rle2vram(TITLECOLORRLE,coltab);
			rle2vram(TITLECOLORRLE,coltab+2048);
			rle2vram(TITLECOLORRLE,coltab+4096);
			changeFontColor(15,1);
			/*for (i=0;i<32;i++)
			 for (j=0;j<24;j++)
				put_char(i,j,32);*/
				eraseScreen();
			resetSprites();
			updatesprites(0,6);
			center_string(8,"GAME OVER");
			center_string(10,"FINAL SCORE");
			center_string(12,str(player.score));
			if (player.score>hiscore) 
			{
				center_string(15,"YOU'VE GOT HIGH SCORE !!");
				hiscore=player.score;
			}
			screen_on();
			enable_nmi();
			stopmusic();
			startmusic(music_gameOver,LOOP_OFF);
			pause();
			workflow=W_MENU;
		}
		
	}
	

	
}

void nmi(void)
{
	//update_music();
	if (activateNmi==OK)
	{
		if (autoDoorTimer!=0) autoDoorTimer--; // Le temps que dure une animation d'autoDoor (8 animation pour une fermeture, 8 pour une ouverture)
		if (scatterModeTimer!=0) scatterModeTimer--;	
		//if (flickerTimer==0) flickerTimer++; else flickerTimer=0;
		if (animateSprite!=9) animateSprite++; else {animateSprite = 0;renderPlayerScore();}
	
		if (currentFlicker<2) currentFlicker++; else currentFlicker=1;
		if (currentFlicker==2) put_vram (0x1b00,sprites,128); 
		else 
		{
			memcpyb(bsprites,sprites+16,64);
			memcpyb(bsprites+16,sprites,64);
			put_vram (0x1b00,bsprites,128);				
		}	

		//updatesprites(0,6);
	}
	
	  G_TickCount++;
  G_count++;
  

  sound_nmi();

}
