int eyesSize = 20;
int headSize = 120;
float xPos, yPos;


float speed = 5;

int xspeed = 5, yspeed = 5; 
int xdirection = 1, ydirection = 1;

void setup() {
  size(600, 400);
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  background(255);

  if (xPos > width-headSize || xPos < 0) {
    xdirection *= -1;
  }
  if (yPos > height-headSize || yPos < 0) {
    ydirection *= -1;
  }

  xPos = xPos + ( xspeed * xdirection );
  yPos = yPos + ( yspeed * ydirection );

  // bg
  fill(0, 0, 200);
  rect(0, 0, 600, 300);

  // head
  fill(200, 0, 0);
  ellipse(xPos, yPos, headSize, headSize);

  // eyes
  fill(mouseX - 255);
  //fill( random(255), random(255), random(255), random(255));
  ellipse(xPos - 20, yPos, eyesSize, eyesSize);
  ellipse(xPos + 20, yPos, eyesSize, eyesSize);

  // body
  fill(200, 0, 0);
  rect(xPos - 40, yPos + 60, 80, 150);

  // legs
  stroke(0);
  line(xPos - 40, yPos + 210, xPos - 80, yPos + 300);
  line(xPos + 40, yPos + 210, xPos + 80, yPos + 300);

  //flyUp(); // to fly up from bottom
}

void flyUp() {
  yPos = yPos - speed;
  if (yPos == 0) {
    yPos = 600;
  }

  //if (yPos % 2 == 0) {
  //  xPos -= 10;
  //} else {
  //  xPos += 10;
  //}
}
