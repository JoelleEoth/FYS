//Joelle Schmidt

void bananaValues() {
  bananas = new ArrayList<Banana>();
}
void updateBanana() {
  spawnBanana();
  for ( Banana banana : bananas ) {
    banana.updateBanana();
  }

  for ( int i = 0; i < bananas.size(); i++) {
    Banana aBanana = bananas.get(i);
    if (rectRectCollision(aBanana.xBan, aBanana.yBan, bananaSize, bananaSize, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {
      bananas.remove(i);
      score += scoreUp; 
      bananaSound.play();
    }
    if ( aBanana.xBan + (bananaSize/2) < 0 ) {
      bananas.remove(i);
    }
  }
}


void drawBanana() {
  for ( Banana banana : bananas ) {
    banana.drawBanana();
  }
}

void spawnBanana() {
  Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformW = tempPlatform.platformWidth;
  float platformS = tempPlatform.platformSpeed;
  //dit spawn de banaan, de if frameCount in de if statement bepaald hoeveel bananen spawn in het spel
  switch(spawnBanana) {
  case 1:
    if ( bananas.size() < 1) {
      bananas.add( new Banana(random(platformX-(platformW/2), platformX+(platform/2)), platformY-(bananaSize/2), platformS));
    }
    break;
  case 2:
    if ( bananas.size() < 3) {
      for ( int i = 1; i < platformW*2; i ++) {
        bananas.add( new Banana((platformX*i)/3, platformY-(bananaSize/2), platformS));
      }
    } 
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

    if ( bananas.size() == 0 ) {
      spawnBanana = (int)random(2);
    }
  }
}
