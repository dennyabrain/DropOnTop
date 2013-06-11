void screen2(){
 image(acuteLogo,120,180);
 image(rightLogo,490,180);
 image(obtuseLogo,860,180);
 if(isAnimating){
   playGame.resize(radiusButton*2,radiusButton*2);
 }
 image(playGame,width-140,height-140);   
 textAlign(CENTER);
 textSize(20);
 if(option==1){
   fill(245,208,77);
   arc(270, 330, 50, 50,-1*HALF_PI/20*angleButtons,0,PIE);
   fill(125,125,125);
   text(acuteAngle,120+150,420);
 }
 else if(option==2){
   fill(245,208,77);
   arc(640, 330, 50, 50,-1*HALF_PI/20*angleButtons,0,PIE);
   fill(125,125,125);
   text(rightAngle,490+150,420);
 }
 else if(option==3){
   fill(245,208,77);
   arc(1010, 330, 50, 50,-1*HALF_PI/20*angleButtons,0,PIE);
   fill(125,125,125);
   text(obtuseAngle,860+150,420);
 } 
}
