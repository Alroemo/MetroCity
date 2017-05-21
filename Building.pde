class Building {
  int x, y, width, height;
  float randAngle= random(30);
  Building(int _x, int _y, int _width, int _height) {
    x = _x;
    y = _y;
    width = _width;
    height = _height;
    //randAngle = random(30);
  }
  void display() {
    fill(0, 230, 0);
    rectMode(CORNER);
    rect(x, y, width, height, 30);

    fill(100);
    rect(x+ 10, y+10, width - 20, height - 20, 30);

    fill(165);
    rect(x+20, y+20, width - 40, height - 40, 30);

    fill(50);
    stroke(1);
    line(x + (width/2), y+20, x + (width/2), y + height-20);
    line(x+20, y + (height/2), x + width-20, y + (height/2)); 
    /*
    for(int i = 0; i < 4; i++){
     fill(200,0,0);
     ellipse(random(x,x+width),random(y,y+height),5,5);
     }
     */
  }
}

