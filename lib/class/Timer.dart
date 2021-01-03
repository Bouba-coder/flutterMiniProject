import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Timer extends StatefulWidget
{
  //constructor
  Timer(Duration secondDuration, void keepRunning);

  @override
  TimerClass createState() => TimerClass();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TimerClass extends _TimerState{
//variables
  bool startIsPressed = true;
  bool stopIsPressed = true;
  bool resetIsPressed = true;
  //timer variable init
  String stopTimeToDisplay = "00:00:00:00";

  //second var
  final _secondDuration = const Duration(seconds:1);
  //stop timer var(calling native function)
  var _swatch = Stopwatch();

  get getStartTime => startIsPressed;
  get getstopIsPressed => stopIsPressed;
  get getresetIsPressed => resetIsPressed;
  get getstartstopwatch => startstopwatch;
  get getstartTimer => startTimer;
  get getstopstopwatch => stopstopwatch;
  get getresetstopwatch => resetstopwatch;


  //start timer function
  void startTimer(){
    Timer(_secondDuration, keepRunning());
  }
  void keepRunning(){
    if(_swatch.isRunning){
      startTimer();
    }
    setState((){
      stopTimeToDisplay = _swatch.elapsed.inHours.toString().padLeft(2, "0")
          + ":" + (_swatch.elapsed.inMinutes%60).toString().padLeft(2, "0")
          + ":" + (_swatch.elapsed.inSeconds%60).toString().padLeft(2, "0") + ":" + (_swatch.elapsed.inMilliseconds).toString().padLeft(2, "0");
    });
  }

  void startstopwatch(){
    setState((){
      stopIsPressed = false;
      startIsPressed = false;
    });
    _swatch.start();
    startTimer();
  }

  //timer stop function
  void stopstopwatch(){
    setState(() {
      stopIsPressed = true;
      resetIsPressed = false;
    });
    _swatch.stop();
  }

  //timer reset button
  void resetstopwatch(){
    setState(() {
      stopIsPressed = true;
      startIsPressed = true;
    });
    _swatch.reset();
    stopTimeToDisplay = "00:00:00:00";
  }
}
