import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/SensorData.dart';

class DeviceSummary {
  Device device;
  List<SensorData> sensorDataList;

  DeviceSummary({this.device, this.sensorDataList});
}
