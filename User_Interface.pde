class Data extends Button {
  int l;
  int w;
  boolean stop;
  int [] ii;
  Data(int a, int b, int c, int d, String e, int f, int g, int h, int i, int[]j) { 
    super(a, b, c, d, e, f, g, h, i);
    ii = j;
  }
  void d_run(int[] x, int []j, String [] k) {
    data(x, k);
    organize(j);
  }
  /**
   * This function displays the data which was obtained from various locations
   * 
   *
   *@param the data obtained from the reader class
   *@param k data which is obtained from the search value class.
   */
  void data(int [] x, String []k) {
    if (Hold) {
      fill(255);
      text("Matches", loc.x, loc.y +20);
      fill(41, 41, 255);
      text(x[1] + " matches for " + k[1], loc.x, loc.y+40);
      fill(41, 255, 41);
      text(x[2] + " matches for " + k[2], loc.x, loc.y+60);
      fill( 255, 188, 41);
      text(x[3]+ " matches for " + k[3], loc.x, loc.y+80);
      fill(240, 255, 41);
      text(x[4]+ " matches for " + k[4], loc.x, loc.y+100);
      fill(255, 41, 41);
      text(x[5]+ " matches for " + k[0], loc.x, loc.y+120);
    }
  }
  /**
   * This function shows you the organized version of the information
   *
   *@param j information to be displayed
   */
  void organize(int[]j) {
    ii = j;
    if (Hold) {
      textSize(20);
      display(loc.x+160, loc.y+320, "Finish");
      textSize(20);
      if ((mouseX > loc.x +160 && mouseX < loc.x + 240) && (mouseY > loc.y +320 && mouseY < loc.y+350)) {
        stop = true;
        Sorting(ii);
        fill(41, 41, 255);
        textSize(14);
        /*This if statement is used since the new array which is created is some what messed up
        * this makes sure that the value is actually the highest one.
        */
        if (ii[4] > ii[5]){
        text(ii[4] + " is the largest amount of matches that was made", loc.x + 10, loc.y + 280);
        } else {
          text(ii[5] + " is the largest amount of matches that was made", loc.x + 10, loc.y + 280);
        }
        textSize(20);
      }
    }
  }
}

