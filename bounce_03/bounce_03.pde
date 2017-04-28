int elements = 50;

int[] x = new int[elements];
int[] y = new int[elements];
int[] velocityX = new int[elements];
int[] velocityY = new int[elements];
int[] shapeHeight = new int[elements];
int[] shapeWidth = new int[elements];
int[] shapeColor = new int[elements];
int borderTop;
int borderBottom;
int borderLeft;
int borderRight;

void setup() {
  size(800, 600);

  for (int i = 0; i < elements; i++) {
    velocityX[i] = round(random(-5, 5));
    velocityY[i] = round(random(-5, 5));

    if (velocityX[i] == 0) {
      velocityX[i] = 1;
    }

    if (velocityY[i] == 0) {
      velocityY[i] = 1;
    }

    shapeWidth[i] = 20;
    shapeHeight[i] = 20;

    shapeColor[i] = color(116, 30, round(random(100, 200)), 10);

    x[i] = round(random(shapeWidth[i], width - shapeHeight[i]));
    y[i] = round(random(shapeHeight[i], height - shapeHeight[i]));
  }

  borderTop = 0 + shapeHeight[0] / 2;
  borderBottom = height - shapeHeight[0] / 2;
  borderLeft = 0 + shapeWidth[0] / 2;
  borderRight = width - shapeWidth[0] / 2;

  noStroke();

  background(237, 216, 22);
}

void draw() {
  for (int i = 0; i < elements; i++) {
    if (x[i] >= borderRight || x[i] <= borderLeft) {
      velocityX[i] = velocityX[i] * -1;
    }

    if (y[i] >= borderBottom || y[i] <= borderTop) {
      velocityY[i] = velocityY[i] * -1;
    }

    x[i] = x[i] + velocityX[i];
    y[i] = y[i] + velocityY[i];

    fill(shapeColor[i]);
    ellipse(x[i], y[i], shapeWidth[i], shapeHeight[i]);
  }
}

