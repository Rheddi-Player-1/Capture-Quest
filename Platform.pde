

class Platform {
  PImage Img;
  int platXPos, platYPos;
  int platLength, platHeight;
  int level;

  Platform(int l) {
    level = l;

  }




  void position() {
    fill(240, 240, 240);
    rect(450, 0, 50, 1000);
    rect(1500, 0, 50, 1000);
    if (level==1) {
      rect(500, 200, 400, 50);
      rect(800, 400, 400, 50);
      rect(1100, 600, 400, 50);
      rect(600, 800, 400, 50);
      rect(500, 950, 1000, 50);
    }
  }
}
