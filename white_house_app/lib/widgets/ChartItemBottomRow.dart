import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/models/SensorData.dart';

class ChartItemBottomRow extends StatelessWidget {
  List<SensorData> data;
  String unitSymbol;

  ChartItemBottomRow({
    @required this.data,
    @required this.unitSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('Minimum Value'),
            Text(Calculators.getMinValue(data) + ' ' + unitSymbol),
          ],
        ),
        Column(
          children: <Widget>[
            Text('Average Value'),
            Text(Calculators.getAverageValue(data) + ' ' + unitSymbol),
          ],
        ),
        Column(
          children: <Widget>[
            Text('Maximum Value'),
            Text(Calculators.getMaxValue(data) + ' ' + unitSymbol),
          ],
        ),
      ],
    );
  }
}
