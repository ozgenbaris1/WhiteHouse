import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/DataFilter.dart';
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
  List<FilterButtonData> buttonList = [
    FilterButtonData(
      filter: DataFilter.last10,
      title: 'Last 10',
      isBold: true,
    ),
    FilterButtonData(
      filter: DataFilter.daily,
      title: 'Daily',
      isBold: false,
    ),
    FilterButtonData(
      filter: DataFilter.weekly,
      title: 'Weekly',
      isBold: false,
    ),
    FilterButtonData(
      filter: DataFilter.yearly,
      title: 'Yearly',
      isBold: false,
    ),
  ];

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
        Row(
          children: buttonList.map<Widget>(
            (item) {
              return filterButton(
                title: item.title,
                isBold: item.isBold,
                onPressed: () {
                  SensorSummaryProvider.timer.cancel();
                  Provider.of<SensorSummaryProvider>(context, listen: false)
                      .initTimer(
                          dataFilter: item.filter,
                          deviceID: widget.deviceID,
                          sensorID: widget.sensorID);

                  var tmpList = buttonList;

                  tmpList.forEach((tmp) {
                    if (item.title == tmp.title) {
                      tmp.isBold = true;
                    } else {
                      tmp.isBold = false;
                    }
                  });

                  setState(() {
                    buttonList = tmpList;
                  });
                },
              );
            },
          ).toList(),
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        // decoration: MyDecorations.rawMaterialButtonDecoration,
        child: RawMaterialButton(
          constraints: BoxConstraints(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontWeight: fw, fontSize: 13),
          ),
        ),
      ),
    );
  }
}

class FilterButtonData {
  DataFilter filter;
  String title;
  bool isBold;

  FilterButtonData({this.title, this.isBold, this.filter});
}
