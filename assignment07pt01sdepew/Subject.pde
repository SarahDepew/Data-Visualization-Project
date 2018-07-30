class Subject {
  int number;
  int[] days;
  float[] rxnTimes;

  Subject(int number) { //constructor
    this.number = number;
    days = new int[10];
    rxnTimes = new float[10];
  }

  void addDay(int day, int i) { //loads the days into the days array
    days[i]=day;
  }

  void addRxnTime(float rxnTime, int i) {
    rxnTimes[i]=rxnTime;
  }

  void graph() {
    float inc = width/11; //stretching out the data along the x-axis
    float shift = width/10;
    float textShiftY = width/60; 
    float textShiftX = height/40; 
    fill(0);
    for (int i=0; i<days.length-1; i++) {
      ellipse(days[i]*inc+shift, height-rxnTimes[i], width/50, width/50); //height-rxnTimes[i] corrects for y-axis
      line(days[i]*inc+shift, height-rxnTimes[i], days[i+1]*inc+shift, height-rxnTimes[i+1]);
      text("("+str(days[i])+", "+str(rxnTimes[i])+")", days[i]*inc+textShiftY, height-rxnTimes[i]-textShiftX); //writes the points in coordinate form
    }
    ellipse(days[days.length-1]*inc+shift, height-rxnTimes[days.length-1], 12, 12);
    text("("+str(days[days.length-1])+", "+str(rxnTimes[days.length-1])+")", days[days.length-1]*inc+textShiftY, height-rxnTimes[days.length-1]-textShiftX);
  }

  void graphNoText() {
    float inc = width/11; //stretching out the data along the x-axis
    float shift = width/10;
    float textShiftY = width/60; 
    float textShiftX = height/40; 
    fill(0);
    for (int i=0; i<days.length-1; i++) {
      ellipse(days[i]*inc+shift, height-rxnTimes[i], width/50, width/50); //height-rxnTimes[i] corrects for y-axis
      line(days[i]*inc+shift, height-rxnTimes[i], days[i+1]*inc+shift, height-rxnTimes[i+1]);
    }
    ellipse(days[days.length-1]*inc+shift, height-rxnTimes[days.length-1], 12, 12);
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

