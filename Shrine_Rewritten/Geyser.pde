ArrayList<Geyser> geyserArrayList;

int geyserWidth = 150, 
  geyserHeight = 250; 

void spawnGeyser() {
  //platform values 
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  //hier spawnt de geysers en whirlpools op de platforms zelf, pas als de platforms in het scherm zijn
  if (geyserArrayList.size() < 2 &&  isObjectOnScreen(platformX, platformW ) == false) {
    geyserArrayList.add(new Geyser(platformX+(random(-250, 250)), platformY-125, geyserWidth, geyserHeight, 255, 40, platformS, 0.3));
    /*if a geyserx > platform.x-geyser1.x && < platform.w
     remove that geyser pls
     */
    //for (int i = 0; i< 2; i++) {
    //  if (geyserArrayList.get(i+1).x - geyserArrayList.get(i).x <= OBJECT_DIFFERENCE) {
    //    geyserArrayList.remove(i+1);
    //  }
    //  if (i >=2) {
    //    i = 0;
    //  }
  }
}

void updateGeyser() {
  if (spawnGeyser) {
    spawnGeyser();
  }
  //dit verwijdert een geiser uit de arraylist wanneer het uit het scherm is
  for (int i =0; i<geyserArrayList.size(); i++) {
    Geyser aGeyser = geyserArrayList.get(i);
    aGeyser.updateGeyser();
    aGeyser.effectPlayer();

    if (aGeyser.x+(aGeyser.w/2) < 0 || geyserArrayList.get(i).m == 0) {
      geyserArrayList.remove(i);
    }
  }
}

void drawGeyser() {
  for (int i = 0; i<geyserArrayList.size(); i++) {
    Geyser aGeyser = geyserArrayList.get(i);
    aGeyser.drawGeyser();
  }
}

//de class geyser
class Geyser { 
  float x, y, w, h;
  float clr, opact;
  float m;
  float e;
  boolean collisionGeyser = false;
  int drawFrame;

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
      drawFrame++;
      if (drawFrame >2) {
        drawFrame = 0;
      }
    }
    image(geyserImg[drawFrame], x, y, w, h);
  }
  //geiser beweging
  void updateGeyser() {
    x-=m;
  }

  //de effects van de geiser op de speler wanneer er een rectrect collision plaatsvindt
  void effectPlayer() {
    for (int i = 0; i<geyserArrayList.size(); i++) {
      if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, geyserArrayList.get(i).x, geyserArrayList.get(i).y, geyserArrayList.get(i).w, geyserArrayList.get(i).h)) {
        collisionGeyser = true;
        playerVelocityY+=geyserArrayList.get(i).e;
      } else {
        collisionGeyser = false;
      }
    }
  }
}
