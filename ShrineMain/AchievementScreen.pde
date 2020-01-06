StatScreen stat;
StatScreen statScreen;
class StatScreen { 
  float achievementX = width/4;
  float achievementY;
  int nameSize = 40;
  int descSize = 30;
  float boxSizeX = width/4;
  float boxSizeY = 110;
  float boxSize2X = width/2;
  float boxSize2Y = height/2;
  float box2X = width*0.70;
  float box2Y = height*0.40;

  float cooldown = 30;

  void setUpAchievements() {
    for (int i = 0; i<MAX_ACHIEVEMENTS; i++) {

      nameAchievement[i] = " ";
      descriptionAchievement[i] = " ";
      unlockedAchievement[i] = " ";
    }
  }


  void drawScreen() {
    rectMode(CENTER);
    background(achievementBgImg);
    textSize(100);
    text("Your Statistics", width/2, height*0.10);

    for ( int i = 0; i<MAX_ACHIEVEMENTS; i++) {
      achievementY = i*(height/9)+(height/5);
      fill(255);
      rect(achievementX, achievementY-20, boxSizeX, boxSizeY);
      fill(0);
      textSize(nameSize);
      text(nameAchievement[i], achievementX, achievementY-20);
      textSize(descSize);
      text(descriptionAchievement[i], achievementX, achievementY+10);
      text(unlockedAchievement[i], achievementX, achievementY+35);
    }

    fill(249, 231, 159);
    rect(box2X, box2Y, boxSize2X, boxSize2Y);
    fill(0);
    textSize(60);
    image(bananaImg, box2X-(box2X*0.25), box2Y-(box2Y*0.25), bananaSize*2, bananaSize*2);
    text(bananaTotal, box2X-(box2X*0.15), box2Y-(box2Y*0.25));
    image(sharkImg, box2X, box2Y-(box2Y*0.25), 150, 60);
    text(sharkTotal, box2X+(box2X*0.15), box2Y-(box2Y*0.25));
    image(shellImg, box2X-(box2X*0.25), box2Y+(box2Y*0.20), shellSize*2, shellSize*2);
    text(shellTotal, box2X-(box2X*0.15), box2Y+(box2Y*0.20));
    image (squidImg, box2X, box2Y+(box2Y*0.20), 110, 150);
    text(squidTotal, box2X+(box2X*0.15), box2Y+(box2Y*0.20));
    text("Highscore :" + personalHigh, box2X-(box2X*0.15), box2Y+(box2Y*0.55));
    text( "Press A to continue 1/2", width*0.75, height*0.95);
  }
  
  void updateScreen(){
    if (keysPressed[10] && cooldown <= 0){
        cooldown+=30;
        stage = 6;
    }
    
    if(cooldown >= 0){
      cooldown--;
    }
  }
}
