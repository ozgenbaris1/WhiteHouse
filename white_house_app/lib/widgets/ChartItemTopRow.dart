import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/helpers/MyDecorations.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/SensorData.dart';

class ChartItemTopRow extends StatelessWidget {
  final String name;
  final String lastValue;
  final String unitSymbol;

  ChartItemTopRow({
    Key key,
    @required this.name,
    @required this.lastValue,
    @required this.unitSymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              this.name,
              style: MyTextStyles.sensorNameTextStyle,
            ),
            Text(
              "${this.lastValue} ${this.unitSymbol}",
              style: MyTextStyles.sensorLastValueTextStyle,
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: MyDecorations.rawMaterialButtonDecoration,
            child: RawMaterialButton(
              constraints: BoxConstraints(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              child: Text("Day"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: MyDecorations.rawMaterialButtonDecoration,
            child: RawMaterialButton(
              constraints: BoxConstraints(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              child: Text("Week"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: MyDecorations.rawMaterialButtonDecoration,
            child: RawMaterialButton(
              constraints: BoxConstraints(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              child: Text("Month"),
            ),
          ),
        ),
      ],
    );
  }
}
