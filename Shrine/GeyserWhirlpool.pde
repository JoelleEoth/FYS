// Door Vivienne

void geyserWhirlpoolValues() { //alle geyser values
  //geyser(x, y, width, height, color, opacity, its movement speed)
  theGeyser = new ArrayList<Geyser>();
  theWhirlpool = new ArrayList<Whirlpool>();
}


void updateGeyserWhirlpool() {
  Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  //hier spawnt de geysers en whirlpools op de platforms zelf, pas als de platforms in het scherm zijn
  if (theGeyser.size() < 2 && isPlatformOnScreen(platformX, platformW ) == false) {
    theGeyser.add(new Geyser(platformX+(random(-250, 250)), platformY-125, geyserWidth, geyserHeight, 255, 40, platformS, 0.3));
  }
  if (theWhirlpool.size() < 2 && isPlatformOnScreen(platformX, platformW) == false) {
    theWhirlpool.add(new Whirlpool(platformX+(random(-250, 250)), platformY-125, whirlpoolWidth, whirlpoolHeight, 255, 40, platformS, 0.1));
  }
  //dit verwijdert een geiser uit de arraylist wanneer het uit het scherm is
  for (int i =0; i<theGeyser.size(); i++) {
    Geyser aGeyser = theGeyser.get(i);
    aGeyser.updateGeyser();
    aGeyser.effectPlayer();

    if (aGeyser.x+(aGeyser.w/2) < 0 || theGeyser.get(i).m == 0) {
      theGeyser.remove(i);
    }
  }
  //dit verwijdert een whirlpool uit de arraylist wanneer het uit het scherm is
  for (int i = 0; i<theWhirlpool.size(); i++) {
    Whirlpool aWhirlpool = theWhirlpool.get(i);
    aWhirlpool.updateWhirlpool();
    aWhirlpool.effectPlayer();
    if (aWhirlpool.x+(aWhirlpool.w/2) < 0|| theWhirlpool.get(i).m == 0) {
      theWhirlpool.remove(i);
    }
  }
}

void drawGeyserWhirlpool() {
  for (int i = 0; i<theGeyser.size(); i++) {
    Geyser aGeyser = theGeyser.get(i);
    aGeyser.drawGeyser();
  }
  for ( int i = 0; i< theWhirlpool.size(); i++) {
    Whirlpool aWhirlpool = theWhirlpool.get(i);
    aWhirlpool.drawWhirlpool();
  }
}

//de class geiser
class Geyser { 
  float x, y, w, h;
  float clr, opact;
  float m;
  float e;
  boolean collisionGeyser = false;

  Geyser(float tempX, float tempY, float tempW, float tempH, float tempCLR, float tempOPACT, float tempM, float tempE) {
    x = tempX;
    y = tempY; 
    w = tempW; 
    h = tempH;
    clr = tempCLR;
    opact=tempOPACT;
    m = tempM;
    e = tempE;
  }
  //tekent de geiser
  void drawGeyser() { 
    fill(0, 0, clr, opact);
    rect(x, y, w, h);
  }
  //geiser beweging
  void updateGeyser() {
    x-=m;
  }

  //de effects van de geiser op de speler wanneer er een rectrect collision plaatsvindt
  void effectPlayer() {
    for (int i = 0; i<theGeyser.size(); i++) {
      if ( rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, theGeyser.get(i).x, theGeyser.get(i).y, theGeyser.get(i).w, theGeyser.get(i).h)) {
        playerVelocityY+=theGeyser.get(i).e;
      }
    }
  }
}



// de whirlpool class
class Whirlpool {
  float x, y, w, h;
  float clr, opact;
  float m;
  float e;


  Whirlpool(float tempX, float tempY, float tempW, float tempH, float tempCLR, float tempOPACT, float tempM, float tempE) {
    x = tempX;
    y = tempY; 
    w = tempW; 
    h = tempH;
    clr = tempCLR;
    opact=tempOPACT;
    m=tempM;
    e = tempE;
  }
  //dit tekent de whirlpool
  void drawWhirlpool() {
    fill(clr, 0, 0, opact);
    rect(x, y, w, h);
  }
  //zo beweegt de whirlpool naar de speler toe
  void updateWhirlpool() {
    x-=m;
  }
  //de effects dat de speler krijgt als er een rectrect collision is
  void effectPlayer() {
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, theWhirlpool.get(0).x, theWhirlpool.get(0).y, theWhirlpool.get(0).w, theWhirlpool.get(0).h)) {
      try {
        playerVelocityY-=theGeyser.get(theGeyser.size()-1).e;
      }
      catch(ArrayIndexOutOfBoundsException e) {
      }
    }
  }
}
