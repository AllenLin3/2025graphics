// week13-2_camera_movie_eye_center_up
// 電腦圖學繪圖時，會設定 camera 的 相關係數
import processing.video.*;//要使用影片的外掛
Movie movie; // 要放影片的變數
void setup(){
  size(720, 480, P3D); // 要記得加上P3D 才能有OpenGL 3D 功能
  movie= new Movie(this, "street.mov");
  movie.loop();// 迴圈撥放
}
void draw(){
  background(128);
  camera(mouseX, mouseY, 500, 360, 240, 0, 0, 1, 0);
  //很多參數 eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ
  //                                現在把影片中心點當主角
  if(movie.available()) movie.read();// 有新畫面就讀入
  image(movie, 0, 0);// 放影片在 0,0
}
