int elements = 50;

int[] x = new int[elements];
int[] y = new int[elements];
int[] velocityX = new int[elements];
int[] velocityY = new int[elements];
int[] shapeHeight = new int[elements];
int[] shapeWidth = new int[elements];
int borderTop;
int borderBottom;
int borderLeft;
int borderRight;

void setup() {
	// préparation de la scène
	size(800, 600);

	for (int i = 0; i < elements; i++) {
		velocityX[i] = 1;
		velocityY[i] = 1;
		shapeWidth[i] = 20;
		shapeHeight[i] = 20;
		x[i] = round(random(shapeWidth[i], width - shapeHeight[i]));
		y[i] = round(random(shapeHeight[i], height - shapeHeight[i]));
	}

	borderTop = 0 + shapeHeight[0] / 2;
	borderBottom = height - shapeHeight[0] / 2;
	borderLeft = 0 + shapeWidth[0] / 2;
	borderRight = width - shapeWidth[0] / 2;

	noStroke();
	fill(116, 30, 116);

	background(237, 216, 22);
}

void draw() {
	// peindre la scène
	for (int i = 0; i < elements; i++) {
		if (x[i] >= borderRight || x[i] <= borderLeft) {
			velocityX[i] = velocityX[i] * -1;
		}

		if (y[i] >= borderBottom || y[i] <= borderTop) {
			velocityY[i] = velocityY[i] * -1;
		}

		x[i] = x[i] + velocityX[i];
		y[i] = y[i] + velocityY[i];

		ellipse(x[i], y[i], shapeWidth[i], shapeHeight[i]);
	}
}
