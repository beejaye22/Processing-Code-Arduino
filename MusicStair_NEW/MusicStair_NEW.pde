#include <Firmata.h> 
#include <MP3Trigger.h>
MP3Trigger trigger;


const int piezoPin = A0; // piezo connected to analog pin 0
const int threshold = 100; // threshold value
int sensorReading = 0; // the sensor value reading
int sensorValue; // this part is included for the maximum sensor value


int valueP = 0;
int buttonState = 0;



void setup()
{
  trigger.setup();
  Serial.begin(38400);
  
  //Firmata.setFirmwareVersion(0, 1); // communication to processing
  // Firmata.begin(38400); // speed of which data is sent to processing
}

// Play a random track when sensor is activated.
void loop()
{
  sensorValue = analogRead(piezoPin);    // read the value from the piezo sensor
  Serial.println(sensorValue);           // print it to the serial monitor
  delay(100);                            // the speed of which the data is being read
  valueP = analogRead(piezoPin);
  // read the sensor and store it in the variable sensorReading:
  sensorReading = analogRead(piezoPin);   



  if (valueP > threshold)


   
  {

    int i = random(1,4);  // plays tracks randomly from 1- 4
    trigger.trigger(i);   // mp3 trigger setup
    Serial.print(i,DEC);  // print values in the serial monitor
  }
  delay(3);  // Better for Processing showing data
}




