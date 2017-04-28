import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

float base = 50;
float top = 100;
float rotationSpeed = 0.01;
float growthSpeed = 0.01;
float growth;

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 500);
}

void draw() {
  background(64, 162, 234);

  translate(0, 0, 0);
  rotateX(radians(90));
  rotateZ(frameCount * rotationSpeed);

  growth = frameCount * growthSpeed;

  // square base
  beginShape();
  vertex(-base * growth, -base * growth, 0);
  vertex(base * growth, -base * growth, 0);
  vertex(base * growth, base * growth, 0);
  vertex(-base * growth, base * growth, 0);
  endShape(CLOSE);

  // face 1
  beginShape(TRIANGLES);
  vertex(-base * growth, -base * growth, 0);
  vertex(base * growth, -base * growth, 0);
  vertex(0, 0, top * growth);
  endShape();

  // face 2
  beginShape(TRIANGLES);
  vertex(base * growth, -base * growth, 0);
  vertex(base * growth, base * growth, 0);
  vertex(0, 0, top * growth);
  endShape();

  // face 3
  beginShape(TRIANGLES);
  vertex(base * growth, base * growth, 0);
  vertex(-base * growth, base * growth, 0);
  vertex(0, 0, top * growth);
  endShape();

  // face 4
  beginShape(TRIANGLES);
  vertex(-base * growth, base * growth, 0);
  vertex(-base * growth, -base * growth, 0);
  vertex(0, 0, top * growth);
  endShape();
}

