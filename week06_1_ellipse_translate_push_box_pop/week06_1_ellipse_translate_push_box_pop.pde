//week06-1_ellipse_translate_push_box_pop
//有點模仿第4週的程式，慢慢建出來
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(142);
  ellipse(width/2, height/2, 200, 200);
  translate(width/2, height/2);//把東西放中間
  pushMatrix();
    //改一下，要按下mouse才轉
    if(mousePressed)rotateZ(radians(frameCount));//對著下面中心旋轉
    box(100, 30, 30);//橫的棒子
  popMatrix();
}
