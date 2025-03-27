//week06-5_push_T_box_push_T_R_T_box_pop_pop
//慢慢組合出機器手臂
void setup(){
  size(500,400,P3D);
}
void draw(){
  background(255);
  translate(width/2, height/2);
  sphere(10);
  
  fill(252,131,77);
  pushMatrix();
    translate(x, y);
     box(200,50,25);//手肘
    pushMatrix();//step03 把程式往右縮排
      translate(100, 0);//step01 發現放 100,0 很好
      //if(mousePressed) // step02 把剛剛的if(mousePressed)刪掉
      rotateZ(radians(frameCount));
      translate(25, 0, 0);// 往右推，讓左端放中心
      box(50,25,50);//小手腕
     popMatrix();
    popMatrix();
}
float x=0, y=0;// 會動的位置
void mouseDragged(){
  x += mouseX - pmouseX;
  y += mouseY - pmouseY;
  println("x:" + x + " y:" + y);// step07 印出來
}
