class Ball {
  float xPos, yPos;
  float xSpeed = 5, ySpeed = 5; 
  int ballSize = 30;
  color ballColor;
  boolean status = false;

  Ball(color c, boolean usingStatus) {
    xPos = random(0, 1000);
    yPos = random(50, 600);
    ballColor = c;

    status = usingStatus;
  }

  void move() {
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

  void drawBalls(boolean status) {
    if (status) {
      noStroke();
      fill(ballColor);
      ellipse(xPos, yPos, ballSize, ballSize);
    }
  }
}
