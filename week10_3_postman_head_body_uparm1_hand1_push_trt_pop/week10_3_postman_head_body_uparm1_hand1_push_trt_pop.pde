//week10-3_postman_head_body_uparm1_hand1_push_trt_pop
PImage postman, head, body, uparm1, hand1;
  void setup(){
  size(560, 560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
}
void draw(){
  background(#FFFFF2);
  image(postman, 0, 0);// 基礎的郵差先生(全身)
  fill(255, 0, 255, 128);//半透明的紫色
  rect(0, 0, 560, 560);//蓋上去
  pushMatrix();//上手臂
    translate(185, 261);// 再放回去正確的位置
    //rotate(radians(mouseX));
    translate(-185, -261);// 旋轉中心，放到(0,0)
    image(uparm1, 0, 0);
    pushMatrix();//手
      translate(116, 231);// 再放回去正確的位置
      //rotate(radians(mouseX));
      translate(-116, -231);// 旋轉中心，放到(0,0)
      image(hand1, 0, 0);
    popMatrix();
  popMatrix();
  pushMatrix();
    translate(232, 200);// 再放回去正確的位置
    rotate(radians(mouseX));
    translate(-232, -200);// 把頭的旋轉中心，放到(0,0)
    image(head, 0, 0);//再畫頭
  popMatrix();
  image(body, 0, 0);//再畫身體
}
