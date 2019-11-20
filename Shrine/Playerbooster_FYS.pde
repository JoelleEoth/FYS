//Point multiplier

 void boosterStartingValues() {
  thebooster = new Booster(xHB,yHB,sizeHB,sizeHB);
}

void drawHitbox(){
theBooster.theHitbox();
}

void updateBooster(){
theBooster.mechanicsScoreBooster();
}


//Joelle Schmidt
class Booster {
  int xHB;
  int yHB;
  int sizeHB;
  int scoreBooster;
  int timeStarts;

  boolean Playerbooster={xHB+sizeHB<=xPlayer&&yHB+sizeHB<=yPlayer};

 void setupBooster() {


    rectMode(CENTER);

    xHB = xShell;
    yHB = yShell;
    sizeHB = sizeShell + 10;
    timeStarts = millis();


   
  }
  
  void theHitbox(){
  rect(xHB,yHB,sizeHB,sizeHB);
  
  }

  void mechanicsScoreBooster() {
  
  
  
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
