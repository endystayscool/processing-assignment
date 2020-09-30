class Circle {
  float x, y;
  float R = random(255);
  float G = random (255);
  float B = random (255);

  Circle() {
    noStroke();
    x = random(0, 500);
    y = random(0, 500);
  }

  void display() {
    fill(R, G, B);
    ellipse(mouseX, mouseY, 5, 5);
  }
  
  void step() {   
    int choice = int(random(4));
    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else {
      y--;
    }
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}
