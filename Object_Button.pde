class Button {
  int size_X;
  int size_Y;
  PVector location;
  PVector Text_location;
  String Text;
  int size_xx;
  int size_yy;
  PVector loc;
  boolean Hold;
  Button(int a, int b, int c, int d, String e, int f, int g, int h, int i) {
    size_X = a;
    size_Y = b;
    location = new PVector(c, d);
    Text_location = new PVector(f, g);
    Text = e;
    loc = new PVector(h, i);
    Hold = false;
  } 
  /**
     * This function creates a rectangle and checks for the closing of the rectangle
     * these rectangles will be used as buttons
     *
     *@param x the width of the rectangle which is made
     *@param y the height of the rectangle which is made
     */
  void display(float x, float y, String v) {
    fill(180, 95);
    stroke(255);
    strokeWeight(2);
    rect(x, y, size_X, size_Y);
    strokeWeight(1);
    fill(255);
    text(v, x+5, y +25);
  }
  /**
   * This function creates a rectangle and checks for the closing of the rectangle
   * 
   *@param x the width of the rectangle which is made
   *@param y the height of the rectangle which is made
   */
  void MouseC(int x, int y) {
    if (mousePressed) {
      if ((mouseX >= location.x && mouseX <=location.x +size_X) && ((mouseY >=location.y) && (mouseY <= location.y +size_Y))) {
        Hold = true;
      }
    } 
    if (Hold) {
      Explode(x, y);
      update(x, y);
    }
  }
  /**
   * This function creates a rectangle and checks for the closing of the rectangle
   * 
   *@param x the width of the rectangle which is made
   *@param y the height of the rectangle which is made
   */
  void run(int x, int y) {
    display(location.x, location.y, Text);
    MouseC(x, y);
  }
  /**
   * This function updates the location of the rectangle, when it is clicked upon
   * 
   *@param x the width of the rectangle
   *@param y the height of the rectangle
   */
  void update(int x, int y) {
    if (mousePressed && Hold) {
      if ((mouseX >= loc.x && mouseX <=loc.x + x) && ((mouseY >=loc.y) && (mouseY <= loc.y + y))) {
         loc.x = mouseX - x/2;
         loc.y = mouseY - y/2;
      }
    }
  }
  /**
   * This function creates a rectangle and checks for the closing of the rectangle
   * 
   *@param x the width of the rectangle which is made
   *@param y the height of the rectangle which is made
   */
  void Explode(int x, int y) {
    fill(180, 50);
    stroke(67);
    strokeWeight(3);
    rect(loc.x, loc.y, x, y);
    fill(205, 30, 30);
    rect(loc.x+x -10, loc.y, 10, 10);
    if (mousePressed) {
      if ((mouseX >= loc.x + x -10 && mouseX <=loc.x + x) && ((mouseY >=loc.y) && (mouseY <= loc.y + 10))) {
        Hold = false;
      }
    }
    strokeWeight(1);
  }
}