class EnemyCharacter 
{
  PImage leftImg[];
  PImage rightImg[];
  int enemyX;
  int enemyY;
  int destinationX;
  int destinationY;
  int moveSpeed;
  
  EnemyCharacter(int x, int y, int dX, int dY, int sp)
  {
    leftImg = new PImage[4];
    rightImg = new PImage[4];
    
    enemyX = x;
    enemyY = y;
    destinationX = dX;
    destinationY = dY;
    moveSpeed = sp;
    
    for(int i = 0; i < leftImg.length; i++)
      leftImg[i] = loadImage("Enemy/EnemyLeft" + i + ".png");
    for(int i = 0; i < rightImg.length; i++)
      rightImg[i] = loadImage("Enemy/EnemyRight" + i + ".png");
  }
  
  void setEnemySpeed(int sp)
  {
    moveSpeed = sp;
  }
    
  void moveEnemy()
  {
   boolean keepMoving = true;
   int orginX = enemyX;
   int orginY = enemyY;
   int i = 1;
   int j = 1;
  
   while(keepMoving)
   {
     if(enemyX < destinationX)
     {
       enemyX = enemyX - moveSpeed;
       image(rightImg[i], enemyX, enemyY);
       if(i == rightImg.size)
         i = 1;
       else
         i++;
     }
     else if(enemyX >= destinationX && enemyX != orginX)
     {
       enemyX = enemyX + moveSpeed;
       image(leftImg[i], enemyX, enemyY);
       if(j == rightImg.size)
         j = 1;
       else
         j++;
     }
       
   }
  }
  
  void initializeEnemy()
  {
    if(enemyX < destinationX)
      image(rightImg[0], enemyX, enemyY);
    else if(enemyX > destinationX)
      image(leftImg[0], enemyX, enemyY);
  }
  
}
