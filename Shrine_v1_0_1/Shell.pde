Shell shell;

float scoreMultiplier;
int shellSize = 50;//size shell
final float SCORE_MULTIPLIER_INCREASE = 1.3, 
  SHELL_FREQUENCY = 0.6; //value between 0 and 1 that defines how many shells you get. 0 is none, 1 is every 5 seconds.

void spawnShell() {
  //platform values 
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformS = tempPlatform.platformSpeed;
  shell.xShell = platformX+(random(-250, 250));
  shell.yShell = platformY - (shellSize/2)-5;
  shell.speedShell = platformS;
}

void updateShell() {
  shell.mechanicsShell();
}

void drawShell() {
  shell.drawShell();
}

class Shell {
  float xShell;//x shell
  float yShell;//y shell
  float speedShell;//speed shell

  Shell(float x, float y, float speed) {
    xShell = x;
    yShell = y;
    speedShell = speed;
  }

  void drawShell() {
    image(shellImg, xShell, yShell, shellSize, shellSize);
    text(scoreMultiplier, 200, 200);
  }
  //Collision met player&Shell
  void mechanicsShell() {
    xShell -= speedShell;
    //Shell verdwijnen
    if (rectRectCollision(xShell, yShell, shellSize, shellSize, playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT)) {
      xShell = OFFSCREEN;
      yShell = OFFSCREEN;
      scoreMultiplier*=SCORE_MULTIPLIER_INCREASE;
      shellCount++;
    }
    //Shell verdwijnen edge screen
    if (xShell+(shellSize/2)<0 && frameCount % 600 == 599 && random(1) > SHELL_FREQUENCY) {
      spawnShell();
    }
  }
}
