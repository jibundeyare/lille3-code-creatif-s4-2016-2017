// vector_fields

PImage img;
PImage img2;
int d = 15;

float facteurVelociteCirculaire = 15;
float facteurAccelerationCirculaire = 15;

Particule p = new Particule();
Particule p2 = new Particule();

void setup() {
  size(800, 600);
  blendMode(ADD);
  img = loadImage("particule-rouge.png");
  img2 = loadImage("particule-bleue.png");
  imageMode(CENTER);
  background(0);
}

void draw() {
  image(img, p.position.x, p.position.y, d, d);
  image(img2, p2.position.x, p2.position.y, d, d);
  p.update();
  p2.update();
  p.limite();
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

  p.reset();
  p2.reset();
}