/*Portable button class
  different type buttons have differnt amount of parameters
  show function is universal for all types of buttons
  !!!! imageMode, TextAlign, rectMode MUST ALL BE CENTER !!!!
  to see if a button is clicked, used the [buttonName].buttonClicked() to check
  ie. if (bN.buttonClicked())
*/

class Button {
  float x, y, w, h; //shared dimension variables
  String text; //text variable
  int curve; //rectangle curvature
  int sWeight; //strokeWeight for tactile
  int bType; //determine button type
  PImage bImage; //button image
  color cText, cFill, cBorder; //names are intuitive
  //clicking mechanism ---------------------------------------------------------------
  boolean mouseOff, hasPressed;

  //Basis Constructors ---------------------------------------------------------------
  Button(int T, float X, float Y, float W, float H, int sW) {
    //call on this constructor by function this()
    bType = T; //button type
    x = X; //X coord
    y = Y; //Y coord
    w = W; //Width
    h = H; //Height
    sWeight = sW; //stroke Weight
    //clicking mechanism
    mouseOff = false;  /*detect if the mouse is lifted off, 
                        thus it's false here*/
    hasPressed = false; //check if the user have pressed button
  }

  //sub / customized constructors -----------------------------------------------------
  Button(int T, float X, float Y, float W, float H, int sW, int C, color c1,
    color c2, color c3, String txt) {
    //type 0 button, rectange with color and a text label
    this(T, X, Y, W, H, sW);
    curve = C;
    cText = c1; //text color
    cFill = c2; //fill color
    cBorder = c3; //border color
    text = txt;
  }

  Button(int T, float X, float Y, float W, float H, int sW, color C, PImage I) {
    //type 1 button, image with no label, but tactile
    this(T, X, Y, W, H, sW);
    cBorder = C; //the tactile color
    bImage = I;
  }

  Button(int T, float X, float Y, float W, float H, int sW, color c1,
    color c2, color c3, String txt) {
    //type 2 button, ellipse (W & H for major and minor axis), behaves like type 0;
    this(T, X, Y, W, H, sW);
    cText = c1; //text color
    cFill = c2; //fill color
    cBorder = c3; //border color
    text = txt;
  }

  //main behavior functions -----------------------------------------------------------
  void show() {
    strokeWeight(this.sWeight);
    if (this.bType == 0 || bType == 2) {
      type0and2();
    } else if (bType == 1) {
      type1Button();
    }
  }

  boolean isHover() { //check if mouse over the button
    return (mouseX > x-w/2 && mouseX < x+w/2 &&
      mouseY > y-h/2 && mouseY < y+h/2);
  }

  boolean buttonClicked() { //check if user have clicked button
    this.clicked();  
    return (this.isHover() && this.mouseOff);
  }

  void clicked() {  //check if the user have clicked ANYWHERE on screen
    mouseOff = false; //constantly setting mouseOff to false
    if (mousePressed) this.hasPressed = true; //record that you clicked
    if (hasPressed && !mousePressed) { 
      this.mouseOff  = true; //
      this.hasPressed = false; //reseting your clicking status
    }
  }

  //sub behavior functions -------------------------------------------------------------
  void type0and2() {
    stroke(cBorder);
    color textCol = cText;
    color fillCol = cFill;
    if (isHover()) { //when mouse hovers over
      textCol = cFill;
      fillCol = cText;
    }
    drawType0and2(fillCol);
    drawLabel(textCol);
  }

  void type1Button() {
    if (isHover()) {
      noFill();
      stroke(cBorder);
      rect(x, y, w, h);
    }
    image(bImage, x, y, w, h);
  }

  void drawType0and2(color c) {
    //draw the button itself
    fill(c);
    if (bType == 0) rect(x, y, w, h, curve); //type 0 button
    else if (bType == 2) ellipse(x, y, w, h); //type 2 button
  }

  void drawLabel(color c) {
    //draw the text for label
    textSize(18);
    fill(c);
    text(text, x, y);
  }
}
