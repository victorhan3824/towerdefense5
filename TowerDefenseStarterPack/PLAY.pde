//This function draws the PLAY screen

void play() {
  animateEverything();  //animate everything
  toolbar(); //toolbar
  buttonControl(); //check button clicks
}

void animateEverything() {
  image(backdrop, width/2, height/2); //background image
  map1(); //backdrop
  //drawNodes(); //draw Nodes (just debugging)
  home();  //controls end of path and its mechanisms
  statDisplay(); //display stats

  //mob - parsas
  for (int i=0; i < parsas.size(); i++) {
    Mob pNow = parsas.get(i);
    pNow.act();
    pNow.show();
    if (pNow.hp <= 0) { //remove because no health
      parsas.remove(pNow);
    }
  }

  //towers
  for (int i=0; i < towers.size(); i++) {
    Tower tNow = towers.get(i);
    tNow.show();
    if (tNow.status != tNow.PLACING) {
      tNow.act();
    }
  }

  //shells
  for (int i=0; i < shells.size(); i++) {
    Bullet bNow = shells.get(i);
    if (parsas.size() > 0) { //make sure it only shoot when there is mob
      bNow.act();
    }
  }
}

void statDisplay() {
  //display wood count, wave count, healthbar
  //wave count
  stroke(violet);
  strokeWeight(5);
  fill(nBlue);
  rect(width/2, 40, 240, 40);
  fill(mGold);
  text("Wave " + (waveCount-1), width/2, 40);
  //health display
  noStroke();
  fill(violet);
  healthWheel();
  //material count
  materialWheel();
}

void healthWheel() {
  //health wheel
  fill(nBlue);
  arc(740, 40, 65, 65, 0, map(health, 0, maxHealth, 0, PI*2));
  fill(violet);
  circle(740, 40, 60);
  //treasure(health) count
  image(treasure, 740, 40);
  fill(violet);
  text(health, 680, 40);
}

void materialWheel() {
  fill(nBlue);
  circle(740, 120, 65);
  fill(violet);
  circle(740, 120, 60);
  image(material, 740, 120);
  fill(violet);
  text(money, 680, 120);
}

void buttonControl() {
  if (nWave.buttonClicked()) { //clicking next wave
    if (parsas.size()  <= 0) { //check if no alive mob
      for (int i = 0; i < waveCount; i++) { //spawning mobs based on wave count
        parsas.add(new Mob(0-i*50, 2*height/3, 1, 0, 3, 3, 40, 1, regM)); //regular mob
        parsas.add(new Mob(0-i*50, 2*height/3, 1, 0, 1, 10, 80, 100, chunkM)); //chunky mob
      }
      waveCount ++;
    }
  }

  if (toBuild.buttonClicked()) { // to BUILD
    mode = BUILD;
  }
}

void drawNodes() {
  strokeWeight(1);
  for (int i=0; i<nodes.length; i++) nodes[i].show();
}

void toolbar() {
  nWave.show(); //next wave button
  toBuild.show(); //PLAY --> BUILD
}

void home() {
  //when mob reaches home
  Node last = nodes[nodes.length-1]; //find the end nodes

  //draw home
  image(flagship, last.x + 50, last.y);
}

void map1() {
  //draw out map1
  strokeWeight(3);
  stroke(flame);
  line(0, 2*height/3, 100, 2*height/3);
  line(100, 2*height/3, 100, height/2);
  line(100, height/2, 200, height/2);
  line(200, height/2, 200, height/3);
  line(200, height/3, 500, height/3);
  line(500, height/3, 500, height/2);
  line(500, height/2, 350, height/2);
  line(350, height/2, 350, 4*height/5);
  line(350, 4*height/5, 700, 4*height/5);
}
