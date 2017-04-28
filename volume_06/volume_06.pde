import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

float base;
float top;
float rotationSpeed = 0.01;
float growthSpeed = 0.01;

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 500);
}

void draw() {
  background(64, 162, 234);

  translate(0, 0, 0);
  rotateX(radians(90));
  rotateZ(frameCount * rotationSpeed);

  base = 50 * frameCount * growthSpeed;
  top = 100 * frameCount * growthSpeed;

  pyramid(base, top);
}

void pyramid(float base, float top) {
  // square base
  beginShape();
  vertex(-base, -base, 0);
  vertex(base, -base, 0);
  vertex(base, base, 0);
  vertex(-base, base, 0);
  endShape(CLOSE);

  // face 1
  beginShape(TRIANGLES);
  vertex(-base, -base, 0);
  vertex(base, -base, 0);
  vertex(0, 0, top);
  endShape();

  // face 2
  beginShape(TRIANGLES);
  vertex(base, -base, 0);
  vertex(base, base, 0);
  vertex(0, 0, top);
  endShape();

  // face 3
  beginShape(TRIANGLES);
  vertex(base, base, 0);
  vertex(-base, base, 0);
  vertex(0, 0, top);
  endShape();

  // face 4
  beginShape(TRIANGLES);
  vertex(-base, base, 0);
  vertex(-base, -base, 0);
  vertex(0, 0, top);
  endShape();
}

