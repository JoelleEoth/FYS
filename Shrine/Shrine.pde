/*
Shrine of the Sea
Versie: 0.06

Dorus van Weelden   -   500815398
Vivienne Majarocon  -   500825852
[namen en studnummers]
*/


void setup() {
  fullScreen();
  frameRate(120);
  rectMode(CENTER);
  background(0);
  startingValues();
}

void startingValues() {
  playerPositionX = width/4;
  playerPositionY = height - 60;
  Hearts = new Hearts();
  geyserWhirlpoolValues();
  thePlatforms = new ArrayList<Platform>();
  thePlatforms.add(new Platform(2000, 2, 1000, height, 1));
}



// Keyboard handling
void keyPressed() {
  if (keyCode >= KEY_LIMIT) return; //safety: if keycode exceeds limit, exit methhod ('return').
  keysPressed[keyCode] = true; // set its boolean to true
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
}


//All the computations happen here
void updateGame() {
  movement();
  updateGeyserWhirlpool();
  updatePlatform();
  addPlatform(0, 2*height/3, height);
  addPlatform(50, height/3, 2*height/3);
}

//Everything that draws things goes here
void drawGame() {
  background(0);
  drawPlayer();
  hud();
  Hearts.update();
  drawGeyserWhirlpool();
  drawPlatform();
}



void draw() {
  updateGame();
  drawGame();
}
