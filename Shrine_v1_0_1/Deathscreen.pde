//is yet to be made
int personalHigh;
int globalHigh;

DeathScreen deathScreen;
class DeathScreen {

  float scoreTextX = width/2;
  float scoreY = height/1.5;
  float personalHighY = height/1.5+100;
  float globalHighY = height/1.5+200;
  final int OPACITY = 70;
  final int GRAY_SCALE = 0;

  void drawDeathScreen() {
    loopBackground();
    tint(GRAY_SCALE, OPACITY);
    fill(255);
    textSize(60);
    text( "You Died", width/2, height/2);

    text(score, scoreTextX, scoreY);
    text(personalHigh, scoreTextX, personalHighY);
    text(globalHigh, scoreTextX, globalHighY);

    textAlign(LEFT);
    text("score:", scoreTextX - 600, scoreY);
    text("personal Highscore:", scoreTextX - 600, personalHighY);
    text("global Highscore:", scoreTextX - 600, globalHighY);
  }
  void updateDeathSceen() {
    if (keysPressed[10]) {
      variableInitialisation();
      stage = 2;
    }
  }
}
