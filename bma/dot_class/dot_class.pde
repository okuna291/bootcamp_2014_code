boolean saveAnim = false;
float frm, a;
int numElem = 150;
myDot[] myDots = new myDot[numElem];
color bg = #202020;
color[] palette = {
  #F58F12, #0B9EE7, #4EA731, #F4D910, #F334E3
};
 
void setup() {
  size(1024, 768);
  background(bg);
  noStroke();
  float locx, locy, start_sz, r;
  color col;
 
  for (int i=0; i<numElem; i++) {
    locx = random(width);
    locy = random(height);
    start_sz = random(8, 15);
    col = palette[int(random(5))];
    r = random(TWO_PI);
    myDots[i]= new myDot(locx, locy, start_sz, col, r);
  }
}
 
void draw() {
  fill(bg);
  rect(0, 0, width, height);
  for (int i=0; i<numElem; i++) {
    myDots[i].display(i);
  }
 
  if (saveAnim) {
    if (frameCount % 4 == 0 && frameCount < frm+121) saveFrame("image-###.gif");
  }
}
 
void keyPressed() {
  saveAnim = true;
  frm = frameCount;
}
 
void mouseClicked() {
  setup();
}
 
class myDot {
  float locx, locy, start_sz, sz, r, x, y;
  color col;
  int dir=1;
 
  myDot(float _locx, float _locy, float _start_sz, color _col, float _r) {
    locx = _locx;
    locy = _locy;
    start_sz = _start_sz;
    col = _col;
    r = _r;
    x = random(-20, 20);
    y = random(-20, 20);
    if (random(1)>.5) dir =-1;
  }
 
  void display(float i) {
    pushMatrix();
    translate(locx, locy);
    rotate(r);
    sz = map(sin(r), -1, 1, 5, start_sz*4);
    a = 200;
    fill(col,a);
    rect(x, y, sz, sz, sz/3);
    popMatrix();
    r += 0.0523*dir;
  }
}
