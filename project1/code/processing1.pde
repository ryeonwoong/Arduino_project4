import processing.serial.*;
import processing.net.*;

Server s;
Client c;
Serial p;
int ledState = 0;

void setup() {
  p = new Serial(this, "COM4", 9600);
  s = new Server(this, 12345);
}

void draw() {
  c = s.available();
  if (c != null) {
    String m = c.readString();
    m = m.substring(m.length() - 1);  // 마지막 1문자만 추출하기

    if (m.equals("1")) {
      ledState = 1;
    } else if (m.equals("0")) {
      ledState = 0;
    }

    // 제어한 LED 상태에 따라 LED를 켜거나 끕니다.
    if (ledState == 1) {
      p.write("1");
    } else {
      p.write("0");
    }
  }
}
