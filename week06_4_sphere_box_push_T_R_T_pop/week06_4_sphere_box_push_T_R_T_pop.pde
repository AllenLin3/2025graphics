//week06-4_sphere_box_push_T_R_T_pop
//慢慢組合出機器手臂
void setup(){
  size(500,400,P3D);
}
void draw(){
  background(255);// step00
  translate(width/2, height/2);// step00
  sphere(10);// step04 放個圓球，當世界中心的參考
  
  box(200,50,25);//step05 手肘
  
  fill(252,131,77);
  pushMatrix();// step03
    translate(x, y);// step06 發現放 100,0 很好
    if(mousePressed)rotateZ(radians(frameCount));// step03
    translate(25, 0, 0);// step02 往右推，讓左端放中心
    box(50,25,50);// step01 小手腕
   popMatrix();// step03
}
float x=0, y=0;// step06 會動的位置
void mouseDragged(){// step06 
  x += mouseX - pmouseX;
  y += mouseY - pmouseY;
  println("x:" + x + " y:" + y);// step07 印出來
}
