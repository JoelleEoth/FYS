//Bepaald de bewegingen van de speler.
//Dorus

//the size, speed and jumpheight of the player
final int PLAYER_WIDTH = 50, 
  PLAYER_HEIGHT = 78, 
  PLAYER_JUMP_HEIGHT = 15;
int playerSpeed;
final float HITBOX_IMAGE_DIFF_FACTOR = 1.28;

//position and speed of the player
float playerPositionX, 
  previousPlayerPositionY, 
  playerPositionY, 
  playerVelocityY, 
  playerVelocityX, 
  gravity = 0.3;


void movement() {
  //a boolean that checks if the player is trying to jump or not
  boolean playerJumping = keysPressed[87] == true || keysPressed[UP] == true;
  boolean playerDropping = keysPressed[83] == true || keysPressed[DOWN] == true;
  boolean playerMovingLeft = keysPressed[65] ==true || keysPressed[LEFT] == true;
  boolean playerMovingRight = keysPressed[68] == true || keysPressed[RIGHT] == true;
  boolean inBoundsTop = playerPositionY-(PLAYER_HEIGHT/2) > 0;
  boolean inBoundsRight = playerPositionX+(PLAYER_WIDTH/2) < width;
  boolean inBoundsLeft = playerPositionX-(PLAYER_WIDTH/2) > 0;
  for (int i = 0; i < geyserArrayList.size(); i++) {

    //try/catch ding dat ervoor zorgt dat er geen error komt als er geen enkele geyser op het scherm is.
    try {
      geyserArrayList.get(i).collisionGeyser = rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, geyserArrayList.get(0).x, geyserArrayList.get(0).y, geyserArrayList.get(0).w, geyserArrayList.get(0).h);
    }
    catch(IndexOutOfBoundsException e) {
      geyserArrayList.get(i).collisionGeyser = false;
    }
  }


  //move left and right within the bounds
  if (playerMovingLeft && inBoundsLeft) {
    playerPositionX -= 5;
  }
  if (playerMovingRight && inBoundsRight) {
    playerPositionX += 5;
  }

  //if on a platform (checkPlatform returns -1 if the player is not touching any platforms) and the player isn't pressing down to drop through a platform,
  //keep the player on the platform
  //if the player is on a platform in the arraylist platformArrayListMain then return the index to which specific platform it is
  int platformIndex = checkPlatform();


  if (platformIndex != -1 && previousPlayerPositionY <= platformArrayListMain.get(platformIndex).platformY + PLAYER_HEIGHT/2) {
    //line of code that corrects for clipping with high speeds
    playerPositionY -= PLAYER_HEIGHT / 2 - (-playerPositionY + platformArrayListMain.get(platformIndex).platformY);

    //if the player is jumping, initiate a jump. Else, set its velocity to 0 to mimic the normal force of the platform.
    if (playerJumping) {
      playerVelocityY = PLAYER_JUMP_HEIGHT;
    } else {
      for (int i = 0; i < geyserArrayList.size(); i++) {
        if (geyserArrayList.get(i).collisionGeyser == false) {
          playerVelocityY = 0;
        }
      }
    }
  } else {
    //if the player is in the air, apply gravity to its speed
    playerVelocityY -= gravity;
    if (inBoundsTop == false) {
      playerPositionY += gravity;
      playerVelocityY = 0;
    }
  }
  //line of code that will allow the player to drop faster downward
  if (playerDropping) {
    playerVelocityY -= gravity;
  }

  if (playerPositionY >= height) {
    damage(1);
    playerPositionX = width/4;
    playerPositionY = random(height/2, height);
    platformArrayListMain.add(new Platform(400, 10, playerPositionX, playerPositionY + PLAYER_HEIGHT, 3));
  }

  //update the position and the previous position.
  previousPlayerPositionY = playerPositionY;
  playerPositionY -= playerVelocityY;
}

int playerDrawFrame;

void drawPlayer() {
  boolean playerJumping = keysPressed[87] == true || keysPressed[UP] == true;
  //dit is de code voor de animatie. De frame verandert elke 10 frames
  if (frameCount % 10 == 0) {
    playerDrawFrame++;
    if (playerDrawFrame > 7) {
      playerDrawFrame = 0;
    }
  }
  if (playerJumping) {
    playerDrawFrame = 8;
  }
  //set immunity to false whenever it is done
  if (immunityStart <= millis() - IMMUNITY_TIME) {
    playerImmune = false;
  }
  //red highlight as feedback 
  if (playerImmune == false) {
    damageRedHighLight = false;
  }

  if (frameCount % 30 > 0 && frameCount % 30 < 15 && damageRedHighLight) {
    tint(255, 0, 0);
  }
  image(playerImg[playerDrawFrame], playerPositionX, playerPositionY, PLAYER_WIDTH * HITBOX_IMAGE_DIFF_FACTOR, PLAYER_HEIGHT * HITBOX_IMAGE_DIFF_FACTOR);
  tint(255, 255, 255);
}


//checkt op welk platform de player staat. Als er geen collision is tussen een van de platforms en de player, dan geeft het de waarde -1 terug.r
int checkPlatform() {
  for (int i = 0; i < platformArrayListMain.size(); i++) {
    Platform platform = platformArrayListMain.get(i);
    if (platform.onPlatform()) {
      return i;
    }
  }
  return -1;
}
