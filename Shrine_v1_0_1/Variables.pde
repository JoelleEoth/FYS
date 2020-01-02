//// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

//the size, speed and jumpheight of the player
final int PLAYER_SIZE = 100, 
  PLAYER_JUMP_HEIGHT = 15;
int playerSpeed;
float lives = 3;
boolean playerImmune;
int immunityStart;
boolean playerHit;
final int IMMUNITY_TIME = 1000;

int score;
int scoreUp = 1;
int frame;
boolean gameReady;
boolean[] spawnConditionArray = new boolean[6];
boolean spawnGeyser, 
  spawnWhirlpool, 
  spawnSquids, 
  spawnSharks, 
  spawnFishhook, 
  platformDecline;

int gameStartTime;

int timeLevel2 = 10000, 
  timeLevel3 = 20000, 
  timeLevel4 = 30000, 
  timeLevel5 = 40000;

//a boolean if the player is on a platform. Used for platform detection.
boolean onPlatform;
//the height difference from a platform to the next platform
final int PLATFORM_DIFFERENCE = 100;
int platformFrequency = 100; 

//Classes
Hearts Hearts;
Menu theMenu;
ArrayList<Whirlpool> theWhirlpool;
ArrayList<Geyser> theGeyser;
ArrayList<Platform> thePlatforms;
//total amount of squids
final int MAX_AMOUNT_SQUIDS = 3; 
//storage of enemy squids in an arraylist
ArrayList<Squid> squids;
ArrayList<Banana> bananas;
FishingHook theFishhook;
Shell theShell;
Shark theShark;
Platform shrinePlatform; 


int sharkWidth = 150, 
  sharkHeight = 60;



//position and speed of the player
float playerPositionX, 
  previousPlayerPositionY, 
  playerPositionY, 
  playerVelocityY, 
  playerVelocityX, 
  gravity = 0.3;

//Geyser and Whirlprool specific variables
int geyserWidth = 150, 
  geyserHeight = 250, 
  whirlpoolWidth = 150, 
  whirlpoolHeight = 250, 
  whirlpoolMovementSpeed = 12;
final int OBJECT_DIFFERENCE = 100;
float effectSpeed;

//vishaak
float 
  fishhookX=2500, 
  fishhookY=0, 
  fishhookVX=10, 
  hookSize=15, 
  fishhookSpeed, 
  fishhookPointX=500, 
  fishhookPointY=700, 
  fishhookRange =200, 
  fishHookCircleRadius = 20;

//shell
float
  xShell = random(0, width), 
  yShell = random(playerPositionY+10, playerPositionY+100), 
  sizeShell = 20, 
  speedShell = random(8, 10);
float bananaSize = 50;
int spawnBanana = 2;




//menu specific variables

int textSizeStart = 48;
int startButtonX = 850, 
  startButtonY = 400;

int textSizeDifficulty = 48;
int  difficultyButtonX = 880, 
  difficultyButtonY = 480; 

boolean gameStart = false;
boolean difficultyButtonHover = (mouseX >= difficultyButtonX && mouseX <=1000 && mouseY >= difficultyButtonY - 40 && mouseY < difficultyButtonY);
boolean startButtonHover = (mouseX >= startButtonX && mouseX <=1090 && mouseY >= startButtonY - 40 && mouseY < startButtonY);

final int MAX_PARTICLES = 30;
final float particleMoveUp = 1.3;
int particleMinSize = 5;
int particleMaxSize = 10;
Particle[] playerParticles = new Particle[MAX_PARTICLES];
Particle[] sharkParticles = new Particle[MAX_PARTICLES];
Particle[] squidParticles = new Particle[MAX_PARTICLES];
Particle[] shrineParticles = new Particle[MAX_PARTICLES];
Particle[] bananaParticles = new Particle[MAX_PARTICLES];
Particle[] shellParticles = new Particle[MAX_PARTICLES];


int shellCount;
