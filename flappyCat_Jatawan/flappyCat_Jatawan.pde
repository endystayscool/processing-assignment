PImage bg;
//logic
float gravity, velocity;
float topValue, bottomValue;
boolean alive;
int score = 0;

// cat positon
float xPos = 100, yPos = 0, obstacleX;
int faceSize = 25;


void setup() {
  size(500, 500);

  yPos = 0;
  gravity = 0.2;
  velocity = 0;
  obstacleX = 500;
  alive = true;
  topValue = random(50, 300);
  bottomValue = topValue+150;
  score = 0;
  bg = loadImage("CdzKcY.jpg");

  refresh();
  obstacle();
}

void draw() {
  if (alive) {
    refresh();
    jump();
    obstacle();
    collisionCheck();
  } else {
    restartScreen();
  }

  scoreCheck();
}

void cat() {
  noStroke();
  // head
  fill(#8FFCEF);
  ellipse(xPos, yPos, faceSize, faceSize);
  // ears
  fill(#73CBC0);
  triangle(xPos-3, yPos-5, xPos-5, yPos-20, xPos-12, yPos-5);
  triangle(xPos+3, yPos-5, xPos+5, yPos-20, xPos+12, yPos-5);
  //eyes
  fill(0);
  ellipse(xPos-5, yPos, 3, 3);
  ellipse(xPos+5, yPos, 3, 3);
  //nose
  fill(#FA4762);
  ellipse(xPos, yPos+5, 5, 5);
  //mustache 
  stroke(#814301);
  line(xPos-2, yPos+5, xPos-15, yPos+3);
  line(xPos-4, yPos+7, xPos-13, yPos+9);
  line(xPos+2, yPos+5, xPos+13, yPos+3);
  line(xPos+4, yPos+7, xPos+11, yPos+9);
}

void catDead() {
  noStroke();
  // head
  fill(#E02460);
  ellipse(xPos, yPos, faceSize, faceSize);
  // ears
  triangle(xPos-3, yPos-5, xPos-5, yPos-20, xPos-12, yPos-5);
  triangle(xPos+3, yPos-5, xPos+5, yPos-20, xPos+12, yPos-5);
  //eyes
  stroke(0);
  strokeWeight(2);
  line(xPos-17, yPos+5, xPos+15, yPos-5);
  line(xPos-17, yPos-5, xPos+15, yPos+5);
  ////nose
  noStroke();
  fill(#FA4762);
  ellipse(xPos, yPos+5, 5, 5);
}

void refresh() {
  if (yPos > 480) {
    alive = false;
    catDead();
  }
  if (alive == true) {
    velocity = velocity + gravity;
    yPos = yPos+velocity;
    background(bg);
    cat();
    noStroke();
    fill(0);
    rect(obstacleX, 0, 50, topValue);
    rect(obstacleX, bottomValue, 50, 500);
    obstacleX = obstacleX-2;
  }
}

void jump() {
  if (keyPressed == true) {
    if (velocity > 2  ) {
      velocity = -5;
    }
  }
}  

void obstacle() {
  if (obstacleX + 50 < 0) {
    topValue = random(50, 300);
    bottomValue = topValue+150;
    obstacleX = 500;
  }
}

void collisionCheck() {
  if ((obstacleX + 50 > 125) && (obstacleX < 150)) {  
    if ((yPos + 25 > bottomValue) || (yPos - 25 < topValue)) {
      alive = false;
      catDead();
    }
  }
}

void restartScreen() {
  textSize(50);
  fill(255, 255, 0);
  text("Oops!", 130, 200);
  fill(255);
  rect(130, 250, 270, 100);
  fill(0);
  text("Try Again", 150, 320);
}

void mouseClicked() {
  if (alive == false) {
    if ((mouseY > 250) & (mouseY < 350) & (mouseX > 130) & (mouseX < 400)) {
      setup();
    }
  }
}

void scoreCheck() {
  if (obstacleX == 60) {
    score++;
  }
  noStroke();
  fill(255);
  rect(460, 10, 30, 30);
  fill(200, 0, 0);
  textSize(20);
  text(score, 470, 30);
}
