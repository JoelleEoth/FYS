boolean playerImmune;
int immunityStart;
boolean playerHit;
final int IMMUNITY_TIME = 1000;

boolean damageRedHighLight;

//viv
// dit telt hoeveel platforms op het scherm zijn
boolean isObjectOnScreen(float objectX, float objectW) {
  if (objectX-(objectW/2)<width) {
    return true;
  }
  if (objectX+(objectW/2)<0) {
    return true;
  } else {
    return false;
  }
}


//Door viv & dorus
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


void damage(float damageAmount) {
  if (playerImmune == true) {

  } else {
    lives -= damageAmount/2;
    playerImmune = true;
    immunityStart = millis();
    damageRedHighLight = true;
  }
  if (lives <= 0) {
    death();
    println(bananaCount);
  }
}

void death() {
  stage = 4;
}
