PImage logo,acuteLogo,rightLogo,obtuseLogo,check,playGame,takeTest,done;
PImage []star,badStar;
int screen;

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;
float cursor_size = 15;
float object_size = 60;
float table_size = 800;
float scale_factor = 2;
PFont font;
int option=0; //keep tab of acute,obtuse,right angle
int radiusButton=56,angleButtons=0;
Ani radiusAni,angleAni;
String acuteAngle="Any angle that is greater than zero \nbut less than ninety degrees is \ncalled an acute angle";
String rightAngle="Any angle that measures ninety \ndegrees is called a right angle";
String obtuseAngle="Any angle that is greater than \nninety but less than one \nhundred and eighty  degrees is \ncalled an obtuse angle";
boolean isAnimating=false;
int angle;
int questionNum=0;
float measuredAngle=0;
int[] answer;
int score;
float fingMouseX,fingMouseY;

Dot[] DotObjects;

void setup() {
  size(displayWidth, displayHeight);  
  logo=loadImage("Image/logo.png");
  acuteLogo=loadImage("Image/acuteLogo.png");
  rightLogo=loadImage("Image/rightLogo.png");
  obtuseLogo=loadImage("Image/obtuseLogo.png");
  check=loadImage("Image/check.png");
  playGame=loadImage("Image/playGame.png");
  takeTest=loadImage("Image/takeTest.png");
  done=loadImage("Image/done.png");
  star = new PImage[5];
  badStar = new PImage[5];
  for(int i=0;i<5;i++){
    star[i]=loadImage("Image/star.png");
    badStar[i]=loadImage("Image/badStar.png");
  }  
  angle=int(random(18));
  angle*=10;
  screen=0;
  fingMouseX=0;fingMouseY=0;
  noStroke();
  DotObjects = new Dot[2];
  answer = new int[5];
  for(int i=0;i<5;i++){
    answer[i]=-1;
  }
  score =0;
  
  hint(ENABLE_NATIVE_FONTS);
  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  tuioClient  = new TuioProcessing(this);
  Ani.init(this);
  radiusAni = new Ani(this, 0.25, "radiusButton",56-10, Ani.EXPO_IN_OUT, "onStart:itsStarted, onEnd:itsEnded");
  angleAni = new Ani(this,0.5, "angleButtons",0,Ani.LINEAR, "onStart:angleStarted, onEnd:angleEnded");
}

void draw(){
  background(236,236,236);
  if(screen==0){
    
  }
  else if(screen==1){
    screen1();
  }
  else if(screen==2){
    screen2();
  }
  else if(screen==3){
    screen3();
  }
  else if(screen==4){
    screen4();
  }
  else if(screen==5){
    screen5();
  }
  else {
    exit();
  }
}

//BUTTON PRESSES DETECTION
void mousePressed(){
  
}
void keyPressed(){
  if(key=='a'){
    screen++;
  }
}

void itsStarted(){
  isAnimating=true;
  if(screen==4){
    //println("Measured angle = "+measuredAngle+" angle = "+angle);
    //println("Difference = " + abs(measuredAngle-angle));
    if(abs(measuredAngle-angle)<10){
      answer[questionNum]=1;
      score++;
    }
    else{
      answer[questionNum]=0;
    }
    questionNum++;
    angle=int(random(18));
    angle*=10;
  }
}

void itsEnded(){
  radiusButton=56;
  isAnimating=false;
  if(screen==4){    
    check=loadImage("Image/check.png");  
    println("here1");
    if(questionNum>4){
      screen++;
   }
  }
  else if(screen==5){
   for(int i=0;i<5;i++){
    answer[i]=-1;
    }
    screen=1;
    println("here2");
  }
  else{
    screen++;
    println("here3");
  }
}

void angleStarted(){
 
}

void angleEnded(){
  
}
