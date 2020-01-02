//Jennifer


void enemiesValues() {
  squids = new ArrayList<Squid>(MAX_AMOUNT_SQUIDS);
  theShark = new Shark (-2000, 0, sharkWidth, sharkHeight);
}
void spawnShark() {
  //platform values 
  Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
  float platformX = tempPlatform.platformX;
  float platformY = tempPlatform.platformY;
  //Shark(xPosition, yPosition, size);
  theShark = new Shark (platformX, platformY-100, sharkWidth, sharkHeight);
}

//Method word aangeroepen in de mainscript in startingValues();
void spawnEnemies() {
  for (int i = 0; i < squids.size(); i++) {
    if (squids.get(i).x < 0) {
      squids.remove(i);
    }
  }

  if (spawnSquids && squids.size() < MAX_AMOUNT_SQUIDS) {
    spawnSquids();
  }
  if (spawnSharks && theShark.x + (theShark.w/2) < 0) {
    spawnShark();
  }
}

void spawnSquids() {
  //Squid(xPosition, yPosition, size);
  for (int i = 0; i < MAX_AMOUNT_SQUIDS; i++) {
    float randomSize = random(70,120);
    float randomX = width + random(width);
    float randomY = random(0+randomSize, height - randomSize);
    squids.add(new Squid(randomX, randomY /*-4*sin(frameCount / 30.0)*/, randomSize));
  }
}


void drawEnemies() {
  drawSquids();
  theShark.drawShark();
}

//Methods voor de squids draw.
void drawSquids() {
  //forloop for the squids
  for (int i =0; i < MAX_AMOUNT_SQUIDS; i++) {
    try {
      Squid theSquid = squids.get(i);
      theSquid.drawSquid();
    }
    catch(IndexOutOfBoundsException e) {
    }
  }
  theShark.drawShark();
}

class Shark {

  float x, y, w, h, speedX, speedY;
  float xStart;  
  float xDistanceFromStart = 100;
  //constructor
  Shark(float xPos, float yPos, float sharkWidth, float sharkHeight) {
    x = xPos;
    y = yPos;
    xStart = xPos;
    w = sharkWidth;
    h = sharkHeight;
    speedX = 4;
  }
  //shark position and movement (sinus in movement)
  void drawShark() {
    noStroke();
    fill (255, 0, 0);
    image(sharkImg, x, y, w, h);
    x -= thePlatforms.get(thePlatforms.size()-1).platformSpeed +  6*sin(frameCount / 30.0);
    //if (x+(w/2)< 0) {
    //  spawnShark();
    //}
    //player collision and health reduction
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, x, y, w, h))
    {
      damage(1);
	  if (biteSound.isPlaying() == false){
          biteSound.play();
      }
    }
  }
  //random voor x position
  float randomX = random(900, 1200);
  //random voor y position
  float randomY = random(600, 1000);
  //random voor size
  float randomSize = random(20, 60);
}
