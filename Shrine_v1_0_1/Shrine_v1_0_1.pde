import processing.sound.*;

/*
Shrine of the Sea
 Versie: 0.9.9
 
 Dorus van Weelden   -   500815398
 Vivienne Majarocon  -   500825852
 Jennifer Voogt      -   500823819
 Mitchell de Bruyn   -   500816391
 
 */

void setup() {
  fullScreen();
  frameRate(120);
  rectMode(CENTER);
  imageMode(CENTER);
  startingValues();
  loadAssets();
  smooth(0);
  createDatabaseConnection();
}

void startingValues() {
  println(shellCount);
  lives = 3;
  playerPositionX = width/4;
  playerPositionY = height - 60;
  Hearts = new Hearts();
  theMenu = new Menu();
  geyserWhirlpoolValues();
  thePlatforms = new ArrayList<Platform>();
  thePlatforms.add(new Platform(2000, 2, 1000, height, 5));
  fishhookStartingValues();
  bananaValues();
  enemiesValues();
  shellStartingValues();
  playerVelocityY = 0;
  //theDeath = new Deathscreen();
  shrinePlatform = new Platform(400, 2, -300, 200, 0);
  score = 0;
  shellCount = 0;
  scoreUp = 1;
  loadParticles();
}
void loadParticles() {
  for ( int i = 0; i<MAX_PARTICLES; i++) {
    playerParticles[i] = new Particle(random(playerPositionX-(PLAYER_SIZE/2), playerPositionX+(PLAYER_SIZE/2)), random(playerPositionY-(PLAYER_SIZE/2), playerPositionY+(PLAYER_SIZE/2)), random(particleMinSize, particleMaxSize), color(#B7F8FF), 255);
    sharkParticles[i] = new Particle(random(theShark.x-(sharkWidth/2), theShark.x+(sharkWidth/2)), random(theShark.y-(sharkHeight/2), theShark.y+(sharkHeight/2)), random(particleMinSize, particleMaxSize), color(#B7F8FF), 255);
    //for (Squid squid : squids) {
    //  squidParticles[i] = new Particle(random(squid.x-(squid.size), squid.x+(squid.size)), random(squid.y-(squid.size), squid.y+(squid.size)), random(particleMinSize, particleMaxSize), color(#B7F8FF), 255);
    //}
    shrineParticles[i] = new Particle(random(shrinePlatform.platformX-(shrineWidth/2), shrinePlatform.platformX+(shrineWidth/2)), random(shrinePlatformY-(shrineHeight/2), shrinePlatformY+(shrineHeight/2)), random(particleMinSize*2, particleMaxSize*2), color(#F5E043), 255);
  }
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
  theMenu.mouseDetection();

  if (gameStart == true) {
    updateLevel();
    updateParticles();
    movement();
    updateGeyserWhirlpool();
    updatePlatform();
    updateBanana();
    updateTheFishhook();
    updateShell();
    updateTheShrine();
    spawnEnemies();
    if (lives == 0) {
      gameOver();
      gameStart = false;
    }
  }
}

//Everything that draws things goes here
void drawGame() {
  image(startImg, width/2, height/2);
  theMenu.drawMenu();
  if (gameStart == true) {
    if (bgMusic.isPlaying() == false) {
      bgMusic.play();
    }
    loopBackground();
    drawPlayer();
    drawParticles();
    hud();
    Hearts.update();
    drawGeyserWhirlpool();
    drawPlatform();
    drawBanana();
    drawFishhook();
    drawEnemies();
    drawShell();
    drawShrine();
    //queryShell();
  }
  deathscreen();
}


void draw() {
  //println(millis());
  updateGame();
  //print(millis());
  if (frameCount%2==0) {
    drawGame();
    //print(millis());
  }
}
