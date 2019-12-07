import 'package:flutter/material.dart';

class ScheduleEdit extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScheduleEditState();
  } 
}

class ScheduleEditState extends State<ScheduleEdit>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title : Text ('Edit Your Schedule'),
      ),
    );
  }

}

