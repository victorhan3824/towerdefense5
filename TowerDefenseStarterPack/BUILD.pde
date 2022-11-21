//This function draws the BUILD screen

void build() {
  animateEverything(); /*animate things
  source is in PLAY tab
  */
  buildBar();
  if (clickable) buildModeButtonControl();
  aesthetics();
}

void buildBar() {
  //bar itself
  fill(purple);
  noStroke();
  rect(width/2, 570, width, 60);

  toPlay.show(); //go to PLAY mode button show
  buildT1.show();
  buildT2.show();
  buildT3.show();
  
}

void buildModeButtonControl() {
  //go to PLAY mode
  if (toPlay.buttonClicked()) {
    mode = PLAY;
  }
  
  //placing towers
  if (buildT1.buttonClicked()) {
    towers.add(new Tower(GUN));
  }
  if (buildT2.buttonClicked()) {
    towers.add(new Tower(SNP)); 
  }
  
  if (buildT3.buttonClicked()) {
    towers.add(new Tower(GAL)); 
  }
  
}

void aesthetics() {
  //wave count
  stroke(violet);
  fill(nBlue);
  rect(width/2, 40, 240, 40);
  fill(mGold);
  text("Build Mode", width/2, 40);  
}
