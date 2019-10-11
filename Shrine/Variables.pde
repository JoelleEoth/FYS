//// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

//the size, speed and jumpheight of the player
final int PLAYER_SIZE = 60, PLAYER_JUMP_HEIGHT = 12;
int playerSpeed; 
float Lives = 3;

//Classes
Hearts Hearts;
Geyser theGeyser;
Whirlpool theWhirlpool;

//position and speed of the player
float playerPositionX, playerPositionY, playerVelocityY, playerVelocityX, gravity = 0.2;

//Geyser and Whirlprool specific variables
int geyserWidth = 150, 
  geyserHeight = 1000, 
  geyserMovementSpeed = 10, 
  whirlpoolWidth = 150, 
  whirlpoolHeight = 1000, 
  whirlpoolMovementSpeed = 12;
float effectSpeed;
