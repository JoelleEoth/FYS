//Joelle Schmidt

//IMPORTANT NOTE:Ik heb de float voor score niet dus die moet nog ingezet worden!!

class Banana {
  int xBan;//x banaan
  int yBan;//y banaan 
  int sizeBan;//size banaan

  Banana(int x, int y, int size){
    xBan = x;
    yBan = y;
    sizeBan = size;
  }

  void drawBanana() {
    rectMode(CENTER);
    //banaan
    noStroke();
    fill(255, 250, 88);//kleur banaan
    rect(xBan, yBan, sizeBan, sizeBan);//banaan


  }
  //Collision met player&banana
  void updateBanana() {
        xBan -= 10;
    //score 1 omhoog
    if (rectRectCollision(xBan, yBan, sizeBan, sizeBan, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      score += 1;//score int moet nog toegevoegd worden(zie note)
      /*
      
      
      
      JANK
      
      
      
      
      */
      yBan -= height;
      
    }
    //banaan verwijnen
      

  }
}
