import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutterMiniProject/class/stopTimer.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  //variables
  String stopTimeToDisplay = "00:00:00:00";
  final dur = const Duration(seconds: 0);
  //swatch method calling
  var swatch = Stopwatch();

  //timer starter
  startTime(){
    setState(() {
      Timer(dur, (){
        startTime();
        stopTimeToDisplay = swatch.elapsed.inHours.toString().padLeft(2, "0")
            + ":" + (swatch.elapsed.inMinutes%60).toString().padLeft(2, "0")
            + ":" + (swatch.elapsed.inSeconds%60).toString().padLeft(2, "0") + ":" + (swatch.elapsed.inMilliseconds%60).toString().padLeft(2, "0");


      });
    });

  }

  //start method
  getStart(){
    startTime();
    swatch.start();
  }

  //stop method
  getStop(){
    if(swatch.isRunning){
      swatch.stop();
      print('swatch stop');
    }
  }

  //reset method
  getReset(){
    if(swatch.isRunning == false || swatch.isRunning)
    {
      swatch.stop();
      swatch.reset();
    }
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
                    stopTimeToDisplay,
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
                            onPressed: getStop,
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
                            onPressed: getReset,
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
                        onPressed: getStart,
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
                ),
              ),
            ],
          ),
        ),
    );
  }
}
