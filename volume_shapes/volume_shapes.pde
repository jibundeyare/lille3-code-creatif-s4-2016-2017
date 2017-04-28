import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int shapes = 100;
int x;
int y;
int z;

void setup() {
  size(1024, 768, P3D);

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);

  blendMode(ADD);

  //hint(ENABLE_STROKE_PERSPECTIVE);
  hint(DISABLE_DEPTH_MASK);
}

void draw() {
  background(0);

  for (int i = 0; i < shapes; i++) {
    rotateX(1.0 / TWO_PI * i);
    x = round(random(100, 100));
    y = round(random(100, 100));
    z = round(random(100, 100));

    beginShape(TRIANGLES);
    vertex(x + 30, y + 75, z + 0);
    vertex(x + 40, y + 20, z + 0);
    vertex(x + 50, y + 75, z + 0);
    endShape();
  }

  for (int i = 0; i < shapes; i++) {
    rotateY(1.0 / TWO_PI * i);
    x = round(random(100, 100));
    y = round(random(100, 100));
    z = round(random(100, 100));

    beginShape(TRIANGLES);
    vertex(x + 30, y + 75, z + 0);
    vertex(x + 40, y + 20, z + 0);
    vertex(x + 50, y + 75, z + 0);
    endShape();
  }

  for (int i = 0; i < shapes; i++) {
    rotateZ(1.0 / TWO_PI * i);
    x = round(random(100, 100));
    y = round(random(100, 100));
    z = round(random(100, 100));

    beginShape(TRIANGLES);
    vertex(x + 30, y + 75, z + 0);
    vertex(x + 40, y + 20, z + 0);
    vertex(x + 50, y + 75, z + 0);
    endShape();
  }
}

