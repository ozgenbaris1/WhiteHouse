import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/SensorData.dart';
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
        .getDevices();
  }

  @override
  Widget build(BuildContext context) {
    Device device;
    List<SensorData> sensorList = List<SensorData>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('White House'),
      ),
      body: Container(
        child: Consumer<DeviceSummaryProvider>(
          builder: (ctx, deviceSummaryProvider, _) => DeviceList(
            deviceList: deviceSummaryProvider.device,
          ),
        ),
      ),
    );
  }
}
