Circle[] c = new Circle[100];

void setup() {
  size(500, 500);
  for (int i = 0; i < c.length; i++) {
    c[i] = new Circle();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < c.length; i++) {
    c[i].step();
    c[i].display();
  }
}
