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
}

//Everything that draws things goes here
void drawGame() {
  background(0);
  drawPlayer();
  hud();
  Hearts.update();
  drawGeyserWhirlpool();
}



void draw() {
  updateGame();
  drawGame();
}
