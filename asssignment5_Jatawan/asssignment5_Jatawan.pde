void setup() {
  size(600, 600);
  background(255);
  noStroke();
}

void draw() {
  //1
  float d = myDistance(0, 0, mouseX, mouseY);
  float maxDist = myDistance(0, 0, width, height);
  float grayScale = map(d, 0, maxDist, 0, 255);
  fill(grayScale);
  square(0, 0, 300);
  
  //2
  d = myDistance(600, 0, mouseX, mouseY);
  maxDist = myDistance(0, 0, width, height);
  grayScale = map(d, 0, maxDist, 0, 255);
  fill(grayScale);
  square(300, 0, 300);
  
  //3
  d = myDistance(0, 600, mouseX, mouseY);
  maxDist = myDistance(0, 0, width, height);
  grayScale = map(d, 0, maxDist, 0, 255);
  fill(grayScale);
  square(0, 300, 300);
  
  //4
  d = myDistance(600, 600, mouseX, mouseY);
  maxDist = myDistance(0, 0, width, height);
  grayScale = map(d, 0, maxDist, 0, 255);
  fill(grayScale);
  square(300, 300, 300);
}

float myDistance(float x, float y, float mouseX, float mouseY) {
  float dx = mouseX - x;
  float dy = mouseY - y;
  float dis = sqrt(dx*dx + dy*dy);

  return dis;
}
