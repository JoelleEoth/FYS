/*
Shrine of the Sea
 Versie: 1.0.3
 
 Dorus van Weelden   -   500815398
 Vivienne Majarocon  -   500825852
 Jennifer Voogt      -   500823819
 Mitchell de Bruyn   -   500816391
 
 */


import processing.sound.*;
import de.bezier.data.sql.*;

//StatScreen stat;

int stage = 0;
int playerId;
String[] achievementName;
String[] achievementDescription;
int[] achievementId = { 1, 2, 3, 4, 5, 6, 7 };
String unlockedOn;
boolean[] achievementGet;
int gameStartTime;
int score;
float lives;

int shellCount;
int shellTotal;
int bananaCount;
int bananaTotal;
int sharkCount;
int sharkTotal;
int squidCount;
int squidTotal;
boolean shrineTouch;
boolean sharkTouch;

final int OFFSCREEN = -1000;


void setup() {
  fullScreen();
  frameRate(120);
  rectMode(CENTER);
  imageMode(CENTER);
  smooth(0);
  //LoadingScreen();
  loadAssets();
  //createDatabaseConnection();
  variableInitialisation();
  createClasses();
}

void variableInitialisation() {
  lives = 3;
  //default player position
  playerPositionX = width/4;
  playerPositionY = height - 60;
  playerVelocityY = 0;
  //reset score
  score = 0;
  bananaCount = 0;
  shellCount = 0;
  sharkCount = 0;
  squidCount = 0;
  stage = 2;
  scoreMultiplier = 1;
  sharkTouch = false;
  shrineTouch = false;
}


void createClasses() {

  hearts = new Hearts();
  //loginMenu = new LoginMenu();
  mainMenu = new MainMenu();
  //stat = new StatScreen();
  //achievementName = new String[MAX_ACHIEVEMENTS];
  //achievementDescription = new String[MAX_ACHIEVEMENTS];
  //achievementGet = new boolean[MAX_ACHIEVEMENTS];
  platformArrayListMain = new ArrayList<Platform>();
  //starting platform, format width, height, x, y, and speed.
  platformArrayListMain.add(new Platform(2000, 2, 1000, height, 5));
  //offscreen spawn so it exists but doesn't interfere, format width, height, x, y, and speed.
  shrinePlatform = new Platform(400, 2, OFFSCREEN, OFFSCREEN, 0);
  //queries = new mySQLQueries();
  geyserArrayList = new ArrayList<Geyser>();
  whirlpoolArrayList = new ArrayList<Whirlpool>();
  //format x, y, speed
  bananaArrayListMain = new ArrayList<Banana>();
  //offscreen spawn so it exists but doesn't interfere, format x, y, speed
  shell = new Shell(OFFSCREEN, OFFSCREEN, 0);
  squidArrayList = new ArrayList<Squid>(MAX_AMOUNT_SQUIDS);
  //offscreen spawn so it exists but doesn't interfere, format x, y, width, height
  shark = new Shark (OFFSCREEN, OFFSCREEN, 0);
  deathScreen = new DeathScreen();
  //statScreen = new StatScreen();
  ////statScreen2 = new StatScreen2();
  //newUser = new NewUser();
  //newUser.setupNewUser();
  //statScreen2.setUpAchievements();
  //stat.setUpAchievements();
  loadParticles();
}


// Keyboard handling

// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
boolean[] keysPressedPrevious = new boolean[KEY_LIMIT];

boolean keyChanged(int aKey) {
  if (keysPressed[aKey] == true && keysPressedPrevious[aKey] == false) {
    return true;
  }
  return false;
}

void updatePreviousKey() {
  for (int iKey = 0; iKey < KEY_LIMIT; iKey++) {
    keysPressedPrevious[iKey] = keysPressed[iKey];
  }
}

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
  if (bgMusic.isPlaying() == false) {
    bgMusic.play();
  }
  updateLevel();
  updateParticles();
  movement();
  updateGeyser();
  updateWhirlpool();
  updatePlatform();
  updateBanana();
  updateShell();
  updateTheShrine();
  updateShark();
  updateSquids();
}


//Everything that draws things goes here
void drawGame() {
  if (frameCount % 2 == 0) {
    loopBackground();
    drawPlayer();
    drawParticles();
    hud();
    hearts.update();
    drawGeyser();
    drawWhirlpool();
    drawPlatform();
    drawBanana();
    drawShark();
    drawSquids();
    drawShell();
    drawShrine();
    if (spawnSquids)
    text(1, 400, 400);
  }
}


void draw() {

  switch(stage) {
  case 0:
    loginMenu.drawMenu();
    loginMenu.updateMenu();
    break;

  case 1:
    newUser.drawNewUser();
    newUser.updateNewUser();
    //queries.userQueries();
    //if (userLoggedIn && inserted) {
    //  queries.getStats();
    //  queries.setUpAchievements();
    //}
    break;

  case 2:
    mainMenu.drawMenu();
    mainMenu.updateMenu();
    break;

  case 3:
    drawGame();
    updateGame();
    break;

  case 4:
    deathScreen.drawDeathScreen();
    deathScreen.updateDeathSceen();
    //queries.sessionQueries();
    //queries.highscoreQueries();
    //queries.achievementQueries();
    break;
  case 5: 
    //statScreen.drawScreen();
    //statScreen.updateScreen();
    //queries.highscoreQueries();
    //queries.getAchievements();
    break;
    
    case 6:
    //statScreen2.updateScreen();
    //statScreen2.drawScreen();
  }
  updatePreviousKey();
}
