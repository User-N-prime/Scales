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
  
  // Move the origin to the rectangle's position (a, b)
  translate(a, b);  // Move origin to the top-left corner of the rectangle
  
  // Apply scaling based on mouse position (this is the scaling factor)
  scale(mouseX / float(width), mouseY / float(height));
  
  // Translate to the center of the rectangle (because rect() will draw it centered at (0, 0))
  translate(10, 10); // Center the rectangle (20x20 size, so we move by half)
  
  // Now apply rotation around the center
  rotate(mouseX * 0.01);
  
  // Draw the rectangle centered at (0, 0)
  rect(-10, -10, 20, 20, 60);  // Use (-10, -10) to center the rectangle
  
  // Add a triangle to simulate a "scale"
  // Adjust the triangle's position based on the rectangle's center
  pushMatrix();
    // Rotate the triangle slightly for a more natural, irregular effect
    rotate(-PI / 6);  
    fill(100, 150, 200, 150);  // Semi-transparent fill
    triangle(10, 10, 20, 10, 15, 20);  // Small triangle next to the rectangle
  popMatrix();

  popMatrix();
}





