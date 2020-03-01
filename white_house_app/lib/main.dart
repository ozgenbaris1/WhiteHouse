import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_house_app/providers/DeviceProvider.dart';
import 'package:white_house_app/screens/DeviceScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DeviceSummaryProvider()),
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
