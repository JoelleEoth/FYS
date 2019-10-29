//// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

//the size, speed and jumpheight of the player
final int PLAYER_SIZE = 60, 
  PLAYER_JUMP_HEIGHT = 15;
int playerSpeed;
float lives = 3;
boolean playerImmune;
int immunityStart;
final int IMMUNITY_TIME = 1000;

int score;


//a boolean if the player is on a platform. Used for platform detection.
boolean onPlatform;
//the height difference from a platform to the next platform
final int PLATFORM_DIFFERENCE = 100;
int platformFrequency = 100; 

//Classes
Hearts Hearts;
ArrayList<Whirlpool> theWhirlpool;
ArrayList<Geyser> theGeyser;
ArrayList<Platform> thePlatforms;
Banana theBanana;
FishingHook theFishhook;

//green rect
//blue rect
Squid squid1;
Squid squid2;
Squid squid3;
//red rect
Shark shark; 


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
