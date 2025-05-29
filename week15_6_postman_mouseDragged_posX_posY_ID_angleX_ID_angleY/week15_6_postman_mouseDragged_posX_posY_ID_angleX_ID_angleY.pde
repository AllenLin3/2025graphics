//week15-6_postman_mouseDragged_posX_posY_ID_angleX_ID_angleY
//修改自week15-5_postman_mouseDragged_head_angleX_0_atan2
PImage postman, head, body, uparm1, hand1, uparm2, hand2, foot1, foot2;
void setup(){
  size(512, 600);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
  uparm2 = loadImage("uparm2.png");
  hand2 = loadImage("hand2.png");
  foot1 = loadImage("foot1.png");
  foot2 = loadImage("foot2.png");
}
float [] angleX= new float[10];
float [] angleY= new float[10];
int ID= 0;
ArrayList<String> lines = new ArrayList<String>();
void keyPressed() {
  if(key=='s'){
    String now="";
    for(int i=0;i<10;i++){
      now+= angleX[i] +" ";
      now+= angleY[i] +" ";
    }
    lines.add(now);
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angle.txt",arr);
    println("現在存檔" +now);
  }
  if(key=='r'){
    String [] file = loadStrings("angle.txt");
    if(file != null){
      for(int i=0; i<file.length; i++){
        lines.add(file[i]);
        println("現在讀檔:"+ file[i]);
      }
    }
  }
  if(key=='p')playing= !playing;
  if (key=='1') ID = 1;//左手臂
  if (key=='2') ID = 2;//左手
  if (key=='3') ID = 3;//右手臂
  if (key=='4') ID = 4;//右手
  if (key=='5') ID = 5;//左腳
  if (key=='6') ID = 6;//右腳
  if (key=='0') ID = 0;//頭
}
boolean playing = false;
float [] posX = {236, 185, 116, 290, 357, 220, 260 };
float [] posY = {231, 261, 265, 262, 259, 375, 372 };
float [] posAngle= {90, 180, 180, 0, 0, -90, -90};
void mouseDragged() {
  //從void draw()找到投 掛的位置 +236,+231
  //float dx= mouseX- 236, dy= mouseY -231;// 減掉座標
  //angleX[0] = degrees(atan2(dy, dx)) +90;// 頭的角度
  float dx= mouseX- posX[ID], dy= mouseY -posY[ID];// 減掉座標
  angleX[ID] = degrees(atan2(dy, dx)) +posAngle[ID];//某個關節的角度
  //把原本左右移動，變成像IK轉動
  //angleX[ID] += mouseX - pmouseX;
  //angleY[ID] += mouseY - pmouseY;
}
int R = 0;
void myInterpolate(){
  if(lines.size()>=2){
    float alpha = (frameCount%30)/30.0;
    if (alpha==0.0) R = (R+1)%lines.size();
    int R2 = (R+1)%lines.size();
    float [] oldAngle = float(split( lines.get( R ), ' ' ));
    float [] newAngle = float(split( lines.get( R2), ' ' ));
    for(int i=0;i<10;i++){
      angleX[i] = oldAngle[i*2+0]*(1-alpha) + newAngle[i*2+0]*alpha;
      angleY[i] = oldAngle[i*2+1]*(1-alpha) + newAngle[i*2+1]*alpha;
    }
  }
}
void draw(){
  background(#FFFFF2);
  if(playing) myInterpolate();
  image(body, 0, 0);//先畫身體
  pushMatrix();
  translate(232, 200);// 再放回去正確的位置
  rotate(radians(angleX[0]));
  translate(-232, -200);// 把頭的旋轉中心，放到(0,0)
  image(head, 0, 0);//再畫頭
  popMatrix();
  pushMatrix();//foot1
    translate(220, 375);
    rotate(radians(angleX[5]));
    translate(-220, -375);
    image(foot1, 0, 0);
  popMatrix();
  pushMatrix();//foot2
    translate(260, 372);
    rotate(radians(angleX[6]));
    translate(-260, -372);
    image(foot2, 0, 0);
  popMatrix();
  pushMatrix();//上手臂
  translate(185, 261);// 再放回去正確的位置
  rotate(radians(angleX[1]));
  translate(-185, -261);// 旋轉中心，放到(0,0)
  image(uparm1, 0, 0);
  pushMatrix();//手
  translate(126, 261);// 再放回去正確的位置
  rotate(radians(angleX[2]));
  translate(-126, -261);// 旋轉中心，放到(0,0)
  image(hand1, 0, 0);
  popMatrix();
  popMatrix();
  pushMatrix();//上手臂2
    translate(290, 262);// 再放回去正確的位置
    rotate(radians(angleX[3]));
    translate(-290, -262);// 旋轉中心，放到(0,0)
    image(uparm2, 0, 0);
    pushMatrix();//手2
      translate(357, 259);// 再放回去正確的位置
      rotate(radians(angleX[4]));
      translate(-357, -259);// 旋轉中心，放到(0,0)
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
}
