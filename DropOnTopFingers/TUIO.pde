void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  DotObjects[tobj.getSymbolID()] = new Dot(tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height), tobj.getAngle());
}

void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  DotObjects[tobj.getSymbolID()] = null;   
}

void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
  DotObjects[tobj.getSymbolID()].update(tobj.getScreenX(width), tobj.getScreenY(height), tobj.getAngle());
}

void addTuioCursor(TuioCursor tcur) {
  println("add cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
  //mouseX=tcur.getX()*displayWidth;
  //mouseX=tcur.getY()*displayHeight;
  if(screen==1){
    if(mouseX>width/2-logo.width/2 && mouseX<width/2+logo.width && mouseY>height/2-logo.height/2 && mouseY<height/2+logo.height){
      screen++;
    }
  }
  else if(screen==2){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && mouseY<height-140+takeTest.height){
      radiusAni.start();
    }
    else if(mouseX>120 && mouseX<120+acuteLogo.width && mouseY>180 && mouseY<180+acuteLogo.height){
      option=1;
      angleAni.setEnd(8);
      angleAni.setDuration(0.3);
      angleAni.start();
    }
    else if(mouseX>490 && mouseX<490+rightLogo.width && mouseY>180 && mouseY<180+rightLogo.height){
      option=2;
      angleAni.setEnd(20);
      angleAni.setDuration(0.4);
      angleAni.start();
    }
    else if(mouseX>860 && mouseX<860+obtuseLogo.width && mouseY>180 && mouseY<180+acuteLogo.height){
      option=3;
      angleAni.setEnd(29);
      angleAni.setDuration(0.5);
      angleAni.start();
    }
  }
  else if(screen==3){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && mouseY<height-140+takeTest.height){
      radiusAni.start();
    }
  }
  else if(screen==4){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && fingFMouseY<height-140+takeTest.height){
      radiusAni.start();
    }
  }
  else if(screen==5){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && mouseY<height-140+takeTest.height){
      radiusAni.start();
      //screen++;
    }
  }
}

void updateTuioCursor (TuioCursor tcur) {
  println("update cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
          +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
  //mouseX=tcur.getX()*displayWidth;
  //mouseY=tcur.getY()*displayHeight;
  if(screen==1){
    if(mouseX>width/2-logo.width/2 && mouseX<width/2+logo.width && mouseY>height/2-logo.height/2 && mouseY<height/2+logo.height){
      screen++;
    }
  }
  else if(screen==2){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && mouseY<height-140+takeTest.height){
      radiusAni.start();
    }
    else if(mouseX>120 && mouseX<120+acuteLogo.width && mouseY>180 && mouseY<180+acuteLogo.height){
      option=1;
      angleAni.setEnd(8);
      angleAni.setDuration(0.3);
      angleAni.start();
    }
    else if(mouseX>490 && mouseX<490+rightLogo.width && mouseY>180 && mouseY<180+rightLogo.height){
      option=2;
      angleAni.setEnd(20);
      angleAni.setDuration(0.4);
      angleAni.start();
    }
    else if(mouseX>860 && mouseX<860+obtuseLogo.width && mouseY>180 && mouseY<180+acuteLogo.height){
      option=3;
      angleAni.setEnd(29);
      angleAni.setDuration(0.5);
      angleAni.start();
    }
  }
  else if(screen==3){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && mouseY<height-140+takeTest.height){
      radiusAni.start();
    }
  }
  else if(screen==4){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseY>0 && mouseY<height-140+takeTest.height){
      radiusAni.start();
    }
  }
  else if(screen==5){
    if(mouseX>width-140 && mouseX<width-140+takeTest.width && mouseX>0 && mouseX<height-140+takeTest.height){
      radiusAni.start();
      //screen++;
    }
  }
}

void removeTuioCursor(TuioCursor tcur) {
  println("remove cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
}

void refresh(TuioTime bundleTime) { 
  redraw();
}

//Function To Detect Intersection
PVector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) 
{ 
  float bx = x2 - x1; 
  float by = y2 - y1; 
  float dx = x4 - x3; 
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if (b_dot_d_perp == 0) {
    return null;
  }
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if (t < 0 || t > 1) {
    return null;
  }
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if (u < 0 || u > 1) { 
    return null;
  }
  return new PVector(x1+t*bx, y1+t*by);
}
