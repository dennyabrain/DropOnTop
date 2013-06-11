class Dot{
  int id;
  float slope;
  float x,y;
  float x2,y2;
  float intX,intY;
  float angle;
  boolean isIntersecting;
 
  Dot(int ID,float X,float Y, float Slope){
    slope=Slope;
    angle=map(Slope,0,6.30,0,360);
    x=X;
    y=Y;
    id=ID;
    x2=x+1200*cos(slope);
    y2=y+1200*sin(slope);
    isIntersecting=false;
    intX=0;
    intY=0;
  }
  
  void update(float xNew,float yNew,float slopeNew){
    x=xNew;
    y=yNew;
    slope=slopeNew;
    angle=map(slopeNew,0,6.30,0,360);
    x2=x+1200*cos(slope);
    y2=y+1200*sin(slope);
  }
  
  void sketch(){
    stroke(222,135,135);
    if(isIntersecting){
      line(this.x,this.y,this.intX,this.intY);
    }
    else{
      line(this.x,this.y,this.x2,this.y2);
    }
    pushMatrix();
    translate(this.x,this.y);
    rotate(this.slope);
    strokeWeight(4);
    //line(10,0,infLine.getPosition(),0);
    fill(222,135,135);
    rect(-37.89/2,-37.89/2,37.89,37.89);
    popMatrix();
    fill(222,135,135);     
    text(""+this.id,this.x,this.y);     
  }    
};


