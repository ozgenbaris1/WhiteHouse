import 'package:flutter/material.dart';
import 'package:white_house_app/models/Overview.dart';
import 'package:white_house_app/styles/MyTextStyles.dart';

class DeviceDetailItem extends StatelessWidget {
  final Overview overview;

  DeviceDetailItem({this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                overview.device.name,
                style: DeviceScreenTextStyles.deviceNameTextStyle,
              ),
              Text(
                overview.device.description,
                style: DeviceScreenTextStyles.deviceDescriptionTextStyle,
              ),
            ],
          ),
          Icon(
            Icons.ac_unit,
            color: overview.device.isOnline ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}
