#include <Servo.h>
#define LENGTH 1

int rxBuffer[128];
int rxIndex = 0;

Servo frontServo;
Servo leftServo;
Servo rightServo;

void setup() {
  Serial.begin(9600);
  //Attach servos to digital IO pins.
  frontServo.attach(11);
  leftServo.attach(9);
  rightServo.attach(10);
  //Set servers to 0.
  frontServo.write(90);
  leftServo.write(90);
  rightServo.write(90);
}

void loop () {
    if (Serial.available() > 0) {
       rxBuffer[rxIndex++] = Serial.read();
       if (rxIndex == LENGTH) {
         //Serial.print("Byte received: ");
         //Serial.println(rxBuffer[0]);
         if (rxBuffer[0] == 48) {
           forward();
         } else if (rxBuffer[0] == 49) {
           right();
         } else if (rxBuffer[0] == 50) {
           reverse();
         } else if (rxBuffer[0] == 51) {
           left();
         } else if (rxBuffer[0] == 52) {
           stopAll();
         }
  rxIndex = 0;

       }
    }
}

void forward () {
  leftServo.write(135);
  rightServo.write(35);
};

void right () {
  leftServo.write(135);
  rightServo.write(90);
}

void reverse () {
  leftServo.write(35);
  rightServo.write(135);
}

void left () {
  leftServo.write(90);
  rightServo.write(35);
}
   
void stopAll () {
    leftServo.write(90);
    rightServo.write(90);
}
