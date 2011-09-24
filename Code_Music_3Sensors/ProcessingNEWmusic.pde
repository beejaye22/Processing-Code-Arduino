
 
#include <Firmata.h> 
  
int sensorPin = 0;  
int sensorPin1 = 1;
int sensorPin2 = 2;


int speakerPin = 9;

int length = 2; // the number of notes
char notes[] = {"c "}; // a space represents a rest
int beats[] = { 1 };
int tempo = 10;



void setup() {
 // Serial.begin(9600);
  pinMode(speakerPin, OUTPUT);

Firmata.setFirmwareVersion(0, 1);
    Firmata.begin(57600);
}

void loop() {
  
 // Play the notes of the C Major scale0 
//  int sensorValue = analogRead(0)/128;   //read the Soft Pot
//   playNumber(sensorValue,20);
  int sensorValue = analogRead(0);
  int sensorValue1 = analogRead(1);
  int sensorValue2 = analogRead(2);
  Firmata.sendAnalog(0, sensorValue); 
  
  Serial.println(sensorValue);
  delay(200);
  
  
  
  if (sensorValue == 0) {
 tone(9,500,200);
 delay(tempo*2);
  }
  else{
    noTone(9);
  }
   if (sensorValue1 == 0) {
 tone(9,500,200);
 delay(tempo*2);
  }
  else{
    noTone(9);
  }
 
 
  if (sensorValue2 == 0) {
 tone(9,500,200);
 delay(tempo*2);
  }
  else{
    noTone(9);
  }
  
  // instead of having playtone - playing music, replaced by tone
/*
  for (int i = 0; i < length; i++) {
    if (notes[i] == ' ') {
      delay(beats[i] * tempo); // rest
    } else {
      playNote(notes[i], beats[i] * tempo);
    }
    
    // pause between notes
    delay(tempo / 2); 
  }
  */
}

