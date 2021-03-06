class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  int ttl;

  Particle(PVector pos, PVector vel, PVector acc, int ttl) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.ttl = ttl;
  }

  Particle() {
    pos = new PVector();
    pos.x = random(0, width);
    pos.y = random(0, height);

    vel = PVector.random2D();
    vel.mult(3);

    acc = PVector.random2D();

    ttl = round(random(100, 255));
  }

  void update() {
    ttl--;
    pos.add(vel);
  }

  void constrain() {
    if (pos.x < 0) {
      pos.x = width + pos.x;
    }

    if (pos.x > width) {
      pos.x = pos.x - width;
    }

    if (pos.y < 0) {
      pos.y = height + pos.y;
    }

    if (pos.y > height) {
      pos.y = pos.y - height;
    }
  }
}

