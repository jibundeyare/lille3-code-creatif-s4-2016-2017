// @todo ellipse()
// @todo translate() sur un axe
// @todo translate() à la balle de kalachnikov

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

float base;
float top;
float rotationSpeed = 0.005;
float growthSpeed = 0.005;

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 500);
  cam.rotateZ(radians(20));
  cam.rotateY(radians(-20));
}

void draw() {
  background(64, 162, 234);

  pushMatrix();

  translate(0, 0, 0);
  rotateY(radians(90));
  rotateZ(frameCount * rotationSpeed);

  base = 50 * frameCount * growthSpeed;
  top = 100 * frameCount * growthSpeed;

  pyramid(base, top);

  popMatrix();

  pushMatrix();

  translate(0, 0, 0);
  rotateY(radians(-90));
  rotateZ(frameCount * rotationSpeed);

  base = 50 * frameCount * growthSpeed;
  top = 100 * frameCount * growthSpeed;

  pyramid(base, top);

  popMatrix();
}

void pyramid(float base, float top) {
  // base carrée
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
