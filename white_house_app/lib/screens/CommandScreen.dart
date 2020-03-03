import 'package:flutter/material.dart';

class CommandScreen extends StatefulWidget {
  createState() => CommandScreenState();
}

class CommandScreenState extends State<CommandScreen> {
  bool isSwitched = true;
  List<String> listItems = ["Ventilation", "Watering"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Commands"),
        ),
        body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              title: Text(listItems[index]),
              trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(
                    () {
                      isSwitched = value;
                    },
                  );
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
