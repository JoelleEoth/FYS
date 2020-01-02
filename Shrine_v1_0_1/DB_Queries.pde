void queryShell() {
    if (lives == 0) {
      if(mysql.connect()){
      mysql.query("INSERT INTO Player(username, password) VALUES('AAA', 'AAA');");
      mysql.query("INSERT INTO Session(dayPlayed, playTime, score, startTime) VALUES('2020-12-11', 12.3, " + score + ", 1230, 1 );");
      mysql.query("INSERT INTO PowerUpData(idPowerUpData, powerUpName, timesPickedUp) VALUES(2, 'Shell', "+ shellCount + ", 1);" );
    }
  }
}

//maak misschien een lijst van alle spelers?
