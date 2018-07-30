//This data set includes patient reaction time information over the course of ten days. In total, the file has 181 lines of code: 10 line for each of the 18 patients and 1 decription. 

String[] data; //array of type string of the data 
Subject[] patients; //array of patients

void setup() {
  size(800, 500); //size does adjust, but this size looks best
  background(255); //white background
  data = loadStrings("sleepStudy.csv"); //loads the data file into strings

    patients = new Subject[18]; //new array of the Subject class for each of the 18 patients in the study

  //fill object array with all data
  for (int i=1; i<data.length; i+=10) {
    String[] patientNums = data[i].split(","); //loads each of the patient numbers into their own array
    patients[i/10] = new Subject(int(patientNums[3]));
    for (int j=0; j<10; j++) {
      String[] dayAndTime = data[i+j].split(","); //splits the correct line in the data array
      patients[i/10].addDay(int(dayAndTime[2]), j); //adds the day to the array
      patients[i/10].addRxnTime(float(dayAndTime[1]), j); //adds the time to the array
    } //done filling the patients array
  }
  for (int i=0; i<patients.length; i++) {
    println(patients[i]);
  }
  for (int j=0; j<patients.length; j++) {
    patients[j].graphNoText();
  }
}

void draw() {
}

void keyPressed() {
  if (key>='a' && key<='r') { 
    background(255);
    textSize(10);
    patients[key-'a'].graph();
    if (width<height) {
      textSize(width/30);
    } else {
      textSize(height/30);
    }
    text("Patient " + str(key-'a'+1) + " Average Reaction Time (ms) vs. Days of Lost Sleep", width/50, height/25);
  }
}

