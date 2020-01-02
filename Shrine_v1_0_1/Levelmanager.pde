String levelParts;

void updateLevel() {

  checkGameState();
  checkLevelParts();
  spawnGeyser = spawnConditionArray[0];
  spawnWhirlpool = spawnConditionArray[1];
  spawnSquids = spawnConditionArray[2];
  spawnSharks = spawnConditionArray[3];
  spawnFishhook = spawnConditionArray[4];
  platformDecline = spawnConditionArray[5];
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
    levelParts = "101000";
  } else if (gameStartTime + millis() < timeLevel3) {
    levelParts = "110100";
  } else if (gameStartTime + millis() < timeLevel4) {
    levelParts = "001110";
  } else if (gameStartTime + millis() < timeLevel5) {
    levelParts = "111110";
  } else {
    levelParts = "111111";
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
