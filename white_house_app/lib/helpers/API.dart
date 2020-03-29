import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:white_house_app/models/ApiResponse.dart';

const baseUrl = "http://192.168.1.27:8080";

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

  static Future<ApiResponse> getLastSensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getLastSensorData?DeviceID=$deviceID&SensorID=$sensorID";
    final res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getLast10SensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getLast10SensorData?DeviceID=$deviceID&SensorID=$sensorID";
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

  static Future<ApiResponse> getWeeklySensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getWeeklySensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }

  static Future<ApiResponse> getYearlySensorData({deviceID, sensorID}) async {
    var url =
        baseUrl + "/getYearlySensorData?DeviceID=$deviceID&SensorID=$sensorID";
    var res = await http.get(url);
    final response = json.decode(res.body);
    return ApiResponse(
      type: response['type'],
      message: response['message'],
      data: response['data'],
    );
  }
}
