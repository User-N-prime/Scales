void setup() {
  size(800, 600);
}

void draw() {
  // calculate colors on mouse
  float red = float(mouseX) / width;
  float green = float(mouseY) / height;
  float blue = float(mouseX + mouseY) / (width + height);

  color aCol = color(red * 90, green * 142, blue * 230);
  color bCol = color((1 - red) * 7, (1 - green) * 78, (1 - blue) * 196);
  setGrad(0, 0, width, height, aCol, bCol);
   for (float x = 10; x < width; x += 70) {
    for (float y = 10; y < height; y += 70) {
      petEffect(x, y);
    }
  }
}

void setGrad(float x, float y, float w, float h, color c1, color c2) {
  // gradient from c1 to c2
  for (int i = 0; i < h; i++) {
    float inter = map(i, 0, h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }
}

void petEffect(float a, float b) {
  //distance from mouse to rect pos
  double legs = Math.pow(mouseX - a, 2) + Math.pow(mouseY - b, 2);
  float distance = sqrt((float)legs);
  float littleDis = distance/3.0000000;
  if (littleDis < 40)
    littleDis = 40;
  if (littleDis > 60)
    littleDis = 60;
  float bigDis = distance/2.0000000;
  if (bigDis < 60)
    bigDis = 60;
  if (bigDis > 90)
    bigDis = 90;
  float grad_2 = map(distance, 0, 1000, 123, 225);
  float grad_3 = map(distance, 0, 1000, 100, 255);
  float grad_4 = map(distance, 0, 1000, 50, 200);
  float offset = map(Math.random(), 0.0, 1.0, -2, 2);
  

  // "scale" design
  pushMatrix();
  translate(a + 10, b + 10);
  rotate(distance * 0.01);
  noStroke();
  fill(0, grad_2, grad_3, grad_4);
  ellipse(-10 + offset, -10 + offset, littleDis, bigDis);
  fill(255, grad_2 ,0 ,grad_4);
  ellipse(-10 + offset, -10 + offset, 15, 15);
  popMatrix();
}




