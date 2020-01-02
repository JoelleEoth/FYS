//Jennifer

class Squid {

  float x, y, yStart, size, speedX, speedY;
  float yDistanceFromStart = 50;
  float rSpeed = 2;
  float phase = random(0,TWO_PI);
  float frequency = random(20,50);
  //constructor
  Squid(float xPos, float yPos, float squidSize) {
    x = xPos;
    y = yPos;
    yStart = yPos;
    size = squidSize;
    speedY = randomSpeed(rSpeed);
  }
  //squid position and movement (moving in sinus)
  void drawSquid() {
    Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
    float platformS = tempPlatform.platformSpeed;
    image (squidImg, x, y, size, size);
    

    //amplitude * sin(4 * PHI + phase);
    
    y += 4*sin(frameCount / frequency+phase);
    x -= platformS;
    
    //Als de squid links buiten het scherm gaat, zet het dan terug naar rechts van het scherm.

    //player collision and health reduction
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, x, y, size, size))
    {
      damage(1);
if (splatSound.isPlaying() == false){
      splatSound.play();
      }
    }
  }
  //random speed of squids
  float randomSpeed(float speed) {
    float value = random(-speed, speed);
    return value;
  }
}
