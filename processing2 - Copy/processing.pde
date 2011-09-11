/* Melody
 * (cleft) 2005 D. Cuartielles for K3
 *
 * This example uses a piezo speaker to play melodies.  It sends
 * a square wave of the appropriate frequency to the piezo, generating
 * the corresponding tone.
 *
 * The calculation of the tones is made following the mathematical
 * operation:
 *
 *       timeHigh = period / 2 = 1 / (2 * toneFrequency)
 *
 * where the different tones are described as in the table:
 *
 * note 	frequency 	period 	timeHigh
 * c 	        261 Hz 	        3830 	1915 	
 * d 	        294 Hz 	        3400 	1700 	
 * e 	        329 Hz 	        3038 	1519 	
 * f 	        349 Hz 	        2864 	1432 	
 * g 	        392 Hz 	        2550 	1275 	
 * a 	        440 Hz 	        2272 	1136 	
 * b 	        493 Hz 	        2028	1014	
 * C	        523 Hz	        1912 	956
 *
 * http://www.arduino.cc/en/Tutorial/Melody
 */
 
#include <Firmata.h> 
  
int sensorPin = 0;   
int speakerPin = 9;

int length = 2; // the number of notes
char notes[] = {"c "}; // a space represents a rest
int beats[] = { 1 };
int tempo = 10;



void setup() {
  Serial.begin(9600);
  pinMode(speakerPin, OUTPUT);

Firmata.setFirmwareVersion(0, 1);
    Firmata.begin(57600);
}

void loop() {
  
 // Play the notes of the C Major scale0 
//  int sensorValue = analogRead(0)/128;   //read the Soft Pot
//   playNumber(sensorValue,20);
  int sensorValue = analogRead(0);
  
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

