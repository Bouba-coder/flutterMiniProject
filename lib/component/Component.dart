import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

//a simple component
class Component {
  //attributs
  /*
  String _cardText1;
  String _cardText2;
  int _cardWidth;
  int _cardHeight;
  double _cardBorderRadius;
   */

  //constructor
  //Component(this._cardWidth,this._cardHeight,this._cardBorderRadius);

  //getter and setter
  //Getter in dart(amazing)
  /*
  get getCardWidth => _cardWidth;
  get getCardHeight => _cardHeight;
  get getCardBorderRadius => _cardBorderRadius;
  get getCardText1 => _cardText1;
  get getCardText2 => _cardText2;

  //setter
  set setCardWidth(value) => _cardWidth = value;
  set setCardHeight(value) => _cardHeight = value;
  set setCardBorderRadius(value) => _cardBorderRadius = value;
  set setCardText1(value) => _cardText1 = value;
  set setCardText2(value) => _cardText2 = value;
*/
  //card component
  Container getCard(_cardWidth, _cardHeight, _cardBorderRadius, _cardText1,
      _cardText2, _textClick) {
    return Container(
      width: _cardWidth.toDouble(),
      height: _cardHeight.toDouble(),
      margin: EdgeInsets.all(70.0),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(_cardBorderRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _cardText1,
            style: TextStyle(fontSize: 22.2, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(_cardText2),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
            child: GestureDetector(
                child: Text("$_textClick",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueGrey)),
                onTap: _launchURL,
          )
          )
        ],
      ),
    );
  }
  //url launcher
  _launchURL() async {
    const url = 'https://google.com.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  //imageAvatar  component
  Container getAvatar(String imageLink, double containerWidth, double containerHeigh) {
    return Container(
      width: containerWidth,
      height: containerHeigh,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
        border: Border.all(color: Colors.black, width: 2.1),
        //image: DecorationImage(image: NetworkImage("https://picsum.photos/400/500"), fit: BoxFit.contain),
        image: DecorationImage(
            image: NetworkImage(imageLink),
            fit: BoxFit.contain),
      ),
    );
  }

  //burger component
  burger(String _ingredient, Object textColor, Object _iconName, double _iconSize){
    return TextButton.icon(
        icon: Icon(_iconName, size: _iconSize, color: Colors.black),
        label: Text(_ingredient, style: TextStyle(color: textColor, fontSize: 25.2), overflow: TextOverflow.ellipsis)
    );
  }

  //show dialogue component
  show(String showDialogMessage, Object context ){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('An other ingredients'),
          content: Text(showDialogMessage),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
