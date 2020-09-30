void setup() {
  size(600, 600); 
}

void draw() {
  background(255); 
  strokeWeight(10);

  //red
  fill(255, 0, 0);
  rect(-10, -10, mouseX, mouseY);

  //white
  fill(255);
  rect(mouseX-10, mouseY-10, 600, 600);

  //blue
  fill(0, 0, 255);
  rect(width-mouseX, mouseY-10, 100, pmouseY);

  //yellow
  fill(255, 255, 0);
  rect(mouseX-10, mouseY+100, 100, 600);

  //black
  fill(0);
  rect(mouseX+90, mouseY+100, pmouseX, pmouseY);
}
