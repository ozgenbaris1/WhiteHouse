// TO-DO: Restrict the screen to be horizontal

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/models/DataFilter.dart';
import 'package:white_house_app/providers/SensorDataProvider.dart';
import 'package:white_house_app/widgets/Chart.dart';

class ChartScreen extends StatefulWidget {
  final int deviceID;
  final int sensorID;

  ChartScreen({
    @required this.deviceID,
    @required this.sensorID,
  });

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
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
  initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SensorDataProvider>(
        builder: (ctx, sensorSummaryProvider, _) {
          return SafeArea(
            left: false,
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);

                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: buttonList.map<Widget>(
                          (item) {
                            return filterButton(
                              title: item.title,
                              isBold: item.isBold,
                              onPressed: () {
                                SensorDataProvider.timer.cancel();
                                Provider.of<SensorDataProvider>(context,
                                        listen: false)
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
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Chart(
                      data: sensorSummaryProvider.sensorData,
                      unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
