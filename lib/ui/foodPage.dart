import 'package:flutter/material.dart';
//food class
import 'package:flutterMiniProject/class/Food.dart';


class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //new object init
  Food _burger = new Food();

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
            //onPressed: _getresult,
            onPressed: (){
              setState(() {
                _burger.getItems(context);
              });
            },
          ),
          //Text("${ing.getItems()}"),
        ],
      ),
    );
  }
}
