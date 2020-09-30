// adapt from the class example
// DifferentShapesAndStaticPlatforms
class Danger {

  Body body;      
  float r = 10;
  float xPos, yPos;

  Danger(float x, float y) {
    xPos = x;
    yPos = y;

    // for body
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(xPos, yPos));
    body = box2d.createBody(bd);

    // Define a polygon
    Vec2[] vertices = new Vec2[3];  // An array of 6 vectors
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(0, -20));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-20, 0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(0, 20));
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, 3);  // Define a polygon

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;

    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 1.3;  // <- Very bouncy!

    // Attach Fixture to Body               
    body.createFixture(fd);
  }

  //display the balls
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(#CB8199);
    noStroke();
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  // check if the avatar touched the danger element
  boolean isTouched() {
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    return ((mouseX >= pos.x && mouseX <= pos.x+20) && pos.y >= 500);
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
