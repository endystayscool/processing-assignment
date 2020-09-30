class Ball {
  int ballSize = 50;

  // bounce speed and direction
  float xPos, yPos;
  float xSpeed = 5, ySpeed = 5; 
  float xdirection = 1, ydirection = 1;
  int co = #C86464;

  //receive value from main 'creature_oop'
  Ball (float x, float y, float xs, float ys, int c) {  
    xPos = x;
    yPos = y;
    xSpeed = xs;
    ySpeed = ys;
    co = c;
  } 

  void drawBall() {
    println(xPos, yPos);
    // head
    fill(co);
    ellipse(xPos, yPos, ballSize, ballSize);
  }

  void move() {
    //xPos = xPos + ( xSpeed * xdirection );
    //yPos = yPos + ( ySpeed * ydirection );
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }

  void bounce() {
    if (xPos + ballSize/2 >= width || xPos - ballSize/2 <= 0) {
      xSpeed = xSpeed *-1;
    }
    if (yPos + ballSize/2 >= height || yPos - ballSize/2 <= 0) {
      ySpeed = ySpeed *-1;
    }
  }
}
