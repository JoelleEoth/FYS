//total amount of squidArrayList
final int MAX_AMOUNT_SQUIDS = 3; 
ArrayList<Squid> squidArrayList;

//Method word aangeroepen in de mainscript in startingValues();
void spawnSquid() {
  float randomSize = random(50, 100);
  float randomX = width + random(width);
  float randomY = random(0+randomSize, height - randomSize);
  squidArrayList.add(new Squid(randomX, randomY, randomSize, randomSize * 2.74));
}

void updateSquids() {
  text(squidArrayList.size(), 400, 400);

  for (int i = 0; i < squidArrayList.size(); i++) {
    squidArrayList.get(i).updateSquid();
  }
  if (spawnSquids && squidArrayList.size() < MAX_AMOUNT_SQUIDS && random(1) < 0.01) {
    spawnSquid();
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

  float x, y, yStart, squidWidth, squidHeight, speedX = random(2, 3);
  float phase = random(0, TWO_PI);
  float frequency = random(20, 50);
  float amplitude = random(50, 200);
  //constructor
  Squid(float tempX, float tempY, float tempWidth, float tempHeight) {
    x = tempX;
    y = tempY;
    yStart = tempY;
    squidWidth = tempWidth;
    squidHeight = tempHeight;
  }

  void updateSquid() {    
    //Als de squid links buiten het scherm gaat, zet het dan terug naar rechts van het scherm.   
    for (int i = 0; i < squidArrayList.size(); i++) {
      Squid tempSquid = squidArrayList.get(i);
      if (tempSquid.x + tempSquid.squidWidth/2 < 0) {
        squidArrayList.remove(tempSquid);
      }
    }


    //amplitude * sin(4 * PHI + phase);

    y = yStart + amplitude * sin(frameCount / frequency + phase);
    x -= speedX;

    //player collision and health reduction
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_WIDTH, PLAYER_HEIGHT, x, y, squidWidth, squidHeight))
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
    image (squidImg, x, y, squidWidth, squidHeight);
  }
}
