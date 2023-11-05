void setup() {
  pinMode(13, OUTPUT);
  Serial.begin(9600);
}
void loop() {
  if(Serial.available()>0){
    char v = Serial.read();
    if(v=='1') digitalWrite(13, HIGH);
    if(v=='0') digitalWrite(13,LOW);
  }
}

아두이노 
void setup() {
  Serial.begin(9600);
}
double th(int v) {
  double t;
  t = log(((10240000/v) - 10000));
  t = 1 /(0.001129148 + (0.000234125*t) + (0.0000000876741*t*t*t));
  t = t - 273.15; // 화씨를 섭씨로 바꾸어줌
  return t;
}
void loop() {
  int temp = analogRead(A0); // 온도 센서 값 읽기
  int light = analogRead(A1); // 조도 센서 값 읽기

  double temperature = th(temp); // 온도 값 계산
  Serial.print("온도: ");
  Serial.print(temperature);
  Serial.print("°C, 조도: ");
  Serial.println(light);

  delay(1000);
}
