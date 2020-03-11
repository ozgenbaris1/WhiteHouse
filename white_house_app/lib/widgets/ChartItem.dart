import 'dart:math';

import 'package:flutter/material.dart';
import 'package:white_house_app/helpers/Calculators.dart';
import 'package:white_house_app/helpers/MyTextStyles.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/widgets/Chart.dart';

class ChartItem extends StatelessWidget {
  final String name;
  final String lastValue;
  final String unitSymbol;
  final List<SensorData> data;

  ChartItem(
      {Key key,
      @required this.name,
      @required this.lastValue,
      @required this.unitSymbol,
      @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RawMaterialButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.red),
                          ),
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          child: Text("Day"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RawMaterialButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.red),
                          ),
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          child: Text("Week"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RawMaterialButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.red),
                          ),
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          child: Text("Month"),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                  ),
                  SizedBox(
                    height: 200,
                    child: Chart(
                      data: data,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Minimum Value'),
                          Text(
                            Calculators.getMinValue(data, unitSymbol),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Average Value'),
                          Text(
                            Calculators.getAverageValue(data, unitSymbol),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Maximum Value'),
                          Text(
                            Calculators.getMaxValue(data, unitSymbol),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
