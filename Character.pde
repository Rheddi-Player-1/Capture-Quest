import processing.sound.*;

RectangleBoarder[] rectangle;
EnemyCharacter[] enemy;
SoundFile bad;

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
  int highLimit;
  int lowLimit;
  int jump=0;
  int left=0;
  int right=0;
  int limit;
  int life=5;
  int goldKey=0;
  int points=500;

  // SoundFile bad = new SoundFile(this, "bad_item_negsound.wav");




  RectangleBoarder ninja;
  RectangleBoarder[] rectangle = new RectangleBoarder[7];
  EnemyCharacter[] enemy = new EnemyCharacter[3];
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
    highLimit = charYPos - 50;
    lowLimit = charYPos;    


    leftImg = new PImage[4];
    rightImg = new PImage[4];
    direction = new PImage[4];




    rectangle[0] = new RectangleBoarder(450, 0, 50, 1000);
    rectangle[1] = new RectangleBoarder(1500, 0, 50, 1000);
    rectangle[2] = new RectangleBoarder(500, 200, 400, 50);
    rectangle[3] = new RectangleBoarder(800, 400, 400, 50);
    rectangle[4] = new RectangleBoarder(1100, 600, 400, 50);
    rectangle[5] = new RectangleBoarder(750, 800, 400, 50);
    rectangle[6] = new RectangleBoarder(500, 950, 1000, 50);

    enemy[0] = new EnemyCharacter(820, 375, 1170, 370, 3);
    enemy[1] = new EnemyCharacter(760, 775, 1140, 770, 7);
    enemy[2] = new EnemyCharacter(1100, 575, 1450, 570, 5);


    for (int i = 0; i < rightImg.length; i++)
    {
      rightImg[i] = loadImage("thiefRight" + i + ".png");
    }

    direction[0] = rightImg[0];

    for (int i = 0; i < leftImg.length; i++)
    {
      leftImg[i] = loadImage("thiefLeft" + i + ".png");
    }
  }

  void gravity() {
    ninja = new RectangleBoarder(charXPos, charYPos, tall, wide);

    // System.out.println(ninja.x1 + "," + ninja.x2 + ", " + ninja.y2);
    if (jump==0) {
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
    } else {
      //System.out.println("y: " + rectangle[2].gety1());
      charYPos = charYPos -15;
      for (int i=2; i<=6; i++) {
        
        if (charYPos<rectangle[i].gety1()+20 && charYPos>=rectangle[i].gety1()) {
          jump=0;
        }

      }
    }
  }

  void dodge() {
    ninja = new RectangleBoarder(charXPos, charYPos, tall, wide);
    for (int i=0; i<=2; i++) {
      if (ifTouch(charXPos, charYPos, enemy[i].enemyX, enemy[i].enemyY)) {
        life--;
        points-=100;
        if(life>0){
        charXPos = 550;
        charYPos = 50;}
        else{
          charXPos = 2300;
          
        }
        
        
        redraw();
        return;
      }
    }
  }
  
  void getKey() {
    if (ifTouch(charXPos, charYPos, 1400, 550)) {
      goldKey = 1;
     }
  }


  // x1,y1 is ninja,   x2,y2 is enemy
  boolean ifTouch(int x1, int y1, int x2, int y2) {
    if (x1>x2-25 && x1<x2+25 && y1+50>y2 && y1+50<y2+50)
      return true;
    else
      return false;
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
    if (left==1) {
      ninja = new RectangleBoarder(charXPos, charYPos, tall, wide);
      if (ninja.ifCollideLeft(rectangle[0].x2)) {

        return;
      }
      // System.out.println(ninja.x1 + ", " + rectangle[0].x2) ; 
      vx = -1*charSpeed;
      charXPos = charXPos + vx;
      direction[0] = leftImg[k];
      if (k == leftImg.length-1)
      {
        k = 0;
      }
      k++;

      redraw();
    } else return;
  }

  void moveCharRight()
  {  
    if (right==1) {
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
    } else
      return;
  }

  void keyReleaseRight()
  {
    direction[0] = rightImg[0];
    j = 1;
    k = 0;
    //direction[0] = rightImg[j];
    //if (j == rightImg.length - 1)
    //{
    //  j = 1;
    //}
    //j++;

    redraw();
  }

  void keyReleaseLeft()
  {
    direction[0] = leftImg[0];
    j = 1;
    k = 0;
    //direction[0] = leftImg[k];
    //if (k == leftImg.length-1)
    //{
    // k = 0;
    //}
    //k++;


    redraw();
  }


  void moveCharJump()
  {
  }

  void getEnemy() {
    for (int i=0; i<enemy.length; i++)
    {
      enemy[i].moveEnemy();
      enemy[i].initializeEnemy();
    }
  }



  void initializeChar()
  {
    image(direction[0], charXPos, charYPos, tall, wide);

    //charXPos = charXPos + vx;
  }
}
