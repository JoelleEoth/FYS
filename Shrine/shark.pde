//Jennifer

final int MAX_AMOUNT_SQUIDS = 3;
ArrayList<Squid> squids = new ArrayList<Squid>();

void enemiesValues() {
  //Squid(xPosition, yPosition, size);

  for (int i = 0; i < MAX_AMOUNT_SQUIDS; i++)
  {
    //random voor x position
    float randomX = random(700, 1200);
    //random voor y position
    float randomY = random(500, 700);
    //random voor size
    float randomSize = random(10, 50);

    squids.add(new Squid(randomX, randomY, randomSize));
  }

  //Shark(xPosition, yPosition, size);
  shark = new Shark (random(500, 800), random(600, 1000), random(50, 100) );
}

void drawEnemies() {

  for (int i =0; i < MAX_AMOUNT_SQUIDS; i++)
  {
    squids.get(i).drawSquid();
  }
  shark.drawShark();
}

class Shark {

  float x, y, size, speedX, speedY;
  float xStart;  
  float xDistanceFromStart = 100;
  //constructor
  Shark(float xPos, float yPos, float sharkSize) {
    x = xPos;
    y = yPos;
    xStart = xPos;
    size = sharkSize;
    speedX = 4;
  }
  //shark position and movement
  void drawShark() {
    noStroke();
    fill (255, 0, 0);
    rect (x, y, size, size);
    x += 4*sin(frameCount / 30.0) ;
    x -= 2;
    if (x < 0) {
      x = width;
    }

    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, x, y, size, size))
    {
      damage(1);
    }
  }
  //random voor x position
  float randomX = random(900, 1200);
  //random voor y position
  float randomY = random(600, 1000);
  //random voor size
  float randomSize = random(20, 60);

  //mouseclick to take health
  void sharkMousePressed() {
    if (mouseButton == LEFT) {
      if (dist(x, y, mouseX, mouseY)<= size/2) {
        lives --;
      }
    }
  }
}
