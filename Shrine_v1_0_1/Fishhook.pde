//door Mina

//voor de positie van het haak
void fishhookStartingValues() { //de starting values en constructie voor de vishaak
      theFishhook = new FishingHook(-100, fishhookPointY, fishhookVX);

}


void drawFishhook() { //het tekend de vishaak
  if (spawnFishhook) {

    theFishhook.theEntireFishhook();
  }
}


void updateTheFishhook() { //hier zit alles om de vishaak te laten bewegen
  if (spawnFishhook) {

    if (fishhookX+fishhookRange<0) {
      theFishhook = new FishingHook(fishhookPointX, fishhookPointY, fishhookVX);
    }
    theFishhook.swingingMotion();
    theFishhook.fishhookMovingX();
    theFishhook.collisionWithFishhook();
  }
}


class FishingHook { 
  float px, py, vx;
  float fishhookX2=fishhookPointX, // dit heb ik gedaan zodat de lijn die ik heb getekend
    // de punt die ik hbe getekened volgd, zodat het aan elkaar vast blijft.
    fishhookY2=fishhookPointY, angle;

  FishingHook(float pointX, float pointY, float speedX) { 
    px = pointX;
    py = pointY;
    vx = speedX;
  }


  void swingingMotion() { //update, de motion dat het heen en weer gaat

    angle=frameCount/30.0; //de snelheid van het haak

    fishhookPointX = fishhookX + fishhookRange * cos(angle);
  }


  void fishhookMovingX() {
    fishhookX-=fishhookVX;

    //if (fishhookX+fishhookRange<0) { // zorgt er voor dat het loopt, eigenlijk veranderd de x positie alleen lmao
    //  fishhookX=width+fishhookRange; // dus dat ie een bepaalde range aan houd wanneer die zwaait
    //  fishhookPointX=width+fishhookRange;
    //}
  }

  void theEntireFishhook() { //het tekend de vishaak
    stroke(255);
    line(fishhookX, fishhookY, fishhookPointX, fishhookPointY);
    image(fishhookImg, fishhookPointX, fishhookPointY, fishHookCircleRadius, fishHookCircleRadius); //het punt waarmee er word geinteracteerd
  }


  void collisionWithFishhook() {// de collision
    if (rectRectCollision(fishhookPointX, fishhookPointY, 1, 1, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      damage(1); // damage bij de collision
    }
  }
}
