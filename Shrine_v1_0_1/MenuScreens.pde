LoginMenu loginMenu;
MainMenu mainMenu;

class LoginMenu {

  int select = 0;

  void drawMenu() {
    image(startImg, width/2, height/2);

    //aaaaa magic numbers!!!
    fill(135, 54, 0);
    rect(width/1.7, height/2.5, 520, 320);

    fill(249, 231, 159);
    rect(width/1.7, height/2.5, 500, 300, 63);

    switch(select) {
    case 0:
      textSize(120);
      fill(255);
      textAlign(CENTER);
      text("Login", width/1.7, height/2.75);

      textSize(80);
      fill(255);
      textAlign(CENTER);
      text("New User", width/1.7, height/2);
      break;

    case 1:
      textSize(80);
      fill(255);
      textAlign(CENTER);
      text("Login", width/1.7, height/2.75);

      textSize(120);
      fill(255);
      textAlign(CENTER);
      text("New User", width/1.7, height/2);
    }
  }

  void updateMenu() {

    //Laat de speler kiezen tussen Login en New User
    if (keyChanged(DOWN)) {
      select += 1;

    }

    if (keyChanged(UP)) {
      select -= 1;
    }


    //Reversed het geselecteerde menu als het out of bounds gaat.
    if (select > 1) {
      select = 0;
    }
    if (select < 0) {
      select = 1;
    }


    if (keysPressed[10] && select == 0) {
      stage = 1;
      state = 0;
    }
    if (keysPressed[10] && select == 1) {
      stage = 1;
      state = 1;
    }
  }
}
class MainMenu {

  int select = 0;

  void drawMenu() {
    image(startImg, width/2, height/2);
    
    fill(135, 54, 0);
    rect(width/1.7, height/2.5, 520, 320);

    fill(249, 231, 159);
    rect(width/1.7, height/2.5, 500, 300, 63);
    
      switch(select) {
    case 0:
      textSize(120);
      fill(255);
      textAlign(CENTER);
      text("Play", width/1.7, height/2.75);

      textSize(80);
      fill(255);
      textAlign(CENTER);
      text("Stats", width/1.7, height/2);
      break;

    case 1:
      textSize(80);
      fill(255);
      textAlign(CENTER);
      text("Play", width/1.7, height/2.75);

      textSize(120);
      fill(255);
      textAlign(CENTER);
      text("Stats", width/1.7, height/2);
    }
  }

  void updateMenu() {

    //Laat de speler kiezen tussen Login en New User
    if (keysPressed[DOWN] && keyChanged(DOWN)) {
      select += 1;
    }

    if (keysPressed[UP] && keyChanged(UP)) {
      select -= 1;
    }

    //Reversed het geselecteerde menu als het out of bounds gaat.
    if (select > 1) {
      select = 0;
    }
    if (select < 0) {
      select = 1;
    }


    if (keyChanged(10) && select == 0) {
      stage = 3;
    }
    if (keyChanged(10) && select == 1) {
      stage = 5;
    }
  }
}
    
