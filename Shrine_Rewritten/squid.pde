//total amount of squidArrayList
final int MAX_AMOUNT_SQUIDS = 3; 
ArrayList<Squid> squidArrayList;

//Method word aangeroepen in de mainscript in startingValues();
void spawnSquid() {
  float randomSize = random(70, 120);
  float randomX = width + random(width);
  float randomY = random(0+randomSize, height - randomSize);
  squidArrayList.add(new Squid(randomX, randomY, randomSize));
}

void updateSquids() {
  for (Squid squid : squidArrayList) {
    squid.updateSquid();
  }
}

//Methods voor de squidArrayList draw.
void drawSquids() {
  //forloop for the squidArrayList
  for (Squid squid : squidArrayList) {
    squid.drawSquid();
  }
}



class Squid {

  float x, y, yStart, size, speedX = random(2, 3);
  float phase = random(0, TWO_PI);
  float frequency = random(20, 50);
  float amplitude = random(50, 200);
  //constructor
  Squid(float tempX, float tempY, float tempSize) {
    x = tempX;
    y = tempY;
    yStart = tempY;
    size = tempSize;
  }

  void updateSquid() {

    //Als de squid links buiten het scherm gaat, zet het dan terug naar rechts van het scherm.   
    for (Squid squid : squidArrayList) {
      if (squid.x + squid.size/2 < 0) {
        squidArrayList.remove(squid);
      }
    }

    if (spawnSquids && squidArrayList.size() < MAX_AMOUNT_SQUIDS && random(1) < 0.01) {
      spawnSquid();
    }


    //amplitude * sin(4 * PHI + phase);

    y = yStart + amplitude * sin(frameCount / frequency + phase);
    x -= speedX;

    //player collision and health reduction
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, x, y, size, size))
    {
      damage(1);
      squidCount++;
      if (splatSound.isPlaying() == false) {
        splatSound.play();
      }
    }
  }

  //squid position and movement (moving in sinus)
  void drawSquid() {
    image (squidImg, x, y, size, size);
  }
}
