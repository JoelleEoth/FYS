//Bepaald de bewegingen.
//Dorus
void movement() {
  //a boolean that checks if the player is trying to jump or not
  boolean playerJumping = keysPressed[87] == true || keysPressed[UP] == true;
  boolean playerDropping = keysPressed[83] == true || keysPressed[DOWN] == true;
  boolean playerMovingLeft = keysPressed[65] ==true || keysPressed[LEFT] == true;
  boolean playerMovingRight = keysPressed[68] == true || keysPressed[RIGHT] == true;
  for (int i = 0; i < theGeyser.size(); i++) {
    
    //try/catch ding dat ervoor zorgt dat er geen error komt als er geen enkele geyser op het scherm is.
    try {
      theGeyser.get(i).collisionGeyser = rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, theGeyser.get(0).x, theGeyser.get(0).y, theGeyser.get(0).w, theGeyser.get(0).h);
    }
    catch(IndexOutOfBoundsException e) {
      theGeyser.get(i).collisionGeyser = false;
    }
  }



  if (checkPlatform() != -1 && playerDropping == false) {
    //line of code that corrects for clipping with high speeds
    playerPositionY -= PLAYER_SIZE / 2 - (-playerPositionY + thePlatforms.get(checkPlatform()).platformY);

    //if the player is jumping, initiate a jump. Else, set its velocity to 0 to mimic the normal force of the platform.
    if (playerJumping) {
      playerVelocityY = PLAYER_JUMP_HEIGHT;
    } else {
      for (int i = 0; i < theGeyser.size(); i++) {
        if (theGeyser.get(i).collisionGeyser == false) {
          playerVelocityY = 0;
        }
      }
    }
  } else {
    //if the player is in the air, apply gravity to its speed
    playerVelocityY -= gravity;
  }
  //line of code that will allow the player to drop faster downward
  if (playerDropping) {
    playerVelocityY -= gravity; 
    playerPositionY -= playerVelocityY;
  }

  if (playerMovingLeft && playerPositionX > width/8) {
    playerPositionX -= playerVelocityX;
  }

  if (playerMovingRight && playerPositionX < 3*width/8) {
    playerPositionX += playerVelocityX;
  }

  //update the position and the previous position.
  previousPlayerPositionY = playerPositionY;
  playerPositionY -= playerVelocityY;
}

void drawPlayer() {
  fill(255);
  rect(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE);
}

//checkt op welk platform de player staat. Als er geen collision is tussen een van de platforms en de player, dan geeft het de waarde -1 terug.r
int checkPlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    Platform platform = thePlatforms.get(i);
    if (platform.onPlatform()) {
      return i;
    }
  }
  return -1;
}

void damage(float damageAmount) {
  if (playerImmune == true) {
    if (immunityStart <= millis() - IMMUNITY_TIME) 
      playerImmune = false;
  } else {
    lives -= damageAmount/2;
    playerImmune = true;
    immunityStart = millis();
  }
}


//Door viv
//hoe je deze boolean leest: playerX, playerY, playerWidth, playerHeight, objectX, objectY, objectWidth,  objectHeight 
//deze collision boolean kan je overal voor gebruiken, zolang het rect/rect is.
boolean rectRectCollision(float x1, float y1, float width1, float height1, float x2, float y2, float width2, float height2) {
  //collision in the y direction
  boolean upDownCollision = y1-(height1/2) < y2+(height2/2) && y1+(height1/2) > y2-(height2/2);
  //collision in the x direction
  boolean leftRightCollision = x1+(width1/2) > x2-(width2/2) && x1-(width1/2) < x2+ (width2/2);
  //if both collision types happen:
  if (leftRightCollision && upDownCollision) { 
    return true;
  } else {
    return false;
  }
}
