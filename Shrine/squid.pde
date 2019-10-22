class Squid {

  float x, y, yStart, size, speedX, speedY;
  float yDistanceFromStart = 50;
  float rSpeed = 2;
  //constructor
  Squid(float xPos, float yPos, float squidSize) {
    x = xPos;
    y = yPos;
    yStart = yPos;
    size = squidSize;
    speedY = randomSpeed(rSpeed);
    x = width;
  }
  //squid position and movement
  void drawSquid() {
    noStroke();
    fill (0, 0, 255);
    rect (x, y, size, size);
    y += 4*sin(frameCount / 30.0) ;
    x -= 2;
    if (x < 0) {
      x = width;
      y = yStart;
    }

    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, x, y, size, size))
    {
      lives =-0.5; //wat gebeurt er als je squid raakt
    }
  }

  float randomSpeed(float speed) {
    float value = random(-speed, speed);
    /*if(value > 0) 
     value = speed;
     else if(value < 0)
     value = -speed;*/
    return value;
  }
  //mouseclick to take health
  void squidMousePressed() {

    if (mouseButton == LEFT) {
      if (dist(x, y, mouseX, mouseY)<= size/2) {
        lives --;
        println("squid click"+lives);
      }
    }
  }
}
