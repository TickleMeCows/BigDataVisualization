void Sorting(int[] AR) {
  for (int i = 1; i < AR.length-1; i++) {
    int smallest = i;
    for (int j = i+1; j <AR.length-1; j++) {
      //compares each value to the smallest value
      if (AR[j] < AR[smallest]) {
        //if it matches smallest is now the j index
        smallest = j;
      }
    }
    //keeps temp data of fall speed
    int temp = AR[i];
    //replaces values
    AR[i] = AR[smallest];
    AR[smallest] = temp;
    println(AR[i]);
  }
}
void hideBoids(Flock f, int len) {                    
  int i = len;
  Flock z = f;
  if (i > 0 ) {
    i -=1;
    z.boids.remove(i);
    hideBoids(f, i);
  }
}