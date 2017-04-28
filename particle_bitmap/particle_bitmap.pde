PGraphics pg;

// red
color c1 = color(255, 1, 1, 1);

// orange
color c2 = color(255, 127, 1, 4);

// blue
// color c1 = color(1, 1, 255, 1);

// green
// color c2 = color(1, 255, 1, 4);

// yellow
color c3 = color(255, 255, 1, 20);

// white
color c4 = color(255, 255, 255);

void setup() {
  size(256, 256);
  pg = createGraphics(width, height);

  pg.beginDraw();
  pg.noStroke();
  for (int i = width; i >= 0; i--) {
    println(i);
    if (i >= 150) {
      pg.fill(c1);
    } else if (i >= 100) {
      pg.fill(c2);
    } else if (i >= 50) {
      pg.fill(c3);
    } else {
      pg.fill(c4);
    }

    pg.ellipse(width / 2, height / 2, i, i);
  }
  pg.endDraw();

  pg.save("particle.png");
}

void draw() {
  background(255);
  image(pg, 0, 0);
}

