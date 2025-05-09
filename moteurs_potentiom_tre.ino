#include <Servo.h>

// definition des objets de la classe Servo
Servo servo1A, servo1B; 
Servo servo2, servo3, servo4, servo5, servo6;


int pinServo1A = 3;
int pinServo1B = 5;
int pinServo2 = 6;
int pinServo3 = 9;
int pinServo4 = 10;
int pinServo5 = 11;

int pot1 = A0;
int pot2 = A1;
int pot3 = A2;
int pot4 = A3;
int pot5 = A4;
int pot6 = A5;

// NEMA 17
int stepPin = 7;
int dirPin = 8;
void setup() {
  
  servo1A.attach(pinServo1A);
  servo1B.attach(pinServo1B);
  servo2.attach(pinServo2);
  servo3.attach(pinServo3);
  servo4.attach(pinServo4);
  servo5.attach(pinServo5);
  
  // NEMA 17
 pinMode(stepPin, OUTPUT);
 pinMode(dirPin, OUTPUT);
}
void loop() {
  
  int steps = map( analogRead(pot1), 0, 1023, 0, 200); // 200 pas = 1 tour
  digitalWrite(dirPin, HIGH);
  for (int i = 0; i < steps; i++) {
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(1000);
    digitalWrite(stepPin, LOW);
    delayMicroseconds(1000);
  }delay(15);
 
  int val2 = analogRead(pot2);
  int angle2 = map(val2, 0, 1023, 0, 180);
  servo1A.write(angle2);
  servo1B.write(angle2); // synchronisation

  servo3.write(map(analogRead(pot3), 0, 1023, 0, 180));
  servo4.write(map(analogRead(pot4), 0, 1023, 0, 180));
  servo5.write(map(analogRead(pot5), 0, 1023, 0, 180));
  servo6.write(map(analogRead(pot6), 0, 1023, 0, 180));

 delay(15);
}
