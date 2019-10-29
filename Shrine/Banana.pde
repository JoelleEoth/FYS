//Joelle Schmidt



//void updateBanana(){
//  for (int i = 0; i < theBananas.size(); i++){
//    theBananas.get(i).updateBanana();
//  }
//}

void newBanana() {
  theBanana = new Banana(width, (int)random(0,height - 20), 20, 2);
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

      score += 1;
      newBanana();
    }
    //banaan verdwijnen edge screen
     if (xBan<=0) {
      newBanana();
    }
  }
}
