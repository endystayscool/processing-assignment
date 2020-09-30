class Level {
  void drawLevel(int n) {
    switch(n) {
    case 1: 
      background(222);
      break;
    case 2: 
      background(160);
      break;
    case 3: 
      background(80);
      break;
    case 4: 
      background(20);
      break;
    default: 
      background(0);
      break;
    }
  }
}
