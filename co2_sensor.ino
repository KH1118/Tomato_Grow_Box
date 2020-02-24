int sensorIn = A1;
const int numReadings = 60;
float total = 0.0;                  // the running total
float average = 0.0;  

void setup(){
  Serial.begin(9600);
  // Set the default voltage of the reference voltage
  analogReference(DEFAULT);
}

void loop(){
  //Read voltage
  total = 0.0;
  average=0.0;
  int sensorValue = analogRead(sensorIn);

  // The analog signal is converted to a voltage
  float voltage = sensorValue*(5000/1024.0);
  if(voltage == 0)
  {
    Serial.println("Fault");
    delay(5000);
  }
  else if(voltage < 400)
  {
    Serial.println("preheating");
    delay(5000);
  }
  else
  {
    total = 0.0;
    average = 0.0;
    for (int thisReading = 0; thisReading < numReadings; thisReading++)
     {//take repeated readings
     total = total + analogRead(sensorIn); 
     delay(1000);
     }

  // calculate the average:
    average = total / numReadings;
    voltage =  average*(5000/1024.0);
  // send it to the computer as ASCII digits
    int voltage_diference=voltage-400;
    float concentration=voltage_diference*50.0/16.0;
    Serial.print(concentration);
    Serial.println("ppm");
    total = 0.0;
    average=0.0;
  }
  //delay(2000);
  //delay(60000);
    delay(600000);//600secs = 10mins
  //delay(1800000);
}
