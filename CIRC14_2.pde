#include <Firmata.h>

// LED leads connected to PWM pins

const int RED_LED_PIN = 9;    //Red LED Pin
const int GREEN_LED_PIN = 10; //Green LED Pin
const int BLUE_LED_PIN = 11;  //Blue LED Pin

int sensorPin = 0; 

 

void setup() {

  //no need for any code here
  Firmata.setFirmwareVersion(0, 1);
    Firmata.begin(57600);

}

	

void loop() {

  int sensorValue = analogRead(0);   //read the Soft Pot
  
  Firmata.sendAnalog(0, sensorValue); 


  int redValue = constrain(map(sensorValue, 0, 512, 255, 0),0,255); //calculate the red Value (255-0 over the range 0-512)
  int greenValue = constrain(map(sensorValue, 0, 512, 0, 255),0,255)-constrain(map(sensorValue, 512, 1023, 0, 255),0,255);  //calculate the green value (0-255 over 0-512 & 255-0 over 512-1023)
  int blueValue = constrain(map(sensorValue, 512, 1023, 0, 255),0,255); //calculate the blue value 0-255 over 512-1023


  // Display the requested color 

  analogWrite(RED_LED_PIN, redValue);

  analogWrite(GREEN_LED_PIN, greenValue);

  analogWrite(BLUE_LED_PIN, blueValue);

} 

