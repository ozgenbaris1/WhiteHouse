import 'package:flutter/cupertino.dart';
import 'package:white_house_app/helpers/API.dart';
import 'package:white_house_app/models/Sensor.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/models/SensorSummary.dart';

class SensorSummaryProvider extends ChangeNotifier {
  List<SensorData> sensorData;

  getSensorDataList({deviceID, sensorID}) async {
    var response =
        await API.getSensorSummary(deviceID: deviceID, sensorID: sensorID);

    if (response.type == 'S') {
      Iterable list = response.data;

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
