void screen5(){
  questionNum=0;
  check=loadImage("Image/check.png");//To get rid of the crash
  if(isAnimating){
   done.resize(radiusButton*2,radiusButton*2);
 } 
 image(done,width-140,height-140);
   for(int i=0;i<5;i++){
       if(answer[i]==0){
         image(badStar[i],(i+1)*100,height-100);
       }
       else if(answer[i]==1){
         image(star[i],(i+1)*100,height-100);
       }
   } 
   
 
  textSize(30);
  
  if(score==0){
    text("Come on! You can do better than that.",width/2,height/2);  
  }
  if(score==1){
    text("Try harder.",width/2,height/2);  
  }  
  if(score==2){
    text("Good. You can improve.",width/2,height/2);  
  } 
  if(score==3){
    text("Very Good. Keep it up.",width/2,height/2);  
  } 
  if(score==4){
    text("Excellent. You could help a few others learn now.",width/2,height/2);  
  } 
}
