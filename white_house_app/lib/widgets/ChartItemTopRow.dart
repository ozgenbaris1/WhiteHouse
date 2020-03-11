import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/helpers/MyDecorations.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';

class ChartItemTopRow extends StatelessWidget {
  final int deviceID;
  final int sensorID;
  final String name;
  final String lastValue;
  final String unitSymbol;

  ChartItemTopRow({
    Key key,
    @required this.deviceID,
    @required this.sensorID,
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
              onPressed: () {
                SensorSummaryProvider.timer.cancel();
                Provider.of<SensorSummaryProvider>(context, listen: false)
                    .initDailyTimer(deviceID: deviceID, sensorID: sensorID);
              },
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
