import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/DeviceProvider.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';
import 'package:white_house_app/widgets/DeviceList.dart';
import 'package:white_house_app/widgets/SensorSummaryList.dart';

class SensorScreen extends StatefulWidget {
  int deviceID;
  int sensorID;

  SensorScreen({this.deviceID, this.sensorID});

  @override
  _SensorScreen createState() =>
      _SensorScreen(deviceID: deviceID, sensorID: sensorID);
}

class _SensorScreen extends State {
  int deviceID;
  int sensorID;

  _SensorScreen({this.deviceID, this.sensorID});

  @override
  initState() {
    super.initState();
    initDataProviders();
  }

  initDataProviders() async {
    await Provider.of<SensorSummaryProvider>(context, listen: false)
        .getSensorDataList(deviceID: this.deviceID, sensorID: this.sensorID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        centerTitle: true,
        title: Text('White House'),
      ),
      body: Container(
        child: Consumer<SensorSummaryProvider>(
          builder: (ctx, sensorSummaryProvider, _) => Column(
            children: <Widget>[
              ChartItem(),
              // SensorSummaryList(
              //   sensorSummaryList: sensorSummaryProvider.sensorData,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartItem extends StatelessWidget {
  final String metricName;
  final num value;
  final String metric;
  final List<double> dataList;

  ChartItem(
      {Key key,
      @required this.metricName,
      @required this.value,
      @required this.metric,
      @required this.dataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            metricName,
                            style: TextStyle(
                                color: MyColors.headerTextColor, fontSize: 15),
                          ),
                          Text("$value $metric",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24.0)),
                        ],
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  Sparkline(
                    data: dataList,
                    lineWidth: 3.0,
                    pointColor: Colors.black,
                    pointSize: 8.0,
                    pointsMode: PointsMode.last,
                    lineColor: MyColors.headerTextColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }