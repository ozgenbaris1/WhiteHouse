import 'package:flutter/material.dart';
import 'package:white_house_app/models/SensorData.dart';

class SensorItem extends StatelessWidget {
  SensorData sensorData;

  SensorItem({this.sensorData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green[200], Colors.lightGreen],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 130,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(sensorData.name),
            Text("${sensorData.value} ${sensorData.unitSymbol}"),
          ],
        ),
      ),
    );
  }
}