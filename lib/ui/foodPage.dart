import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Food page"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("This the home page."),
      ),
    );
  }
}
