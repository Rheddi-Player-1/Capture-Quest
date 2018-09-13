class Character
{
  PImage leftImg[];
  PImage rightImg[];
  int charSpeed, charJump;
  int charXPos, charYPos;
  int tall, wide, weight;
  int j, k;
  PImage direction[];

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
    charXPos = charXPos - charSpeed;
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
    charXPos = charXPos + charSpeed;
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
