

class Platform {
  PImage img1 = loadImage("thiefPlatform.png");
  PImage img2 = loadImage("thiefPlatformTopBot.png");
  PImage img3 = loadImage("thiefPlatformSides.png");
  int platXPos, platYPos;
  int platLength, platHeight;
  int level;

  Platform(int l) {
    level = l;
  }




  void position() {
    fill(240, 240, 240);
    image(img3, 450+25, 0+500);
    image(img3, 1500+25, 0+500);
    if (level==1) {
      image(img1, 500+200, 200+25);
      image(img1, 800+200, 400+25);
      image(img1, 1100+200, 600+25);
      image(img1, 750+200, 800+25);
      image(img2, 500+500, 950+25);
    }
    if (level==2) {
      image(img1, 500+200, 200+25);
      image(img1, 800+200, 400+25);
      image(img1, 1100+200, 600+25);
      image(img1, 850+200, 800+25);
      image(img2, 500+500, 950+25);
    }
  }
}
