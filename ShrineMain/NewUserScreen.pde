String userName;
String userPassword;
boolean userCreated = false;
boolean userLoggedIn = false;

int state;             //0 = User Creation, 1 = LogIn

NewUser newUser;

class NewUser {

  String[] letters = new String[6];



  int selector = 0;      //Determines the chosen letter
  int count = 0;         //0 = Changes to username, 1 = Changes to password
  float pressCooldown;   //Used for a slight cooldown between button presses
  int i = 0;             //For changes in arrays

  float posYusername = height / 3;        //The Y position of the username letters.
  float posYpassword = height / 1.5;      //The Y position of the password letters.
  float posXLeft = width / 2 - 100;       //The X position of the most left letters.
  float posXCenter = width / 2;           //The X position of the center letters.
  float posXRight = width / 2 + 100;      //The X position of the most right letters.

  void setupNewUser() {
    //Default values for the username letters
    letters[0] = "A";
    letters[1] = "A";
    letters[2] = "A";

    //Default values for the pasword letters
    letters[3] = "A";
    letters[4] = "A";
    letters[5] = "A";

    //Initial cooldown for input is 30
    pressCooldown = 30;
  }

  void drawNewUser() {
    background(0, 0, 0);    //Creates a black background

    switch(selector) {
    case 0:
      letters[i] = "A";    //selects the letter A
      break;
    case 1:
      letters[i] = "B";    //selects the letter B
      break;
    case 2:
      letters[i] = "C";    //selects the letter C
      break;
    case 3:
      letters[i] = "D";    //selects the letter D
      break;
    case 4:
      letters[i] = "E";    //selects the letter E
      break;
    case 5:
      letters[i] = "F";    //selects the letter F
      break;
    case 6:
      letters[i] = "G";    //selects the letter G
      break;
    case 7:
      letters[i] = "H";    //selects the letter H
      break;
    case 8:
      letters[i] = "I";    //selects the letter I
      break;
    case 9:
      letters[i] = "J";    //selects the letter J
      break;
    case 10:
      letters[i] = "K";    //selects the letter K
      break;
    case 11:
      letters[i] = "L";    //selects the letter L
      break;
    case 12:
      letters[i] = "M";    //selects the letter M
      break;
    case 13:
      letters[i] = "N";    //selects the letter N
      break;
    case 14:
      letters[i] = "O";    //selects the letter O
      break;
    case 15:
      letters[i] = "P";    //selects the letter P
      break;
    case 16:
      letters[i] = "Q";    //selects the letter Q
      break;
    case 17:
      letters[i] = "R";    //selects the letter R
      break;
    case 18:
      letters[i] = "S";    //selects the letter S
      break;
    case 19:
      letters[i] = "T";    //selects the letter T
      break;
    case 20:
      letters[i] = "U";    //selects the letter U
      break;
    case 21:
      letters[i] = "V";    //selects the letter V
      break;
    case 22:
      letters[i] = "W";    //selects the letter W
      break;
    case 23:
      letters[i] = "X";    //selects the letter X
      break;
    case 24:
      letters[i] = "Y";    //selects the letter Y
      break;
    case 25:
      letters[i] = "Z";    //selects the letter Z
      break;
    }

    switch(i) {
    case 0:
      ellipse(posXLeft, posYusername + 20, 10, 10);     //Creates an ellipe under the first letter, in order to show which letter is selected
      break;
    case 1:
      ellipse(posXCenter, posYusername + 20, 10, 10);   //Creates an ellipe under the second letter, in order to show which letter is selected
      break;
    case 2:
      ellipse(posXRight, posYusername + 20, 10, 10);    //Creates an ellipe under the third letter, in order to show which letter is selected
      break;
    case 3:
      ellipse(posXLeft, posYpassword + 20, 10, 10);     //Creates an ellipe under the fourth letter, in order to show which letter is selected
      break;
    case 4:
      ellipse(posXCenter, posYpassword + 20, 10, 10);   //Creates an ellipe under the fifth letter, in order to show which letter is selected
      break;
    case 5:
      ellipse(posXRight, posYpassword + 20, 10, 10);    //Creates an ellipe under the sixth letter, in order to show which letter is selected
      break;
    }

    text(letters[0], posXLeft, posYusername);      //Displays the first letter
    text(letters[1], posXCenter, posYusername);    //Displays the second letter    
    text(letters[2], posXRight, posYusername);     //Displays the third letter

    text(letters[3], posXLeft, posYpassword);      //Displays the fourth letter
    text(letters[4], posXCenter, posYpassword);    //Displays the fifth letter
    text(letters[5], posXRight, posYpassword);     //Displays the sixth letter

    text("Username:", width / 4, posYusername);    //Displays "Username"
    text("Password:", width / 4, posYpassword);    //Displays "Password"
  }

  void inputGiven() {        //Method used after input is given by the player
    pressCooldown += 30;     //Cooldown is raised by 30 after said input.

    if (keysPressed[LEFT] || keysPressed[RIGHT] || keysPressed[10]) {
      selector = 0;          //The letter selector will return to 0 so the next letter can be selected
    }
  }

  void updateNewUser() {

    if (pressCooldown <= 0) {            //The input code below will only be read if the cooldown is 0 or lower
      if (keysPressed[UP]) {             //If a player presses the UP key, the previous letter will be selected
        selector -= 1;          
        inputGiven();
      } 
      if (keysPressed[DOWN]) {           //If a player presses the DOWN key, the next letter will be selected
        selector += 1;
        inputGiven();
      }

      if (keysPressed[RIGHT] && i < 2) {                  //If a player presses the RIGHT key, they can alter the letter to the right of the letter they were previously on (Username row)
        i += 1; 
        inputGiven();
      }
      if (keysPressed[LEFT] && i > 0 && count == 0) {     //If a player presses the LEFT key, they can alter the letter to the left of the letter they were previously on (Username row) 
        i -= 1; 
        inputGiven();
      }

      if (keysPressed[RIGHT] && i < 5 && count == 1) {    //If a player presses the RIGHT key, they can alter the letter to the right of the letter they were previously on (Password row)
        i += 1; 
        inputGiven();
      }

      if (keysPressed[LEFT] && i > 3 && count == 1) {    //If a player presses the RIGHT key, they can alter the letter to the right of the letter they were previously on (Password row)
        i -= 1; 
        inputGiven();
      }

      if (keysPressed[10] && count == 1) {                    //If a player presses Enter for the second time, the selected letters will form the password
        userPassword = letters[3] + letters[4] + letters[5];

        if (state == 1) {
          userCreated = true;                                   //Depending on whether the player is a new user or a returning user, the boolean will be set to true
        }
        if (state == 0) {
          userLoggedIn = true;
        }
      }

      if (keysPressed[10] && count == 0) {                    //If a player presses Enter for the first time, the selected letters will form the username
        inputGiven();
        userName = letters[0] + letters[1] + letters[2];
        i = 3;                                                //i and count will be altered, so the password can now be selected instead of the username
        count += 1;
      }
    }

    if (selector > 25) {                      //If a player scrolls past Z they will return to A
      selector = 0;
    }
    if (selector < 0) {                      //If a player scrolls behind A they will reach Z
      selector = 25;
    }

    if (pressCooldown > 0) {            //Lowers the cooldown once it has been raised
      pressCooldown--;
    }
  }
}
