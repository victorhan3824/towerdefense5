

class Bullet {
  float x, y, vx, vy, d; //d is diameter of bullet
  float startX, startY; //bullet's start pos
  float R; //range, user give radius
  int time; //time variable for AoE_ring
  int type; //type of bullet
  
  Bullet (int T, float X, float Y) { //bullet basis class, this is also constructor for GAL type
    type = T; //GUN GAL based on tower type, SNP tower lazer code is in Tower class
    x = X;
    y = Y;
    if (type == GAL) {
      time = 0;
      R = 75;  
    }
  }
  
  Bullet(int T, float X, float Y, float VX, float VY) {//GUN
    this(T, X, Y);
    startX = X;
    startY = Y;
    vx = VX;
    vy = VY;
    d = 2; //the diameter of bullet; used for collision
    R = 125;
  }

  void act() {
    if (type == GUN) actGUN(); 
    if (type == GAL) actGAL();
  }
  
//===========================================
  void actGUN() {
    fill(black);
    circle(x,y,d); 
    //act
    x += vx;
    y += vy;
    if (dist(x,y,startX,startY) > R) { //check if outside range
      shells.remove(this);
    }
  }
  
  void actGAL() {
    //AoE Ring show
    strokeWeight(1);
    stroke(white);
    fill(255,255,255,25);
    circle(x, y, R*2);
    
    //AoE Ring act
    time++;
    if (time > 20) {
      shells.remove(this);
    }    
  }
  
} //================================================================
