class Particule {
  PVector position = new PVector();
  PVector velocite = new PVector();
  PVector acceleration = new PVector();
  float vitesseMax = 20;
  float velociteCirculaire;
  float accelerationCirculaire;

  Particule() {
    position.x = random(0, width);
    position.y = random(0, height);
    velocite.x = random(-10, 10);
    velocite.y = random(-10, 10);
    acceleration.x = random(-10, 10);
    acceleration.y = random(-10, 10);

    reset();
  }

  void reset() {
    velociteCirculaire = random(-HALF_PI, HALF_PI) / facteurVelociteCirculaire;
    accelerationCirculaire = random(-HALF_PI, HALF_PI) / facteurAccelerationCirculaire;
  }

  void update() {
    acceleration.rotate(velociteCirculaire);
    velocite.add(acceleration);
    velocite.limit(vitesseMax);
    position.add(velocite);
  }

  void limite() {
    if (position.x < 0) {
      position.x = width;
    }

    if (position.x > width) {
      position.x = 0;
    }

    if (position.y < 0) {
      position.y = height;
    }

    if (position.y > height) {
      position.y = 0;
    }

  }
}