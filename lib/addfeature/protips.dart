import 'package:flutter/material.dart';

class ProTips extends StatelessWidget
{

  List <String> tips = ['chem is volatile' , 'not brought is equivalent to not done'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: (Text('Pro - Tips')) ,
        ),
        body: Container( 
          child : ListView(
          children : tips.map((element)=> 
          Column(
            children : <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
          child :ListTile(
            title: Text('$element' , style : TextStyle(color: Colors.black , fontSize: 16)),
          )),
          Text(' ')]
          )).toList(),
        ),
    ));
  }
  
}
