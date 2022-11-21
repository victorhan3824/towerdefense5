//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to 
//the node's instructions. 

class Node {
  float x, y, dx, dy;
  
  Node(float X, float Y, float DX, float DY) {
    x = X;
    y = Y;
    dx = DX;
    dy = DY;
  }
  
  void show() {
    fill(flame);  
    stroke(flame);
    circle(x,y,20);
    line(x, y, x+dx*30, y+dy*30);
  }
}
