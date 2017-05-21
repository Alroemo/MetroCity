class Intersection {
  float x, y;
  boolean vertGreen;
  boolean horizGreen;
  int timer;
  int baseTime = - 250;

  Intersection(int _x, int _y) {
    vertGreen = false;
    horizGreen = true;
    x = _x;
    y = _y;
    //400,300
    timer = baseTime;
  } 

  void display() {

    if (horizGreen) {
      fill(0, 255, 0);
    } else if (!horizGreen) {
      fill(255, 0, 0);
    }
    rect(x-30, y-25, 5, 50);
    rect(x+25, y-25, 5, 50);

    //draws vertical traffic lights
    if (vertGreen) {
      fill(0, 255, 0);
    } else if (!vertGreen) {
      fill(255, 0, 0);
    }
    rect(x-25, y-30, 50, 5);
    rect(x-25, y + 25, 50, 5);



    if (timer >= 0||keyPressed) {
      vertGreen = !vertGreen;
      horizGreen = !horizGreen;
      timer = baseTime;
    }
    timer ++;
    println(timer);
  }//end of display

  boolean isVert() {
    if (vertGreen)
      return true;
    return false;
  }
  boolean isHoriz() {
    if (horizGreen)
      return true;
    return false;
  }
}
