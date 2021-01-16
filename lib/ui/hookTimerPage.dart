import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterMiniProject/class/Timer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
/*
class HTimerPage extends StatefulWidget {
  @override
  _HTimerPageState createState() => _HTimerPageState();
}

class _HTimerPageState extends State<HTimerPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Timer Hook Page"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("This is timer hooks page."),
      ),
    );
  }
}
*/

/*
//hookWidget
class HTimerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Timer Hook Page"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("This is timer hooks page."),
      ),
    );
  }
}
*/

class HTimerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var timerController;
    //timer var
    final _minutes = useState(0.0);
    final _seconds = useState(0.0);

    //an animationController
    final _timerController = useAnimationController(
        duration: Duration(
            minutes: _minutes.value.toInt(), seconds: _seconds.value.toInt()));

    //animationController method for changed timer
    _timerController.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _timerController.reset();
      }
    });



    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Timer Hook Page"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: new Column(
        //timer watch affich
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: AnimatedBuilder(
              animation: _timerController,
              builder: (context, child) {
                Duration duration =
                    _timerController.duration * (1.0 - _timerController.value);
                return Text(
                  //condition
                  _timerController.isAnimating == false
                      ? '${_timerController.duration.inMinutes}:${(_timerController.duration.inSeconds % 60).toString().padLeft(2, '0')}'

                      : '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 60.0, fontStyle: FontStyle.italic),
                );
              },
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //play Button
                  IconButton(icon: Icon(Icons.play_arrow, color: Colors.green,
              ), onPressed: (){
                      _timerController.forward(
                        from:
                        _timerController.value == 0.0 ? 1.0 : _timerController.value,
                      );
                  }
                  ),
                  //stop button
                  IconButton(icon: Icon(Icons.stop_circle, color: Colors.red), onPressed: (){
                    if(_timerController.isAnimating) {
                      _timerController.stop(canceled: true);
                    }
                  }),
                  //reset Button
                  IconButton(icon: Icon(Icons.redo), onPressed: (){
                    if (_timerController.isAnimating == false || _timerController.isAnimating) {
                        _timerController.reset();
                    }
                  })
                ],
              ),
            ),
          Text('Minutes', style: TextStyle(fontSize: 18, color: Colors.black),),
          Slider(
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            value: _minutes.value,
            min: 0.0,
            max: 10.0,
            onChanged: (value) {
              if (_timerController.isAnimating == false) {
                _minutes.value = value;
              }
            },
            divisions: 10,
            label: _minutes.value.toString(),
          ),
          Text('Second', style: TextStyle(fontSize: 18, color: Colors.black),),
          Slider(
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            value: _seconds.value,
            min: 0.0,
            max: 60.0,
            onChanged: (value) {
              if (_timerController.isAnimating == false) {
                _seconds.value = value;
              }
            },
            divisions: 10,
            label: _seconds.value.toString(),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
