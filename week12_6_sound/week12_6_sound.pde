//week12-6_sound
//要有聲音，需要聲音的 Library 函式庫
// Sketch - Library -Managed Libraries 找 Sound
//會看到 Sound | Provideos a simple way to work with audio
//選它，右下角 Install 下載安裝(會有小勾勾)
// 安裝好 Sound 後， 會有File - Examples 點開 Libraries核心函式庫 Sound
//Soundfile 那堆範例 看 SimplePlayback 簡單撥放音樂的範例
import processing.sound.*;
SoundFile mySound;
void setup() {
  size(400, 400);
  mySound = new SoundFile(this, "music.mp3");
  mySound.play();
}      
void draw() {
}
