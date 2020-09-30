// adapt from the class example
// DifferentShapesAndStaticPlatforms
class Ball {

  Body body;      
  float r = 10;
  float xPos, yPos;

  Ball(float x, float y) {
    xPos = x;
    yPos = y;

    // for body
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(xPos, yPos));
    body = box2d.createBody(bd);

    // Define a shape
    CircleShape cs = new CircleShape();
    float radius = box2d.scalarPixelsToWorld(r);
    cs.m_radius = radius;

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;

    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 1.3;  // <- Very bouncy!

    // Attach Fixture to Body               
    body.createFixture(fd);
  }

  //display the balls
  void display() {
    noStroke();
    fill(#898989); // 21243d
    ellipseMode(RADIUS);
    Vec2 pos = box2d.getBodyPixelCoord(body);     // We need the Circle’s position 
    ellipse(pos.x, pos.y, r, r);
  }

  // check if the avatar touched the ball
  boolean isTouched() {
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    return ((mouseX >= pos.x && mouseX <= pos.x + 30) && pos.y >= 500);
  }

  // check if the object on screen   //from simple_box_example_removal
  boolean isOnScreen() {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    return (pos.x >= 0 && pos.x < width && pos.y >= 0 && pos.y < height);
  }

  // destroy balls   //from simple_box_example_removal
  void killBody() {
    box2d.destroyBody(body);
  }
}
