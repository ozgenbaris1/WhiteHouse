import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:white_house_app/models/ApiResponse.dart';

const baseUrl = "http://192.168.1.107:8080";

class API {
  static Future<ApiResponse> getDevices() async {
    var url = baseUrl + "/getDevices";
    final res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getSensorSummary({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getSensorDataSummary?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getDailySensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getDailySensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }
}
