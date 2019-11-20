void newShell() {
  theShell = new Shell(width, height - 20, 20, 2);
}
class Shell {
  int xShell;//x shell
  int yShell;//y shell
  int sizeShell;//size shell
  float speedShell;//speed shell

  Shell(int x, int y, int size, float speed) {
    xShell = x;
    yShell = y;
    sizeShell = size;
    speedShell = speed;
  }

  void drawShell() {
    rectMode(CENTER);
    //shell
    noStroke();
    fill(255, 0, 0);//kleur Shell
    rect(xShell, yShell, sizeShell, sizeShell);//shell
  }
  //Collision met player&Shell
  void updateShell() {
    xShell -= speedShell;
    //Shell verdwijnen
    if (rectRectCollision(xShell, yShell, sizeShell, sizeShell, playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE)) {

      
      newShell();
    }
    //Shell verdwijnen edge screen
    if (xShell <= 0) {
      newShell();
    }
  }
}
