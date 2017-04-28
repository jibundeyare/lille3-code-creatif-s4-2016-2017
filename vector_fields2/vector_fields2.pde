// vector_fields2

PImage img;
PImage img2;
int d = 30;

Particule p = new Particule();
Particule p2 = new Particule();

int rows = 100;
int columns = 100;
float cellWidth;
float cellHeight;

PVector[][] grille = new PVector[rows][columns];
int mul = 1;

void setup() {
  size(800, 600);
  // blendMode(ADD);
  img = loadImage("particule-rouge.png");
  img2 = loadImage("particule-bleue.png");
  imageMode(CENTER);

  cellWidth = (float) width / columns;
  cellHeight = (float) height / rows;

  initField();

  background(0);
}

void draw() {
  image(img, p.position.x, p.position.y, d, d);
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

      if (p.position.x >= left && p.position.x < right
        && p.position.y >= top && p.position.y < bottom) {
        p.update(grille[i][j]);
        p.limite();
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