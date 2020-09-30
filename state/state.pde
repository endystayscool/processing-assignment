int state = 0;
int x = 0, y = 0;
int speed = 10;
int rectSize = 200;

void setup() {
  size(400, 400);
  noStroke();
}

void draw() {
  background(#e2e2e2);

  fill(#EBF293);
  rect(x, y, rectSize, rectSize);

  if (state == 0) {
    x += speed;
    if (x > width - rectSize) {
      state = 1;
    }
  } else if (state == 1) {
    y += speed;
    if (y > height - rectSize) {
      state = 2;
    }
  } else if (state == 2) {
    x -= speed;
    if (x < 0) {
      state = 3;
    }
  } else if (state == 3) {
    y -= speed;
    if (y < 0) {
      state = 0;
    }
  }
}
