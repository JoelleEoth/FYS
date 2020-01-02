//dit zijn de variabelen voor de images
final int MONKEY_IMAGE_AMOUNT = 9;
final int WHIRLPOOL_IMAGE_AMOUNT = 3;
final int GEYSER_IMAGE_AMOUNT = 3;
//een array van images om een animatie te maken
PImage[] playerImg = new PImage[MONKEY_IMAGE_AMOUNT];
PImage shellImg;
PImage bananaImg;
PImage sharkImg;
PImage[] geyserImg = new PImage[GEYSER_IMAGE_AMOUNT];
PImage[] whirlpoolImg = new PImage[WHIRLPOOL_IMAGE_AMOUNT];
PImage bgImg;
PImage deathImg;
PImage shrineImg;
PImage fishhookImg;
PImage platformImg;
PImage startImg;
PImage squidImg;

PFont HUDfont;
PFont menuFont;
SoundFile bgMusic;
SoundFile bananaSound;
SoundFile biteSound;
SoundFile splatSound;


void loadAssets() {

  playerImg[0] = loadImage("./Sprites/Monkey/000.png");
  playerImg[1] = loadImage("./Sprites/Monkey/001.png");
  playerImg[2] = loadImage("./Sprites/Monkey/002.png");
  playerImg[3] = loadImage("./Sprites/Monkey/003.png");
  playerImg[4] = loadImage("./Sprites/Monkey/004.png");
  playerImg[5] = loadImage("./Sprites/Monkey/005.png");
  playerImg[6] = loadImage("./Sprites/Monkey/006.png");
  playerImg[7] = loadImage("./Sprites/Monkey/007.png");
  playerImg[8] = loadImage("./Sprites/Monkey/monkey jump.png");

  shellImg = loadImage("./Sprites/Objects/Shell sprite.png"); 
  bananaImg = loadImage("./Sprites/Objects/Banana sprite.png");
  sharkImg = loadImage("./Sprites/Enemies/Shark sprite.png");
  squidImg = loadImage("./Sprites/Enemies/Squid.png");
  geyserImg[0] = loadImage("./Sprites/Objects/Geyser Sprite.png");
  geyserImg[1] = loadImage("./Sprites/Objects/Geyser 2.png");
  geyserImg[2] = loadImage("./Sprites/Objects/Geyser 3.png");
  whirlpoolImg[0] = loadImage("./Sprites/Objects/Whirlpool sprite.png");
  whirlpoolImg[1] = loadImage("./Sprites/Objects/whirlpool 2.png");
  whirlpoolImg[2] = loadImage("./Sprites/Objects/whirlpool 3.png");


  bgImg = loadImage("./Background/Background.png");
  deathImg = loadImage ("./Background/deathscreen.png");
  shrineImg = loadImage ("./Shrine/shrines.png");
  fishhookImg = loadImage ("./Sprites/Objects/fishhook.png");
  platformImg = loadImage("./Shrine/Platform.png");

  shrineImg = loadImage("./Shrine/shrineSprite.png");

  startImg = loadImage("./Background/startscreen.png");

  HUDfont = createFont ("Arial", 32, false);
  menuFont = createFont ("Arial", 48, false);
  bgMusic = new SoundFile(this, "./Sounds/bgMusic.wav");
  bananaSound = new SoundFile(this, "./Sounds/bananaSound.wav");
  biteSound = new SoundFile(this, "./Sounds/biteSound.wav");
  splatSound = new SoundFile(this, "./Sounds/splatSound.wav");
}
