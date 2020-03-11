import 'package:flutter/material.dart';

class MyDecorations {
  /* SensorList Decorations */
  static final BoxDecoration noSensorFoundDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.red[300], Colors.red[300]],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  /* SensorItem Decorations */
  static final BoxDecoration sensorDataDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.green[200], Colors.lightGreen],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}