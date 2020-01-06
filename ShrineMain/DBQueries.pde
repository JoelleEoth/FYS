boolean checkedScores = false;
boolean checkedAchievements = false;
boolean insertedSession = false;
boolean insertedAchievements = false;
boolean inserted = false;

int unlockedAchievements;
int yetToUnlockAchievements;

final int MAX_ACHIEVEMENTS = 7;

String[] nameAchievement = new String[MAX_ACHIEVEMENTS];
String[] descriptionAchievement = new String[MAX_ACHIEVEMENTS];
String[] unlockedAchievement = new String[MAX_ACHIEVEMENTS];

String[] nameAchievementX = new String[MAX_ACHIEVEMENTS];
String[] descriptionAchievementX = new String[MAX_ACHIEVEMENTS];
String[] unlockedAchievementX = new String[MAX_ACHIEVEMENTS];

mySQLQueries queries;

class mySQLQueries {


  void getStats() {
    if (mysql.connect()) {
      mysql.query("SELECT SUM( timesPickedUp ) FROM PowerUpData pd INNER JOIN Session s on pd.Session_idSession = s.idSession WHERE s.Player_idPlayer = "+ playerId + " AND powerUpName = 'Banana' GROUP BY s.Player_idPlayer;");
      mysql.next();
      bananaTotal = mysql.getInt(1);

      mysql.query("SELECT SUM( timesPickedUp ) FROM PowerUpData pd INNER JOIN Session s on pd.Session_idSession = s.idSession WHERE s.Player_idPlayer = "+ playerId + " AND powerUpName = 'Shell' GROUP BY s.Player_idPlayer;");
      mysql.next();
      shellTotal = mysql.getInt(1);

      mysql.query("SELECT SUM( timesHit ) FROM EnemyData en INNER JOIN Session s on en.Session_idSession = s.idSession WHERE s.Player_idPlayer = "+ playerId + " AND EnemyName = 'Shark' GROUP BY s.Player_idPlayer;");
      mysql.next();
      sharkTotal = mysql.getInt(1);

      mysql.query("SELECT SUM( timesHit ) FROM EnemyData en INNER JOIN Session s on en.Session_idSession = s.idSession WHERE s.Player_idPlayer = "+ playerId + " AND EnemyName = 'Squid' GROUP BY s.Player_idPlayer;");
      mysql.next();
      squidTotal = mysql.getInt(1);
    }
    println(bananaTotal);
    println(sharkTotal);
    println(shellTotal);
    println(squidTotal);
  }
  void setUpAchievements() {
    if (mysql.connect()) {
      //for loop die vraagt naar de namen van de achievement
      mysql.query("Select achievementName from Achievement");
      for ( int i = 0; i < MAX_ACHIEVEMENTS; i++) {
        mysql.next();
        achievementName[i] = mysql.getString(1);
        //println(achievementName[i]);
      }
      //for loop die vraagt naar de descriptions
      mysql.query("Select description from Achievement");
      for ( int i = 0; i < MAX_ACHIEVEMENTS; i ++ ) {
        mysql.next();
        achievementDescription[i] = mysql.getString(1);
        //println(achievementDescription[i]);
      }
    }
  }

  void getAchievements() { 
    if (!checkedAchievements) {
      if (mysql.connect()) {

        mysql.query("SELECT count(idAchievements) FROM PlayerAchievement WHERE idPlayer = "+ playerId +  ";");
        mysql.next();
        unlockedAchievements  = mysql.getInt(1);



        mysql.query("SELECT achievementName, description, unlockedOn FROM Achievement a INNER JOIN PlayerAchievement pa ON a.idAchievements = pa.idAchievements WHERE pa.idPlayer = "+ playerId + " AND a.idAchievements IN (SELECT IdAchievements FROM PlayerAchievement);");
        mysql.next();


        for (int i = 0; i < unlockedAchievements; i++) {
          nameAchievement[i] = mysql.getString(1);
          descriptionAchievement[i] = mysql.getString(2);
          unlockedAchievement[i] = mysql.getString(3);          
          mysql.next();
        }

        mysql.query("SELECT count(idAchievements) FROM Achievement WHERE idAchievements NOT IN (SELECT idAchievements FROM PlayerAchievement WHERE idPlayer = "+ playerId +");");
        mysql.next();
        yetToUnlockAchievements = mysql.getInt(1);

        mysql.query("SELECT achievementName, description FROM Achievement WHERE idAchievements NOT IN (SELECT idAchievements FROM PlayerAchievement WHERE idPlayer = "+ playerId +");");
        mysql.next();

        for (int i = 0; i < yetToUnlockAchievements; i++) {
          nameAchievementX[i] = mysql.getString(1);
          descriptionAchievementX[i] = mysql.getString(2);
          print(nameAchievementX[i]);
          print(descriptionAchievementX[i]);

          mysql.next();
        }       
        checkedAchievements = true;
      }
    }
  }



