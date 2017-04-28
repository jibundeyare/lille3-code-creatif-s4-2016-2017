int particles = 100;
Particle[] p = new Particle[particles];
int d = 10;

void setup() {
	size(1000, 800, P3D);

	for (int i = 0; i < particles; i++) {
		p[i] = new Particle();
	}
}

void draw() {
	background(0);

	noStroke();
	fill(255);

	for (int i = 0; i < particles; i++) {
		p[i].update();
		p[i].constrain();

		pushMatrix();
		translate(p[i].pos.x, p[i].pos.y);
		ellipse(0, 0, d, d);
		popMatrix();
	}
}
