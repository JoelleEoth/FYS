//Dorus

void updatePlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    //update each platform
    Platform platform = thePlatforms.get(i);
    platform.updatePlatform();

    //delete platforms out of the screen
    if (platform.platformX < -platform.platformWidth/2) {
      thePlatforms.remove(i);
    }
  }
  addPlatform(0, 2*height/3, height);
  addPlatform(50, height/3, 2*height/3);
}


void drawPlatform() {
  for (int i = 0; i < thePlatforms.size(); i++) {
    //draw each platform
    Platform platform = thePlatforms.get(i);
    image(platformImg, platform.platformX, platform.platformY, platform.platformWidth, platform.platformHeight);
  }
      image(platformImg, shrinePlatform.platformX, shrinePlatform.platformY, shrinePlatform.platformWidth, shrinePlatform.platformHeight);
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

    thePlatforms.add(new Platform(500, 10, width + 750, y, random(8, 10)));
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
    boolean collidesWithPlatform = rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, platformX, platformY, platformWidth, platformHeight);
    boolean movingDown = playerVelocityY <= 0;

    if (collidesWithPlatform && movingDown) {
      return true;
    } else {
      return false;
    }
  }
}

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
