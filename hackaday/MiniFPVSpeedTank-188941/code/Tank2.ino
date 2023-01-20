#include "CrsfSerial.h"

uint8_t ledR = 18;
uint8_t ledG = 19;
uint8_t ledB = 20;

uint8_t RDir = 0;
uint8_t RPWM = 1;
uint8_t LDir = 3;
uint8_t LPWM = 2;

int L = 0;
int R = 0;

UART Serial2(4, 5, NC, NC);
CrsfSerial crsf(Serial2, CRSF_BAUDRATE); // pass any HardwareSerial port

void packetChannels()
{
    L = map(crsf.getChannel(1), 989, 2011, 0, 255)
    
    ;

    R = map(crsf.getChannel(2), 989, 2011, 0, 255);
//  Serial.println(crsf.getChannel(1));
}

void setup()
{
    // If something other than changing the baud of the UART needs to be done, do it here
    // Serial1.end(); Serial1.begin(500000, SERIAL_8N1, 16, 17);

    pinMode(ledR, OUTPUT);
    pinMode(ledG, OUTPUT);
    pinMode(ledB, OUTPUT);

    Serial.begin(115200);

    pinMode(LDir, OUTPUT);
    pinMode(LPWM, OUTPUT);
    pinMode(RDir, OUTPUT);
    pinMode(RPWM, OUTPUT);

    // Attach the callbacks
    crsf.onPacketChannels = &packetChannels;
}

void loop()
{
  crsf.loop();
  digitalWrite(LDir, LOW);
  digitalWrite(RDir, HIGH);
  analogWrite(LPWM, L);
  analogWrite(RPWM, R);
  delay(100);
}
