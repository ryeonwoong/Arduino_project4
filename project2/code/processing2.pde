import processing.serial.*;
import processing.net.*;
Serial p;
Server s;
Client c;
void setup(){
  p = new Serial(this, "COM4", 9600);
  s = new Server(this, 12345);
}
String m="";
void draw(){
  if(p.available()>0){
    m = p.readStringUntil('\n');
    if(m!=null){
      print(m);
    }
  }
  c = s.available();
  if(c!=null){
    String w = c.readString();
    println(w);
    if (w.indexOf("GET")==0) { // 스마트폰의 GET이 1초 마다 요청을 할 경우 
      c.write("HTTP/1.1 200 OK\r\n\r\n\r\n"); // POST 규격
      c.write(m);
    }
    c.stop();
  }
}
