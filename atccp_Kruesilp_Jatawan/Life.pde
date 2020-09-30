// adapt from the class example
// DifferentShapesAndStaticPlatforms
class Life {

  Body body;      
  float w = 16;
  float h = 16;

  Life(float x, float y) {
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    // Define a polygon
    Vec2[] vertices = new Vec2[6];  // An array of 6 vectors
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(0, -25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-15, 0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(-10, 10));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertices[4] = box2d.vectorPixelsToWorld(new Vec2(10, 10));
    vertices[5] = box2d.vectorPixelsToWorld(new Vec2(15, 0));
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, 6);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    // Attach Fixture to Body               
    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(#1E9B93);
    noStroke();
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  // check if the avatar touched the extra life
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
