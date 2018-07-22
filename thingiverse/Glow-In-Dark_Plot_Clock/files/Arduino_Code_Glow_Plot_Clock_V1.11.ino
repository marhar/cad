
// Plotclock
// cc - by Johannes Heberlein 2014
// modified for glow clock - Tucker Shannon 2018
// v 1.05
// thingiverse.com/joo   wiki.fablab-nuernberg.de
// thingiverse.com/TuckerPi
// units: mm; microseconds; radians
// origin: bottom left of drawing surface
// time library see http://playground.arduino.cc/Code/time
// RTC  library see http://playground.arduino.cc/Code/time
//               or http://www.pjrc.com/teensy/td_libs_DS1307RTC.html
// Change log:
// 1.01  Release by joo at https://github.com/9a/plotclock
// 1.02  Additional features implemented by Dave (https://github.com/Dave1001/):
//       - added ability to calibrate servofaktor seperately for left and right servos
//       - added code to support DS1307, DS1337 and DS3231 real time clock chips
//       - see http://www.pjrc.com/teensy/td_libs_DS1307RTC.html for how to hook up the real time clock
// 1.03  Fixed the length bug at the servoplotclockogp2 angle calculation, other fixups
// 1.04  Modified for Tuck's glow clock
// 1.05  Modified calibration mode to draw a 4 point square instead

#include <Time.h> // see http://playground.arduino.cc/Code/time
#include <TimeLib.h>
#include <Servo.h>

//RTC_DS1307 RTC;

// delete or mark the next line as comment if you don't need these
//#define CALIBRATION      // enable calibration mode
#define REALTIMECLOCK    // enable real time clock

#define WISHY 3 // Offset of the Y coordinats of the plate-wisher

// When in calibration mode, adjust the following factors until the servos move exactly 90 degrees
#define SERVOFAKTORLEFT 660
#define SERVOFAKTORRIGHT 550

// Zero-position of left and right servo
// When in calibration mode, adjust the NULL-values so that the servo arms are at all times parallel
// either to the X or Y axis
#define SERVOLEFTNULL 1685
#define SERVORIGHTNULL 875

#define SERVOPINLEFT  10
#define SERVOPINRIGHT 9



// length of arms
#define L1 35
#define L2 55.1
#define L3 13.2
#define L4 45

//comment the next line out for military 24 hour time setting.
#define NONMILITARY


// origin points of left and right servo
#define O1X 24-10//22 //point 1
#define O1Y -28-12    //point 1
#define O2X 49-8//47  //point 2
#define O2Y -25-12    //point 2
#define LASER 12

#ifdef REALTIMECLOCK

// for instructions on how to hook up a real time clock,
// see here -> http://www.pjrc.com/teensy/td_libs_DS1307RTC.html
// DS1307RTC works with the DS1307, DS1337 and DS3231 real time clock chips.
// Please run the SetTime example to initialize the time on new RTC chips and begin running.

#include <Wire.h>
#include <DS1307RTC.h> // see http://playground.arduino.cc/Code/time
#endif

Servo servo2;  //
Servo servo3;  //

volatile double lastX = 75;
volatile double lastY = 47.5;

int last_min = 0;

void setup()
{
  digitalWrite(LASER, LOW);
  pinMode(12, OUTPUT);
  pinMode(7, INPUT_PULLUP);
}

void loop()
{

  tmElements_t tm;
  #ifdef CALIBRATION
    if (!servo2.attached()) servo2.attach(SERVOPINLEFT);
    if (!servo3.attached()) servo3.attach(SERVOPINRIGHT);
    // Servohorns will have 90° between movements, parallel to x and y axis
    while (true) {
      drawTo(5, 15);
      delay(2000);
      drawTo(5, 50);
      delay(500);
      drawTo(70, 50);
      delay(500);
      drawTo(70,15);
      delay(500);
    }

  #endif
  int i = 0;
    while(digitalRead(7) != LOW) {
      delay(1);
      Serial.println("waiting for button");
    }
    if (!servo2.attached()) servo2.attach(SERVOPINLEFT);
    if (!servo3.attached()) servo3.attach(SERVOPINRIGHT);
    if (RTC.read(tm))
    {
      setTime(tm.Hour,tm.Minute,tm.Second,tm.Day,tm.Month,tm.Year);
      #ifdef NONMILITARY
        if (tm.Hour < 1){
          setTime(12,tm.Minute,tm.Second,tm.Day,tm.Month,tm.Year);
        }
        if (tm.Hour > 12){
          setTime(tm.Hour-12,tm.Minute,tm.Second,tm.Day,tm.Month,tm.Year);
        }
      #endif
    }
    //setTime(17,01,0,0,0,0);
    hour();
    while ((i+1)*10 <= hour())
    {
      i++;
    }

    if (i != 0){
      number(5, 25, i, 0.9);
    }
    number(21, 25, (hour()-i*10), 0.9);
    number(35, 25, 11, 0.9);

    i=0;
    while ((i+1)*10 <= minute())
    {
      i++;
    }
    number(44, 25, i, 0.9);
    number(57, 25, (minute()-i*10), 0.9);
    //lift(2);
    drawTo(55, 2);
    //lift(1);
    last_min = minute();
    delay(580);

    servo2.detach();
    servo3.detach();
  }


