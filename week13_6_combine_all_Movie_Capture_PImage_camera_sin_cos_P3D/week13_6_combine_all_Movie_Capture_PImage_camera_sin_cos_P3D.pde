// week13-6_combine_all_Movie_Capture_PImage_camera_sin_cos_P3D
//把今天教的全部加進來
//street.mov 及 chessboard.png 都加進來
import processing.video.*;
Movie movie;
PImage img;
void setup(){
  size(400, 400, P3D); // 要記得加上P3D 才能有OpenGL 3D 功能
  movie= new Movie(this, "street.mov");
  movie.loop();// 迴圈撥放
  img = loadImage("chessboard.png");
  textureMode(NORMAL);
  video = new Capture(this, 640, 480);
  video.start();
}
Capture video;
void draw(){
  camera(200, 200, 200, 200+ cos(radians(frameCount)), 200, 200+sin(radians(frameCount)), 0, 1, 0);
  background(128);
  if(movie.available()) movie.read();
  beginShape(); // 正前方的牆
    texture(img);
    vertex(  0,   0, 0, 0, 0);// x, y, z, u, v
    vertex(400,   0, 0, 1, 0);
    vertex(400, 400, 0, 1, 1);
    vertex(  0, 400, 0, 0, 1);
  endShape();
  image(movie, 0, 0, 360, 240);
  if(video.available()) video.read(); // 放影片，用2D放圖的方法
  beginShape(); // 左方的牆，直接放視訊
    texture(video);// 把視訊也當成一面牆
    vertex(0,   0,   0, 0, 0);// x, y, z, u, v
    vertex(0, 400,   0, 1, 0);
    vertex(0, 400, 400, 1, 1);
    vertex(0,   0, 400, 0, 1);
  endShape();
}
