//Shrine
//gemaakt door: Mitch

Platform shrinePlatform;

int shrineWidth = 375, shrineHeight = 150;
int shrinePlatformWidth = 400, shrinePlatformHeight = 10;
float platformSpeed =5;
float shrinePlatformX = -300;
float shrinePlatformY = 400;
boolean spawnShrine;
boolean insideShrine;

void updateTheShrine() {
  insideShrine = rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, shrinePlatform.platformX, shrinePlatformY, shrineWidth, shrineHeight);
  if (insideShrine) {
    lives=3;
    shrineTouch = true;
  }

  spawnShrine = shrinePlatform.platformX < 0 && frameCount %200==0;
  if (spawnShrine && lives <= 1) {
    shrinePlatformX = width + 300;  
    shrinePlatformY = random(200, 600);
    shrinePlatform = new Platform(shrinePlatformWidth, shrinePlatformHeight, shrinePlatformX, shrinePlatformY, platformSpeed);
  }
  shrinePlatform.updatePlatform();
}

void drawShrine() {
  image(shrineImg, shrinePlatform.platformX, shrinePlatformY-(shrineHeight/2), shrineWidth, shrineHeight);
}
