//mitch: Comments op variables, herdoen met rectmode:center 
//class voor leftheart en rightheart, dit is veel te veel moeite.




void hud() {
  int score;
  PFont font;

  font = createFont ("Arial", 32, true);   

  //Hud, timers, score, lives, Air level, Bannanas--------------------------------------------------------------------------------------------------------------------------------------------------------

  //timer-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  fill(255);
  int timer =millis();
  textFont(font, 36);
  text("Time: "+timer, width/25, height/15);

  //score-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  score = 0;
  text("Score: "+score, width*5/6, height/15);
}
