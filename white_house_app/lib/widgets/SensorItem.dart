import 'package:flutter/material.dart';
import 'package:white_house_app/helpers/MyDecorations.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/DeviceProvider.dart';
import 'package:white_house_app/screens/SensorScreen.dart';

class SensorItem extends StatelessWidget {
  int deviceID;
  SensorData sensorData;

  SensorItem({this.deviceID, this.sensorData});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        DeviceSummaryProvider.timer.cancel();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SensorScreen(
              deviceID: deviceID,
              sensorID: sensorData.sensorID,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: MyDecorations.sensorDataDecoration,
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
      ),
    );
  }
}
