import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 500);
}

void draw() {
  background(255);

  translate(0, 0, 0);
  rotateX(radians(-90));

  // square base
  beginShape();
  vertex(0, 0, 0);
  vertex(0, 0, 0);
  // ...
  endShape(CLOSE);

  // face 1
  beginShape(TRIANGLES);
  endShape();

  // face 2


  // face 3


  // face 4
}

