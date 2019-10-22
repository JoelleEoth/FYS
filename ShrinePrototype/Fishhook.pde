//voor de positie van het haak
void fishhookStartingValues() {
  theFishhook = new FishingHook(fishhookPointX, fishhookPointY, fishhookVX);
}


void drawFishhook() { //het tekend de vishaak
  theFishhook.theEntireFishhook();
}


void updateTheFishhook() {
  theFishhook.swingingMotion();
  theFishhook.fishhookMovingX();
  theFishhook.collisionWithFishhook();
}


class FishingHook {
  float px, py, vx;
  float fishhookX2=fishhookPointX, 
    fishhookY2=fishhookPointY, angle;

  FishingHook(float pointX, float pointY, float speedX) { 
    px = pointX;
    py = pointY;
    vx = speedX;
  }


  void swingingMotion() { //update, de motion dat het heen en weer gaat

    angle=frameCount/15.0; //de snelheid van het haak
    fishhookPointX=fishhookX+fishhookRange*cos(angle);
  }


  void fishhookMovingX() {
    fishhookX-=fishhookVX;

    if (fishhookX+fishhookRange<0) { // zorgt er voor dat het loopt, eigenlijk veranderd de x positie alleen lmao
      fishhookX=width+fishhookRange;
      fishhookPointX=width+fishhookRange;
    }
  }

  void theEntireFishhook() { //het tekend de vishaak
    line (fishhookX, fishhookY, fishhookPointX, fishhookPointY);
    point (px, py); //het punt waarmee er word geinteracteerd
  }


  void collisionWithFishhook() {// de collision
    if (rectRectCollision(fishhookPointX, fishhookPointY, 1, 1, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      Hearts.H -= 1;//nog kijken hoe het -0.5 kan zijn
      println("hetiseenvis");
    }
  }
}
