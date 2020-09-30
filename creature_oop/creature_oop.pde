
//constructure
Creature c1 = new Creature(300, 200, 5, 5, #64C8C8);
Creature c2 = new Creature(150, 100, 10, 10, #C86464);
Level lvl = new Level();

void setup() {
  size(600, 400);
}

void draw() {
  lvl.drawLevel(1);
  c1.drawCreature();
  c1.move();
  c1.bounce();
  
  c2.drawCreature();
  c2.move();
  c2.bounce();
}