// Writing numeral with bx by being the bottom left originpoint. Scale 1 equals a 20 mm high font.
// The structure follows this principle: move to first startpoint of the numeral, lift down, draw numeral, lift up
void number(float bx, float by, int num, float scale) {
  scale = scale *1.2;
  by = by * .8;
  switch (num) {

  case 0:
    scale = scale * 0.8;
    by = by + 3;
    drawTo(bx + 12 * scale, by + 6 * scale);
    digitalWrite(LASER, HIGH);
    bogenGZS(bx + 7 * scale, by + 10 * scale, 10 * scale, -0.8, 6.7, 0.5);
    digitalWrite(LASER, LOW);
    break;
  case 1:
    drawTo(bx + 5 * scale, by + 18 * scale);
    digitalWrite(LASER, HIGH);
    drawTo(bx + 8 * scale, by + 20 * scale);
    drawTo(bx + 8 * scale, by + 0 * scale);
    digitalWrite(LASER, LOW);
    break;
  case 2:
    scale = scale * 0.9;
    by = by + 3;
    drawTo(bx + 2 * scale, by + 15 * scale);
    digitalWrite(LASER, HIGH);
    bogenUZS(bx + 8 * scale, by + 14 * scale, 5 * scale, 3, -0.8, 1);
    drawTo(bx + 3 * scale, by + 0 * scale);
    drawTo(bx + 14 * scale, by + 0 * scale);
    digitalWrite(LASER, LOW);
    break;
  case 3:
    scale = scale * 0.95;
    drawTo(bx + 3 * scale, by + 17 * scale);
    digitalWrite(LASER, HIGH);
    bogenUZS(bx + 6 * scale, by + 15 * scale, 5 * scale, 3, -2, 0.8);
    bogenUZS(bx + 6 * scale, by + 5 * scale, 5 * scale, 1.57, -3, 0.8);
    digitalWrite(LASER, LOW);
    break;
  case 4:

    //scale = scale 0.9;
    //by = by - 2;
    //drawTo(bx + 10 * scale, by + 0 * scale);
    drawTo(bx + 10 * scale, by + 20 * scale);


    digitalWrite(LASER, HIGH);
    drawTo(bx + 10 * scale, by + 0 * scale);
    digitalWrite(LASER, LOW);
    drawTo(bx + 2 * scale, by + 20 * scale);
    digitalWrite(LASER, HIGH);
    drawTo(bx + 2 * scale, by + 10 * scale);
    drawTo(bx + 14 * scale, by + 10 * scale);
    digitalWrite(LASER, LOW);

    break;
  case 5:
    scale = scale * 1.0;
    drawTo(bx + 2 * scale, by + 5 * scale);
    digitalWrite(LASER, HIGH);
    bogenGZS(bx + 5 * scale, by + 8 * scale, 5 * scale, -2.5, 2, 1);
    drawTo(bx + 3 * scale, by + 20 * scale);
    drawTo(bx + 13 * scale, by + 20 * scale);
    digitalWrite(LASER, LOW);
    break;
  case 6:
    //scale = scale * 0.9;
    by = by + 1;
    drawTo(bx + 4 * scale, by + 10 * scale);
    digitalWrite(LASER, HIGH);
    bogenUZS(bx + 7 * scale, by + 6 * scale, 5 * scale, 2, -4.4, 1);
    drawTo(bx + 11 * scale, by + 20 * scale);
    digitalWrite(LASER, LOW);
    break;
  case 7:
    scale = scale * 0.9;
    drawTo(bx + 2 * scale, by + 22 * scale);
    digitalWrite(LASER, HIGH);
    drawTo(bx + 12 * scale, by + 22* scale);
    drawTo(bx + 2 * scale, by + 2);
    digitalWrite(LASER, LOW);

    break;
  case 8:
    scale = scale *0.9;
    drawTo(bx + 5 * scale, by + 10 * scale);

    digitalWrite(LASER, HIGH);
    bogenUZS(bx + 6 * scale, by + 16 * scale, 5 * scale, 4.7, -1.6, 1);
    bogenGZS(bx + 6 * scale, by + 6 * scale, 5 * scale, -4.7, 2, 1);
    digitalWrite(LASER, LOW);
    break;

  case 9:
    drawTo(bx + 9 * scale, by + 11 * scale);

    digitalWrite(LASER, HIGH);
    bogenUZS(bx + 7 * scale, by + 15 * scale, 5 * scale, 4, -0.5, 1);
    drawTo(bx + 5 * scale, by + 0);
    digitalWrite(LASER, LOW);
    //lift(1);
    break;



  case 11:
    drawTo(bx + 5 * scale, by + 16 * scale);
    delay(100);
    digitalWrite(LASER, HIGH);
    delay(50);
    digitalWrite(LASER, LOW);
    drawTo(bx + 5 * scale, by + 4 * scale);
    delay(100);
    digitalWrite(LASER, HIGH);
    delay(50);
    digitalWrite(LASER, LOW);
    //lift(1);
    break;

  }
}



