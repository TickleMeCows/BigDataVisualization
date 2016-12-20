class Reader {
  BufferedReader [] reader;
  String SV [];
  String line;
  int [] tracker;
  Reader(String [] g) {
    reader = new BufferedReader[2];
    reader[0] = createReader("anonym_tag.csv");
    reader[1] = createReader("anonym_folder.csv");
    SV = g;
    tracker = new int[6];
  }

  /**
   * This function checks for similarities between the two compared strings, if a match
   * is found a
   *@param x the width of the rectangle which is made
   *@param y the height of the rectangle which is made
   */
  void Reading(Flock f1, Flock f2, Flock f3, Flock f4, Flock f5, PVector[] i, float s, float v, int r, boolean p) {
    if (p == false) {
      try {
        line = reader[r].readLine();
        if (line.contains(SV[0])) {
          //println("Match 0"); 
          tracker[5] +=1;
          if (tracker[5] < v) {          
            f1.addBoid(new Boid(i[0].x, i[0].y, "red", s));
          }
        }
        if (line.contains(SV[1])) {
          //println("Match 1"); 
          tracker[1] +=1;
          if (tracker[1] < v) {
            f2.addBoid(new Boid(i[1].x, i[1].y, "blue", s));
          }
        }
        if (line.contains(SV[2])) {
          //println("Match 2"); 
          tracker[2] +=1;
          if (tracker[2] < v) {
            f3.addBoid(new Boid(i[2].x, i[2].y, "green", s));
          }
        }
        if (line.contains(SV[3])) {
          //println("Match 3"); 
          tracker[3] +=1;
          if (tracker[3] < v) {
            f4.addBoid(new Boid(i[3].x, i[3].y, "orange", s));
          }
        }
        if (line.contains(SV[4])) {
          //println("Match 4"); 
          tracker[4] +=1;
          if (tracker[4] < v) {
            f5.addBoid(new Boid(i[4].x, i[4].y, "yellow", s));
          }
        }
      } 
      catch (IOException e) {
        e.printStackTrace();
        line = null;
      }
      fill(255);
      rect(75, 550, 5, 5);
      rect(75, 560, 5, 5);
      rect(75, 570, 5, 5);
      rect(75, 580, 5, 5);
      rect(75, 590, 5, 5);
      text(line, 350, 590);
    }
  }
}