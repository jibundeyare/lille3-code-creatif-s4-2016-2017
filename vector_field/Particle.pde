class Particle {
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float maxSpeed = 20;
  float circularVelocity;
  float circularAcceleration;

  Particle() {
    position.x = random(0, width);
    position.y = random(0, height);

    velocity.x = random(-5, 5);
    velocity.y = random(-5, 5);
    acceleration.x = random(-5, 5);
    acceleration.y = random(-5, 5);

    circularVelocity = random(0, HALF_PI) / 15;
    circularAcceleration = random(0, HALF_PI) / 15;
  }

  void update() {
    /*circularVelocity += circularAcceleration;

    if (circularVelocity > PI) {
      circularVelocity = 0;
    }*/

    acceleration.rotate(circularVelocity);

    velocity.add(acceleration);
    velocity.limit(maxSpeed);

    position.add(velocity);

    checkBorders();
  }

  void checkBorders() {
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
