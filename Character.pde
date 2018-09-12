class Character
{
  PImage leftImg[];
  PImage rightImg[];
  int charSpeed, charJump;
  int charXPos, charYPos;
  int tall, wide, weight;
  int j, k;
  
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
    
    for (int i = 0; i < rightImg.length; i++)
    {
      rightImg[i] = loadImage("SeeSnakeMove/Snake" + i + ".gif");
    }
    for (int i = 0; i < leftImg.length; i++)
    {
      leftImg[i] = loadImage("SeeSnakeMove/SnakeLeft" + i + ".gif");
    }
    
  }
  
  void updateWeight(int wei)
  {
    if(wei > weight )
    {
       charSpeed = charSpeed - 2;
       charJump = charJump  - 2;
    }
    else if( wei < weight)
    {
      charSpeed = charSpeed + 2;
      charJump = charJump + 2;
    }
    weight = wei;
  }
  
    
  
  void moveCharLeft()
  {
    background(255,255,255);
      charXPos = charXPos - charSpeed;
      image(leftImg[k],charXPos,charYPos, wide, tall);
      if(k == leftImg.length-1)
      {
        k = 0;
      }
     k++;
  }
  
  void moveCharRight()
  {
    background(255,255,255);
    charXPos = charXPos + charSpeed;
    image(rightImg[j],charXPos,charYPos, wide, tall);
    if(j == rightImg.length - 1)
      {
        j = 1;
      }
    j++;
  }
  
  void keyReleaseRight()
  {
    background(255, 255, 255);
    image(rightImg[0], charXPos, charYPos, wide, tall);
    j = 1;
    k = 0;
  }
  
  void keyReleaseLeft()
  {
    background(255, 255, 255);
    image(leftImg[0], charXPos, charYPos, wide, tall);
    j = 1;
    k = 0;
  }
  
  void moveCharJump()
  {
  }
  
  void initializeChar()
  {
    image(rightImg[0], charXPos, charYPos, wide, tall);
  }
  
}
