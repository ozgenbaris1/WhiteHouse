import 'package:flutter/material.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/widgets/SensorSummaryItem.dart';

class SensorSummaryList extends StatelessWidget {
  List<SensorData> sensorSummaryList;

  SensorSummaryList({this.sensorSummaryList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: sensorSummaryList
            .map<Widget>(
              (item) => SensorSummaryItem(
                sensorSummary: item,
              ),
            )
            .toList(),
      ),
    );
  }
}
