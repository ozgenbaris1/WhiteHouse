import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/models/SensorData.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';
import 'package:white_house_app/widgets/ChartItem.dart';

class SensorScreen extends StatefulWidget {
  int deviceID;
  int sensorID;

  SensorScreen({this.deviceID, this.sensorID});

  @override
  _SensorScreen createState() =>
      _SensorScreen(deviceID: deviceID, sensorID: sensorID);
}

class _SensorScreen extends State {
  int deviceID;
  int sensorID;

  _SensorScreen({this.deviceID, this.sensorID});

  @override
  initState() {
    super.initState();
    initDataProviders();
  }

  initDataProviders() async {
    await Provider.of<SensorSummaryProvider>(context, listen: false)
        .initTimer(deviceID: this.deviceID, sensorID: this.sensorID);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SensorSummaryProvider>(
      builder: (ctx, sensorSummaryProvider, _) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomSliverDelegate(
                  title: sensorSummaryProvider.sensor.name,
                  child: ChartItem(
                    name: sensorSummaryProvider.sensor.name,
                    lastValue: sensorSummaryProvider
                        .sensorData[sensorSummaryProvider.sensorData.length - 1]
                        .value,
                    unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
                    data: sensorSummaryProvider.sensorData,
                  ),
                  expandedHeight: 120,
                ),
              ),
              SliverFillRemaining(
                child: Center(
                  child: Text("data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: NestedScrollView(
  //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //         return <Widget>[
  //           SliverAppBar(
  //             expandedHeight: 430.0,
  //             floating: false,
  //             pinned: true,
  //             flexibleSpace: FlexibleSpaceBar(
  //               centerTitle: true,
  //               // title: Text(
  //               //   "Collapsing Toolbar",
  //               //   style: TextStyle(
  //               //     color: Colors.white,
  //               //     fontSize: 16.0,
  //               //   ),
  //               // ),
  //               background: Container(
  //                 padding: EdgeInsets.only(top: 40),
  //                 child: Consumer<SensorSummaryProvider>(
  //                   builder: (ctx, sensorSummaryProvider, _) => Column(
  //                     children: <Widget>[
  //                       ChartItem(
  //                         name: sensorSummaryProvider.sensor.name,
  //                         lastValue: sensorSummaryProvider
  //                             .sensorData[
  //                                 sensorSummaryProvider.sensorData.length - 1]
  //                             .value,
  //                         unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
  //                         data: sensorSummaryProvider.sensorData,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ];
  //       },
  //       body: Center(
  //         child: Consumer<SensorSummaryProvider>(
  //           builder: (ctx, sensorSummaryProvider, _) => SingleChildScrollView(
  //             scrollDirection: Axis.vertical,
  //             child: DataTable(
  //               headingRowHeight: 45,
  //               horizontalMargin: 10,
  //               rows: _convertDataToDataRow(sensorSummaryProvider.sensorData),
  //               columns: [
  //                 DataColumn(
  //                   label: Text(
  //                     'Created Date',
  //                     style:
  //                         TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //                 DataColumn(
  //                   label: Text(
  //                     'Value',
  //                     style:
  //                         TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.grey[350],
  //     appBar: AppBar(
  //       leading: IconButton(
  //         icon: Icon(Icons.arrow_back),
  //         onPressed: () {
  //           SensorSummaryProvider.timer.cancel();
  //           Navigator.pop(context);
  //         },
  //       ),
  //       centerTitle: true,
  //       title: Text('White House'),
  //     ),
  //     body: Container(
  //       child: Consumer<SensorSummaryProvider>(
  //         builder: (ctx, sensorSummaryProvider, _) => Column(
  //           children: <Widget>[
  //             ChartItem(
  //                 name: sensorSummaryProvider.sensor.name,
  //                 lastValue: sensorSummaryProvider
  //                     .sensorData[sensorSummaryProvider.sensorData.length - 1]
  //                     .value,
  //                 unitSymbol: sensorSummaryProvider.sensor.unitSymbol,
  //                 data: sensorSummaryProvider.sensorData,),
  //             Expanded(
  //               child: SingleChildScrollView(
  //                 scrollDirection: Axis.vertical,
  //                 child: DataTable(
  //                   headingRowHeight: 45,
  //                   horizontalMargin: 10,
  //                   rows:
  //                       _convertDataToDataRow(sensorSummaryProvider.sensorData),
  //                   columns: [
  //                     DataColumn(
  //                       label: Text(
  //                         'Created Date',
  //                         style: TextStyle(
  //                             fontSize: 15, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                     DataColumn(
  //                       label: Text(
  //                         'Value',
  //                         style: TextStyle(
  //                             fontSize: 15, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  List<DataRow> _convertDataToDataRow(List<SensorData> list) {
    return list.reversed
        .toList()
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Text(data.createdDate),
              ),
              DataCell(
                Text(data.value),
              ),
            ],
          ),
        )
        .toList();
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Widget child;

  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
    this.title,
    this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight * 1.5,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Colors.green,
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              elevation: 0.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text(title)),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[Expanded(flex: 1, child: child)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
