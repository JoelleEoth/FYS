String levelParts;

boolean[] spawnConditionArray = new boolean[5];
boolean spawnGeyser, 
  spawnWhirlpool, 
  spawnSquids, 
  spawnSharks,  
  platformDecline;

int timeLevel2 = 10000, 
  timeLevel3 = 20000, 
  timeLevel4 = 30000, 
  timeLevel5 = 40000;

void updateLevel() {

  checkGameState();
  checkLevelParts();
  spawnGeyser = spawnConditionArray[0];
  spawnWhirlpool = spawnConditionArray[1];
  spawnSquids = spawnConditionArray[2];
  spawnSharks = spawnConditionArray[3];
  platformDecline = spawnConditionArray[4];
}

void checkGameState() {
    /*
  The string decides what objects spawn. They are, respectively:
   -Geyser
   -Whirlpool
   -Squids
   -Sharks
   -Fishhook
   -A decline in platforms
  */
  
  if (gameStartTime + millis() < timeLevel2) {
    levelParts = "10100";
  } else if (gameStartTime + millis() < timeLevel3) {
    levelParts = "11010";
  } else if (gameStartTime + millis() < timeLevel4) {
    levelParts = "00110";
  } else if (gameStartTime + millis() < timeLevel5) {
    levelParts = "11110";
  } else {
    levelParts = "11111";
  }
}

void checkLevelParts() {
  //set all the appropriate spawncondition booleans to their respective values
  for (int i = 0; i < levelParts.length(); i++) {
    if (levelParts.charAt(i) == '1') {
      spawnConditionArray[i] = true;
    } else {
      spawnConditionArray[i] = false;
    }
  }
}
