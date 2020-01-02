// Door Vivienne

void geyserWhirlpoolValues() { //alle geyser values
  //geyser(x, y, width, height, color, opacity, its movement speed)
  theGeyser = new ArrayList<Geyser>();
  theWhirlpool = new ArrayList<Whirlpool>();
}


void updateGeyserWhirlpool() {
  if (spawnWhirlpool) {
    spawnWhirlpool();
  }
  if (spawnGeyser) {
    spawnGeyser();
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
// aGeyser1.x + ( aGeyser1.s/2) - aGeyser2.x - ( aGeyser2.s/2) >= OBJECT_DIFFERENCE
void spawnGeyser() {
  //platform values 
  Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  //hier spawnt de geysers en whirlpools op de platforms zelf, pas als de platforms in het scherm zijn
  if (theGeyser.size() < 2 &&  isObjectOnScreen(platformX, platformW ) == false) {
    theGeyser.add(new Geyser(platformX+(random(-250, 250)), platformY-125, geyserWidth, geyserHeight, 255, 40, platformS, 0.3));
    /*if a geyserx > platform.x-geyser1.x && < platform.w
     remove that geyser pls
     */
    //for (int i = 0; i< 2; i++) {
    //  if (theGeyser.get(i+1).x - theGeyser.get(i).x <= OBJECT_DIFFERENCE) {
    //    theGeyser.remove(i+1);
    //  }
    //  if (i >=2) {
    //    i = 0;
    //  }
  }
}

void spawnWhirlpool() {
  //platform values 
  Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  //hier spawnt de whirlpool
  if (theWhirlpool.size() < 2 && isObjectOnScreen(platformX, platformW) == false) {
    theWhirlpool.add(new Whirlpool(platformX+(random(-250, 250)), platformY-125, whirlpoolWidth, whirlpoolHeight, 255, 40, platformS, 0.1));
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
  int frame;

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
    if (frameCount%15 == 0) {
      frame++;
      if (frame >2) {
        frame = 0;
      }
    }
    image(geyserImg[frame], x, y, w, h);
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
  int frame;


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
    if (frameCount % 15 == 0) {
      frame++;
      if (frame> 2) {
        frame = 0;
      }
    }
    image(whirlpoolImg[frame], x, y, w, h);
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

/* boolean isObjectTouchingObject?
if(object 1 collides with object 2){
  return true;
} else {
  return false;
}

if( boolean is true) {
  remove said geyser/whirlpool;
}
*/
