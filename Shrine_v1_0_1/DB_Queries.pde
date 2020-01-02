boolean inserted = false;
void queryShell() {

  String playerUsername = "big";
  String playerPassword = "chungus";
  int playerId = 0;

  if (inserted == false) {
    if (mysql.connect()) {
      //query for a new profile
      mysql.query("INSERT INTO Player(username, password) VALUES('" + playerUsername + "', '" + playerPassword + "');");

      //check how many of the specific usernames exist in database 
      mysql.query("SELECT count(*) FROM Player WHERE username = '" + playerUsername + "';");
      mysql.next();
      int countUsername = mysql.getInt(1);

      //check the password for each entry of the username
      mysql.query("SELECT * FROM Player WHERE username = '" + playerUsername + "';");
      for (int i = 0; i < countUsername; i++) {
        mysql.next();
        if (mysql.getString("password") == playerPassword) {
          playerId = mysql.getInt("idPlayer");
          break;
        }
      }
      
      
      int timesHitEnemy1 = 2;
      //session saving
      mysql.query("INSERT INTO Session(dayPlayed, playTime, score, startTime, Player_idPlayer) VALUES('2020-01-02', '" + millis() + "','" + 200 + "','" + hour() + ":" + minute() + ":" + second() + "','" + playerId + "');");

      //get current sessionId
      mysql.query("SELECT max(idSession) FROM Session;");
      mysql.next();
      int currentSessionId = mysql.getInt(1);

      //insert the enemies hit data
      mysql.query("INSERT INTO EnemyData(enemyName, timesHit, Session_idSession) VALUES('enemy1', '" + timesHitEnemy1 + "','" + currentSessionId + "');");
      mysql.query("INSERT INTO EnemyData(enemyName, timesHit, Session_idSession) VALUES('enemy1', '" + timesHitEnemy1 + "','" + currentSessionId + "');");
      mysql.query("INSERT INTO EnemyData(enemyName, timesHit, Session_idSession) VALUES('enemy1', '" + timesHitEnemy1 + "','" + currentSessionId + "');");
      mysql.query("INSERT INTO EnemyData(enemyName, timesHit, Session_idSession) VALUES('enemy1', '" + timesHitEnemy1 + "','" + currentSessionId + "');");


      //insert the powerup hit data
      mysql.query("INSERT INTO PowerUpData(powerUpName, timesPickedUp, Session_idSession) VALUES('enemy1', '" + 12 + "','" + currentSessionId + "');");
      mysql.query("INSERT INTO PowerUpData(powerUpName, timesPickedUp, Session_idSession) VALUES('enemy1', '" + timesHitEnemy1 + "','" + currentSessionId + "');");
      mysql.query("INSERT INTO PowerUpData(powerUpName, timesPickedUp, Session_idSession) VALUES('enemy1', '" + timesHitEnemy1 + "','" + currentSessionId + "');");


      mysql.query("SELECT idSession FROM Session;");
      mysql.next();
      
      //if ()
      
      /*
      query that gets the amount of bananas picked up in all the previous runs
      SELECT SUM(timesPickedUp) FROM PowerUpData pd 
      INNER JOIN Session s on pd.Session_idSession = s.idSession
      WHERE s.Player_idPlayer = 5 AND powerUpName = 'banana'
      GROUP BY s.Player_idPlayer; 
      */
    }
    inserted = true;
  }
}





//maak misschien een lijst van alle spelers?
