/**
 * This program will scan for matching words, if one is found a
 * "boid" will be created.
 * 
 * @author Adrian Chan
 * @version 1.0
 * @since Processing 2.2.1
 * @since 1/18/2015
 */
char letter;
String words = "";
String [] SearchValue;
int searchcount = 0;
boolean Start;
boolean match;
boolean pause;
int [] location = {590, 570, 550, 530, 510};
Reader r;
Data d; 
Options o;
Flock flock_1;
Flock flock_2;
Flock flock_3;
Flock flock_4;
Flock flock_5;
int selector;
PVector []spawnPoints;
float s;
float maxboid;
boolean delete;

/**
 * This function loads the starting data of the program.
 */
void setup() {
  o = new Options(80, 30, 840, 0, "Options", 10, 20, 400, 0);
  spawnPoints = new PVector[5];
  r = new Reader(SearchValue);
  d = new Data(80, 30, 920, 0, "Data", 10, 20, 0, 0, r.tracker);
  flock_1= new Flock();
  flock_2= new Flock();
  flock_3= new Flock();
  flock_4= new Flock();
  flock_5= new Flock();
  spawnPoints[0] = new PVector(0, 0);
  spawnPoints[1] = new PVector(0, 0);
  spawnPoints[2] = new PVector(0, 0);
  spawnPoints[3] = new PVector(0, 0);
  spawnPoints[4] = new PVector(0, 0);
  size(1000, 600);
  background(0);
  SearchValue = new String[5];
  for (int i =0; i <= 4; i++) {
    SearchValue[i] = "";
  }
  Start = false;
  match = false;
}
/**
 * The draw function,undisturbed will continously loop written commands
 */
void draw() {
  ////////////////UI//////////////////
  pause = d.stop;
  background(0);
  fill(255);
  spawnPoints[0].x = o.z[1].location.x;
  spawnPoints[1].x = o.z[2].location.x;
  spawnPoints[2].x = o.z[3].location.x;
  spawnPoints[3].x = o.z[4].location.x;
  spawnPoints[4].x = o.z[5].location.x;
  spawnPoints[0].y = o.z[1].location.y;
  spawnPoints[1].y = o.z[2].location.y;
  spawnPoints[2].y = o.z[3].location.y;
  spawnPoints[3].y = o.z[4].location.y;
  spawnPoints[4].y = o.z[5].location.y;
  s = o.slide[0] /20;
  maxboid = 40 + o.slide[1];
  if (o.slide[2] == 160) {
    delete = true;
  } else {
    delete = false;
  }
  textSize(20);
  text("Look for:", 0, 20);
  text(words, 0, 40);
  text("Looking for:", 0, 490);
  for (int i =0; i <= 4; i++) {
    text(SearchValue[i], 0, location[i]);
  }
  textFont(createFont("Hobo STD", 10));
  stroke(178, 0, 0);
  fill(255);
  rect(850, 525, 100, 25);
  fill(0);
  textSize(20);
  text("Search", 870, 545);
  ////////////////////////Reader///////////////////////  
  if (Start) {
    r.Reading(flock_1, flock_2, flock_3, flock_4, flock_5, spawnPoints, s, maxboid, 1, pause);
  }
  ///////////////////Data/////////////////
  d.run(400, 400);
  d.d_run(r.tracker, r.tracker, SearchValue);
  o.run(200, 200);
  o.o_run();
  flock_1.run();
  flock_2.run();
  flock_3.run();
  flock_4.run();
  flock_5.run();
  if (delete) {
    hideBoids(flock_1, flock_1.boids.size()); 
    hideBoids(flock_2, flock_2.boids.size());
    hideBoids(flock_3, flock_3.boids.size());
    hideBoids(flock_4, flock_4.boids.size());
    hideBoids(flock_5, flock_5.boids.size());
  }
}
/**
 * this function detects keyboard usage
 */
void keyPressed() {
  if (Start == false) {
    if ((key >= 'A' && key <= 'z') || key == ' ') {
      letter = key;
      words = words + key;
      println(key);
    }
    //Key 10 is enter
    if (key == 10) {
      SearchValue[searchcount] = words; 
      words = "";
      background(0);
      searchcount +=1;
      if (searchcount >=5) {
        searchcount = 0;
      }
    }
  }
}
/**
 * This function detects mouse usage
 */
void mousePressed() {
  if ((mouseX >= 850 && mouseX <=950) && ((mouseY >=525) && (mouseY <= 550))) {
    println("Found");
    Start = true;
    if (pause == false) {
      r = new Reader(SearchValue);
    }
  }
}