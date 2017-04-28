PImage img1;
PImage img2;
int d = 15;

float circularVelocityRatio = 15;
float circularAccelerationRatio = 15;

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
    circularVelocityRatio--;
  } else if (key == 'z') {
    circularVelocityRatio++;
  }

  println("circularVelocityRatio " + circularVelocityRatio);

  if (key == 'q') {
    circularAccelerationRatio--;
  } else if (key == 's') {
    circularAccelerationRatio++;
  }

  println("circularAccelerationRatio " + circularAccelerationRatio);

  p1.reset();
  p2.reset();
}