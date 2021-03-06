import 'package:flutter/material.dart';
import 'game.dart';
import 'destressmaster.dart';
class Homesn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: AppBar(
        title:  Text('Snake'),
        actions: <Widget>[
          IconButton(
            icon : Icon (Icons.arrow_back),
            onPressed :(){
             Navigator.pop((context));
            }
          )
        ],
      ),
        backgroundColor: const Color(0xFF000000),
        body:
           Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Game(),
        
         ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
