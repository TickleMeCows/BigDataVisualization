class Terrain {
  //Perlin Noise Offsets creates frequency intervals
  float xOffset;
  float  yOffset;
  float _Width;
  //Y is where the vertex heights will be changed
  float Y;
  int i;
  int Ball_C;
  PVector location;
  Terrain(int x, int y) {
    //Both Offsets given values
    xOffset = 0;
    yOffset = 0;
    _Width = height;
    i=40;
    Ball_C = 0;
    location = new PVector(x,y); 
  }
  /**
     * This will be the spawn location indicator
     * 
     *@param x the x coordinate
     *@param y the y coordinate
     *@param colour this string will be used to identify which colour will be used
     */
  void Display(int x, int y, String colour) {
    noStroke();
    location.x = x;
    location.y = y;
    fill(255);
    xOffset = 0;
    Y = map(noise(xOffset, yOffset), 0, 1, 100, 450)*1.5;
    xOffset = xOffset + .05;
    yOffset = yOffset -.006; 
    _Width -=1;
    if (colour == "red") {
      fill(255, 41, 41);
    }
    if (colour == "green") {
      fill(41, 255, 41);
    }
    if (colour == "blue") {
      fill(41, 41, 255);
    }
    if (colour == "yellow") {
      fill(240, 255, 41);
    }
    if (colour == "orange") {
      fill( 255, 188, 41);
    }
    rect(location.x, location.y, 10, 10, -10);
    pushMatrix();
    translate(location.x, location.y);
    rotate(i);
    fill(47,119,211);
    rect(50, Y-500, 10, 10, -10);
    popMatrix();
    pushMatrix();
    translate(location.x, location.y);
    rotate(i+1);
    fill(255,98,101);
    rect(50, Y-500, 10, 10, -10);
    popMatrix();
    pushMatrix();
    translate(location.x, location.y);
    rotate(-i);
    fill(98,255,146);
    rect(50, Y-500, 10, 10, -10);
    popMatrix();
    i+=4;
  }
 
}
