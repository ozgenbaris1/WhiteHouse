import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_house_app/models/DeviceSummary.dart';
import 'package:white_house_app/widgets/DeviceItem.dart';

class DeviceList extends StatelessWidget {
  List<DeviceSummary> deviceList;

  DeviceList({this.deviceList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: deviceList.map<Widget>(
        (item) => DeviceItem(
          deviceSummaryList: item,
        ),
      )),
    );
  }
}
