// import lib
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Splash> splash;
ArrayList<Ball> balls;
ArrayList<Life> life;
ArrayList<Danger> dangers;

Box2DProcessing box2d;
Avatar avatar;

int state = 0, score = 0, lifeSpan = 3;
PImage endy, bean, chosenAvatar;

void setup() {
  size(400, 600);

  // Initialize and create the Box2D world
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();

  // Create ArrayLists
  splash = new ArrayList<Splash>();
  balls = new ArrayList<Ball>();
  life = new ArrayList<Life>();
  dangers = new ArrayList<Danger>();

  avatar = new Avatar();
}


// A new ball object at the mouse position, if any mouse button is pressed
void mouseClicked() {
  // splash
  if (state == 0) {
    state++;
  } 

  // chosen avatar
  else if (state == 1) {

    // assign chosen player
    if (mouseX >= 16 & mouseX <= 185 & mouseY >= 272 & mouseY <= 472) {
      println("Endy");
      chosenAvatar = endy;
      state ++;
    } else if (mouseX >= 216 & mouseX <= 386 & mouseY >= 272 & mouseY <= 472) {
      println("Bean");
      chosenAvatar = bean;
      state ++;
    }

    score = 0;
    lifeSpan = 3;
  } 

  // main game 
  else if (state == 2) {
    score = 0;      // click anywhere 
    lifeSpan = 3;   // to reset to initial state
  }
}


void keyPressed() {
  if (state == 2) {
    if (keyCode == ENTER)
      state = 1; // after hit enter goes back to avatar selection page
  }
}

void showGameover() {
  noStroke();
  fill(#88e1f2);
  rect(width/2+20, height/4+50, 200, 60);
  fill(#ff7c7c);
  rect(width/2+10, height/4+40, 200, 60);
  fill(255);
  textSize(30);
  text("GAME OVER!!", width/2-90, height/4+50);

  fill(#88e1f2);
  rect(width/2+20, height/2+10, 300, 50);
  fill(#ff7c7c);
  rect(width/2+10, height/2, 300, 50);
  fill(255);
  textSize(20);
  text("Click anywhere to try again.", width/2-130, height/2+5);
}


void draw() {
  // We must always step through time!
  box2d.step();

  // splash page
  if (state == 0) {
    background(#88e1f2);
    stroke(0);

    Splash sp = new Splash(width/2, height/2, #ffd082);
    splash.add(sp);  // A new splash object in the center of the screen
    for (Splash s : splash) {
      s.display(); // Display splash
    }

    // click to play label
    noStroke();
    fill(#21243d);
    rect(width/2+10, height/2+10, 200, 60);
    fill(#ff7c7c);
    rect(width/2, height/2, 200, 60);
    fill(255);
    textSize(30);
    text("Click to Play", width/2-90, height/2+10);

    // Credit
    fill(100);
    textSize(10);
    text("By Jatawan Kruesilp", width-100, height-10);
  } 


  // choose avatar
  else if (state == 1) {
    background(#88e1f2);
    cursor(HAND);

    // command
    noStroke();
    fill(#21243d);
    rect(width/2+5, height/4, 300, 50);
    fill(255);
    rect(width/2-5, height/4-10, 300, 50);
    fill(#21243d);
    textSize(30);
    text("Choose your avatar!", width/2-150, height/4);

    // style
    stroke(255);
    strokeWeight(5);
    fill(#ff7c7c);
    rect(width/2-100, height/2+70, 170, 200);
    fill(#ffd082);
    rect(width/2+100, height/2+70, 170, 200);

    avatar.drawAvatars(); // show avatar options
  }


  // main game
  else if (state == 2) {
    background(#21243d);
    frameRate(60);

    if (score >= 50 && lifeSpan != 0) {
      frameRate(100); // increase game speed if the score is greater than 50
    }

    // display score
    textSize(40);
    fill(255);
    text(score, 20, 45);

    //got the idea from the class example
    float randomNum = random(0, 100);
    if (randomNum >= 1 && randomNum <= 1.1) {
      life.add(new Life(random(0, width), 0)); // random add extra life
    } else if (randomNum >= 2 && randomNum <= 10) {
      balls.add(new Ball(random(0, width), 0));  // random add ball
    } else if (randomNum >= 17 && randomNum <= 20) {
      dangers.add(new Danger(random(0, width), 0));  // random add danger element
    }

    for (Ball b : balls) {
      b.display();
    }
    for (Life l : life) {
      l.display();
    }
    for (Danger d : dangers) {
      d.display();
    }

    // delete if the ball falls out the screen and being touched
    for (int i = 0; i < balls.size(); i++) {
      Ball b = balls.get(i);
      if (!b.isOnScreen()) {
        b.killBody();
        balls.remove(i);
      }
      if (b.isTouched()) {
        b.killBody();
        balls.remove(i);
        score++;
      }
    }
    // delete if the danger falls out the screen and being touched
    for (int i = 0; i < dangers.size(); i++) {
      Danger d = dangers.get(i);
      if (!d.isOnScreen()) {
        d.killBody();
        dangers.remove(i);
      }
      if (d.isTouched()) {
        d.killBody();
        dangers.remove(i);
        lifeSpan--;
      }
    }
    // delete if the life falls out the screen and being touched
    for (int i = 0; i < life.size(); i++) {
      Life l = life.get(i);
      if (!l.isOnScreen()) {
        l.killBody();
        life.remove(i);
      }
      if (l.isTouched()) {
        l.killBody();
        life.remove(i);
        lifeSpan++;
      }
    }

    if (lifeSpan <= 0) {
      showGameover(); // show game over and try again panel
    }

    avatar.drawLifeSpan(lifeSpan, chosenAvatar); // display lifespan
    avatar.drawChosenAvatar(chosenAvatar); // display user chosen avatar
  }
}

// ♥
