// week15-1_mulitple_windows
//file> Example >Demos> Tests > MutipleWindows
void setup(){
  size(300, 200);// 小的第1個視窗
  background(255, 0, 0);
  WindowB child = new WindowB();
}
void draw(){ //空白的，要放

}
//以下會獨立執行
class WindowB extends PApplet{
  public WindowB(){ // 建構子 constructor
    super(); // 呼叫上一層 建構子
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  public void settings(){
    size(300, 200);
  }
  public void setup(){
    //size(200, 200);
    background(0, 255, 0);
  }
  public void draw(){
  
  }
}
