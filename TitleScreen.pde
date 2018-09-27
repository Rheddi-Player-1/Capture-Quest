class TitleScreen

{

  PImage title;
  int x = 1000;
  int y = 500;


  TitleScreen()

  {

    title = loadImage("titleScreen.gif");
  }

  void showTitle()

  {

    imageMode(CENTER);

    image(title, x, y);



      fill(0);
  }



  void clearTitle()

  {
    x=4000;
    redraw();
  }
}
