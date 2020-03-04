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
      // tooltipBehavior: TooltipBehavior(
      //     enable: true,
      //     header: 'Value',
      //     canShowMarker: false,
      //     format: 'point.y'),
      primaryXAxis: CategoryAxis(
        labelPlacement: LabelPlacement.onTicks,
        labelRotation: -75,
      ),
      series: <LineSeries<SensorData, String>>[
        LineSeries<SensorData, String>(
          enableTooltip: false,
          color: Colors.blueAccent,
          // markerSettings: MarkerSettings(isVisible: true),
          dataSource: this.data,
          xValueMapper: (SensorData sensorData, _) =>
              sensorData.createdDate.split(' ')[1],
          yValueMapper: (SensorData sensorData, _) =>
              double.parse(sensorData.value),
        )
      ],
    );
  }
}
