//Dorus

ArrayList<Platform> platformArrayListMain;

//a boolean if the player is on a platform. Used for platform detection.
boolean onPlatform;
//the minimum height difference from a platform to the next platform
final int PLATFORM_DIFFERENCE = 100;
int platformFrequency = 100; 


void addPlatform(int spawnFrame, int spawnYMin, int spawnYMax) {
  //spawn a platform every n-th frame, where n equals SpawnFrame
  if (frameCount%platformFrequency == spawnFrame) {
    //random y in a boundary of spawnYMin and spawnYMax
    float y = random(spawnYMin, spawnYMax);
    //keeps retrying to spawn a platform until the new platform has a difference bigger then PLATFORM_DIFFERENCE with the last platform. This is to ensure a difference in platform heights.
    while (y > platformArrayListMain.get(platformArrayListMain.size() - 1).platformY - PLATFORM_DIFFERENCE && y < platformArrayListMain.get(platformArrayListMain.size() - 1).platformY + PLATFORM_DIFFERENCE) {
      y = random(spawnYMin, spawnYMax);
    }

    platformArrayListMain.add(new Platform(500, 10, width + 750, y, random(8, 10)));
  }
}

void updatePlatform() {
  for (int i = 0; i < platformArrayListMain.size(); i++) {    
    Platform platform = platformArrayListMain.get(i);
    platform.updatePlatform();

    //delete platforms out of the screen
    if (platform.platformX < -platform.platformWidth/2) {
      platformArrayListMain.remove(platform);
    }
  }
  addPlatform(0, 2*height/3, height);
  addPlatform(50, height/3, 2*height/3);
}


void drawPlatform() {
  for (int i = 0; i < platformArrayListMain.size(); i++) {
    //draw each platform
    Platform platform = platformArrayListMain.get(i);
    image(platformImg, platform.platformX, platform.platformY, platform.platformWidth, platform.platformHeight);
  }
  image(platformImg, shrinePlatform.platformX, shrinePlatform.platformY, shrinePlatform.platformWidth, shrinePlatform.platformHeight);
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



  //checkt collision
  boolean onPlatform() {
    boolean collidesWithPlatform = rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, platformX, platformY, platformWidth, platformHeight);
    boolean movingDown = playerVelocityY <= 0;

    if (collidesWithPlatform && movingDown) {
      return true;
    } else {
      return false;
    }
  }
}
