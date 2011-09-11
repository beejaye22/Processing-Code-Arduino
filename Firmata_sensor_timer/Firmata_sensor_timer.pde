import processing.serial.*;
import cc.arduino.*;

import eeml.*;

Arduino arduino;
float myValue;
float lastUpdate;

DataOut dOut;

void setup()
{
println(Arduino.list());
arduino = new Arduino(this, Arduino.list()[1], 57600);

dOut = new DataOut(this, "http://www.pachube.com/api/35213.xml", "VEjk_X91b2cN-_BpBUa2nAGmM0ybiAuHLXwIousYIig"); 

dOut.addData(0,"test, spectrasensor");
dOut.addData(1,"test, timer");

}

void draw()
{
myValue = arduino.analogRead(0);
//        println(myValue);
if ((millis() - lastUpdate) > 10000){
        println(myValue);
        println("ready to PUT: ");
        dOut.update(0, myValue);
        dOut.update(1,millis());
        int response = dOut.updatePachube();
        println(response);
        lastUpdate = millis();
  } 
}


