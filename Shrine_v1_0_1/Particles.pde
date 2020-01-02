//Door Vivienne Majarocon 500825852
//Dit is de particle systeem voor alle particles in het spel. Het is universeel en wordt gebruikt door verschillende opbjecten.

class Particle {

  float x, y, s;
  color clr;
  int o;
  int oDecrease = 15;

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
    part.updateParticle((int)theShark.speedX);
    part.moveParticleBack((int)random(theShark.y-(sharkHeight/2), theShark.y+(sharkHeight/2)), (int)random(theShark.x-(sharkWidth/2), theShark.x+(sharkWidth/2)));
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
  Platform tempPlatform = thePlatforms.get(thePlatforms.size()-1);
  float platformS = tempPlatform.platformSpeed;
  for ( Particle part : playerParticles) {
    part.updateParticle((int)platformS);
    part.moveParticleBack( (int)random(playerPositionY-(PLAYER_SIZE/2), playerPositionY+(PLAYER_SIZE/2)), (int)random(playerPositionX-(PLAYER_SIZE/2), playerPositionX+(PLAYER_SIZE/2)));
  }
}
