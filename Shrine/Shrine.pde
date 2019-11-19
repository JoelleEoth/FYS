/*
Shrine of the Sea
 Versie: 0.07
 
 Dorus van Weelden   -   500815398
 Vivienne Majarocon  -   500825852
 Jennifer Voogt      -   500823819
 Mina Nakamura       -   500824922
 Joelle Schmidt      -   500825264
 Mitchell de Bruyn   -   500816391
 
 [namen en studnummers]
 */
importprocessing.sound.*;
SoundFile backgroundMusic;


void setup() {
  fullScreen();
  frameRate(120);
  rectMode(CENTER);
  background(0);
  startingValues();
  backgroundMusic = new SoundFile(this, "FYS_music.wav"); //zet naam musicfile hierin
  backgroundMusic.loop();
}

void startingValues() {
  playerPositionX = width/4;
  playerPositionY = height - 60;
  Hearts = new Hearts();
  geyserWhirlpoolValues();
  thePlatforms = new ArrayList<Platform>();
  thePlatforms.add(new Platform(2000, 2, 1000, height, 1));
  theBanana = new Banana(width, height - 20, 20, 10);
  fishhookStartingValues();
  enemiesValues();
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
  theBanana.updateBanana();
  updateTheFishhook();
}

//Everything that draws things goes here
void drawGame() {
  background(0);
  drawPlayer();
  hud();
  Hearts.update();
  drawGeyserWhirlpool();
  drawPlatform();
  theBanana.drawBanana();
  drawFishhook();
  drawEnemies();
}


void draw() {
  updateGame();
  drawGame();
      }
