import 'package:flutter/material.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/widgets/SensorItem.dart';

class SensorList extends StatelessWidget {
  int deviceID;
  List<SensorData> sensorList;

  SensorList({this.deviceID, this.sensorList});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: buildSensorList(),
        ),
      ),
    );
  }

  List<Widget> buildSensorList() {
    List<Widget> data = new List<Widget>();

    if (sensorList.length < 1) {
      data.add(
        Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red[300], Colors.red[300]],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          // width: 100,
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
