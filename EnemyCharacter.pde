class EnemyCharacter 
{
  PImage leftImg[];
  PImage rightImg[];
  PImage direction[];
  int enemyX;
  int enemyY;
  int destinationX;
  int destinationY;
  int moveSpeed;
  int speed;
  int left, right;

  EnemyCharacter(int x, int y, int dX, int dY, int sp)
  {
    leftImg = new PImage[4];
    rightImg = new PImage[4];
    direction = new PImage[4];

    enemyX = x;
    enemyY = y;
    destinationX = dX;
    destinationY = dY;
    moveSpeed = sp;
    speed = sp;
    left = enemyX;
    right = destinationX;

    for (int i = 0; i < leftImg.length; i++)
      leftImg[i] = loadImage("Enemy/EnemyLeft" + i + ".png");
    for (int i = 0; i < rightImg.length; i++)
      rightImg[i] = loadImage("Enemy/EnemyRight" + i + ".png");

    direction[0] = rightImg[0];
  }

  void setEnemySpeed(int sp)
  {
    moveSpeed = sp;
  }

  void moveEnemy()
  {


    int i = 1;
    int j = 1;

    enemyX = enemyX + moveSpeed;
    direction[0] = rightImg[i];
    if (i == rightImg.length-1)
      i = 1;
    else
      i++;

    if (enemyX > right) {
      moveSpeed = -speed;
      direction[0] = leftImg[j];
      if (j == leftImg.length-1)
        j = 1;
      else
        j++;
      redraw();
    }

    if (enemyX < left)
    {
      moveSpeed = speed;
      direction[0] = rightImg[i];
      if (i == rightImg.length-1)
        i = 1;
      else
        i++;
      redraw();
    }
  }


  void initializeEnemy()
  {
    image(direction[0], enemyX, enemyY, 50, 50);
  }
}
