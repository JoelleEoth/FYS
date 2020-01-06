//Vivienne Majarocon

//sinus

ArrayList<Banana> bananaArrayListMain;
float bananaSize = 50;
int spawnBanana = 2;

void spawnBanana1() {
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  if (frameCount%120 == 0) {
    bananaArrayListMain.add( new Banana(random(platformX-(platformW/2), platformX+(platform/2)), platformY-(bananaSize/2), platformS));
  }
}

void spawnBanana2() {
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  if (frameCount%120 == 0) {
    for ( int i = 1; i <= 3; i ++) {
      if ( i <= bananaArrayListMain.size()) {
        bananaArrayListMain.add( new Banana((platformX*i/3), platformY-(bananaSize/2), platformS));
      }
    }
  }
}

void updateBanana() {
  bananaManager();
  for ( Banana banana : bananaArrayListMain ) {
    banana.updateBanana();
  }

  for ( int i = 0; i < bananaArrayListMain.size(); i++) {
    Banana aBanana = bananaArrayListMain.get(i);
    if (rectRectCollision(aBanana.xBan, aBanana.yBan, bananaSize, bananaSize, playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT)) {
      bananaArrayListMain.remove(i);
      score += scoreMultiplier; 
      bananaSound.play();
      bananaCount++;
    }
    if ( aBanana.xBan + (bananaSize/2) < 0 ) {
      bananaArrayListMain.remove(i);
    }
  }

  if (bananaArrayListMain.size() <= 0) {
    spawnBanana = (int)random(4)/2;
  }
}


void drawBanana() {
  for ( Banana banana : bananaArrayListMain ) {
    banana.drawBanana();
  }
}

void bananaManager() {

  //dit spawn de banaan, de if frameCount in de if statement bepaald hoeveel bananen spawn in het spel
  switch(spawnBanana) {
  case 1:
    spawnBanana1();
    break;
  case 2:
    spawnBanana2();
    break;
  }
}



class Banana {
  float xBan; //x banaan
  float yBan; //y banaan 
  float speedBan; //speed banaan

  Banana(float x, float y, float speed) {
    xBan = x; 
    yBan = y; 
    speedBan = speed;
  }

  void drawBanana() {
    rectMode(CENTER); 
    //banaan
    noStroke(); 
    fill(255, 250, 88); //kleur banaan
    image(bananaImg, xBan, yBan, bananaSize, bananaSize); //banaan
  }
  //Collision met player&banana
  void updateBanana() {
    xBan -= speedBan;
  }
}
