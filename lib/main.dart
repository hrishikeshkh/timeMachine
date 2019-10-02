import 'package:flutter/material.dart';
import './to-do-list.dart';

void main() {
  runApp(MaterialApp(
    title: 'Alpha',
    home: HP(),
  ));
}

class HP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alpha_home_page'),
        ),
        body: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //TO DO LIST bUTTON
                  Center(
                    child: RaisedButton(
                      child: Text('To - Do - List'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ToDoList()),
                        );
                      },
                      focusElevation: 10.0,
                      focusColor: Colors.blue,
                    ),
                  ),
                  //TIME TABLE BUTTON
                  //TODO: time table
                  Center(
                    child: RaisedButton(
                      child: Text('TimeTable'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimeTable()),
                        );
                      },
                      focusElevation: 10.0,
                      focusColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  // TODO: create MG page
                  Center(
                    child: RaisedButton(
                      child: Text('Marks graph'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MarksGraph()),
                        );
                      },
                      focusElevation: 10.0,
                      focusColor: Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
  }
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TodoList();
  }
}

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Table"),
      ),
      body: Center(),
    );
  }
}

class MarksGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marks Graph"),
      ),
      body: Center(),
    );
  }
}
