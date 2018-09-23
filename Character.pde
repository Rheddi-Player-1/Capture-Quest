RectangleBoarder[] rectangle;


class Character
{
  PImage leftImg[];
  PImage rightImg[];
  int charSpeed, charJump;
  int charXPos, charYPos;
  int tall, wide, weight;
  int j, k;
  PImage direction[];
  int vx, vy; // direction in -1,0,1 //
  RectangleBoarder ninja;
  RectangleBoarder[] rectangle = new RectangleBoarder[8];

  Character(int x, int y, int h, int w, int sp, int j, int wei)
  {
    charXPos = x;
    charYPos = y;
    tall = h;
    wide = w;
    charSpeed = sp;
    charJump = j;
    weight = wei;
    j = 1;
    k = 0;

    leftImg = new PImage[9];
    rightImg = new PImage[9];
    direction = new PImage[9];

    ninja = new RectangleBoarder(charXPos, charYPos, wide, tall);


    rectangle[0] = new RectangleBoarder(charXPos, charYPos, wide, tall);
    rectangle[1] = new RectangleBoarder(450, 0, 50, 1000);
    rectangle[2] = new RectangleBoarder(1500, 0, 50, 1000);
    rectangle[3] = new RectangleBoarder(500, 200, 400, 50);
    rectangle[4] = new RectangleBoarder(800, 400, 400, 50);
    rectangle[5] = new RectangleBoarder(1100, 600, 400, 50);
    rectangle[6] = new RectangleBoarder(600, 800, 400, 50);
    rectangle[7] = new RectangleBoarder(500, 950, 1000, 50);




    for (int i = 0; i < rightImg.length; i++)
    {
      rightImg[i] = loadImage("SeeSnakeMove/Snake" + i + ".gif");
    }

    direction[0] = rightImg[0];

    for (int i = 0; i < leftImg.length; i++)
    {
      leftImg[i] = loadImage("SeeSnakeMove/SnakeLeft" + i + ".gif");
    }
  }

  void gravity() {
    if (ninja.ifCollide(rectangle[3].getx1(), rectangle[3].gety1(), rectangle[3].getx2(), rectangle[3].gety2())) {
      vy=0;
      charYPos = charYPos + vy;
    } else
      vy=10;
      charYPos = charYPos + vy;
  }


  void updateWeight(int wei)
  {
    if (wei > weight )
    {
      charSpeed = charSpeed - 2;
      charJump = charJump  - 2;
    } else if ( wei < weight)
    {
      charSpeed = charSpeed + 2;
      charJump = charJump + 2;
    }
    weight = wei;
  }



  void moveCharLeft()
  {
    vx = -1*charSpeed;
    charXPos = charXPos + vx;
    direction[0] = leftImg[k];
    if (k == leftImg.length-1)
    {
      k = 0;
    }
    k++;

    redraw();
  }

  void moveCharRight()
  {
    vx= charSpeed;
    charXPos = charXPos + vx;
    direction[0] = rightImg[j];
    if (j == rightImg.length - 1)
    {
      j = 1;
    }
    j++;


    redraw();
  }

  void keyReleaseRight()
  {
    direction[0] = rightImg[0];
    j = 1;
    k = 0;

    redraw();
  }

  void keyReleaseLeft()
  {
    direction[0] = leftImg[8];
    j = 1;
    k = 0;

    redraw();
  }

  void moveCharJump()
  {
  }



  void initializeChar()
  {
    image(direction[0], charXPos, charYPos, wide, tall);

  }
}
