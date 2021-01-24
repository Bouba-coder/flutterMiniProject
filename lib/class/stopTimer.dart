/*

class stopTimer{
/**/
}
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

 */