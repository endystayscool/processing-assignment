int state = 0;
int score = 0;
int lifeSpan;
PImage endy, peter, bean;

ArrayList<Ball> ballsList = new ArrayList<Ball>();
ArrayList<Ball> ballRed = new ArrayList<Ball>();
Avatar userAvatar = new Avatar(null, null, null, lifeSpan);
Avatar avatar = new Avatar(null, null, null, lifeSpan);
Label label = new Label();
Stars stars = new Stars(0, 0, 30, 70, 5, 0);
Splash splash = new Splash();

void setup() {
  size(1024, 670);
  lifeSpan = 3;
}

void mouseMoved() {
  if (state == 2) {

    // save (black) balls
    for (int i = 0; i < ballsList.size() - 1; i++) {
      if (mouseX >= ballsList.get(i).xPos && mouseX <= ballsList.get(i).xPos+100
        && mouseY >= ballsList.get(i).yPos && mouseY <= ballsList.get(i).yPos+100) {
        ballsList.remove(i);
        score++;
        //println("out", i, ballsList.size());
        if (ballsList.size() == 1 || i == 0) {
          ballsList.remove(0);
          score++;
          //println("in", i, ballsList.size());
        }
      }
    }

    // danger (red) balls
    for (int i = 0; i < ballRed.size() - 1; i++) {
      if (mouseX >= ballRed.get(i).xPos && mouseX <= ballRed.get(i).xPos+100 
        && mouseY >= ballRed.get(i).yPos && mouseY <= ballRed.get(i).yPos+100) {
        ballRed.remove(i);
        lifeSpan--;
        userAvatar.drawLife(lifeSpan); // life count
      }
    }

    /* proceed to win or lose state if ran out of lifedpan 
     or the black balls was all collected */
    if (lifeSpan == 0 || ballsList.size() < 1) {
      state++;
    }
  }
}

void mouseClicked() {
  // (0) splash page
  if (state == 0) {
    state++;
  }

  // (1) avatar selection
  else if (state == 1) {
    score = 0;
    if (ballsList.size() != 20) {
      for (int i = ballsList.size(); i < 20; i++) {
        ballsList.add(new Ball(0, false));
      }
    }
    if (ballRed.size() != 5) {
      for (int i = ballRed.size(); i < 5; i++) {
        ballRed.add(new Ball(#F52858, false));
      }
    }

    if ((mouseX > 0) & (mouseX < 290) & (mouseY > 200) & (mouseY < 630)) {
      println("peter");
      avatar = new Avatar(peter, null, null, lifeSpan);
      state++;
    } else if ((mouseX > 350) & (mouseX < 600) & (mouseY > 200) & (mouseY < 630)) {
      println("endy");
      avatar = new Avatar(endy, null, null, lifeSpan);
      state++;
    } else if ((mouseX > 660) & (mouseX < width) & (mouseY > 200) & (mouseY < 630)) {
      println("bean");
      avatar = new Avatar(bean, null, null, lifeSpan);
      state++;
    }
  } 

  // (2) main game
  else if (state == 2) {
    if ((mouseY > 0) & (mouseY < 45) & (mouseX > 0) & (mouseX < 20)) {
      state--;
    }
    if (lifeSpan <= 0) { // losing
      state++;
    }
  } 

  // (3) winning/ losing => reset to initial state
  else {
    state--;
    lifeSpan = 3;
    score = 0;
    if (ballsList.size() != 20) {
      for (int i = ballsList.size(); i < 20; i++) {
        ballsList.add(new Ball(0, false));
      }
    }
    if (ballRed.size() != 5) {
      for (int i = ballRed.size(); i < 5; i++) {
        ballRed.add(new Ball(#F52858, false));
      }
    }
  }
}

void draw() {

  // (0) splash page
  if (state == 0) {  
    cursor(HAND);
    splash.drawSplash();
  } 

  // (1) avatar selection
  else if (state == 1) { 
    cursor(HAND);
    lifeSpan = 3;
    endy = loadImage("msEndy.png");
    peter = loadImage("mrPeter.png");
    bean = loadImage("mrBean.png");
    avatar = new Avatar(endy, peter, bean, lifeSpan);
    avatar.drawAvatarSelection();

    // title
    label.chooseAvatar();
  } 

  // (2) main game
  else if (state == 2) {
    background(#88e1f2);
    noCursor();
    frameRate(40);

    if (millis() < 5*1000) {
      label.instruction(); // display game instruction
    } else {
      // dynamic ball
      for (int i = 0; i < ballsList.size(); i++) {
        ballsList.get(i).drawBalls(true);
        ballsList.get(i).move();
        ballsList.get(i).bounce();
      }
      // dynamic ballRed
      for (int i = 0; i < ballRed.size(); i++) {
        ballRed.get(i).drawBalls(true);
        ballRed.get(i).move();
        ballRed.get(i).bounce();
      }
    }

    userAvatar.drawUserSelectedAvatar(mouseX-70, mouseY-70); // draw chosen avatar 
    userAvatar.drawLife(lifeSpan); // life count
    label.countingScore(); // score label
    stars.drawArrow();
  }

  // (3) winning / losing
  else if (state == 3) {
    background(#88e1f2);
    cursor(HAND);
    stars.drawArrow(); // go back arrow
    label.countingScore(); // score label
    userAvatar.drawUserSelectedAvatar(mouseX, mouseY); // draw chosen avatar 

    if (lifeSpan == 0) {
      label.losing(); // losing label
    } else {
      label.winning();  // winning label
      userAvatar.drawLife(lifeSpan); // life count
    }
  }
}
