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
            child : Card(
            child: Text('We Trust you not to overdo this' , style: TextStyle(fontSize: 20.0),),
          )),
          
              Text (' '),
              ListTile(
                  title : Text('TIC - TAC - TOE') ,
                  onTap: ()
                  {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => MyApptic() ));
                  },
                
              ),
              ListTile (
                title : Text ('SNAKEEE'),
                onTap: ()
                {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => Homesn() ));
                },
              )
              ,      
          Text('KEEP'),
          Text ('CALM')
        ],
      ),
    );
  }
  
}