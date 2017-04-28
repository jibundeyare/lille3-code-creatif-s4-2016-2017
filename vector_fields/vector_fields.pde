// vector_fields

PImage img1;
PImage img2;
int d = 15;

float facteurVelociteCirculaire = 15;
float facteurAccelerationCirculaire = 15;

Particle p1 = new Particle();
Particle p2 = new Particle();

void setup() {
  size(800, 600);
  blendMode(ADD);
  img1 = loadImage("particle-red.png");
  img2 = loadImage("particle-blue.png");
  imageMode(CENTER);
  background(0);
}

void draw() {
  image(img1, p1.position.x, p1.position.y, d, d);
  image(img2, p2.position.x, p2.position.y, d, d);
  p1.update();
  p2.update();
  p1.limite();
  p2.limite();
}

void keyPressed() {
  if (key == 'a') {
    facteurVelociteCirculaire--;
  } else if (key == 'z') {
    facteurVelociteCirculaire++;
  }

  println("facteurVelociteCirculaire " + facteurVelociteCirculaire);

  if (key == 'q') {
    facteurAccelerationCirculaire--;
  } else if (key == 's') {
    facteurAccelerationCirculaire++;
  }

  println("facteurAccelerationCirculaire " + facteurAccelerationCirculaire);

  p1.reset();
  p2.reset();
}
