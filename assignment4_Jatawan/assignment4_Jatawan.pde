float rectSize;
float max_distance;

void setup() {
  size(600, 600);
  max_distance = dist(0, 0, width/2, height/2);
}

void draw() {
  background(#7AE0DA);
  stroke(255);

  for (int i = 0; i <= width; i += 20) {
    for (int j = 0; j <= height; j += 20) {
      fill(#DAEAE9);
      rectSize = dist(mouseX, mouseY, i, j);
      rectSize = rectSize/max_distance * 40;
      rect(i, j, rectSize, rectSize);
    }
  }
}
