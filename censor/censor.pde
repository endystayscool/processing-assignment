int rectSize = 10;

void setup() {
  size(200, 200);
  noStroke();
}
void draw() {
  for (int i = 0; i < width; i += 10) {
    for (int j = 0; j < height; j += 10) {
      fill(random(0, 255));
      rect(i,j, rectSize, rectSize);
    }
  }
}
