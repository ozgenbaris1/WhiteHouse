import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:white_house_app/models/SensorData.dart';

class Chart extends StatelessWidget {
  List<SensorData> data;

  Chart({this.data});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis:
          NumericAxis(minimum: 10, maximum: 80, labelFormat: '{value} *C'),
      tooltipBehavior: TooltipBehavior(
          enable: true, header: 'Value', canShowMarker: false, format: 'point.y'
          // builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          //     int seriesIndex) {
          //   return Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [Colors.green[200], Colors.lightGreen],
          //       ),
          //       // color: Colors.green,
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(20),
          //       ),
          //     ),
          //     margin: EdgeInsets.only(bottom: 50),
          //     padding: EdgeInsets.all(10),
          //     child: Text('${data.value}'),
          //   );
          // },
          ),
      primaryXAxis: CategoryAxis(
        labelPlacement: LabelPlacement.onTicks,
        labelRotation: -45,
      ),
      series: <LineSeries<SensorData, String>>[
        LineSeries<SensorData, String>(
          markerSettings: MarkerSettings(isVisible: true),
          dataSource: this.data,
          xValueMapper: (SensorData sales, _) => sales.createdDate,
          yValueMapper: (SensorData sales, _) => double.parse(sales.value),
        )
      ],
    );
  }
}
