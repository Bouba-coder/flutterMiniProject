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
            _card.getCard(350, 300, 5.5, "Timer", "Timer est un projet développé en 2021, ce projet utilise flutter et dart. Il est composé de quatre pages : une Page d'accueil, un Chronometer, un minuteur et d'un page de proposition de plat.", "Click"),
            _card.getAvatar("https://picsum.photos/id/237/200/300",150.0,150.0),
          ],
        ),
      ),
    );
  }
}

