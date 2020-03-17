import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/providers/DeviceProvider.dart';
import 'package:white_house_app/widgets/DeviceList.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreen createState() => _DeviceScreen();
}

class _DeviceScreen extends State {
  @override
  initState() {
    super.initState();
    initDataProviders();
  }

  initDataProviders() async {
    await Provider.of<DeviceSummaryProvider>(context, listen: false)
        .initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        centerTitle: true,
        title: Text('White House'),
      ),
      body: Consumer<DeviceSummaryProvider>(
        builder: (ctx, deviceSummaryProvider, _) {
          if (deviceSummaryProvider.deviceList != null) {
            if (deviceSummaryProvider.deviceList.length > 0) {
              return DeviceList(
                deviceList: deviceSummaryProvider.deviceList,
              );
            } else {
              return Text("No Data");
            }
          } else {
            return Text("No Data");
          }
        },
      ),
    );
  }
}
