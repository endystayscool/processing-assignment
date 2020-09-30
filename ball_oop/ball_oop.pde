
//constructure
Ball c1 = new Ball(300, 200, 5, 5, #64C8C8);
Ball c2 = new Ball(150, 100, 10, 10, #C86464);


void setup() {
  size(600, 400);
}

void draw() {
  background(100,100,100);
  c1.drawBall();
  c1.move();
  c1.bounce();
  
  c2.drawBall();
  c2.move();
  c2.bounce();
}
