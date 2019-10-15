//Joelle Schmidt

//ERG ruwe schets van de bananen(punten)

float xban;//x banaan
float yban;//y banaan 
float sizeban;//size banaan

float grondLX;//linker x grond
float grondLY;//linker y grond
float grondRY;//rechter y grond
float grondRX;//rechter x grond

float xplayer;
float yplayer;
float sizeplayer;
float scoreint;

void setup() {
  size(1000, 800);
  //grond
  grondLX=0;
  grondLY=700;
  grondRY=700;
  grondRX=1000;

  //banaan
  sizeban=50;
  xban=700;
  yban=670;


  //player
  sizeplayer=50;
  xplayer=10;
  yplayer=670;
  

  //score
  scoreint=0;
}

void draw() {
  background(88, 284, 255);
  rectMode(CENTER);
  //banaan
  noStroke();
  fill(255, 250, 88);//kleur banaan
  square(xban, yban, sizeban);//banaan

  //player
  noStroke();
  fill(126, 75, 70);//kleur player
  square(xplayer, yplayer, sizeplayer);//player

  //grond
  stroke(0, 255, 141);//kleur Stroke grond
  strokeWeight(10);//dikte Stroke grond
  fill(0, 255, 141);//kleur grond
  line(grondLX, grondLY, grondRX, grondRY);//grond

  //score
  textSize(50);
  text("Score", 10, 30); //text score
  fill(0, 102, 153);
  text(scoreint, 10, 82); //display score

  //mechanics player
  xplayer=xplayer+5;

  //mechanics score
  if (xplayer>xban&&yplayer>=yban) {
    scoreint=+1;
  }

  //Banaan verdwijnen
  if (xplayer>xban&&yplayer>=yban) {
    sizeban=0;
  }
}
