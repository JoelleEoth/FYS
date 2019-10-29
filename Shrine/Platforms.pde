//Dorus

void updatePlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    //update each platform
    Platform platform = thePlatforms.get(i);
    platform.updatePlatform();
  }
  addPlatform(0, 2*height/3, height);
  addPlatform(50, height/3, 2*height/3);
}


void drawPlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    //draw each platform
    Platform platform = thePlatforms.get(i);
    rect(platform.platformX, platform.platformY, platform.platformWidth, platform.platformHeight);
  }
}

void addPlatform(int spawnFrame, int spawnYMin, int spawnYMax) {
  //spawn a platform every n-th frame, where n equals SpawnFrame
  if (frameCount%platformFrequency == spawnFrame) {
    //random y in a boundary of spawnYMin and spawnYMax
    float y = random(spawnYMin, spawnYMax);
    //keeps retrying to spawn a platform until the new platform has a difference bigger then PLATFORM_DIFFERENCE with the last platform. This is to ensure a difference in platform heights.
    while (y > thePlatforms.get(thePlatforms.size() - 1).platformY - PLATFORM_DIFFERENCE && y < thePlatforms.get(thePlatforms.size() - 1).platformY + PLATFORM_DIFFERENCE) {
      y = random(spawnYMin, spawnYMax);
    }

    thePlatforms.add(new Platform(500, 2, width + 250, y, random(8, 10)));
  }
}

class Platform {

  int platformWidth, 
    platformHeight; 
  float platformX, 
    platformY, 
    platformSpeed;


  Platform(int pWidth, int pHeight, float pX, float pY, float pSpeed) {
    platformWidth = pWidth;
    platformHeight = pHeight;
    platformX = pX;
    platformY = pY;
    platformSpeed = pSpeed;
  }

  void updatePlatform() {
    platformX -= platformSpeed;
  }



  //checkt collision - moet nog geedit worden
  boolean onPlatform() {
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, platformX, platformY, platformWidth, platformHeight)) {
      return true;
    } else {
      return false;
    }
  }
}

//viv
// dit telt hoeveel platforms op het scherm zijn
boolean isPlatformOnScreen(float x, float w) {
  if (x-(w/2)<width) {
    return true;
  }
  if (x+(w/2)<0) {
    return true;
  } else {
    return false;
  }
}
