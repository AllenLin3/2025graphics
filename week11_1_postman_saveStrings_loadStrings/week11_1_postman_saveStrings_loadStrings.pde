//week11-1_postman_saveStrings_loadStrings
PImage postman, head, body, uparm1, hand1, uparm2, hand2;
float [] angle= new float[20];//準備20個關節
int ID= 0;//現在要處理的關節
void mouseDragged(){
  angle[ID] += mouseX -mouseY;
}
void keyPressed(){
  if(key=='1') ID = 1;//左手臂
  if(key=='2') ID = 2;//左手
  if(key=='3') ID = 3;//右手臂
  if(key=='4') ID = 4;//右手
  if(key=='5') ID = 5;//待用
  if(key=='6') ID = 6;//待用
  if(key=='0') ID = 0;//頭
  if(key=='s') {// 從這裡開始
    String now = "";//要放現在全部關節的值
    for(int i=0;i<20;i++){// 全部塞在now裡，記得有空
      now+= angle[i]+" ";
    }
    lines.add(now);//把現在這行加到lines 裡
    String[] arr = new String[lines.size()];
    lines.toArray(arr);
   saveStrings("angles.txt",arr);// 按下英文小寫 s 會存檔
  }
  if(key=='r'){
    if(R==0){//如果目前的沒有任何東西
      String [] file= loadStrings("angle.txt");
      if(file != null){//如果有讀到檔案
        for(int i=0;i<file.length;i++){//就檔案內容逐行
          lines.add(file[i]);// 加到lines資料結構裡
        }
      }
    }
    if(R<lines.size()){
      float [] now= float(split( lines.get(R), ' '));
      for(int i=0;i<20;i++)angle[i] = now[i];
      R=(R+1) %lines.size();   
      
    }
  }
}
int R=0; 
ArrayList<String> lines = new ArrayList<String>();
void setup(){
  size(560, 560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
  uparm2 = loadImage("uparm2.png");
  hand2 = loadImage("hand2.png");
}
void draw(){
  background(#FFFFF2);
  image(postman, 0, 0);// 基礎的郵差先生(全身)
  fill(255, 0, 255, 128);//半透明的紫色
  rect(0, 0, 560, 560);//蓋上去
  pushMatrix();//上手臂
    translate(185, 261);// 再放回去正確的位置
    rotate(radians(angle[1])*0.1);
    translate(-185, -261);// 旋轉中心，放到(0,0)
    image(uparm1, 0, 0);
    pushMatrix();//手
      translate(126, 261);// 再放回去正確的位置
      rotate(radians(angle[2])*0.1);
      translate(-126, -261);// 旋轉中心，放到(0,0)
      image(hand1, 0, 0);
    popMatrix();
  popMatrix();
   pushMatrix();//上手臂2
    translate(290, 262);// 再放回去正確的位置
    rotate(radians(angle[3])*0.1);
    translate(-290, -262);// 旋轉中心，放到(0,0)
    image(uparm2, 0, 0);
    pushMatrix();//手2
      translate(357, 259);// 再放回去正確的位置
      rotate(radians(angle[4])*0.1);
      translate(-357, -259);// 旋轉中心，放到(0,0)
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
  pushMatrix();
    translate(232, 200);// 再放回去正確的位置
    rotate(radians(angle[0])*0.1);
    translate(-232, -200);// 把頭的旋轉中心，放到(0,0)
    image(head, 0, 0);//再畫頭
  popMatrix();
  image(body, 0, 0);//再畫身體
}
