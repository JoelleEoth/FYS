//Bepaald de bewegingen.
void movement() {
  //a boolean that checks if the player is trying to jump or not
  boolean playerJumping = keysPressed[87] == true || keysPressed[UP] == true;
  if (onGround() == true) {
    if (playerJumping) {
      playerVelocityY = PLAYER_JUMP_HEIGHT;
    } else {
      playerVelocityY = 0;
    }
  } else {
    playerVelocityY -= gravity;
  }
  playerPositionY -= playerVelocityY;
}

void drawPlayer() {
  fill(255);
  rect(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE);
}

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


//checkt collision - moet nog geedit worden, checkt nu alleen de grond. Gaat waarschijnlijk in nieuw tab.
boolean onGround() {
  if (playerPositionY + PLAYER_SIZE/2 >= height - 20) {
    return true;
  } else {
    return false;
  }
}
