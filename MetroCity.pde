int carCount;

Car cars[] = new Car[carCount];

Spotter spotter[] = new Spotter[500];
Intersection intersect[] = new Intersection[2];
Building building[] = new Building[6];
Cloud clouds[] = new Cloud[10];
float r, g, b;

void setup() {
  frameRate(60);
  size(800, 600);
  carCount = 20;
  cars = new Car[carCount];


  for (int i = 0; i < cars.length; i++) {

    cars[i] = new Car(); 

    spotter[i] = new Spotter(cars[i]);

    r = random(255);
    g = random(255);
    b = random(255);
  }


  intersect[0] = new Intersection(200, 300);
  intersect[1] = new Intersection(600, 300);
  for (int j = 0; j < clouds.length; j++) {
    clouds[j] = new Cloud();
  }
}

void draw() {
  if (mousePressed) {
    carCount++;
  }
  background(200);

  rectMode(CORNER);
  noStroke();
  fill(150);                                                                                           

  rect(170, 0, 60, 800);
  rect(570, 0, 60, 800);
  rect(0, 275, 800, 60);

  building[0] = new Building(0, -30, 160, 280);
  building[1] = new Building(250, -30, 300, 280);
  building[2] = new Building(645, -30, 165, 280);
  building[3] = new Building(0, 345, 160, 270);
  building[4] = new Building(250, 345, 300, 280);
  building[5] = new Building(645, 345, 165, 270);

  for (int j = 0; j < building.length; j++) {
    building[j].display();
  }
  stroke(1);
  for (int i = 0; i < intersect.length; i++) {
    intersect[i].display();
  }

  for (int i = 0; i < cars.length; i+=2) {

    fill(r, g, b);
    cars[i].display();
    cars[i+1].display();
    cars[i].move(intersect[0]);
    cars[i+1].move(intersect[1]);
    spotter[i].display();
    for (int j = 0; j < cars.length; j++) {
      //cars[i].brake(cars[j]);
      //cars[i+1].brake(cars[j]);
    }
  }

  for (int i = 0; i < cars.length; i++) {
    if (cars[i].x < -100 || cars[i].x > 900 || cars[i].y < -100 || cars[i].y > 700)
    {
      r = random(255);
      g = random(255);
      b = random(255);
    }


    for (int k = 0; k < intersect.length; k++) {
      if (intersect[k].isVert()) {
        if (cars[i].x > (intersect[k].x-15) && cars[i].x < (intersect[k].x + 55) && !cars[i].isTurning()) {
          if (cars[i].isHoriz())
            cars[i].speed = 0;
          else if (cars[i].isVert())
            cars[i].speed = 3;
        }
        //else
        //cars[i].speed += 1;
      } else if (intersect[k].isHoriz()) {
        if (cars[i].y > (intersect[k].y -15) && cars[i].y < (intersect[k].y + 55) && !cars[i].isTurning()) {
          if (cars[i].isHoriz())
            cars[i].speed = 3;
          else if (cars[i].isVert())
            cars[i].speed = 0;
        }
        //else
        //cars[i].speed += 1;
      }
    }
  }//end of loop
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display();
  }
}//end of draw

