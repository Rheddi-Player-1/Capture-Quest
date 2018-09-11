PImage [] img;
PImage [] leftImg;
int x;
int y;
int i;
int j;
int k;

void setup()
{
  size(2000, 1000);
  background(240, 240, 240);
  x = 250;
  y = 250;
  j = 1;
  k = 0;

  img = new PImage[9];
  leftImg = new PImage[9];

  for (int i = 0; i < img.length; i++)
  {
    img[i] = loadImage("SeeSnakeMove/Snake" + i + ".gif");
  }
  for (int i = 0; i < leftImg.length; i++)
  {
    leftImg[i] = loadImage("SeeSnakeMove/SnakeLeft" + i + ".gif");
  }
}


void draw()
{
  //image(img[0], x, y, 100, 150);
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
    {
      background(240, 240, 240);
      x = x + 10;
      image(img[j], x, y, 100, 150);
      if (j == img.length-1)
      {
        j = 1;
      }
      j++;
    } else if (keyCode == LEFT) 
    {
      background(240, 240, 240);
      x = x - 10;
      image(leftImg[k], x, y, 100, 150);
      if (k == leftImg.length-1)
      {
        k = 0;
      }
      k++;
    }
  }
}


void keyReleased()
{
  if (keyCode == RIGHT) {
    background(240, 240, 240);
    image(img[0], x, y, 100, 150);
    j = 1;
    k = 0;
  }
  if (keyCode == LEFT) {
    background(240, 240, 240);
    image(leftImg[8], x, y, 100, 150);
    j = 1;
    k = 0;
  }
}
