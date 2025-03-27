//week06-7_push_RRT_many_TRT_inside_pop
//慢慢組合出機器手臂
void setup(){
  size(500,800,P3D);//step00: 把視窗便常一點，看比較完整
}
void draw(){
  background(255);
  translate(width/2, height/2);
  sphere(10);
  fill(252,131,77);
  pushMatrix();  
    if(mousePressed && mouseButton==RIGHT)rotateY(radians(frameCount));//step03:右鍵旋轉
    if(mousePressed && mouseButton==RIGHT)rotateZ(radians(frameCount));//step02:右鍵旋轉
    translate(0,-100);//translate(x, y);//step01:要往上抬升，把關節移到中心
    box(50,200,25);//手臂
    pushMatrix();
      translate(0,-100);//step00: 掛到手臂上，觀察到0,-100
      //if(mousePressed)//step00:把if(mousePressed)刪掉讓他一直轉
      rotateZ(radians(frameCount));
      translate(100,0);
      box(200,50,25);
      pushMatrix();
        translate(100, 0);
        rotateZ(radians(frameCount));
        translate(25, 0, 0);
        box(50,25,50);//小手腕
       popMatrix();
      popMatrix();
     popMatrix();
}
float x=0, y=0;// 會動的位置
void mouseDragged(){
  x += mouseX - pmouseX;
  y += mouseY - pmouseY;
  println("x:" + x + " y:" + y);// step07 印出來
}
