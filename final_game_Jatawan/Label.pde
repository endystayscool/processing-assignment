class Label {
  Stars stars = new Stars(0, 0, 30, 70, 5, #ffd082);
  Stars starsLosing = new Stars(0, 0, 5, 70, 4, #F52858);

  // (0) splash
  void name() {
    fill(0);
    rect(width/2-100, 50, 610, 100);
    fill(255);
    rect(width/2-130, 30, 610, 100);
    fill(0);
    textSize(20);
    text("By", width/2-120, height/4-70);
    textSize(70);
    text("Jatawan Kruesilp", width/2-100, height/4-50);
  }

  // (1) setup
  void chooseAvatar() {
    noStroke();
    textSize(70);
    fill(0);
    rect(width/2-100, 50, 610, 100);
    fill(255);
    rect(width/2-130, 30, 610, 100);
    fill(0);
    text("Pick your avatar!", width/2-100, height/4-50);
  }

  // (2) main instruction
  void instruction() {
    noStroke();
    textSize(40);
    fill(0);
    rect(width/2-100, 50, 610, 100);
    fill(255);
    rect(width/2-130, 30, 610, 100);
    fill(0);
    text("Collect the black, ", width/2-100, height/4-100);
    text("and avoid the RED dots!", width/2-100, height/4-50);
  }
  // counting score
  void countingScore() {
    noStroke();
    textSize(40);
    fill(0);
    rect(width/6 - 100, 80, 70, 50);
    fill(255);
    rect(width/6 - 110, 70, 70, 50);
    fill(0);
    text(score, width/6-100, 110);
  }

  // (3) label
  void winning() {
    frameRate(20);
    stroke(3);
    textSize(70);

    fill(0);
    rect(width/2-100, 50, 610, 100);
    fill(255);
    rect(width/2-130, 30, 610, 100);
    fill(0);
    text("YOU WIN!!", width/2-100, height/4-50);
    tryAgain();
    callStars();
  }
  void losing() {
    frameRate(5);
    stroke(3);
    textSize(70);

    fill(0);
    rect(width/2-100, 50, 610, 100);
    fill(255);
    rect(width/2-130, 30, 610, 100);
    fill(0);
    text("GAME OVER!!", width/2-100, height/4-50);
    tryAgain();
    callX();
  }
  void tryAgain() {
    fill(0);
    rect(width/2+40, 200, 470, 70);
    fill(255);
    rect(width/2+10, 180, 470, 70);
    fill(0);
    textSize(30);
    text("Click anywhere to try again", width/2+50, height/4+70);
  }

  // particles
  void callStars() {
    pushMatrix();
    translate(random(0, width), random(0, height));
    stars.drawStars();
    popMatrix();
  }
  // particles
  void callX() {
    stroke(#F52858);
    pushMatrix();
    translate(random(0, width), random(0, height));
    rotate(frameCount);
    starsLosing.drawStars(); 
    popMatrix();
  }
}
