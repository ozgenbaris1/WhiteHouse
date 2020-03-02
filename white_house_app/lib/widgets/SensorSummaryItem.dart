import 'package:flutter/material.dart';
import 'package:white_house_app/models/Sensor.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/models/SensorSummary.dart';
import 'package:white_house_app/widgets/SensorItem.dart';

class SensorSummaryItem extends StatelessWidget {
  SensorData sensorSummary;

  SensorSummaryItem({this.sensorSummary});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Text("${sensorSummary.value}"),
          Text("${sensorSummary.createdDate}"),
        ],
      ),
    );
  }
}
