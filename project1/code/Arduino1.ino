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

