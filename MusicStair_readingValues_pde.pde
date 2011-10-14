#include <Firmata.h> 
#include <MP3Trigger.h>
MP3Trigger trigger;

const int ledPin = 13;      // led connected to digital pin 13
const int piezoPin = A0; // piezo connected to analog pin 0
const int threshold = 100;
int sensorReading = 0;

int valueP = 0;
int buttonState = 0;
int sensorMax = 0;
int sensorMin = 1023;


void setup()
{
  trigger.setup();
  Serial.begin(38400);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  while (millis() < 3000) {

   // record the maximum sensor value
    if (threshold > sensorMax) {
      sensorMax = threshold;
    }
    if (threshold < sensorMin) {
      sensorMin = threshold;
    }
    // signal the end of the calibration period
  digitalWrite(13, LOW);
  
  //  Serial.println("*");
  Serial.println(sensorMax);
  Serial.println(sensorMax);
  Serial.println(sensorMax);
  Serial.println(sensorMin);
  Serial.println(sensorMin);
  Serial.println(sensorMin);
  //  Serial.println("*"); 
}
}
// Play a random track when sensor is activated.
void loop()
{
  sensorReading = analogRead(piezoPin);
  valueP = analogRead(piezoPin);
  // read the sensor and store it in the variable sensorReading:
  sensorReading = analogRead(piezoPin);   



  if (valueP > threshold)


  // if the sensor reading is greater than the threshold:
  if ((sensorReading >= threshold) || (sensorReading <= sensorMin) ) {
    Serial.println(sensorReading);      
  {

    int i = random(1,4);
    trigger.trigger(i);
    Serial.print(i,DEC);
  }
  delay(3);  // Better for Processing showing data
}
}



