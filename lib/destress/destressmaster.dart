import 'package:beta_time_machine/destress/snake/main.dart';
import 'package:beta_time_machine/destress/tic-tac-toe/ticmain.dart';
import 'package:flutter/material.dart';

class DestressMaster extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Destress...'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child : Container(
              padding: EdgeInsets.only(top: 10.0),
              child : Card(
            child: Text('We Trust you not to overdo this' , style: TextStyle(fontSize: 20.0),),
          ))),
          
              Text (' '),
              Card(
              child :  ListTile(
                  title : Text('TIC - TAC - TOE'),
                  leading: Icon(Icons.apps),
                  onTap: ()
                  {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => MyApptic() ));
                  },
                
              )),
              Card (
              child :  ListTile (
                title : Text ('SNAKE'),
                leading: Icon(Icons.picture_in_picture),
                onTap: ()
                {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => Homesn() ));
                },
              )),
           Container(child: Image.asset('././assets/images/des.jpeg') , padding: EdgeInsets.only(top : 10.0),)
        ],
      ),
    );
  }
  
}
