//Joelle Schmidt

//IMPORTANT NOTE:Ik heb de float voor score niet dus die moet nog ingezet worden!!




//banaan en player collision
boolean rectRectCollision(float x1, float y1, float width1, float height1, float x2, float y2, float width2, float height2) {
  //collision in the y direction
  boolean upDownCollision = y1-(height1/2) < y2+(height2/2) && y1+(height1/2) > y2-(height2/2);
  //collision in the x direction
  boolean leftRightCollision = x1+(width1/2) > x2-(width2/2) && x1-(width1/2) < x2+ (width2/2);
  //if both collision types happen:
  if (leftRightCollision && upDownCollision) { 
    return true;
  } else {
    return false;
  }
}

class Banana {
  int xban;//x banaan
  int yban;//y banaan 
  int sizeban;//size banaan



  void draw() {
    rectMode(CENTER);
    //banaan
    noStroke();
    fill(255, 250, 88);//kleur banaan
    rect(xban, yban, sizeban, sizeban);//banaan

    xban -= 1;
  }
  //Collision met player&banana
  void collisionBanana() {
    //score 1 omhoog
    if (rectRectCollision(xban, yban, sizeban, sizeban, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      score = +1;//score int moet nog toegevoegd worden(zie note)
    }
    //banaan verwijnen
    if (rectRectCollision(xban, yban, sizeban, sizeban, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      sizeban=0;
    }
  }
}
