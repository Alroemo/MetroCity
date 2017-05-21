class Car {
  float x, y;
  //0 = left 1=up 2=right 3=down
  int direction;
  int prevDirection;
  int speed;
  boolean goVert;
  float r, g, b;
  Intersection intersection;

  Car() {

    goVert = true;
    x = -1000;
    speed = 3;
    direction = (int)random(4);
    r = random(255);
    g = random(255);
    b = random(255);
  }

  void display() {
    rectMode(CENTER);
    fill(r, g, b);
    if (this.isHoriz()) {
      rect(x, y, 40, 25, 25);
      fill(200);
      rect(x, y, 25, 15, 30);
      fill(50);   
      rect(x+15, y+10, 10, 5, 5);
      rect(x+15, y-10, 10, 5, 5);
      rect(x-15, y+10, 10, 5, 5);
      rect(x-15, y-10, 10, 5, 5);
    }
    if (this.isVert()) {
      rect(x, y, 25, 40, 25);
      fill(200);
      rect(x, y, 15, 25, 30);
      fill(50);
      rect(x+15, y+10, 5, 10, 5);
      rect(x+15, y-10, 5, 10, 5);
      rect(x-15, y+10, 5, 10, 5);
      rect(x-15, y-10, 5, 10, 5);
    }
  }

  void move(Intersection _intersection) {
    intersection = _intersection;
    //speed += 0.25;
    if (speed < 0)
      speed = 3;

    if (mousePressed)
      goVert = !goVert;

    if (direction == 0) {
      while (y > intersection.y - 13)
        y-= 0.5;
      while (y < intersection.y - 13)
        y+= 0.5;

      x-= speed;
    }

    if (direction == 1) {
      while (x > intersection.x - 13)
        x-= 0.5;
      while (x < intersection.x - 13)
        x+= 0.5;

      y+=speed;
    }
    if (direction == 2) {
      while (y > intersection.y + 13)
        y-= 0.5;
      while (y < intersection.y + 13)
        y+= 0.5;

      x+= speed;
    }
    if (direction == 3) {
      while (x > intersection.x + 13)
        x-= 0.5;
      while (x < intersection.x + 13)
        x+= 0.5;
      y-= speed;
    }

    //if out of bounds
    if (x >= 1000 || x <= -200 || y >=800 || y <= -200) {
      prevDirection = direction;
      direction = (int)random(4);
      r = random(255);
      g = random(255);
      b = random(255);
      startRun(intersection);
    }

    //Random chance to turn
    if ((x >= intersection.x-15 && x <= intersection.x+15) && (y<=intersection.y+15 && y >= intersection.y-15)) {
      prevDirection = direction;
      direction = (int)random(4);
      if (goVert && (direction == 0 || direction == 2))
        speed = 0;
      if (!goVert && (direction == 1 || direction == 3))
        speed = 0;
      speed = 3;
    }
  }//end of move

  void startRun(Intersection _intersection) {
    intersection = _intersection;

    if (direction == 0) {
      x = 0;
      y = intersection.y - 25;
      speed = 3;
    }
    if (direction == 1) {
      x = intersection.x -25;
      y = 0;
      speed = 3;
    }
    if (direction == 2) {
      x = 800;
      y = intersection.y - 25;
      speed = 3;
    }
    if (direction == 3) {
      x = intersection.x + 25;
      y = 600;
      speed = 3;
    }
  }//end of startRun



  void checkCollision(Car car) {
    if (x == car.x && y == car.y) {
      fill(255, 0, 0);
      speed = 0;
      car.speed = 0;
    }
  }

  boolean isVert() {
    if (direction == 1 || direction == 3)
      return true;
    return false;
  }

  boolean isHoriz() {
    if (direction == 0 || direction == 2)
      return true;
    return false;
  }
  boolean isTurning() {
    if ((prevDirection == 0 || prevDirection ==2) && (direction == 1 || direction == 3))
      return true;
    else if ((prevDirection == 1|| prevDirection ==3) && (direction == 2 || direction == 4))
      return true;
    else
      return false;
  }

  void brake(Car car) {
    if (this.isVert()) {
      if (direction == 1) {
        if (y + 5 >= car.y)
          speed = 0;
      }
      if (direction == 3) {
        if (y - 5 <= car.y)
          speed = 0;
      }
    }
    if (this.isHoriz()) {
      if (direction == 0) {
        if (x + 5 >= car.x)
          speed = 0;
      }

      if (direction == 2) {
        if (y - x <= car.x)
          speed = 0;
      }
    }
  }
}

