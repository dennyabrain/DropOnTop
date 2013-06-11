void screen3(){
 playGame=loadImage("Image/playGame.png");//To get rid of the crash 
 if(isAnimating){
   takeTest.resize(radiusButton*2,radiusButton*2);
 }
 image(takeTest,width-140,height-140);
 textFont(font,18*scale_factor);
  float obj_size = object_size*scale_factor; 
  float cur_size = cursor_size*scale_factor; 

   Vector tuioCursorList = tuioClient.getTuioCursors();
   for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      
      if (pointList.size()>0) {
        stroke(0,0,255);
        TuioPoint start_point = (TuioPoint)pointList.firstElement();;
        for (int j=0;j<pointList.size();j++) {
           TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
           //pushMatrix();
           
           line(start_point.getScreenX(width),start_point.getScreenY(height),end_point.getScreenX(width),end_point.getScreenY(height));
           
           start_point = end_point;
        }
        
        stroke(192,192,192);
        fill(192,192,192);
        ellipse( tcur.getScreenX(width), tcur.getScreenY(height),cur_size,cur_size);
        fill(0);
        text(""+ tcur.getCursorID(),  tcur.getScreenX(width)-5,  tcur.getScreenY(height)+5);
      }
   }
   if (DotObjects[0]!=null){   
     DotObjects[0].sketch();
     //line(DotObjects[0].x,DotObjects[0].y,DotObjects[0].x2,DotObjects[0].y2);
   }
   if (DotObjects[1]!=null){
     DotObjects[1].sketch();
     //line(DotObjects[1].x,DotObjects[1].y,DotObjects[1].x2,DotObjects[1].y2);
   }
   
   if(DotObjects[0]!=null && DotObjects[1]!=null){
   PVector a = segIntersection(DotObjects[0].x, DotObjects[0].y, DotObjects[0].x2, DotObjects[0].y2, DotObjects[1].x, DotObjects[1].y, DotObjects[1].x2, DotObjects[1].y2);
   if (a!=null) {
     DotObjects[0].isIntersecting=true;
     DotObjects[1].isIntersecting=true;
     DotObjects[0].intX=a.x;
     DotObjects[0].intY=a.y;
     DotObjects[1].intX=a.x;
     DotObjects[1].intY=a.y;
     if (a.x>0 && a.x<width && a.y>0 && a.y<height) {
       ellipse(a.x, a.y, 10, 10);
       fill(245,206,77);
       text(""+int(abs(DotObjects[0].angle-DotObjects[1].angle)), a.x, a.y-100);
     }
   }
   else{
     DotObjects[0].isIntersecting=false;
     DotObjects[1].isIntersecting=false;
   }
   }
}
