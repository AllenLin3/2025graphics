//week03-12_3D_sphere_translate_rotateY_lights
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  lights();//加上打光
  translate(mouseX, mouseY);
  rotate(radians(frameCount));
  sphere(200);
}
