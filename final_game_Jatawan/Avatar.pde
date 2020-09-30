class Avatar {
  int circleSize = 400;
  int smallCircleSize = 200;
  int life;

  Label label = new Label();

  Avatar (PImage img1, PImage img2, PImage img3, int l) {
    endy = img1;
    peter = img2;
    bean = img3;
    
    life = l;
  }

  void drawAvatarSelection() {
    background(#88e1f2);

    // background circle
    noStroke();
    fill(#21243d);
    ellipse(200, height/2+100, circleSize, circleSize);
    fill(#ff7c7c);
    ellipse(width/2, height/2+100, circleSize, circleSize);
    fill(#ffd082);
    ellipse(width-200, height/2+100, circleSize, circleSize);

    // small background circle
    fill(#ff7c7c);
    ellipse(100, height/2, smallCircleSize, smallCircleSize);
    fill(#ffd082);
    ellipse(width/2-50, height/2, smallCircleSize, smallCircleSize);
    fill(#21243d);
    ellipse(width-250, height/2, smallCircleSize, smallCircleSize);

    // avater images
    image(peter, 30, height/2-70, peter.width/2, peter.height/2);
    image(endy, width/2-130, height/2-70, endy.width/2, endy.height/2);
    image(bean, width-330, height/2-70, bean.width/2, bean.height/2);

    // sticks
    stroke(#C4773B);
    strokeWeight(10);
    line(190, height/2, 290, height/4);
    line(550, height/2, 650, height/4);
    line(850, height/2, 950, height/4);

    // text name
    fill(255);
    textSize(50);
    text("Retep", 130, height/2+170);
    text("Ydne", width/2-30, height/2+170);
    text("Naeb", width/2+270, height/2+170);

  }

  // draw player avater in main game
  void drawUserSelectedAvatar(float x, float y) {
    //x = width/2-130;
    //y = height/2-70;
    image(endy, x, y, endy.width/2, endy.height/2);
  }

  // draw total life
  void drawLife(int lifeSpan) {
    int x = 40;
    life = lifeSpan;
    for (int i = 0; i < life; i++) {
      image(endy, x, 10, endy.width/6, endy.height/6);
      x += 40;
    }
  }
}
