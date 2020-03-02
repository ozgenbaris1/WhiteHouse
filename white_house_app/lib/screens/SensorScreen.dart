import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/models/Device.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/DeviceProvider.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';
import 'package:white_house_app/widgets/ChartItem.dart';
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
    List<SensorData> data = <SensorData>[
      SensorData(createdDate: '08.00', value: '12'),
      SensorData(createdDate: '08.15', value: '32'),
      SensorData(createdDate: '08.30', value: '14'),
      SensorData(createdDate: '08.45', value: '41'),
      SensorData(createdDate: '09.00', value: '34'),
      SensorData(createdDate: '09.15', value: '46'),
      SensorData(createdDate: '09.30', value: '45'),
      SensorData(createdDate: '09.45', value: '46'),
      SensorData(createdDate: '10.00', value: '67'),
      SensorData(createdDate: '10.15', value: '65'),
      SensorData(createdDate: '10.30', value: '34'),
      SensorData(createdDate: '10.45', value: '46'),
      SensorData(createdDate: '11.00', value: '12'),
      SensorData(createdDate: '11.30', value: '76'),
    ];

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
              ChartItem(
                  name: 'Temperature',
                  lastValue: '25.7',
                  unitSymbol: '*C',
                  data: data),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    headingRowHeight: 45,
                    horizontalMargin: 10,
                    rows: _convertDataToDataRow(data),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Created Date',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Value',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> _convertDataToDataRow(List<SensorData> list) {
    return list
        .asMap()
        .map(
          (index, data) => MapEntry(
            index,
            DataRow(
              cells: [
                DataCell(
                  Text(data.createdDate),
                ),
                DataCell(
                  Text(data.value),
                ),
              ],
            ),
          ),
        )
        .values
        .toList();
  }
}
