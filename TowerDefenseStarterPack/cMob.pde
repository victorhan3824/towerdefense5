//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x, y, vx, vy, s, d;
  int hp, maxHP, value;
  PImage image;
  
  Mob(float X, float Y, float VX, float VY, float S, int HP, float D, int V, PImage I) {
    x = X;
    y = Y;
    vx = VX;
    vy = VY;
    hp = maxHP = HP;
    
    
    s = S; //speed variable
    d = D; //diameter of mob, used for collision
    value = V;
    image = I;
    image.resize(int(d),int(d));
  }
  
  void show() {
    image(image, x, y);
    healthbar();
  }
  
  void act() {
    x += vx*s;
    y += vy*s;
    
    turning();
    getHit();
  }  
//================================================================
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-d/2-2, y-(d+10)-2, d+4, 5);//background
    fill(purple);
    rect(x-d/2, y-(d+10), d, 3);
    fill(flame);
    rect(x-d/2, y-(d+10), hp*d/maxHP, 3);
    rectMode(CENTER);
  }
  
  void turning() { //performing a turn
    //turning when encountering nodes
    for (int i=0; i < nodes.length; i ++) {
      Node n = nodes[i];
      if (dist(n.x, n.y, this.x, this.y) < 3) { //check if the mob is close enough to the node
        if (i == nodes.length-1) { //if it reach the end Node
          parsas.remove(this);
          health--; //remove the user's health
        }
        else { //if it is not at end node
          // copies over direction from the node
          this.vx = n.dx;
          this.vy = n.dy;
        }
      }    
    }
  }
  
  void getHit() { //check if hit by bullet
    for (int i=0; i < shells.size(); i++) {
      Bullet bNow = shells.get(i);
      if (bNow.type == GUN){
        if (dist(bNow.x, bNow.y, this.x, this.y) < this.d/2 + bNow.d/2) {
          //check for collision
          this.hp--; //decrease mob xp
          shells.remove(bNow); //remove bullet
        }
      }
      //-----------------
      if (bNow.type == GAL) {
        if (dist(bNow.x, bNow.y, this.x, this.y) < bNow.R &&
              frameCount % 10 == 0) {
          this.hp--;
        }
      }
      //------------------
    }
    
    //remove when no hp
    if (hp <= 0) {
      parsas.remove(this);
      money += value; //add money to the user
    }
  }
  
  
}
