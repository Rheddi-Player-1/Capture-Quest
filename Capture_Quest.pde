Character playChar;
Platform plat;

void setup()
{

  playChar = new Character(500, 50, 150, 100, 10, 20, 10);
  plat = new Platform(1);
  size(2000, 1000);
  background(255, 255, 255);
}


void draw()
{
  background(255,255,255);
  plat.position();
  playChar.initializeChar();
  
}

void keyPressed() 
{
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
