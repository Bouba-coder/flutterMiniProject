import 'package:flutter/material.dart';
//import to compare two arraylists
import 'package:collection/collection.dart';
import 'package:flutterMiniProject/asset/burgerIcon.dart';
import 'package:flutterMiniProject/class/Food.dart';
import 'package:flutterMiniProject/component/Component.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //new object init
  Component _component = new Component();
  Food _burger = new Food();

  //get burger result
  _getresult(){
    //result
    if(_burger.getItems() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Burger Ingredients'),
            //content: Text('You typed "${_tab.map((key) => key)}".'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _component.burger("Pain", Colors.amberAccent, Icons.breakfast_dining, 18.0),
                _component.burger("Salade", Colors.green, SaladIcon.salade, 18.0),
                _component.burger("Tomate", Colors.red, Icons.breakfast_dining, 18.0),
                _component.burger("Frômage", Colors.yellow, Icons.breakfast_dining, 18.0),
                _component.burger("Steak", Colors.brown, Icons.breakfast_dining, 18.0),
                _component.burger("Frômage", Colors.yellow, Icons.breakfast_dining, 18.0),
                _component.burger("Ketchup", Colors.redAccent, Icons.breakfast_dining, 18.0),
                _component.burger("Moutarde", Colors.yellow, Icons.breakfast_dining, 18.0),
                _component.burger("Pain", Colors.amberAccent, Icons.breakfast_dining, 18.0),
            ],),
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
    else
      _component.show("You choose bad ingredients for a burger : ${_burger.tab.map((key) => key)}", context);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Food page"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: new Column(
        children: <Widget>[
          //listview items
          Expanded(
            child :
            ListView(
              children: _burger.ingrediens.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: _burger.ingrediens[key],
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      _burger.ingrediens[key] = value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          RaisedButton(
            child: Text(" Get Burger ", style: TextStyle(fontSize: 20),),
            color: Colors.green,
            textColor: Colors.white,
            splashColor: Colors.grey,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            onPressed: _getresult,
            /*onPressed: (){
              setState(() {
                ing.getItems();
              });
            },*/
          ),
          //Text("${ing.getItems()}"),
        ],
      ),
    );
  }
}
