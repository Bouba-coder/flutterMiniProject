import 'package:flutter/material.dart';
import 'package:flutterMiniProject/ui/homePage.dart';
import 'package:flutterMiniProject/ui/timerPage.dart';
import 'package:flutterMiniProject/ui/foodPage.dart';
import 'package:flutterMiniProject/ui/hookTimerPage.dart';

//entry point
void main() => runApp(new MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomBarNavigation(),
    );
  }
}

class MyBottomBarNavigation extends StatefulWidget {
  @override
  _MyBottomBarNavigationState createState() => _MyBottomBarNavigationState();
}

//bottom bar content class
class _MyBottomBarNavigationState extends State<MyBottomBarNavigation> {

  //indexIcons init
  int _currentIconIdex = 0;
  //list pages widgets
  final List<Widget> _childrenIcon = [
    HomePage(),
    TimerPage(),
    FoodPage(),
    HTimerPage(),
  ];

  //icon page changed method
  void iconTapped(int index) {
    setState(() {
      _currentIconIdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //content called by icon
      body: _childrenIcon[_currentIconIdex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,

        //onTapFunction
        onTap: iconTapped,
        //flutter current index
        currentIndex: _currentIconIdex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.alarm),
              title: Text("Timer")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.food_bank),
              title: Text("Food")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.alarm),
              title: Text("Htimer")
          ),
        ],
      ),
    );
  }
}
