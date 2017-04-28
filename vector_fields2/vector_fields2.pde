// vector_fields2

PImage img1;
PImage img2;
int d = 30;

Particle p1 = new Particle();
Particle p2 = new Particle();

int rows = 100;
int columns = 100;
float cellWidth;
float cellHeight;

PVector[][] grille = new PVector[rows][columns];
int mul = 1;

void setup() {
  size(800, 600);
  // blendMode(ADD);
  img1 = loadImage("particle-red.png");
  img2 = loadImage("particle-blue.png");
  imageMode(CENTER);

  cellWidth = (float) width / columns;
  cellHeight = (float) height / rows;

  initField();

  background(0);
}

void draw() {
  image(img1, p1.position.x, p1.position.y, d, d);
  image(img2, p2.position.x, p2.position.y, d, d);

  float left;
  float right;
  float top;
  float bottom;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      left = i * cellWidth;
      right = i * cellWidth + cellWidth;
      top = j * cellHeight;
      bottom = j * cellHeight + cellHeight;

      if (p1.position.x >= left && p1.position.x < right
        && p1.position.y >= top && p1.position.y < bottom) {
        p1.update(grille[i][j]);
        p1.limite();
      }

      if (p2.position.x >= left && p2.position.x < right
        && p2.position.y >= top && p2.position.y < bottom) {
        p2.update(grille[i][j]);
        p2.limite();
      }
    }
  }

  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
}

void initField() {
  float theta;
  PVector v;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      theta = noise(i, j) * TWO_PI;
      v = PVector.fromAngle(theta);
      v.mult(mul);
      grille[i][j] = v;
    }
  }
}

void keyPressed() {
  if (key == 'a') {
    mul++;
  } else if (key == 'z') {
    mul--;
  }

  println("mul " + mul);

  initField();
}
