//Writen by: Mitch
class Menu {
  int startTime;

  void drawMenu() {

    if (gameStart == false) { 
      startTime = millis();
      PFont font;
      font = createFont ("Arial", 48, false);   
      fill(0);
      textFont(font, textSizeStart);
      text("Start Game", startButtonX, startButtonY);
      textFont(font, textSizeDifficulty);
      //text("Difficulty", difficultyButtonX, difficultyButtonY);
    }
  }

  void mouseDetection() {
    boolean startButtonPress = keysPressed[UP] == true;
    boolean difficultyButtonPress = keysPressed[DOWN] == true;
    boolean startGame = keysPressed[ENTER] == true;


    if  (startButtonPress) {
      textSizeStart = 56;
      startButtonX = 830;
      textSizeDifficulty = 48;
      difficultyButtonX = 880;
      difficultyButtonY = 480;
      gameReady = true;
    }

//    if (difficultyButtonPress) {
//      textSizeDifficulty = 56;
//      difficultyButtonX = 870;
//      textSizeStart = 48;
//      startButtonX = 850;
//      startButtonY = 400;
//      gameReady = false;
//    } 

    if (startGame && gameReady) {
      gameStart = true;
      gameStartTime = millis();
    }
  }
}
