Character playChar;

void setup()
{
  playChar = new Character(250, 250, 150, 100, 10, 20, 10);
  size(2000, 1000);
  background(255, 255, 255);
}


void draw()
{
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
