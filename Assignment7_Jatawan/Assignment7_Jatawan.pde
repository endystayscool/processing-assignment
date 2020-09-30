RandomWalker[] walker = new RandomWalker[500];

void setup() {
  size(500, 500);
  background(255);
  for (int i = 0; i < walker.length; i++) {
    walker[i] = new RandomWalker();
  }
}

void draw() {
  for (int i = 0; i < walker.length; i++) {
    walker[i].step();
    walker[i].display();
  }
}
