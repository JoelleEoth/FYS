//Joelle Schmidt

//IMPORTANT NOTE:Ik heb de float voor score niet dus die moet nog ingezet worden!!

//void updateBanana(){
//  for (int i = 0; i < theBananas.size(); i++){
//    theBananas.get(i).updateBanana();
//  }
//}

void newBanana() {
  theBanana = new Banana(width, height - 20, 20, 2);
}

class Banana {
  int xBan;//x banaan
  int yBan;//y banaan 
  int sizeBan;//size banaan
  float speedBan;//speed banaan

  Banana(int x, int y, int size, float speed) {
    xBan = x;
    yBan = y;
    sizeBan = size;
    speedBan = speed;
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
    xBan -= speedBan;
    //score 1 omhoog
    if (rectRectCollision(xBan, yBan, sizeBan, sizeBan, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      score += 1;//score int moet nog toegevoegd worden(zie note)
      newBanana();
    }
    //banaan verwijnen
  }
}
