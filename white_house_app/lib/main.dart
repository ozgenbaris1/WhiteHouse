import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/providers/DeviceProvider.dart';
import 'package:white_house_app/providers/SensorSummaryProvider.dart';
import 'package:white_house_app/screens/DeviceScreen.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  SyncfusionLicense.registerLicense(
      "NT8mJyc2IWhiZH1nfWN9YGpoYmF8YGJ8ampqanNiYmlmamlmanMDHmgxMiE6IDwpNDY9amUTND4yOj99MDw+");

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DeviceSummaryProvider()),
        ChangeNotifierProvider(create: (context) => SensorSummaryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'White House',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Container(
          child: DeviceScreen(),
        ),
      ),
    );
  }
}
