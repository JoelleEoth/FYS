//// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

//the size, speed and jumpheight of the player
final int playerSize = 60, playerJumpHeight = 12;
int playerSpeed; 
float Lives = 3;

//Classes
Hearts Hearts;


//position and speed of the player
float playerPositionX, playerPositionY, playerVelocityY, playerVelocityX, gravity = 0.2;
