import 'package:flutter/material.dart';

class HtimerPage extends StatefulWidget {
  @override
  _HtimerPageState createState() => _HtimerPageState();
}

class _HtimerPageState extends State<HtimerPage> {
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
