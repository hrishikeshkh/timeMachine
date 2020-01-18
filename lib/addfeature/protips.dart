import 'package:flutter/material.dart';

class ProTips extends StatelessWidget
{

  //List <String> tips = ['Understanding chemistry is like a pyramid, the top will collapse without a strong base,  one should give importance to basic concepts and fundamental topics in chemistry first, then try to master those concepts.', 'After learning concepts, one should think where the knowledge can be applied to and start applying principles of chemistry in daily processes.', 'Memorizing reactions is a major difficulty which can be overcome by effective and technical use of mind / concept maps.', 'Numericals in chemistry can be solved in a better way  by logically applying relevant formulas and practising divergent type of numericals.', 'Reference books should be wisely used for concepts which require more information and clarity.'];
  List <String> tips = [
    'Understanding chemistry is like a pyramid, the top will collapse without a strong base,  one should give importance to basic concepts and fundamental topics in chemistry first, then try to master those concepts.', 'After learning concepts, one should think where the knowledge can be applied to and start applying principles of chemistry in daily processes.', 'Memorizing reactions is a major difficulty which can be overcome by effective and technical use of mind / concept maps.', 'Numericals in chemistry can be solved in a better way  by logically applying relevant formulas and practising divergent type of numericals.', 'Reference books should be wisely used for concepts which require more information and clarity.',
    'Chemistry is volatile, keep revising it' , 
    'Not brought is equivalent to not done', 
    'The key to learning something well is repetition; the more times you go over the material the better chance you have of storing it permanently.', 
    'Visual learners study best when the material is graphic',
    'Do your homework whether you have to turn it in or not. Homework helps build the concept better',
    'The most important practice is note taking, lectures can only be restored in the brain if we write it down once and read that writing to recreate the lecture in our mind.',
    'For chemistry, read whatever is in bold face first and then go back and read all the text, highlighting the most important information. To memorize chemical reactions,  use index cards. you  can take them wherever go and look at them whenever youu have free time',
    'When reading science books, make sure you read the examples. If you don\'t read the examples you\'ll be lost during class.',
    'Working out or playing sports relieves stress. You should have incentives after your homework is done: go out, talk with a friend, read for pleasure, have fun.'
    ];
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