  void userQueries() {          //Method for queries related to the "Players can login" functionality)

    if (userCreated == true && inserted == false) {

      if (mysql.connect()) {
        mysql.query("INSERT INTO Player(username, password) VALUES('" + userName + "', '" + userPassword + "');"); //Query will add new user to the database
        stage = 2; //Game will start with new user 
        inserted = true; //In order to prevent this query from running more than once, this boolean will be set to true

        mysql.query("SELECT MAX(idPlayer) from Player");
        mysql.next();
        playerId = mysql.getInt(1);
      }
    }
    if (userLoggedIn && !inserted) {
      if (mysql.connect()) {
        mysql.query("SELECT idPlayer FROM Player WHERE username = '" + userName + "' AND password = '" + userPassword + "';"); //Query will get ID of player with matching name and password 
        mysql.next(); 

        playerId = mysql.getInt(1); //The playerId in the game will be set to match the playerId found in the database

        if (playerId != 0) {              //If the playerId = 0, that means that no players with that name and password were found. Therefor the game will not start
          stage = 2; //If a match was found the game will start
        }
        println(playerId); 
        inserted = true; //Boolean will be set to true to prevent this query from repeating itself
      }
    }
  }
  void sessionQueries() {
    if (!insertedSession) {
      if (mysql.connect()) {
        mysql.query("INSERT INTO Session(dayPlayed, playTime, score, startTime, Player_idPlayer) VALUES('2020-01-02', '" + millis() + "'," + score + ",'" + hour() + ":" + minute() + ":" + second() + "','" + playerId + "');"); 

        //get current sessionId
        mysql.query("SELECT max(idSession) FROM Session;"); 
        mysql.next(); 
        int currentSessionId = mysql.getInt(1); 

        //insert the enemies hit data
        mysql.query("INSERT INTO EnemyData(enemyName, timesHit, Session_idSession) VALUES('Shark', '" + sharkCount + "','" + currentSessionId + "');"); 
        mysql.query("INSERT INTO EnemyData(enemyName, timesHit, Session_idSession) VALUES('Squid', '" + squidCount + "','" + currentSessionId + "');"); 

        //insert the powerup hit data
        mysql.query("INSERT INTO PowerUpData(powerUpName, timesPickedUp, Session_idSession) VALUES('Shell', '" + shellCount + "','" + currentSessionId + "');"); 
        mysql.query("INSERT INTO PowerUpData(powerUpName, timesPickedUp, Session_idSession) VALUES('Banana', '" + bananaCount + "','" + currentSessionId + "');"); 


        mysql.query("SELECT idSession FROM Session;"); 
        mysql.next(); 
        insertedSession = true;
      }
    }
  }
  void achievementQueries() {
    if (!insertedAchievements) {
      if (mysql.connect()) {
        if (bananaTotal >= 10) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement(idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ", 1 ,' " + year() + "-" + month() + "-" + day() + "');" );
        }
        if (bananaTotal >=20) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement( idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ",2 ,' " + year() + "-" + month() + "-" + day() + "');" );
        }
        if (bananaTotal >= 50) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement(idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ", 3 , ' " + year() + "-" + month() + "-" + day() + "');" );
        }
        if (bananaTotal >= 100) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement(idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ", 4 ,' " + year() + "-" + month() + "-" + day() + "');" );
        }
        if (shrineTouch) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement(idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ", 5,' " + year() + "-" + month() + "-" + day() + "');" );
        }
        if (sharkTouch) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement(idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ", 6 , ' " + year() + "-" + month() + "-" + day() + "');" );
        }
        if (scoreMultiplier >= 16) {
          mysql.query("INSERT IGNORE INTO PlayerAchievement(idPlayer, idAchievements, unlockedOn) VALUES( " + playerId + ", 7 ,' " + year() + "-" + month() + "-" + day() + "');");
        }
        insertedAchievements = true;
      }
    }
  }
  void highscoreQueries() {
    if (!checkedScores) {
      if (mysql.connect()) {
        mysql.query("SELECT MAX(score) FROM Session;"); 
        mysql.next(); 

        globalHigh = mysql.getInt(1); 
        print(globalHigh); 

        mysql.query("SELECT MAX(score) FROM Session WHERE Player_idPlayer = '" + playerId + "';"); 
        mysql.next(); 

        personalHigh = mysql.getInt(1); 
        print(personalHigh); 
        checkedScores = true;
      }
    }
  }
}
