class Avatar {

  Avatar() {
    // load images
    endy = loadImage("endy.png");
    bean = loadImage("mrBean.png");
  }

  // display avatar selection
  void drawAvatars() {
    image(endy, width/2-160, height/2, endy.width/2, endy.height/2);
    image(bean, width/2+40, height/2, bean.width/2, bean.height/2);
  }

  // display chosen avatar
  void drawChosenAvatar(PImage player) {
    noCursor(); 
    image(player, mouseX-40, 490, player.width/2-10, player.height/2-10);
  }

  // display game lifespan
  void drawLifeSpan(int life, PImage player) {
    int x = 360;
    for (int i = 0; i < life; i++) {
      image(player, x, 10, player.width/4-20, player.height/4-20);
      x -= 40;
    }
  }
}
