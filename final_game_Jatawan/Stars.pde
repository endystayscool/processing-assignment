class Stars {

  float x, y, radius1, radius2;
  int npoints;
  color co;

  Stars(float xx, float yy, float r1, float r2, int np, color c) {
    x = xx;
    y = yy;
    radius1 = r1;
    radius2 = r2;
    npoints = np;
    co = c;
  }

  void drawStars() {
    fill(co);
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  
   void drawArrow() {
    stroke(0);
    fill(0);
    strokeWeight(5);
    triangle(10, 35, 20, 25, 20, 45);
    rect(20, 30, 10, 10);
  }
}
