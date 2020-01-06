//Jennifer

Shark shark;


void spawnShark() {
  //platform values 
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  float platformS = tempPlatform.platformSpeed;
  //Shark(xPosition, yPosition, size);
  shark = new Shark (platformX, platformY-100, platformS);
}

void updateShark() {
  shark.updateShark();
}

void drawShark() {
  shark.drawShark();
}

class Shark {

int sharkWidth = 150, 
  sharkHeight = 60;

  float x, y, speed;
  float xStart;  

  //constructor
  Shark(float tempX, float tempY, float tempSpeed) {
    x = tempY;
    y = tempX;
    xStart = tempX;
    speed = tempSpeed;
  }

  //shark position and movement (sinus in movement)
  void updateShark() {
    x -= speed + 6 * sin(frameCount / 30.0);
    if (spawnSharks && shark.x + (shark.sharkWidth/2) < 0) {
      spawnShark();
    }
    //player collision and health reduction
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, x, y, sharkWidth, sharkHeight))
    {
      damage(1);
      sharkCount++;
      sharkTouch = true;
      if (biteSound.isPlaying() == false) {
        biteSound.play();
      }
    }
  }

  void drawShark() {
    noStroke();
    fill (255, 0, 0);
    image(sharkImg, x, y, sharkWidth, sharkHeight);
  }

}
