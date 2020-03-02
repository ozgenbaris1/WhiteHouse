import 'package:flutter/cupertino.dart';
import 'package:white_house_app/helpers/API.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/DeviceSummary.dart';
import 'package:white_house_app/models/SensorData.dart';

class DeviceSummaryProvider extends ChangeNotifier {
  List<DeviceSummary> deviceList;

  getDevices() async {
    var response = await API.getDevices();

    if (response.type == 'S') {
      Iterable list = response.data;

      deviceList = list.map((item) {
        var sensorDataList = item['SensorDataList'];

        Device device = new Device(
          deviceID: item['Device']['DeviceID'],
          name: item['Device']['Name'],
          description: item['Device']['Description'],
          isOnline: item['Device']['IsOnline'],
        );

        List<SensorData> data = sensorDataList
            .map<SensorData>(
              (element) => SensorData(
                sensorID: element['SensorID'],
                name: element['Name'],
                value: element['Value'],
                createdDate: element['CreatedDate'],
                unitSymbol: element['UnitSymbol'],
              ),
            )
            .toList();

        return new DeviceSummary(device: device, sensorDataList: data);
      }).toList();

      print("Done");
    } else {}

    notifyListeners();
  }
}
