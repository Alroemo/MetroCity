class Cloud {
  float x, y, width, height;

  Cloud() {
    x = random(-100, 800);
    y = random(600);
    width = random(180, 280);
    height = random(50, 100);
  } 
  void display() {
    noStroke();
    fill(230, 230, 230, 200);
    ellipse(x, y, width, height);

    if (x > 850) {
      x = -random(150);
      y = random(600);
    }
    x+= random(5);
  }
}

