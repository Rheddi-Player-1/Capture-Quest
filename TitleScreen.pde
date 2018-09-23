class TitleScreen

{

  PImage title;
  int x = 1000;
  int y = 500;


  TitleScreen()

  {

    title = loadImage("CaptureQuest.png");
  }

  void showTitle()

  {

    imageMode(CENTER);

    image(title, x, y);

    textMode(CENTER);

    textSize(55);

    text("PRESS ENTER", 800, 900);

      fill(0);
  }



  void clearTitle()

  {
    x=4000;
    redraw();
  }
}
