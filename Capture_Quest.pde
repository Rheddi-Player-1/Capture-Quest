Character playChar;
Platform plat;
TitleScreen title;

void setup()
{
  title = new TitleScreen();
  playChar = new Character(500, 50, 150, 100, 10, 20, 10);
  plat = new Platform(1);
  size(2000, 1000);

}


void draw()
{
  background(255,255,255);
  playChar.initializeChar();
  plat.position();
  title.showTitle();
  
  playChar.gravity();
  
  
}

void keyPressed() 
{
  if(key == ENTER){
    title.clearTitle();
  }
  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
    {
      playChar.moveCharRight();

    }
    else if (keyCode == LEFT) 
    {
      playChar.moveCharLeft();
      

    }
  
    }
  }


void keyReleased()
{

  if (keyCode == RIGHT) 
    playChar.keyReleaseRight();
  else if (keyCode == LEFT) 
    playChar.keyReleaseLeft();
}
