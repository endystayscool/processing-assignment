class Creature {
  // creature size
  int eyesSize = 10;
  int headSize = 50;

  // bounce speed and direction
  float xPos, yPos;
  float xSpeed = 5, ySpeed = 5; 
  float xdirection = 1, ydirection = 1;
  int co = #C86464;

  //receive value from main 'creature_oop'
  Creature (float x, float y, float xs, float ys, int c) {  
    xPos = x;
    yPos = y;
    xSpeed = xs;
    ySpeed = ys;
    co = c;
  } 

  void drawCreature() {
    println(xPos, yPos);
    // head
    fill(co);
    ellipse(xPos, yPos, headSize, headSize);

    // eyes
    fill(mouseX - 255);
    //fill( random(255), random(255), random(255), random(255));
    ellipse(xPos - 15, yPos, eyesSize, eyesSize);
    ellipse(xPos + 15, yPos, eyesSize, eyesSize);

    // body
    fill(co);
    rect(xPos - 20, yPos + 25, 40, 60);

    // legs
    stroke(0);
    strokeWeight(3);
    line(xPos - 20, yPos + 85, xPos - 25, yPos + 120);
    line(xPos + 20, yPos + 85, xPos + 25, yPos + 120);
  }

  void move() {
    //xPos = xPos + ( xSpeed * xdirection );
    //yPos = yPos + ( ySpeed * ydirection );
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }

  void bounce() {
    if (xPos + headSize/2 >= width || xPos - headSize/2 <= 0) {
      xSpeed = xSpeed *-1;
    }
    if (yPos + headSize/2 >= height || yPos - headSize/2 <= 0) {
      ySpeed = ySpeed *-1;
    }
  }
}
