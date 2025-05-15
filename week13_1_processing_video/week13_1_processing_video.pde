// week13-1_processing_video
//Sketch - Library - Mange Libraries 安裝video
import processing.video.*;//Java 使用外掛的匯入
//有視訊鏡頭的，用這個版本
Capture video;
Movie movie;// 沒有視訊鏡頭，改用這個
void setup(){
  size(640, 960);//常見的視訊
  video = new Capture(this, 640, 480);
  video.start();// 打開視訊
  movie= new Movie(this, "street.mov");//讀檔案
  movie.loop();
}
void draw(){
  if(video.available()) video.read();
  image(video, 0, 480);
  if(movie.available()) movie.read();
  image(movie, 0, 0);
}
