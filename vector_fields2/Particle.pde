class Particule {
  PVector position = new PVector();
  PVector velocite = new PVector();
  PVector acceleration = new PVector();
  float vitesseMax = 20;

  Particule() {
    position.x = random(0, width);
    position.y = random(0, height);
    velocite.x = random(-10, 10);
    velocite.y = random(-10, 10);
    acceleration.x = random(-10, 10);
    acceleration.y = random(-10, 10);
  }

  void update(PVector acceleration) {
    this.acceleration = acceleration;
    velocite.add(acceleration);
    velocite.limit(vitesseMax);
    position.add(velocite);
  }

  void update() {
    update(this.acceleration);
  }

  void limite() {
    if (position.x < 0) {
      position.x = width - 1;
    }

    if (position.x > width) {
      position.x = 0;
    }

    if (position.y < 0) {
      position.y = height - 1;
    }

    if (position.y > height) {
      position.y = 0;
    }

  }
}