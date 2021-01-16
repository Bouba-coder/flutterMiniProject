import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Component{
  //attributs
  String _cardText1;
  String _cardText2;
  int _cardWidth ;
  int _cardHeight ;
  double _cardBorderRadius ;



  //constructor
  //Component(this._cardWidth,this._cardHeight,this._cardBorderRadius);

  //getter and setter
  //Getter in dart(amazing)
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


  //card component
  Container getCard(_cardWidth,_cardHeight,_cardBorderRadius, _cardText1, _cardText2){
    return Container(
      width: _cardWidth.toDouble(),
      height: _cardHeight.toDouble(),
      margin: EdgeInsets.all(60.0),

      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(_cardBorderRadius)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_cardText1, style: TextStyle(fontSize: 22.2, fontWeight: FontWeight.bold),),
          Text(_cardText2),

        ],
      ),
    );
  }

  //imageAvatar  function
  Container getAvatar(){
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
        border: Border.all(color: Colors.black, width: 2.1),
        //image: DecorationImage(image: NetworkImage("https://picsum.photos/400/500"), fit: BoxFit.contain),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/id/237/200/300"), fit: BoxFit.contain),
      ),
    );
  }

}