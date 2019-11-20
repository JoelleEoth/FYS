//Point multiplier

//Joelle Schmidt
class Booster {
  int xHB;
  int yHB;
  int sizeHB;
  int scoreBooster;
  int timeStarts;

  boolean Playerbooster={xHB+sizeHB<=xPlayer&&yHB+sizeHB<=yPlayer};

  void setup() {


    rectMode(CENTER);

    xHB = xShell;
    yHB = yShell;
    sizeHB = sizeShell + 10;
    timeStarts = millis();


   
  }

  void ScoreBooster() {
    if (Playerbooster == true) {
      scoreBooster = 2;
    } else 
    {
      scoreBooster = 1;
    }

    if (Playerbooster == true && timeStarts + 5000 > millis()) {
      Playerbooster = false;
    }
  }
}
