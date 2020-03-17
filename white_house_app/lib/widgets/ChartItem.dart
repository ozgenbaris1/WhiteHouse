import 'dart:math';

import 'package:flutter/material.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/helpers/MyDecorations.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/widgets/Chart.dart';
import 'package:white_house_app/widgets/ChartItemBottomRow.dart';
import 'package:white_house_app/widgets/ChartItemTopRow.dart';

class ChartItem extends StatelessWidget {
  final int deviceID;
  final int sensorID;
  final String name;
  final String lastValue;
  final String unitSymbol;
  final List<SensorData> data;

  ChartItem(
      {Key key,
      @required this.deviceID,
      @required this.sensorID,
      @required this.name,
      @required this.lastValue,
      @required this.unitSymbol,
      @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                ChartItemTopRow(
                    deviceID: deviceID, sensorID: sensorID, name: name, lastValue: lastValue, unitSymbol: unitSymbol),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                ),
                SizedBox(
                  height: 200,
                  child: Chart(
                    data: data,
                  ),
                ),
                ChartItemBottomRow(
                  data: data,
                  unitSymbol: unitSymbol,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
