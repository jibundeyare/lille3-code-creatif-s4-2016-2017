int x;
int y;
int velocityX = 1;
int velocityY = 1;
int shapeHeight = 20;
int shapeWidth = 20;
int borderTop;
int borderBottom;
int borderLeft;
int borderRight;

void setup() {
	// préparation de la scène
	size(800, 600);
	x = round(random(0, width));
	y = round(random(0, height));

	borderTop = 0 + shapeHeight / 2;
	borderBottom = height - shapeHeight / 2;
	borderLeft = 0 + shapeWidth / 2;
	borderRight = width - shapeWidth / 2;

	noStroke();
	fill(116, 30, 116);

	background(237, 216, 22);
}

void draw() {
	// peindre la scène
	if (x >= borderRight || x <= borderLeft) {
		velocityX = velocityX * -1;
	}

	if (y >= borderBottom || y <= borderTop) {
		velocityY = velocityY * -1;
	}

	x = x + velocityX;
	y = y + velocityY;

	ellipse(x, y, shapeWidth, shapeHeight);
}
