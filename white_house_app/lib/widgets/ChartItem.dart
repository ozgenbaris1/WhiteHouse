import 'package:flutter/material.dart';
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
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                          Text(
                            "${this.lastValue} ${this.unitSymbol}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 24.0),
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Day"),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Week"),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Month"),
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

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('Minimum Value'),
                              Text('12.3 *C'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('Average Value'),
                              Text('19.5 *C'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('Maximum Value'),
                              Text('26.7 *C'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Expanded(
                  //   flex: 1,
                  //   child: ,
                  // ),

                  // chart.LineChart(
                  //   [
                  //     chart.Series<SensorData, int>(
                  //       id: 'Sales',
                  //       colorFn: (_, __) =>
                  //           chart.MaterialPalette.blue.shadeDefault,
                  //       domainFn: (SensorData sensorData, _) =>
                  //           int.parse(sensorData.createdDate),
                  //       measureFn: (SensorData sensorData, _) =>
                  //           int.parse(sensorData.value),
                  //       data: data,
                  //     ),
                  //   ],
                  //   animate: false,
                  //   defaultRenderer:
                  //       chart.LineRendererConfig(includePoints: true),
                  // ),

                  // SfCartesianChart(
                  //   // Initialize category axis
                  //   primaryXAxis: CategoryAxis(
                  //     labelPlacement: LabelPlacement.onTicks,
                  //     labelRotation: -45,
                  //   ),
                  //   series: <LineSeries<SensorData, String>>[
                  //     LineSeries<SensorData, String>(
                  //       // Bind data source
                  //       dataSource: this.data,
                  //       xValueMapper: (SensorData sales, _) =>
                  //           sales.createdDate,
                  //       yValueMapper: (SensorData sales, _) =>
                  //           double.parse(sales.value),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
