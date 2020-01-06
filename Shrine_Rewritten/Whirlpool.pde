int   whirlpoolWidth = 150, 
  whirlpoolHeight = 250, 
  whirlpoolMovementSpeed = 12;

ArrayList<Whirlpool> whirlpoolArrayList;

void spawnWhirlpool() {
  //platform values 
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  //hier spawnt de whirlpool
  if (whirlpoolArrayList.size() < 2 && isObjectOnScreen(platformX, platformW) == false) {
    whirlpoolArrayList.add(new Whirlpool(platformX+(random(-250, 250)), platformY-125, whirlpoolWidth, whirlpoolHeight, 255, 40, platformS, 0.1));
  }
}

void updateWhirlpool() {
  if (spawnWhirlpool) {
    spawnWhirlpool();
  }

  //dit verwijdert een whirlpool uit de arraylist wanneer het uit het scherm is
  for (int i = 0; i<whirlpoolArrayList.size(); i++) {
    Whirlpool aWhirlpool = whirlpoolArrayList.get(i);
    aWhirlpool.updateWhirlpool();
    aWhirlpool.effectPlayer();
    if (aWhirlpool.x+(aWhirlpool.w/2) < 0|| whirlpoolArrayList.get(i).m == 0) {
      whirlpoolArrayList.remove(i);
    }
  }
}

void drawWhirlpool() {

  for ( int i = 0; i< whirlpoolArrayList.size(); i++) {
    Whirlpool aWhirlpool = whirlpoolArrayList.get(i);
    aWhirlpool.drawWhirlpool();
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
  
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  void effectPlayer() {
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, whirlpoolArrayList.get(0).x, whirlpoolArrayList.get(0).y, whirlpoolArrayList.get(0).w, whirlpoolArrayList.get(0).h)) {
      try {
        playerVelocityY-=whirlpoolArrayList.get(whirlpoolArrayList.size()-1).e;
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
