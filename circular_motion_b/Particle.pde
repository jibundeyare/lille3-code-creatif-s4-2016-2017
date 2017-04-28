class Particle {
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float vitesseMax = 20;
  float circularVelocity;
  float circularAcceleration;

  Particle() {
    position.x = random(0, width);
    position.y = random(0, height);
    velocity.x = random(-10, 10);
    velocity.y = random(-10, 10);
    acceleration.x = random(-10, 10);
    acceleration.y = random(-10, 10);

    reset();
  }

  void reset() {
    circularVelocity = random(-HALF_PI, HALF_PI) / circularVelocityRatio;
    circularAcceleration = random(-HALF_PI, HALF_PI) / circularAccelerationRatio;
  }

  void update() {
    acceleration.rotate(circularVelocity);
    velocity.add(acceleration);
    velocity.limit(vitesseMax);
    position.add(velocity);
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

