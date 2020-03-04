import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:white_house_app/helpers/API.dart';
import 'package:white_house_app/models/Sensor.dart';
import 'package:white_house_app/models/SensorData.dart';

class SensorSummaryProvider extends ChangeNotifier {
  Sensor sensor;
  List<SensorData> sensorData;

  static Timer timer;

  initTimer({deviceID, sensorID}) {
    timer = Timer.periodic(new Duration(microseconds: 10000), (timer) {
      getSensorDataList(deviceID: deviceID, sensorID: sensorID);
    });
  }

  getSensorDataList({deviceID, sensorID}) async {
    var response =
        await API.getSensorSummary(deviceID: deviceID, sensorID: sensorID);

    if (response.type == 'S') {
      var lvSensor = response.data['sensor'];
      var lvSensorData = response.data['sensorData'];

      sensor = new Sensor(
        sensorID: lvSensor['SensorID'],
        name: lvSensor['Name'],
        unitSymbol: lvSensor['UnitSymbol'],
      );

      Iterable list = lvSensorData;

      sensorData = list.map<SensorData>(
        (item) {
          return new SensorData(
            createdDate: item['CreatedDate'],
            value: item['Value'],
          );
        },
      ).toList();
    }

    notifyListeners();
  }
}
