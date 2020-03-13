import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/helpers/MyDecorations.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';

class ChartItemTopRow extends StatefulWidget {
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
  _ChartItemTopRowState createState() => _ChartItemTopRowState();
}

class _ChartItemTopRowState extends State<ChartItemTopRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Current',
              style: MyTextStyles.sensorNameSubTextStyle,
            ),
            Text(
              this.widget.name,
              style: MyTextStyles.sensorNameTextStyle,
            ),
            Text(
              "${this.widget.lastValue} ${this.widget.unitSymbol}",
              style: MyTextStyles.sensorLastValueTextStyle,
            ),
          ],
        ),
        Spacer(),
        ToggleButtons(
          borderColor: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Last'),
                Text('10'),
              ],
            ),
            Text('Daily'),
            Text('Weekly'),
            Text('Yearly'),
          ],
          onPressed: (int index) {
            // setState(() {
            //   isSelected[index] = !isSelected[index];
            // });
          },
          isSelected: [true, false, false, false],
        ),
        // filterButton(
        //   title: 'Last 10',
        //   isBold: true,
        //   onPressed: () {
        //     SensorSummaryProvider.timer.cancel();
        //     Provider.of<SensorSummaryProvider>(context, listen: false)
        //         .initDailyTimer(
        //             deviceID: widget.deviceID, sensorID: widget.sensorID);
        //   },
        // ),
        // filterButton(
        //   title: 'Daily',
        //   isBold: false,
        //   onPressed: () {
        //     SensorSummaryProvider.timer.cancel();
        //     Provider.of<SensorSummaryProvider>(context, listen: false)
        //         .initDailyTimer(
        //             deviceID: widget.deviceID, sensorID: widget.sensorID);
        //   },
        // ),
        // filterButton(
        //   title: 'Weekly',
        //   isBold: false,
        //   onPressed: () {
        //     SensorSummaryProvider.timer.cancel();
        //     Provider.of<SensorSummaryProvider>(context, listen: false)
        //         .initDailyTimer(
        //             deviceID: widget.deviceID, sensorID: widget.sensorID);
        //   },
        // ),
        // filterButton(
        //   title: 'Yearly',
        //   isBold: false,
        //   onPressed: () {
        //     SensorSummaryProvider.timer.cancel();
        //     Provider.of<SensorSummaryProvider>(context, listen: false)
        //         .initDailyTimer(
        //             deviceID: widget.deviceID, sensorID: widget.sensorID);
        //   },
        // ),
      ],
    );
  }

  Widget filterButton({title, isBold = false, onPressed}) {
    FontWeight fw;

    if (isBold) {
      fw = FontWeight.bold;
    } else {
      fw = FontWeight.normal;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        // decoration: MyDecorations.rawMaterialButtonDecoration,
        child: RawMaterialButton(
          constraints: BoxConstraints(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontWeight: fw),
          ),
        ),
      ),
    );
  }
}
