int rows = 10;
int columns = 10;

PVector[] field = new PVector[rows * columns];
PVector friction = new PVector();
Particle p = new Particle();

void setup() {
  size(800, 600);
}

void draw() {
  //background(200);

  ellipse(p.position.x, p.position.y, 20, 20);
  p.update();
}
