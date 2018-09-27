import processing.sound.*;

SoundFile file;
Character playChar;
Platform plat;
TitleScreen title;
PImage background;


void setup()
{
  background = loadImage("thiefBackground.png");
  title = new TitleScreen();
  playChar = new Character(550, 50, 50, 50, 5, 20, 10);
  plat = new Platform(1);
  SoundFile file = new SoundFile(this,"game_themesong.wav");
  file.loop();
  size(2000, 1000);
}


void draw()
{
  background(255, 255, 255);
  image(background, 1000, 500);
  playChar.initializeChar();
  playChar.getEnemy();
  plat.position();
  title.showTitle();


  playChar.gravity();
  playChar.moveCharLeft();
  playChar.moveCharRight();
  playChar.dodge();
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
}
