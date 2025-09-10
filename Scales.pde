void setup() {
  size(800, 600);
}
void draw() {
  void draw() {
  float red = float(mouseX) / width;
  float green = float(mouseY) / height;
  float blue = float(mouseX + mouseY) / (width + height);

  color aCol = color(red * 90, green * 142, blue * 230);
  color bCol = color((1 - red) * 7, (1 - green) * 78, (1 - blue) * 196);

  setGrad(0, 0, width, height, aCol, bCol);
 
  scale(float(mouseX), float(mouseY), 100,100);
  

}

void setGrad(float x, float y, float w, float h, color c1, color c2) {
  // Draw a gradient from c1 to c2
  for (int i = 0; i < h; i++) {
    float inter = map(i, 0, h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }
}

void scale(float x,float y, int a, int b) {
  translate(a,b);
  pushMatrix();
    rotate(x*0.01);
    rect(a,b,20,20,60);

  popMatrix();
}



