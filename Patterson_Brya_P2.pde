/* 6 Months in 30 Seconds by Brya Patterson
 
 For Project 2 I decided to take data that my fibit has been collecting 
 about me for the past 6 months. The sketch features six categories of the 13 my 
 fitbit was traking: calories, steps, minutes sedentary, asleep, in bed, and light
 activity. Turns out I spent a lot of time not moving very much, although I did manage 
 to make my step goal more often than not. As the arcs move farther from the center of the
 sketch, the values are greater. My farthest arc is several thousand pixels off the sketch
 (it represents the day I took 21,000 steps). I placed in a scrolling function to be able
 to view that specific arc.
 */

import processing.pdf.*;
PFont titles; 
Table table;

float x = 0;
float y = 0;

void setup() {
  size(1800, 1300);

  titles = createFont ("Gulim", 40); 
  table = loadTable("fitbit_0916_0217.csv", "header");
}

void draw() {
  background (#2F2933);


  if (mouseX < 100) x+= 10;//global shift
  if (mouseX > width - 100) x-=10;
  translate(x, 0);

  if (mouseY < 100) y+= 10;
  if (mouseY > height - 100) y-=10;
  translate(0, y);


  //TEXT 
  fill(#F2EFDF);
  textFont(titles);
  textAlign(LEFT);
  text("6 Month Stats in 30 Seconds", 420, 395);
  textSize(20);
  text("September 22, 2016 to February 18, 2017", 423, 425);


  //ARCS
  for (int i=0; i<table.getRowCount(); i++) {
    pushMatrix();
    strokeCap(ROUND);

    // rotate (radians(360.0/151.0)*i);
    float separation = 360.0/151.0;
    strokeWeight(6);
    noFill();

    float sizeY = height/2+75;

    //CALORIES
    stroke(#211426);
    float myData = table.getFloat(i, 1);
    arc(width/2, sizeY, myData, myData, radians(separation*i), radians(separation*(i+1)));

    //STEPS
    stroke(#413659);
    float myData2 = table.getFloat(i, 2);
    arc(width/2, sizeY, myData2, myData2, radians(separation*i), radians(separation*(i+1)));

    //MINS SEDENTARY
    stroke(#656F8C);
    float myData3 = table.getFloat(i, 4);
    arc(width/2, sizeY, myData3, myData3, radians(separation*i), radians(separation*(i+1)));

    //MINS ASLEEP
    stroke(#569492);
    float myData4 = table.getFloat(i, 9);
    arc(width/2, sizeY, myData4, myData4, radians(separation*i), radians(separation*(i+1)));

    //TIME IN BED
    stroke(#9BBFAB);
    float myData5 = table.getFloat(i, 12);
    arc(width/2, sizeY, myData5, myData5, radians(separation*i), radians(separation*(i+1)));

    //LIGHTLY-CREAM F2DDB6

    stroke(#F2DDB6);
    float myData6 = table.getFloat(i, 5);
    arc(width/2, sizeY, myData6, myData6, radians(separation*i), radians(separation*(i+1)));

    /*FAIRLY
     stroke(#de3d83);
     float myData7 = table.getFloat(i, 6);
     arc(width/2, sizeY, myData7, myData7, radians(separation*i), radians(separation*(i+1)));
     //SOMETHING IS WRONG HERE, SPIKES?
     
     //VERY
     stroke(#f7772c);
     float myData8 = table.getFloat(i, 7);
     arc(width/2, sizeY, myData8, myData8, radians(separation*i), radians(separation*(i+1)));
     */
    //SOMETHING IS WRONG WITH THIS ONE, SPIKES?


    //ELLIPSES AND MORE TEXT

    //CALORIES
    stroke(100);
    strokeWeight(1);
    fill(#211426);
    ellipse(430, 460, 10, 10);
    fill(100);
    textFont(titles);
    textAlign(LEFT);
    textSize(16);
    text("Calories", 440, 465);

    //STEPS
    stroke(100);
    strokeWeight(1);
    fill(#413659);
    ellipse(430, 490, 10, 10);
    fill(100);
    textFont(titles);
    textAlign(LEFT);
    textSize(16);
    text("Steps", 440, 495);

    //MINS SENEDTARY
    stroke(100);
    strokeWeight(1);
    fill(#656F8C);
    ellipse(430, 520, 10, 10);
    fill(100);
    textFont(titles);
    textAlign(LEFT);
    textSize(16);
    text("Minutes Sedentary", 440, 525);

    //MINS ASLEEP
    stroke(100);
    strokeWeight(1);
    fill(#569492);
    ellipse(590, 460, 10, 10);
    fill(100);
    textFont(titles);
    textAlign(LEFT);
    textSize(16);
    text("Minutes Asleep", 600, 465);

    //MINS IN BED
    stroke(100);
    strokeWeight(1);
    fill(#9BBFAB);
    ellipse(590, 490, 10, 10);
    fill(100);
    textFont(titles);
    textAlign(LEFT);
    textSize(16);
    text("Minutes in Bed", 600, 495);

    //MINS of Light Activity
    stroke(100);
    strokeWeight(1);
    fill(#F2DDB6);
    ellipse(590, 520, 10, 10);
    fill(100);
    textFont(titles);
    textAlign(LEFT);
    textSize(16);
    text("Minutes of Light Activity", 600, 525);

    /*//HOT PINK
     noStroke();
     fill(#de3d83);
     rect (350, 500, 10, 10);fill(#000000);
     textFont(titles);
     textAlign(LEFT);
     textSize(16);
     text("Minutes Fairly Active", 410, 510);*/

    //ORANGE
    /* noStroke();
     fill(#f7772c);
     rect (330, 475, 10, 10);
     fill(#000000);
     textFont(titles);
     textAlign(LEFT);
     textSize(16);
     text("Minutes Very Active", 410, 510);*/

    popMatrix();
  }
}


void keyPressed() {
  if (key == ' ') {
    x= 0;
    y= 0;
  }
}