void bogenUZS(float bx, float by, float radius, int start, int ende, float sqee) {
  float inkr = -0.05;
  float count = 0;

  do {
    drawTo(sqee * radius * cos(start + count) + bx,
    radius * sin(start + count) + by);
    count += inkr;
  }
  while ((start + count) > ende);

}

void bogenGZS(float bx, float by, float radius, int start, int ende, float sqee) {
  float inkr = 0.05;
  float count = 0;

  do {
    drawTo(sqee * radius * cos(start + count) + bx,
    radius * sin(start + count) + by);
    count += inkr;
  }
  while ((start + count) <= ende);
}


void drawTo(double pX, double pY) {
  double dx, dy, c;
  int i;

  // dx dy of new point
  dx = pX - lastX;
  dy = pY - lastY;
  //path lenght in mm, times 4 equals 4 steps per mm
  c = floor(7 * sqrt(dx * dx + dy * dy));

  if (c < 1) c = 1;

  for (i = 0; i <= c; i++) {
    // draw line point by point
    set_XY(lastX + (i * dx / c), lastY + (i * dy / c));

  }

  lastX = pX;
  lastY = pY;
}

double return_angle(double a, double b, double c) {
  // cosine rule for angle between c and a
  return acos((a * a + c * c - b * b) / (2 * a * c));
}

void set_XY(double Tx, double Ty)
{
  if (digitalRead(LASER)){
    delay(3);
  }
  else{
   delay(0.1);
  }
  double dx, dy, c, a1, a2, Hx, Hy;

  // calculate triangle between pen, servoLeft and arm joint
  // cartesian dx/dy
  dx = Tx - O1X;
  dy = Ty - O1Y;

  // polar lemgth (c) and angle (a1)
  c = sqrt(dx * dx + dy * dy); //
  a1 = atan2(dy, dx); //
  a2 = return_angle(L1, L2, c);

  servo2.writeMicroseconds(floor(((a2 + a1 - M_PI) * SERVOFAKTORLEFT) + SERVOLEFTNULL));

  // calculate joinr arm point for triangle of the right servo arm
  a2 = return_angle(L2, L1, c);
  Hx = Tx + L3 * cos((a1 - a2 + 0.621) + M_PI); //36,5°
  Hy = Ty + L3 * sin((a1 - a2 + 0.621) + M_PI);

  // calculate triangle between pen joint, servoRight and arm joint
  dx = Hx - O2X;
  dy = Hy - O2Y;

  c = sqrt(dx * dx + dy * dy);
  a1 = atan2(dy, dx);
  a2 = return_angle(L1, L4, c);

  servo3.writeMicroseconds(floor(((a1 - a2) * SERVOFAKTORRIGHT) + SERVORIGHTNULL));
}
