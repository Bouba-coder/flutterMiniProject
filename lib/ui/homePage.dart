import 'package:flutter/material.dart';
import 'package:flutterMiniProject/component/Component.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //component object init
  var _card = new Component();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home page"),
        backgroundColor: Colors.grey,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            //calling method with argument
            _card.getCard(350, 300, 5.5, "YATERA Boubacar ", "boubacar.yatera@edu.itescia.fr"),
            _card.getAvatar(),
          ],
        ),
      ),
    );
  }
}

