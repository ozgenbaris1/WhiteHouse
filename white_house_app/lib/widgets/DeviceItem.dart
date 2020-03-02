import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/DeviceSummary.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/screens/SensorScreen.dart';
import 'package:white_house_app/widgets/SensorItem.dart';
import 'package:white_house_app/widgets/SensorList.dart';

class DeviceItem extends StatelessWidget {
  DeviceSummary deviceSummary;

  DeviceItem({this.deviceSummary});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            deviceSummary.device.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 24.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            deviceSummary.device.description,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.ac_unit,
                              color: deviceSummary.device.isOnline
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SensorList(
                    deviceID : deviceSummary.device.deviceID,
                    sensorList: deviceSummary.sensorDataList,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
