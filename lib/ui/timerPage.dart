import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Timer page"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("This is Timer without hooks page."),
      ),
    );
  }
}

