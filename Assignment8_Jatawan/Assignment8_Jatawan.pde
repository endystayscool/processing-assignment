float theta;   
float position = 10, velocity = 0.1;

void setup() {
  size(500, 500);
}

void draw() {
  background(#AF67A8);
  stroke(255);

  // wind
  position = position + velocity;
  if (position >= 15 ) {
    velocity = velocity - 0.1;
  }
  if (position <= 10) {
    velocity = velocity + 0.1;
    position = position + velocity;
  }

  theta = radians(position);
  translate(width/2, height);
  line(0, 0, 0, -100);
  translate(0, -100);
  tree(128);

}

void tree(float h) {
  h *= 0.65;
  if (h > 1) {
    // L
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    tree(h);
    popMatrix();
    // R
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    tree(h);
    popMatrix();
  }
}
