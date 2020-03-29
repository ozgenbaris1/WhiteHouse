import 'package:flutter/material.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/styles/MyDecorations.dart';
import 'package:white_house_app/widgets/SensorItem.dart';

class SensorItemList extends StatelessWidget {
  final int deviceID;
  final List<SensorData> sensorList;

  SensorItemList({this.deviceID, this.sensorList});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildSensorList(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildSensorList() {
    List<Widget> data = new List<Widget>();

    if (sensorList.isEmpty) {
      data.add(
        Container(
          margin: EdgeInsets.all(3),
          decoration: SensorListDecorations.noSensorFound,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text("No Sensor Found !!!"),
              ],
            ),
          ),
        ),
      );
    } else {
      data = sensorList.map<Widget>(
        (item) {
          return SensorItem(
            deviceID: this.deviceID,
            sensorData: item,
          );
        },
      ).toList();
    }

    return data;
  }
}
