// week13-5_camera_keyPressed_keyCode_x_y_z_angle_cos_sin
// 修改自week13-4_camera_chessboard_texture_front_left
// 利用 方向鍵(上下左右鍵)來移動
PImage img;
void setup(){
  size(400, 400, P3D);
  img = loadImage("chessboard.png");
  textureMode(NORMAL);
}
float x= 200, y= 200, z= 200, angle= 180;
void keyPressed(){
  if(keyCode==LEFT) angle--;
  if(keyCode==RIGHT) angle++;
  if(keyCode==UP){
    x += cos(radians(angle));
    z += sin(radians(angle));
  }
  if(keyCode==DOWN){
    x -= cos(radians(angle));
    z -= sin(radians(angle));
  }
}
void draw(){// 攝影機往前方看，左右、前後移動
  if(keyPressed)keyPressed();
  camera(x, y, z, x+ cos(radians(angle)), y, z+sin(radians(angle)), 0, 1, 0);
  background(128);// 灰背景
  beginShape(); // 正前方， z座標都放0
    texture(img);
    vertex(  0,   0, 0, 0, 0);// x, y, z, u, v
    vertex(400,   0, 0, 1, 0);
    vertex(400, 400, 0, 1, 1);
    vertex(  0, 400, 0, 0, 1);
  endShape();
  beginShape(); // 左方， x座標都放0
    texture(img);
    vertex(0,   0,   0, 0, 0);// x, y, z, u, v
    vertex(0, 400,   0, 1, 0);
    vertex(0, 400, 400, 1, 1);
    vertex(0,   0, 400, 0, 1);
  endShape();
}
