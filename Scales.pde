void setup() {
  size(800, 600);
}

void draw() {
  // Calculate dynamic colors based on mouse position
  float red = float(mouseX) / width;
  float green = float(mouseY) / height;
  float blue = float(mouseX + mouseY) / (width + height);

  color aCol = color(red * 90, green * 142, blue * 230);
  color bCol = color((1 - red) * 7, (1 - green) * 78, (1 - blue) * 196);
  setGrad(0, 0, width, height, aCol, bCol);
   for (float x = 50; x < width; x += 60) {
    for (float y = 50; y < height; y += 60) {
      drawScaledRotatedRect(x, y);
    }
  }
}

void setGrad(float x, float y, float w, float h, color c1, color c2) {
  // Create a vertical gradient from c1 to c2
  for (int i = 0; i < h; i++) {
    float inter = map(i, 0, h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }
}

void drawScaledRotatedRect(float a, float b) {
  pushMatrix();
  translate(a + 10, b + 10);
  scale(mouseX / float(width), mouseY / float(height));
  rotate(mouseX * 0.01);
  rect(a, b, 20, 20, 60);
  pushMatrix();
    rotate(-PI / 6);  // Slightly rotate the triangle to give it an organic feel
    fill(100, 150, 200, 150);  // Use a semi-transparent fill for some texture
    triangle(a + 20, b + 20, a + 20, b, a + 25, b + 10);
  popMatrix();
  popMatrix();
}




