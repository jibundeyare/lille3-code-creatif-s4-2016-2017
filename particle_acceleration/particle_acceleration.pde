int particles = 10000;
Particle[] p = new Particle[particles];
int d = 5;
boolean attract = false;
PVector mousePos;

void setup() {
  size(1000, 800, P3D);

  blendMode(ADD);

  for (int i = 0; i < particles; i++) {
    p[i] = new Particle();
  }
}

void draw() {
  background(0);

  noStroke();

  for (int i = 0; i < particles; i++) {
    if (attract) {
      mousePos = new PVector(mouseX, mouseY);
      p[i].acc = mousePos.sub(p[i].pos);
    }

    p[i].update();
    p[i].constrain();

    if (p[i].ttl == 0) {
      p[i] = new Particle();
    }

    fill(p[i].ttl, 50, 50);

    pushMatrix();
    translate(p[i].pos.x, p[i].pos.y);
    ellipse(0, 0, d, d);
    popMatrix();
  }
}

void mousePressed() {
  attract = !attract;
}

