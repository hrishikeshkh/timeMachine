import 'package:flutter/material.dart';

class ProTips extends StatelessWidget
{

  List <String> tips = ['Understanding chemistry is like a pyramid, the top will collapse without a strong base,  one should give importance to basic concepts and fundamental topics in chemistry first, then try to master those concepts.', 'After learning concepts, one should think where the knowledge can be applied to and start applying principles of chemistry in daily processes.', 'Memorizing reactions is a major difficulty which can be overcome by effective and technical use of mind / concept maps.', 'Numericals in chemistry can be solved in a better way  by logically applying relevant formulas and practising divergent type of numericals.', 'Reference books should be wisely used for concepts which require more information and clarity.'];
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
            //leading: Container(child : Text('$element[1]') , color: Colors.white,),
            title: Text('$element' , style : TextStyle(color: Colors.black , fontSize: 16)),
            //trailing: Text('$element[1][1]' , style : TextStyle(color : Colors.black  , fontSize : 8)),
          )),
          Text(' ')]
          )).toList(),
        ),
    ));
  }
  
}
