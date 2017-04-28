int diameter = 10;

float speedRange = 1000;
float angularSpeedRange = 5;
float speedLimit = 20;
PVector position = new PVector();
PVector velocity = new PVector();
PVector acceleration = new PVector();
PVector rotation = new PVector();
float angularAcceleration;

void setup() {
  size(1500, 800);

  // position.x = round(random(0, width));
  // position.y = round(random(0, height));
  position.x = 0;
  position.y = 0;
  velocity.x = 0;
  velocity.y = 0;
  acceleration.x = round(random(-speedRange, speedRange));
  acceleration.y = round(random(-speedRange, speedRange));
  rotation.x = 0;
  rotation.y = 0;
  angularAcceleration = random(-angularSpeedRange, angularSpeedRange);

  println("acceleration " + acceleration);
  println("angularAcceleration " + angularAcceleration);

  background(255);
}

void draw() {
  noStroke();
  fill(0, 200);
  ellipse(position.x, position.y, diameter, diameter);

  tick();
  constrain();
}

void tick() {
  acceleration.add(rotation);
  velocity.add(acceleration);
  velocity.limit(speedLimit);
  position.add(velocity);

  rotation.x = -acceleration.y;
  rotation.y = acceleration.x;
  rotation.normalize();
  rotation.mult(angularAcceleration);
}

void constrain() {
  if (position.x < 0) {
    position.x = width;
  }

  if (position.x > width) {
    position.x = 0;
  }

  if (position.y < 0) {
    position.y = height;
  }

  if (position.y > height) {
    position.y = 0;
  }
}

