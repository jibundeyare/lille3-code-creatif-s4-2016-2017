/**
 * mode 0: mode normal
 * mode 1: mode masque
 */

int mode = 0;

int elements = 50;
int shapeMaxWidth = 50;
int shapeMaxHeight = 50;
int shapeMinWidth = 1;
int shapeMinHeight = 1;
int bgColor = color(237, 216, 22);

int[] x = new int[elements];
int[] y = new int[elements];
int[] velocityX = new int[elements];
int[] velocityY = new int[elements];
int[] shapeHeight = new int[elements];
int[] shapeWidth = new int[elements];
int[] shapeColor = new int[elements];
int[] shapeGrowthWidth = new int[elements];
int[] shapeGrowthHeight = new int[elements];
int borderTop;
int borderBottom;
int borderLeft;
int borderRight;

void setup() {
	// préparation de la scène
	size(800, 600);

	initShapes();
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

		if (shapeWidth[i] > shapeMaxWidth || shapeWidth[i] < shapeMinWidth) {
			shapeGrowthWidth[i] = shapeGrowthWidth[i] * -1;
		}

		if (shapeHeight[i] > shapeMaxHeight || shapeHeight[i] < shapeMinHeight) {
			shapeGrowthHeight[i] = shapeGrowthHeight[i] * -1;
		}

		shapeWidth[i] = shapeWidth[i] + shapeGrowthWidth[i];
		shapeHeight[i] = shapeHeight[i] + shapeGrowthHeight[i];

		fill(shapeColor[i]);
		ellipse(x[i], y[i], shapeWidth[i], shapeHeight[i]);
	}

	switch (mode) {
		case 1:
			fill(bgColor, 25);
			rect(0, 0, width, height);
			break;
		case 0:
		default:
	}
}

void mouseClicked() {
	if (mode == 0) {
		mode = 1;
		initShapes();
	} else {
		mode = 0;
		initShapes();
	}
}

void initShapes() {
	for (int i = 0; i < elements; i++) {
		velocityX[i] = round(random(-5, 5));
		velocityY[i] = round(random(-5, 5));

		if (velocityX[i] == 0) {
			velocityX[i] = 1;
		}

		if (velocityY[i] == 0) {
			velocityY[i] = 1;
		}

		shapeGrowthWidth[i] = 1;
		shapeGrowthHeight[i] = 1;

		shapeWidth[i] = round(random(shapeMinWidth, shapeMaxWidth));
		shapeHeight[i] = shapeWidth[i];

		switch (mode) {
			case 1:
				shapeColor[i] = color(116, 30, round(random(100, 200)));
				break;
			case 0:
			default:
				shapeColor[i] = color(116, 30, round(random(100, 200)), 10);
		}

		x[i] = round(random(shapeWidth[i], width - shapeHeight[i]));
		y[i] = round(random(shapeHeight[i], height - shapeHeight[i]));
	}

	borderTop = 0 + shapeHeight[0] / 2;
	borderBottom = height - shapeHeight[0] / 2;
	borderLeft = 0 + shapeWidth[0] / 2;
	borderRight = width - shapeWidth[0] / 2;

	noStroke();
	background(bgColor);
}
