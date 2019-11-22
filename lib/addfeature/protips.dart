import 'package:flutter/material.dart';

class ProTips extends StatelessWidget
{

  List <String> tips = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home : Container( 
          child : Column(
          children : tips.map((element)=> 
          Card(
            color: Colors.yellow,
            child: Text('$element' , style : TextStyle(color: Colors.black)),
          )
          ).toList())
        ),
    );
  }
  
}
