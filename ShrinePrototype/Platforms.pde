void updatePlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    Platform platform = thePlatforms.get(i);
    platform.updatePlatform();
  }
}


void drawPlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    Platform platform = thePlatforms.get(i);
    rect(platform.platformX, platform.platformY, platform.platformWidth, platform.platformHeight);
  }
}

void addPlatform(int SpawnFrame, int spawnYMin, int spawnYMax) {
  if (frameCount%platformFrequency == SpawnFrame) {
    float y = random(spawnYMin, spawnYMax);
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
