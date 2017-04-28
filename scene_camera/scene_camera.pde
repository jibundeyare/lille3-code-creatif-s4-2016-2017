import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

int col = 800;
int row = 800;
int cellWidth = 10;
int cellHeight = 10;

PeasyCam cam;
PGraphics pg;

void setup() {
  size(1000, 800, P3D);
  cam = new PeasyCam(this, 1000);

  pg = createGraphics(col * cellWidth, row * cellHeight);
  drawGrid();
}

void draw() {
  background(255);

  pushMatrix();
  rotateX(PI / 4);
  translate(-pg.width / 2.0, -pg.height / 2.0, 0);
  image(pg, 0, 0, pg.width, pg.height);
  popMatrix();
}

void drawGrid() {
  pg.beginDraw();
  pg.noStroke();
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      if (i % 2 == 0 && j % 2 == 0) {
        // even columns & even rows
        pg.fill(255);
      } else if (i % 2 == 0 && j % 2 != 0) {
        // even columns & odd rows
        pg.fill(0);
      } else if (i % 2 != 0 && j % 2 == 0) {
        // odd columns & even rows
        pg.fill(0);
      } else /*if (i % 2 != 0 && j % 2 != 0)*/ {
        // odd columns & odd rows
        pg.fill(255);
      }

      pg.pushMatrix();
      pg.translate(i * cellWidth, j * cellHeight);
      pg.rect(0, 0, cellWidth, cellHeight);
      pg.popMatrix();
    }
  }
  pg.endDraw();
}

