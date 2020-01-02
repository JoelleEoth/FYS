

  void deathscreen() {

    if (playerPositionY>1070) {
      println("hpo");
    } else if (lives == 0) {
      println(shellCount);
      setup();
      if (keysPressed[RETURN]) {
        theMenu.drawMenu();
      }
    }
  }

int gameOverX = width/2;
int gameOverY = height/2;
void gameOver() {
  background(0);
  textAlign(CENTER);
  textSize(60);
  text("GAME OVER", gameOverX, gameOverY);
  textSize(40);
  text("PRESS A TO PLAY AGAIN", gameOverX, gameOverY+200);
  if (keysPressed[ENTER]) {
    gameStart = true;
  }
}
