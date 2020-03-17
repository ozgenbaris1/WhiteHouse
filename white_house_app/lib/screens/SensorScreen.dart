import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';
import 'package:white_house_app/widgets/ChartItem.dart';

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
        .initTimer(deviceID: this.deviceID, sensorID: this.sensorID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            SensorSummaryProvider.timer.cancel();
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('White House'),
      ),
      body: SafeArea(
        child: Consumer<SensorSummaryProvider>(
          builder: (ctx, sensorSummaryProvider, _) => SnappingSheet(
            snapPositions: <SnapPosition>[
              SnapPosition(positionPixel: 0),
              SnapPosition(positionPixel: 350),
            ],
            snappingSheetController: SnappingSheetController(),
            child: Container(
              // color: Colors.red,
              child: ChartItem(
                deviceID: deviceID,
                sensorID: sensorID,
                name: sensorSummaryProvider.sensor.name,
                lastValue: sensorSummaryProvider.lastValue,
                unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
                data: sensorSummaryProvider.sensorData,
              ),
            ),
            grabbing: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Load More',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
              color: Colors.green,
            ),
            sheetBelow: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: DataTable(
                  headingRowHeight: 45,
                  horizontalMargin: 10,
                  rows: _convertDataToDataRow(sensorSummaryProvider.sensorData),
                  columns: [
                    DataColumn(
                      label: Text(
                        'Created Date',
                        style: MyTextStyles.dataColumnTextStyle,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Value',
                        style: MyTextStyles.dataColumnTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // SingleChildScrollView(
        //   child: Column(
        //     children: <Widget>[
        //       InkWell(
        //         child: ChartItem(
        //           deviceID: deviceID,
        //           sensorID: sensorID,
        //           name: sensorSummaryProvider.sensor.name,
        //           lastValue: sensorSummaryProvider.lastValue,
        //           unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
        //           data: sensorSummaryProvider.sensorData,
        //         ),
        //       ),
        //       DataTable(
        //         headingRowHeight: 45,
        //         horizontalMargin: 10,
        //         rows: _convertDataToDataRow(sensorSummaryProvider.sensorData),
        //         columns: [
        //           DataColumn(
        //             label: Text(
        //               'Created Date',
        //               style: MyTextStyles.dataColumnTextStyle,
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'Value',
        //               style: MyTextStyles.dataColumnTextStyle,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),

        // CustomScrollView(
        //   slivers: <Widget>[
        //     // SliverAppBar(
        //     //   leading: SizedBox(),
        //     //   forceElevated: true,
        //     //   snap: true,
        //     //   floating: true,
        //     //   flexibleSpace: ChartItem(
        //     //     deviceID: deviceID,
        //     //     sensorID: sensorID,
        //     //     name: sensorSummaryProvider.sensor.name,
        //     //     lastValue: sensorSummaryProvider.lastValue,
        //     //     unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
        //     //     data: sensorSummaryProvider.sensorData,
        //     //   ),
        //     //   expandedHeight: 360,
        //     // ),
        //     // SliverList(
        //     //   delegate: SliverChildListDelegate(
        //     //     [
        //     //       Padding(
        //     //         padding: const EdgeInsets.all(8.0),
        //     //         child: DataTable(
        //     //           headingRowHeight: 45,
        //     //           horizontalMargin: 10,
        //     //           rows: _convertDataToDataRow(
        //     //               sensorSummaryProvider.sensorData),
        //     //           columns: [
        //     //             DataColumn(
        //     //               label: Text(
        //     //                 'Created Date',
        //     //                 style: MyTextStyles.dataColumnTextStyle,
        //     //               ),
        //     //             ),
        //     //             DataColumn(
        //     //               label: Text(
        //     //                 'Value',
        //     //                 style: MyTextStyles.dataColumnTextStyle,
        //     //               ),
        //     //             ),
        //     //           ],
        //     //         ),
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
  }

  List<DataRow> _convertDataToDataRow(List<SensorData> list) {
    return list.reversed
        .toList()
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Text(data.createdDate),
              ),
              DataCell(
                Text(data.value),
              ),
            ],
          ),
        )
        .toList();
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.grey[350],
//     appBar: AppBar(
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back),
//         onPressed: () {
//           SensorSummaryProvider.timer.cancel();
//           Navigator.pop(context);
//         },
//       ),
//       centerTitle: true,
//       title: Text('White House'),
//     ),
//     body: Container(
//       child: Consumer<SensorSummaryProvider>(
//         builder: (ctx, sensorSummaryProvider, _) => Column(
//           children: <Widget>[
//             ChartItem(
//               name: sensorSummaryProvider.sensor.name,
//               lastValue: sensorSummaryProvider
//                   .sensorData[sensorSummaryProvider.sensorData.length - 1]
//                   .value,
//               unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
//               data: sensorSummaryProvider.sensorData,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: DataTable(
//                   headingRowHeight: 45,
//                   horizontalMargin: 10,
//                   rows:
//                       _convertDataToDataRow(sensorSummaryProvider.sensorData),
//                   columns: [
//                     DataColumn(
//                       label: Text(
//                         'Created Date',
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: Text(
//                         'Value',
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
