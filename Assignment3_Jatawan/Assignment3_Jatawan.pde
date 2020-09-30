int sunSize = 400; // size of the ellipse
int startShade = 10; // height gap between each shade
float lineWeight = 1.0; // stroke size

void setup () {
  size(500, 600);
  noStroke(); // no stroke
  background(#88DAE8); // sky color
  fill(#F7F05A); // sun color
  ellipse(0, 0, sunSize, sunSize); // the sun
}

void draw() {
  openShade();
}

// to open the shade
void openShade() {
  stroke(#E2E2E2); // the shade color
  for (int i = 0; i < height; i += 20) {
    if (mouseY >= i) { // draw lines by mouseY detection
      line(0, startShade + i, width, startShade + i);
    } else if (mouseY < i) {
      closeShade(); // if mouseY move up call closeShade()
    }
  }
}

// to close the shade
void closeShade() {
  noStroke(); 
  background(#88DAE8); // sky color
  fill(#F7F05A); // sun color
  ellipse(0, 0, sunSize, sunSize); // the sun

  for (int i = 0; i < height; i += 20) {
    if (mouseY >= i) { // draw lines by mouseY detection
      stroke(#E2E2E2);
      line(0, startShade + i, width, startShade + i);
    }
  }
}

// detect mouseX and mouseY movement 
void mouseMoved() {
  // detect mouse movement
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  //println(dx + " " + dy);

  // to increase the stroke
  if (dx >= 1 && dy == 0) {
    if (lineWeight < 15) {  // stroke will not thicker than 15
      lineWeight += 0.1; // gradually increase stroke weight
      strokeWeight(lineWeight);
    }

    // to desrease the stroke
  } else if (dx < 0) {
    if (lineWeight > 1) {
      lineWeight -= 0.1; // gradually decrease stroke weight
      strokeWeight(lineWeight);
    }
  }
}
