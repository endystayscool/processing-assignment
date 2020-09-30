float rectSize = 100;
float xpos, ypos; 
int xspeed = 5, yspeed = 5; 
int xdirection = 1, ydirection = 1;
int i = 0;

void setup() 
{
  size(640, 460);
  noFill();
  background(255);
  frameRate(30);
  xpos = width/2;
  ypos = height/2;
  rectMode(CENTER);
}

void draw() 
{
  if (xpos > width-rectSize || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-rectSize || ypos < 0) {
    ydirection *= -1;
  }

  stroke(random(255), random(255), random(255));
  //rect(xpos, ypos, rectSize, rectSize);
  //rectSize = random(rectSize);
  //strokeWeight(random(1, 20));


  //xpos = xpos + ( xspeed * xdirection );
  //ypos = ypos + ( yspeed * ydirection );

  //if (xpos > width-rectSize || xpos < 0) {
  //  xdirection *= -1;
  //}
  //if (ypos > height-rectSize || ypos < 0) {
  //  ydirection *= -1;
  //}

  if (i == 0) {
    rect(xpos, ypos, rectSize, rectSize);
    toMove();
    i++;
  } else if (i == 1) {
    rect(xpos, ypos, rectSize - 20, rectSize - 20);
    toMove();
    i++;
  } else if (i == 2) {
    rect(xpos, ypos, rectSize - 40, rectSize - 40);
    toMove();
    i++;
  } else if (i == 3) {
    rect(xpos, ypos, rectSize - 60, rectSize - 60);
    toMove();
    i++;
  } else if (i == 4) {
    rect(xpos, ypos, rectSize - 80, rectSize - 80);
    toMove();
    i = 0;
  }
}

void toMove() {
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  strokeWeight(random(1, 20));
}
