class Subject { //fields for class
  int number; //patient number
  int[] days; //days of sleep deprivation per patient
  float[] rxnTimes; //reaction times corresponding to each day

  Subject(int number) { //constructor
    this.number = number;
    days = new int[10];
    rxnTimes = new float[10];
  }

  void addDay(int day, int i) { //loads the days into the days array
    days[i]=day;
  }

  void addRxnTime(float rxnTime, int i) { //loads the reaction times into the rxnTimes array
    rxnTimes[i]=rxnTime;
  }

  void graph(color c, boolean label) { //the graph method with color and label parameters

    float inc = width/11; //stretching out the data along the x-axis
    float shift = width/10; //shifts the points to the right
    float textShiftX = width/30; //shifts the text along the x-axis
    float textShiftY = height/40; //shifts the text along the y-axis
    float maxY = 466.3535; //maximum y-value found for data (used excel max function)
    float minY = 194.3322; //minimum y-value found for data (used excel min function)
    
    float ellipseSize; //the size of the graph's ellipse

    if (width<height) {
      ellipseSize = width/50;
    } else {
      ellipseSize = height/50;
    }

    fill(c);
    for (int i=0; i<days.length; i++) { //loop that graph
      float yPos = map(rxnTimes[i], maxY, minY, 5*height/50, 45*height/50); 
      ellipse(days[i]*inc+shift, yPos, ellipseSize, ellipseSize); //height-rxnTimes[i] corrects for y-axis
      if (i+1<days.length) {
        float yPos2 = map(rxnTimes[i+1], maxY, minY, 5*height/50, 45*height/50);
        line(days[i]*inc+shift, yPos, days[i+1]*inc+shift, yPos2);
      }
      if (label) {
        text("("+str(days[i])+", "+str(rxnTimes[i])+")", days[i]*inc+textShiftX, yPos-textShiftY); //writes the points in coordinate form
      }
    }
  }

  void graphColor() { //uses the graph method to create a labeled and colored graph
    stroke(0, 0, 255); 
    graph(color(0, 0, 255), false);
  }

  String toString() { //redefine how the class prints the string
    String msg = "The patient " + str(number);
    for (int i=0; i<days.length; i++) {
      msg +=" had a reaction time of " + str(rxnTimes[i]) + " of ms on day ";
      msg+= str(days[i]); 
      msg+="\n";
    }
    return msg;
  }
}

