import 'package:flutter/material.dart';
//import to compare two tab
import 'package:collection/collection.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //List of ingredients
  Map<String, bool> _ingrediens = {
    'Pain' : false,
    'Viande hachée' : false,
    'Oignon' : false,
    'Frômage' : false,
    'Tomate' : false,
    'Salade' : false,
    'Moutarde' : false,
    'Ketchup' : false,
    'Gingimbre' : false,
    'Steak' : false,
    'Poulet' : false,
    'Pomme de terre' : false,
    'Oeufs' : false,
  };

  //an other tab
  var _tab = [];
  var _tabCompar = ['Pain','Oignon', 'Frômage', 'Tomate', 'Salade', 'Moutarde', 'Ketchup', 'Steak'];
  bool _verif;
  //equality function
  Function eq = const ListEquality().equals;

  //burger
  _burger(String _ingredient, Object textColor, Object _iconName, double _iconSize){
    return TextButton.icon(
          icon: Icon(_iconName, size: _iconSize),
          label: Text(_ingredient, style: TextStyle(color: textColor, fontSize: 25.2), overflow: TextOverflow.ellipsis)
      );
  }
  _getItems(){
    _tab.clear();
   setState(() {
     _ingrediens.forEach((key, value) {
       if(value == true)
       {
         _tab.add(key);
         if(eq(_tab, _tabCompar)){
           _verif = true;
           print("Ca match : $_verif");
         }
         else{
           _verif = false;
          print("Ca ne match pas : $_verif");
         }
         //_tab1.add(key);
       }
       // Printing all selected items on Terminal screen.

     });

   });
    print("le tableau _getItems : ${_tab}");
    print("le tableau _tabCompar : ${_tabCompar}");
    print("le tableau _verif : ${_verif}");

    if(_verif == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thanks!'),
            //content: Text('You typed "${_tab.map((key) => key)}".'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              _burger("Pain", Colors.amberAccent, Icons.breakfast_dining, 18.0),
              _burger("Salade", Colors.green, Icons.breakfast_dining, 18.0),
              _burger("Tomate", Colors.red, Icons.breakfast_dining, 18.0),
              _burger("Frômage", Colors.yellow, Icons.breakfast_dining, 18.0),
              _burger("Steak", Colors.brown, Icons.breakfast_dining, 18.0),
              _burger("Frômage", Colors.yellow, Icons.breakfast_dining, 18.0),
              _burger("Ketchup", Colors.redAccent, Icons.breakfast_dining, 18.0),
              _burger("Moutarde", Colors.yellow, Icons.breakfast_dining, 18.0),
              _burger("Pain", Colors.amberAccent, Icons.breakfast_dining, 18.0),
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thanks!'),
            content: Text('You typed : Vous n\'aurez pas de burger'),
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
          //list items
          Expanded(
            child :
            ListView(
              children: _ingrediens.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: _ingrediens[key],
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      _ingrediens[key] = value;
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
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            onPressed: _getItems,
          ),
          //Text("${_getItems()}"),
        ],
      ),
    );
  }
}
