void shellStartingValues() {
  //platform values 
Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
float platformX = tempPlatform.platformX;
float platformY = tempPlatform.platformY;
float platformS = tempPlatform.platformSpeed;
  theShell = new Shell(platformX+(random(-250,250)), platformY - (sizeShell/2)-5, 50, platformS);
}

void drawShell() {
  theShell.theWholeShell();
}

void updateShell() {
  theShell.mechanicsShell();
}

class Shell {
  float xShell;//x shell
  float yShell;//y shell
  int sizeShell;//size shell
  float speedShell;//speed shell

  Shell(float x, float y, int size, float speed) {
    xShell = x;
    yShell = y;
    sizeShell = size;
    speedShell = speed;
  }

  void theWholeShell() {
    image(shellImg, xShell, yShell, sizeShell, sizeShell);//shell
  }
  //Collision met player&Shell
  void mechanicsShell() {
    xShell -= speedShell;
    //Shell verdwijnen
    if (rectRectCollision(xShell, yShell, sizeShell, sizeShell, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {
      shellStartingValues();
      scoreUp++;
      shellCount++;
    }
    //Shell verdwijnen edge screen
    if (xShell+(sizeShell/2)<0 && frameCount % 1000 == 0) {
      shellStartingValues();
    }
  }
}
