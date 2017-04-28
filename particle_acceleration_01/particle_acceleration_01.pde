int particles = 100;
Particle[] p = new Particle[particles];
int d = 10;

void setup() {
  size(1000, 800, P3D);
  p = new Particle();
}

void draw() {
  background(0);

  p.update();
  p.constrain();

  noStroke();
  fill(255);

  pushMatrix();
  translate(p.pos.x, p.pos.y);
  ellipse(0, 0, d, d);
  popMatrix();
}

