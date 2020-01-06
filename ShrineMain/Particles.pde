//Door Vivienne Majarocon 500825852
//Dit is het particle systeem voor alle particles in het spel. Het is universeel en wordt gebruikt door verschillende opbjecten.

//global variables voor de particles
final int MAX_PARTICLES = 30;
final float particleMoveUp = 1.3;
final int oDecrease = 15;
int particleMinSize = 5;
int particleMaxSize = 10;
Particle[] playerParticles = new Particle[MAX_PARTICLES];
Particle[] sharkParticles = new Particle[MAX_PARTICLES];
Particle[] squidParticles = new Particle[MAX_PARTICLES];
Particle[] shrineParticles = new Particle[MAX_PARTICLES];
Particle[] bananaParticles = new Particle[MAX_PARTICLES];
Particle[] shellParticles = new Particle[MAX_PARTICLES];


/*
viv comment dit
*/

void loadParticles() {
  for ( int i = 0; i<MAX_PARTICLES; i++) {
    playerParticles[i] = new Particle(random(playerPositionX-(PLAYER_WIDTH/2), playerPositionX+(PLAYER_WIDTH/2)), random(playerPositionY-(PLAYER_HEIGHT/2), playerPositionY+(PLAYER_HEIGHT/2)), random(particleMinSize, particleMaxSize), color(#B7F8FF), 255);
    sharkParticles[i] = new Particle(random(shark.x-(shark.sharkWidth/2), shark.x+(shark.sharkWidth/2)), random(shark.y-(shark.sharkHeight/2), shark.y+(shark.sharkHeight/2)), random(particleMinSize, particleMaxSize), color(#B7F8FF), 255);
    //for (Squid squid : squids) {
    //  squidParticles[i] = new Particle(random(squid.x-(squid.size), squid.x+(squid.size)), random(squid.y-(squid.size), squid.y+(squid.size)), random(particleMinSize, particleMaxSize), color(#B7F8FF), 255);
    //}
    shrineParticles[i] = new Particle(random(shrinePlatform.platformX-(shrineWidth/2), shrinePlatform.platformX+(shrineWidth/2)), random(shrinePlatformY-(shrineHeight/2), shrinePlatformY+(shrineHeight/2)), random(particleMinSize*2, particleMaxSize*2), color(#F5E043), 255);
  }
}

/* 
variable naming ;_;
*/

class Particle {

  float x, y, s;
  color clr;
  int o;

  Particle(float tempX, float tempY, float tempS, color tempCLR, int tempO) {
    x = tempX;
    y = tempY;
    s = tempS;
    clr = tempCLR;
    o = tempO;
  }

  void drawParticle() {
    fill(clr, o);
    ellipse(x, y, s, s);
  }

  void updateParticle(int move) {
    y-=particleMoveUp;
    x-=move/2;
    o-= random(oDecrease);
  }
  //Deze methode zet de particle weer terug als de if statement waar is.
  //Deze heeft parameters, omdat niet alle particles dezelfde limit en oorsprong heeft.
  void moveParticleBack( int originY, int originX) {
    if (o <= 0) {
      y = originY;
      x = originX;
      o = 255;
    }
  }
}
void drawParticles() {
  spawnMonkeyParticles();
  spawnEnemyParticles();
  spawnShrineParticles();
}

void updateParticles() {
  updateMonkeyParticles();
  updateEnemyParticles();
  updateShrineParticles();
}

void spawnShrineParticles() {
  for (Particle part : shrineParticles) {
    part.drawParticle();
  }
}
void updateShrineParticles() {
  for (Particle part : shrineParticles) {
    part.updateParticle((int)platformSpeed);
    part.moveParticleBack((int)random(shrinePlatformY-(shrineHeight), shrinePlatformY), (int)random(shrinePlatform.platformX-(shrineWidth/2), shrinePlatform.platformX+(shrineWidth/2)));
  }
}


void spawnEnemyParticles() {
  for (Particle part : sharkParticles) {
    part.drawParticle();
  }
  //for (Particle part : squidParticles) {
  //  part.drawParticle();
  //}
}
void updateEnemyParticles() {
  for (Particle part : sharkParticles) {
    part.updateParticle((int)shark.speed);
    part.moveParticleBack((int)random(shark.y-(shark.sharkHeight/2), shark.y+(shark.sharkHeight/2)), (int)random(shark.x-(shark.sharkWidth/2), shark.x+(shark.sharkWidth/2)));
  }
  //for (Particle part : squidParticles) {
  //  part.updateParticle(10);

  //  for (Squid squid : squids) {
  //    part.moveParticleBack((int)random(squid.x-(squid.size), squid.x+(squid.size)), (int)random(squid.y-(squid.size), squid.y+(squid.size)));
  //  }
  //}
}



void spawnMonkeyParticles() {
  for (Particle particles : playerParticles) {
    particles.drawParticle();
  }
}

void updateMonkeyParticles() {
  Platform tempPlatform = platformArrayListMain.get(platformArrayListMain.size()-1);
  float platformS = tempPlatform.platformSpeed;
  for ( Particle part : playerParticles) {
    part.updateParticle((int)platformS);
    part.moveParticleBack( (int)random(playerPositionY-(PLAYER_HEIGHT/2), playerPositionY+(PLAYER_HEIGHT/2)), (int)random(playerPositionX-(PLAYER_WIDTH/2), playerPositionX+(PLAYER_WIDTH/2)));
  }
}
