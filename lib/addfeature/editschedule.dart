import 'package:flutter/material.dart';

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
        onTap: changesc,
      ));
    }
  }
  return taskdays;
}

class ScheduleEditState extends State<ScheduleEdit>
{
  List ott;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title : Text ('Edit Your Schedule'),
      ),
      body: Container(
          child : ListView (
            children : daygive(ott)
          )
      ),
    );
  }

}

void changesc()
{
  
}
