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
  RectangleBoarder[] rectangle = new RectangleBoarder[7];
  java.util.Scanner input = new java.util.Scanner(System.in);

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




    rectangle[0] = new RectangleBoarder(450, 0, 50, 1000);
    rectangle[1] = new RectangleBoarder(1500, 0, 50, 1000);
    rectangle[2] = new RectangleBoarder(500, 200, 400, 50);
    rectangle[3] = new RectangleBoarder(800, 400, 400, 50);
    rectangle[4] = new RectangleBoarder(1100, 600, 400, 50);
    rectangle[5] = new RectangleBoarder(750, 800, 400, 50);
    rectangle[6] = new RectangleBoarder(500, 950, 1000, 50);




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
    ninja = new RectangleBoarder(charXPos, charYPos, tall, wide);
    // System.out.println(ninja.x1 + "," + ninja.x2 + ", " + ninja.y2);
    for (int i=2; i<=6; i++) {
      if (ninja.ifSupportBelow(rectangle[i].getx1(), rectangle[i].gety1(), rectangle[i].getx2(), rectangle[i].gety2())) {
        // System.out.println("Rectangle: " + i + " - " + rectangle[i].getx1() + ", " + rectangle[i].gety1() + ", " +  rectangle[i].getx2() + ", " + rectangle[i].gety2());

        vy=0;
        charYPos = charYPos + vy;
        redraw();
        return;
      }
    }

    vy=10;
    charYPos = charYPos + vy;
    redraw();
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
    ninja = new RectangleBoarder(charXPos, charYPos, tall, wide);
    if (ninja.ifCollideLeft(rectangle[0].x2)){
      
    return;}
    System.out.println(ninja.x1 + ", " + rectangle[0].x2) ; 
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
    ninja = new RectangleBoarder(charXPos, charYPos, tall, wide);
    if (ninja.ifCollideRight(rectangle[1].x1))
      return;
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
