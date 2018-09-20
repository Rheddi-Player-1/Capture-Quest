class RectangleBoarder {
  int upperLeftX, upperLeftY;
  int lowerRightX, lowerRightY;
  int direction;

  RectangleBoarder(int x, int y, int width, int height ) {
    upperLeftX = x;
    upperLeftY = y;
    lowerRightX = x+width;
    lowerRightY = y+height;
  }

  boolean ifCollide(RectangleBoarder another) {
    if (this.lowerRightY<=another.upperLeftY && this.upperLeftX>=another.upperLeftX && this.lowerRightX<=another.lowerRightX) {
      return true;
    }
    else
      return false;
  }
}
