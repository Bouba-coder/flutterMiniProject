import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterMiniProject/class/Timer.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
//Booleans var for functions actions
  bool _startIsPressed = true;
  bool _stopIsPressed = true;
  bool _resetIsPressed = true;

  //timer variable init
  String _stopTimeToDisplay = "00:00:00:00";
  final _dur = const Duration(seconds:1);
  //stop timer var(calling native function)
  var _swatch = Stopwatch();

  //start timer function
  void startTimer(){
    Timer(_dur, keepRunning);
  }

  void keepRunning(){
    if(_swatch.isRunning){
      startTimer();
    }
    setState((){
      _stopTimeToDisplay = _swatch.elapsed.inHours.toString().padLeft(2, "0")
          + ":" + (_swatch.elapsed.inMinutes%60).toString().padLeft(2, "0")
          + ":" + (_swatch.elapsed.inSeconds%60).toString().padLeft(2, "0") + ":" + (_swatch.elapsed.inMilliseconds%60).toString().padLeft(2, "0");
    });
  }

  void startWatch(){
    setState((){
      _stopIsPressed = false;
      _startIsPressed = false;
    });
    _swatch.start();
    startTimer();
  }


  //timer stop function
  void stopWatch(){
    setState(() {
      _startIsPressed = true;
      _resetIsPressed = false;
    });
    _swatch.stop();
  }

  //timer reset button
  void resetWatch(){
    setState(() {
      _startIsPressed = true;
      _startIsPressed = true;
    });
    _swatch.reset();
    _stopTimeToDisplay = "00:00:00:00";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Timer page"),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: new Material(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    //timer
                    _stopTimeToDisplay,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            //stop function calling onPressed
                            onPressed: _stopIsPressed ? null : stopWatch,
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15.0,
                            ),
                            child: Text(
                              "Stop",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          RaisedButton(
                            //reset function calling onPressed
                            onPressed: _resetIsPressed ? null : resetWatch,
                            color: Colors.teal,
                            padding: EdgeInsets.symmetric(
                              horizontal: 35.0,
                              vertical: 15.0,
                            ),
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      RaisedButton(
                        //start function calling onPressed
                        onPressed: _startIsPressed ? startWatch : null,
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: 80.0,
                          vertical: 20.0,
                        ),
                        child: Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),),
            ],
          ),
        ),
    );
  }
}
