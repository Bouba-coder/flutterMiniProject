import 'package:flutter/material.dart';

class HTimerPage extends StatefulWidget {
  @override
  _HTimerPageState createState() => _HTimerPageState();
}

class _HTimerPageState extends State<HTimerPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Timer Hook Page"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("This is timer hooks page."),
      ),
    );
  }
}
