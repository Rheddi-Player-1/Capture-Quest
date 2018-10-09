import processing.sound.*;

SoundFile file;
Character playChar, playChar2;
Platform plat;
TitleScreen title;
PImage background;
float gkeyX, gkeyY;


void setup()
{
  reset();
  SoundFile file = new SoundFile(this, "game_themesong.wav");
  file.loop();
  size(2000, 1000);
}

void reset()
{
  background = loadImage("thiefBackground.png");
  title = new TitleScreen();
  playChar = new Character(550, 50, 50, 50, 5, 20, 10);
  playChar2 = new Character(600, 50, 50, 50, 5, 20, 10);

  plat = new Platform(1);
}


void draw()
{
  background(255, 255, 255);
  image(background, 1000, 500);
  playChar.initializeChar();
  playChar2.initializeChar();
  if (playChar.goldKey==0 || playChar2.goldKey==0) {
    image(loadImage("key.png"), gkeyX=1400, gkeyY=550);
  }

  //text:
  textSize(32);
  //image(loadImage("thiefRight0.png"), 200, 150,200,200);
  //image(loadImage("thiefRight0.png"), 1700,150,200,200);
  text("Lifes: "+playChar.life, 100, 400);
  text("Lifes: "+playChar2.life, 1600, 400);
  text("player1 X: "+playChar.charXPos, 100, 450);
  text("player1 Y: "+playChar.charYPos, 100, 500);
  text("player2 X: "+playChar2.charXPos, 1600, 450);
  text("player2 Y: "+playChar2.charYPos, 1600, 500);
  text("player1 Max Speed: "+playChar.charSpeed, 100, 550);
  text("player2 Max Speed: "+playChar2.charSpeed, 1600, 550);
  text("player1 keys: "+playChar.goldKey, 100, 650);
  text("player2 keys: "+playChar2.goldKey, 1600, 650);
  text("player1 Points: "+playChar.points, 100, 700);
  text("player1 Points: "+playChar2.points, 1600, 700);

  playChar.getEnemy();
  playChar2.getEnemy();
  plat.position();
  title.showTitle();


  // reset the game.
  if (playChar.life==0 && playChar2.life==0) {
    reset();
  }


  playChar.gravity();
  playChar.moveCharLeft();
  playChar.moveCharRight();
  playChar.dodge();
  playChar.getKey();

  playChar2.gravity();
  playChar2.moveCharLeft();
  playChar2.moveCharRight();
  playChar2.dodge();
  playChar2.getKey();
}

void keyPressed() 
{
  if (key == ENTER) {
    title.clearTitle();
  }

  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
    {
      //playChar.moveCharRight();
      playChar.right=1;
    }
    if (keyCode == UP) {
      playChar.jump=1;
    } else if (keyCode == LEFT) 
    {
      //playChar.moveCharLeft();
      playChar.left=1;
    }
  }
  if (key=='w'||key=='W') {
    playChar2.jump=1;
  }
  if (key=='a'||key=='A') {
    playChar2.left=1;
  }
  if (key=='d'||key=='D') {
    playChar2.right=1;
  }
}


void keyReleased()
{

  if (keyCode == RIGHT) {
    playChar.keyReleaseRight();
    playChar.right=0;
  } else if (keyCode == LEFT) {
    playChar.keyReleaseLeft();
    playChar.left=0;
  }
  if (keyCode == UP) {
    playChar.jump=0;
  }
  if (key=='w'||key=='W') {
    playChar2.jump=0;
  }
  if (key=='a'||key=='A') {
    playChar2.keyReleaseLeft();
    playChar2.left=0;
  }
  if (key=='d'||key=='D') {
    playChar2.keyReleaseRight();
    playChar2.right=0;
  }
}