class Options extends Button {
  int l;
  int w;
  float[] slide;
  int select;
  boolean once;
  PVector S_loc;
  int ls;
  int ws;
  float [] info;
  Terrain [] z;
  Options(int a, int b, int c, int d, String e, int f, int g, int h, int i) { 
    super(a, b, c, d, e, f, g, h, i);
    z = new Terrain[6];
    slide = new float[10];
    select = 1;
    once = true;
    S_loc = new PVector(0, 0);
    info = new float[4];
    z[1] = new Terrain(mouseX, mouseY);
    z[2] = new Terrain(mouseX, mouseY);
    z[3] = new Terrain(mouseX, mouseY);
    z[4] = new Terrain(mouseX, mouseY);
    z[5] = new Terrain(mouseX, mouseY);
  }
  /**
   * This function is responsible for running all the listed functions
   * 
   */
  void o_run() {
    sliders();
    slide();
    reset();
    selector();
    dataUpdate();
    spawnPoint();
  }
  /**
   * This function creates the basic ui, including text and sliders
   *
   */
  void sliders() {
    textSize(12);
    if (Hold) {
      fill(0, 255, 0);
      text("Size", loc.x+20, loc.y+20);
      line(loc.x+20, loc.y+30, loc.x+180, loc.y+30);
      ellipse(loc.x+20+slide[0], loc.y+30, 10, 10);
    }
    if (Hold) {
      fill(0, 255, 0);
      text("Max Boids Per Color", loc.x+20, loc.y+50);
      line(loc.x+20, loc.y+60, loc.x+180, loc.y+60);
      ellipse(loc.x+20+slide[1], loc.y+60, 10, 10);
    }
    if (Hold) {
      fill(0, 255, 0);
      text("Delete Boids", loc.x+20, loc.y+80);
      line(loc.x+20, loc.y+90, loc.x+180, loc.y+90);
      ellipse(loc.x+20+slide[2], loc.y+90, 10, 10);
    }
    if (Hold) {
      fill(0, 255, 0);
      text("Boid Spawn Points", loc.x+20, loc.y+110);
      line(loc.x+20, loc.y+120, loc.x+180, loc.y+120);
      ellipse(loc.x+20+slide[3], loc.y+120, 10, 10);
    }
  }
  /**
   * This function checks for key commands and based on which key is pressed and which slider you are on
   * it will make changes to either the slider or selection
   */
  void slide() {
    if (keyPressed == false) {
      once = true;
    }
    if (Hold) {
      if (keyPressed && once) {
        if (keyCode == DOWN) {
          if (select < 5) {
            println(select);
            select +=1;
            once = false;
          }
        }
        if (keyCode == RIGHT) {
          if (select == 1 && slide[0] < 160) {
            slide[0] +=10;
          } else if (select == 2 && slide[1] < 160) {
            slide[1] +=10;
          } else if (select == 3 && slide[2] < 160) {
            slide[2] +=10;
          } else if (select == 4 && slide[3] < 160) {
            slide[3] +=10;
          }
        }
        if (keyCode == LEFT) {
          if (select == 1 && slide[0] > 0) {
            slide[0] -=10;
          } else if (select == 2 && slide[1] > 0) {
            slide[1] -=10;
          } else if (select == 3 && slide[2] > 0) {
            slide[2] -=10;
          } else if (select == 4 && slide[3] > 0) {
            slide[3] -=10;
          }
        }
        if (keyCode == UP) {
          if (select > 1) {
            select -=1;
            println(select);
            once = false;
          }
        }
        if (key == 10) {
          if (select == 5) {
            println("RESET");
            setup();
            once = false;
          }
        }
      }
    }
  }
  /**
   * This function resets all data in the program
   */
  void reset() {
    if (Hold) {
      textSize(20);
      display(loc.x+55, loc.y+160, "Reset");
      if (mousePressed) {
        if ((mouseX >= loc.x+55 && mouseX <=loc.x+55 +size_X) && ((mouseY >=loc.y+160) && (mouseY <= loc.y+160 +size_Y))) {
          println("found");
        }
      }
    }
  }
  /**
   *This function draws out the selector
   */
  void selector() {
    if (Hold) {
      stroke(41, 255, 78);
      fill(0, 0);
      rect(S_loc.x, S_loc.y, ws, ls);
      if (select == 1) {
        S_loc.x = loc.x+12+slide[0];
        S_loc.y = loc.y+22;
        ws = 15;
        ls = 15;
      } else if (select == 2) {
        S_loc.x = loc.x+12+slide[1];
        S_loc.y = loc.y+52;
        ws = 15;
        ls = 15;
      } else if (select ==3) {
        S_loc.x = loc.x+12+slide[2];
        S_loc.y = loc.y+82;
        ws = 15;
        ls = 15;
      } else if (select == 4) {
        S_loc.x = loc.x+12+slide[3];
        S_loc.y = loc.y+112;
        ws = 15;
        ls = 15;
      } else if (select == 5) {
        S_loc.x=loc.x+52;
        S_loc.y=loc.y+158;
        ws = 86;
        ls = 35;
      }
    }
  }
  /**
   * This function updates the data based on the how much the slide has moved
   */
  void dataUpdate() {
    if (Hold) {
      if (select ==1) {
        info [0] = slide[0];
      } else if (select ==2) {
        info [1] = slide[1];
      } else if (select ==3) {
        info [2] = slide[2];
      } else if (select ==4) {
        info [3] = slide[3];
      }
    }
  }
  /**
   * This function changes the spawnPoints of diffrent boids based on slider location
   */
  void spawnPoint () {
    if (Hold) {
      if (select == 4) {
        if (slide[3] <=30) {
          z[1].Display(mouseX, mouseY, "red");
        } else if (slide[3] <= 60 && slide[3] > 30) {
          z[2].Display(mouseX, mouseY, "blue");
        } else if (slide [3] <= 90 && slide[3] >60) {
          z[3].Display(mouseX, mouseY, "green");
        } else if (slide[3] <= 120 && slide[3] > 90) {
          z[4].Display(mouseX, mouseY, "orange");
        } else if (slide[3] <= 160 && slide[3] >120) {
          z[5].Display(mouseX, mouseY, "yellow");
        }
      }
    }
  }
}