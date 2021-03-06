//door Mitch

void hud() {

  //Hud, timers, score, lives, Air level, Bannanas--------------------------------------------------------------------------------------------------------------------------------------------------------

  //timer-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  fill(255);

  int timer = (millis() - gameStartTime) / 1000; 
  textFont(HUDfont);
  text("Time: "+timer, width/25, height/15);

  //score-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  text("Score: "+score, width*5/6, height/15);
}


Hearts hearts;

class Hearts {
  int H = 3;  


  float lHeartArcX[] = new  float [H];
  float rHeartArcX[] = new float [H];
  float bHeartX0[] = new float [H];
  float bHeartX1[] = new float [H];
  float bHeartX2[] = new float [H];



  void update() {


    boolean Lives0 = lives > 0;
    boolean Lives1 = lives > 0.5; 
    boolean Lives2 = lives > 1;
    boolean Lives3 = lives > 1.5;
    boolean Lives4 = lives > 2;
    boolean Lives5 = lives > 2.5;

    float heartY0 = height/18.0, 
      heartY1 = height/11.0;
    float factor = 0.2;
    float lBase = 4.2, 
      rBase = 4.29, 
      bBase0 = 4.155, 
      bBase1 = 4.245, 
      bBase2 = 4.335;



    stroke(255, 0, 0);
    fill(255, 0, 0);
    for (int i = 0; i<H; i++) {
      lHeartArcX[i] = width * (lBase + (i * factor))/6;
      rHeartArcX[i] = width * (rBase + (i * factor))/6;
      bHeartX0[i] = width * (bBase0 + (i * factor))/6;
      bHeartX1[i] = width * (bBase1 + (i * factor))/6;
      bHeartX2[i] = width * (bBase2 + (i * factor))/6;

      if (Lives0) {
        arc(lHeartArcX[0], heartY0, 30, 30, PI, TWO_PI);
        triangle( bHeartX0[0], heartY0, bHeartX1[0], heartY1, bHeartX1[0], heartY0);
      }
      if (Lives1) {
        arc(rHeartArcX[0], heartY0, 30, 30, PI, TWO_PI);
        triangle(bHeartX2[0], heartY0, bHeartX1[0], heartY1, bHeartX1[0], heartY0);
      }
      if (Lives2) {
        arc(lHeartArcX[1], heartY0, 30, 30, PI, TWO_PI);
        triangle(bHeartX0[1], heartY0, bHeartX1[1], heartY1, bHeartX1[1], heartY0);
      } 
      if (Lives3) {
        arc(rHeartArcX[1], heartY0, 30, 30, PI, TWO_PI);
        triangle(bHeartX2[1], heartY0, bHeartX1[1], heartY1, bHeartX1[1], heartY0);
      }
      if (Lives4) {
        arc(lHeartArcX[2], heartY0, 30, 30, PI, TWO_PI);
        triangle(bHeartX0[2], heartY0, bHeartX1[2], heartY1, bHeartX1[2], heartY0);
      }
      if (Lives5) {
        arc(rHeartArcX[2], heartY0, 30, 30, PI, TWO_PI);
        triangle(bHeartX2[2], heartY0, bHeartX1[2], heartY1, bHeartX1[2], heartY0);
      }
    }
  }
}
