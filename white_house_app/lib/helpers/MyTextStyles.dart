import 'package:flutter/material.dart';

class MyTextStyles {
  /* DeviceItem TextStyles */

  static final TextStyle deviceNameTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  static final TextStyle deviceDescriptionTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );

  /* ChartItem TextStyles */

  static final TextStyle sensorNameSubTextStyle = TextStyle(
    color: Colors.blue,
    fontSize: 12.0,
  );

    static final TextStyle sensorNameTextStyle = TextStyle(
    color: Colors.blue,
    fontSize: 15.0,
  );

  static final TextStyle sensorLastValueTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  /* SensorScreen TextStyles */

  static final TextStyle dataColumnTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}
