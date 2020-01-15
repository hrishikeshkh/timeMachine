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
      body: Column(
        children: <Widget>[
          Center(
            child : Card(
            child: Text('We Trust you not to overdo this' , style: TextStyle(fontSize: 20.0),),
          )),
          Row(
            children: <Widget>[
              Text (' '),
              Card(
                child: RaisedButton(
                    child : Text('TIC - TAC - TOE') ,
                  onPressed: ()
                  {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => MyApptic() ));
                  },
                )
              ),
              Text (' '),
              Card (
              child : RaisedButton(
                child : Text ('SNAKE'),
                onPressed: ()
                {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => Homesn() ));
                },
              )
              )
            ],
          ),
          //Text('KEEP'),
          //Text ('CALM')
                     Container(child: Image.asset('././assets/images/des.jpeg') , padding: EdgeInsets.only(top : 10.0),)

        ],
      ),
    );
  }
  
}
