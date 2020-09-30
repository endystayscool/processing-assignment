int rad = 20;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

float speed = 5;


void setup() 
{
  size(640, 360);
  noStroke();
  //frameRate(30);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(255);
  //bounceTheBall();
  bounceLR();
  drawBall();
}

void bounceTheBall() {
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
}

void bounceLR() {
  xpos += speed;
  if (xpos >= width || xpos <= 0) {
    speed *= -1;
  }
}

void drawBall() {
  fill(#8AE0D4);
  ellipse(xpos, 100, rad, rad);
}
