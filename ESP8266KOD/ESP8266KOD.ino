#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <math.h>

#define FIREBASE_HOST "sudaki-elektrik-deneme-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "BKoi2HKAxZYdD9BH7a7aHmwhXnWJN4tHLb5B3FlG"
#define WIFI_SSID "POCO X3 NFC"
#define WIFI_PASSWORD "b837c4b7886a"

void setup() {
  Serial.begin(9600);

  pinMode(D1,OUTPUT);
  pinMode(D2,OUTPUT);
  pinMode(D3,OUTPUT);
  pinMode(D4,OUTPUT);
  pinMode(D5,OUTPUT);
  pinMode(D6,OUTPUT);
  digitalWrite(D1,HIGH);
  digitalWrite(D2,HIGH);
  digitalWrite(D3,HIGH);
  digitalWrite(D4,HIGH);
  digitalWrite(D5,HIGH);  
  digitalWrite(D6,HIGH);
  

  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

double Termistor(int analogOkuma){

 double sicaklik;
  sicaklik = log(((10240000 / analogOkuma) - 10000));
  sicaklik = 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * sicaklik * sicaklik)) * sicaklik);
  sicaklik = sicaklik - 273.15;
  return sicaklik;
}

void loop() {
  
  int deger = analogRead(A0);
  double sicaklik = Termistor(deger);
  Serial.println(sicaklik);

  delay(100);

  Firebase.setFloat("sicaklik ",sicaklik);
 
  String buton1 = Firebase.getString("buton1");
  delay(100);
  
  String buton2 = Firebase.getString("buton2");
  delay(100);

  String buton3 = Firebase.getString("buton3");
  delay(100);

  String buton4 = Firebase.getString("buton4");
  delay(100);

  String buton5 = Firebase.getString("buton5");
  delay(100);

  String buton6 = Firebase.getString("buton6");
  delay(100);

  if(buton1 == "true")
  {
    digitalWrite(D1,LOW);
    }
    else if (buton1 == "false")
    {
      digitalWrite(D1,HIGH);
      }
      
  if(buton2== "true")
  {
    digitalWrite(D2,LOW);
    }
    else if (buton2 == "false")
    {
      digitalWrite(D2,HIGH);
      }

  if(buton3 == "true")
  {
    digitalWrite(D3,LOW);
    }
    else if (buton3 == "false")
    {
      digitalWrite(D3,HIGH);
      }

  if(buton4 == "true")
  {
    digitalWrite(D4,LOW);
    }
    else if (buton4 == "false")
    {
      digitalWrite(D4,HIGH);
      }

  if(buton5 == "true")
  {
    digitalWrite(D5,LOW);
    }
    else if (buton5 == "false")
    {
      digitalWrite(D5,HIGH);
      }

  if(buton6 == "true")
  {
    digitalWrite(D6,LOW);
    }
    else if (buton6 == "false")
    {
      digitalWrite(D6,HIGH);
      }

  
}
