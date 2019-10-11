// Door Vivienne

void geyserWhirlpoolValues() { //alle geyser values\
  //geyser(x, y, width, height, color, opacity, its movement speed)
  theGeyser = new Geyser(width-40, playerPositionY, geyserWidth, geyserHeight, 255, 40, geyserMovementSpeed);
  theWhirlpool = new Whirlpool(width-40, playerPositionY-300, whirlpoolWidth, whirlpoolHeight, 255, 40, whirlpoolMovementSpeed);
  effectSpeed = 0.5; //the speed that affects the player
}


void updateGeyserWhirlpool() {
  theGeyser.updateGeyser();
  theGeyser.effectPlayer();
  if (theGeyser.spawnWhirlpool) {
    theWhirlpool.updateWhirlpool();
    theWhirlpool.effectPlayer();
  }
}

void drawGeyserWhirlpool() {
  theGeyser.drawGeyser();
  if (theGeyser.spawnWhirlpool) {
    theWhirlpool.drawWhirlpool();
  }
}

class Geyser { // een class geyser
  float x, y, w, h;
  float clr, opact;
  float m;
  boolean spawnWhirlpool;



  Geyser(float tx, float ty, float tw, float th, float tclr, float topact, float tm) {
    x = tx;
    y = ty; 
    w = tw; 
    h = th;
    clr = tclr;
    opact=topact;
    m = tm;
  }
  void drawGeyser() { // tekent dit domme ding
    fill(0, 0, clr, opact);
    rect(x, y, w, h);
  }
  void updateGeyser() {
    x-=m;
    if (x < 0) { //spawns a new one when it goes off screen
      spawnWhirlpool = true;
    }
  }
  // thanks dorus
  void effectPlayer() { // de effects als de speler de geiser aanraakt
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, theGeyser.x, theGeyser.y, theGeyser.w, theGeyser.h)) {
      playerVelocityY-=effectSpeed;
    }
  }
}


class Whirlpool { // de whirlpool class
  float x, y, w, h;
  float clr, opact;
  float m;



  Whirlpool(float tx, float ty, float tw, float th, float tclr, float topact, float tm) {
    x = tx;
    y = ty; 
    w = tw; 
    h = th;
    clr = tclr;
    opact=topact;
    m=tm;
  }
  void drawWhirlpool() { // tekent dit domme ding
    fill(clr, 0, 0, opact);
    rect(x, y, w, h);
  }
  void updateWhirlpool() {
    theWhirlpool.x-=m;

    if (theWhirlpool.x<0) { //spawnt een nieuwe // toch spawnt het niet meer na het eerste keer
      theGeyser.x = width-40;
      theGeyser.spawnWhirlpool = false;
    }
  }
  void effectPlayer() { // de effects als de speler de whirlpool aanraakt 
    // de whirlpool effect is een beetje janky en ughh
    //ik merk nu waarom het zo janky is. wanneer de player uit de hitbox is dan gaat ie "normaal" naar beneden.
    //het ziet er wel raar uit lmao
    if (rectRectCollision(playerPositionX, playerPositionY, PLAYER_SIZE, PLAYER_SIZE, theWhirlpool.x, theWhirlpool.y, theWhirlpool.w, theWhirlpool.h)) {
      playerVelocityY+=effectSpeed;
    }
  }
}
