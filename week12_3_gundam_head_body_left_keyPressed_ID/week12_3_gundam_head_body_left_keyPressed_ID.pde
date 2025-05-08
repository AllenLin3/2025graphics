// week12-3_gundam_head_body_left_keyPressed_ID
//修改自week12-2_gundam_head_body_uparm_upuparm_hand_angle
PShape body,head;
PShape uparm1,upuparm1,hand1;
void setup(){
  size(400, 400, P3D);
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  uparm1 = loadShape("uparm1.obj");//week09-5
  upuparm1 = loadShape("upuparm1.obj");//week09-5
  hand1 = loadShape("hand1.obj");//week09-5
}
float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0;//0:頭 1:上上手臂 2:上手臂 3: 手
void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX);
  angleY[ID] += radians(mouseY - pmouseY);
}
void keyPressed(){
  if(key=='1')ID = 1;//還沒有設好 上上手臂
  if(key=='2')ID = 2;//上手臂
  if(key=='3')ID = 3;//手
  if(key=='4')ID = 4;
  if(key=='5')ID = 5;
  if(key=='6')ID = 6;
  if(key=='7')ID = 7;
  if(key=='8')ID = 8;
  if(key=='9')ID = 9;
  if(key=='0')ID = 0;//頭
}
void draw(){
  background(204);
  translate(200, 300);
  sphere(10);// 原點的球
  
  scale(10, -10, 10);// y要上下再反過來
  shape(body, 0, 0);
  pushMatrix();
    translate(0, 22.5);
    rotateY(angleX[0]);
    rotateX(angleY[0]);
    translate(0, -22.5);
    shape(head, 0, 0);
  popMatrix();
  
  pushMatrix();
    shape(upuparm1, 0, 0);// 上上手臂
    pushMatrix();
      translate(-4.1, 19.9);// 再掛回原本的位置
      rotateZ(angleY[2]);
      rotateY(angleX[2]);
      translate(4.1, -19.9);// 把物體的旋轉中心，放到座標中心
      shape(uparm1, 0, 0);// 上手臂
      pushMatrix();
        translate(-4.5, 16.9);
        rotateY(angleX[3]);
        rotateX(angleY[3]);
        translate(4.5, -16.9);// 把剛剛手移到做邊中心的移動量
        shape(hand1, 0, 0);// 手
       popMatrix();
     popMatrix();
  popMatrix();
}
