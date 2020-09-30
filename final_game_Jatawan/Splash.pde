class Splash {
  Label label = new Label();

  Splash() {
  }

  void drawSplash() {
    background(#21243d);
    noStroke();
    fill(#ff7c7c);
    rect(0, 300, width, 200);
    fill(#ffd082);
    rect(0, 500, width, 100);
    fill(#88e1f2);
    rect(0, 600, width, 70);

    drawPlayButton();

    label.name();
  }

  void drawPlayButton() {
    fill(0);
    ellipse(width/2+30, height/2+70, 400, 400);
    fill(255);
    ellipse(width/2, height/2+50, 400, 400);

    fill(0);
    textSize(100);
    text("Click to", width/2-185, height/2+40);
    text("Play", width/2-50, height/2+140);
  }
}
