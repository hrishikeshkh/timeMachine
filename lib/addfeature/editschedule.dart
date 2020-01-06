import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

List ott;

class ScheduleEdit extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScheduleEditState();
  } 
}

List daygive (List<List<dynamic>> ott)
{
  List taskdays;
  List <String> days = ['m','t','w','th','f','sa', 'su'];
  List ott;
  for (var i = 1; i < (ott.length + 1); i++) {
    taskdays.add(ListTile (title : Text(days[i])));
    for (var j = 1; j < (ott[i].length + 1); j++)
    {
      taskdays.add(ListTile(
        title:Text (ott[i][j][2]),
        subtitle: Text (ott[i][j][0].toString() + ':' + ott[i][j][1].toString()),
        onTap: () {
          changesc(i,j);
        },
      ));
    }
  }
  return taskdays;
}

class ScheduleEditState extends State<ScheduleEdit>
{
  List ott;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title : Text ('Edit Your Schedule'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
                _refreshIndicatorKey.currentState.show();
              },
          )
        ],
      ),
      body: Container(
          child : ListView (
            children : daygive(ott)
          )
      ),
    );
  }

}

void changesc(i,j)
{
  TextEditingController timeController;
  TextEditingController taskController;
  Dialog(
    child: Column(
      children: <Widget> [
      TextFormField(
        controller: timeController,
        onChanged: (value) {
          List x = value.split(':');
          ott[i][j][0] = int.parse(x[0]);
          ott[i][j][1] = int.parse(x[1]);
        }
      ),
      TextFormField(
        controller: taskController,
        onChanged: (value) {
          ott[i][j][2] = value;
        },
      )
    ]
  ));
}

void refresh(){

}