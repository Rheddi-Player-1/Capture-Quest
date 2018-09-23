class RectangleBoarder {
  int x1, y1; //x1 is upperLeftX, y1 is upperLeftY
  int x2, y2; //x2 is lowerRightX, y2 is lowerRightY
  int direction;

  RectangleBoarder(int x, int y, int w, int h ) {
    x1 = x;
    y1 = y;
    x2 = x+w;
    y2 = y+h;
  }

  boolean ifCollide(int x1, int y1, int x2, int y2) {
    if (this.x2>=x1 && this.x2<=x2 && this.y2>=y1 && this.y2<=y2 ) {
      return true;
    }
    else
      return false;
  }
  
  
  int getx1(){
    return this.x1;
  }
  int getx2(){
    return this.x2;
  }
  int gety1(){
    return this.y1;
  }
  int gety2(){
    return this.y2;
  }
  
}
