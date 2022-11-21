//This function draws the INTRO screen.

void intro() {
  textSize(24);
  introG.show(); //intro gif
  introB.show(); //intro button
  if (introB.buttonClicked()) mode = INTRO2;
}  

void midIntro() {
  //transitional intro to display title
  background(nBlue);
  
  fill(mGold);
  textSize(72);
  text("Treasures of the Galleon", width/2, height/3);
  
  //loading bar
  noStroke();
  fill(gray);
  rect(150,380, 500, 20);
  fill(mGold);
  float x = map(transitionCount, 0, 50, 0, 500);
  rect(150, 380, x, 20);
  
  transitionCount ++;
  if (transitionCount >= 50) mode = PLAY;
}
