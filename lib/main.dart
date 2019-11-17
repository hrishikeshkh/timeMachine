import 'package:flutter/material.dart';
import './beta-to-do-list.dart';
import './settingsPage.dart';
import './time_table.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => MyHomePage());
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  List <String> qlist  = [];
  String diff ;
  //TODO : add this is db
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.yellow.withOpacity(0.8),
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.timer)),
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.timeline)),
              ],
            ),
            title: Row(children: <Widget>[Text('Time Conciser                                                    '),
            IconButton(icon: Icon(Icons.settings), onPressed: () => routeSettingsPage()),],) 
          ),
          body: TabBarView(
            children: [
              MyHomePage(),
              Todolist(),
              Icon(Icons.directions_bike),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color:  Colors.deepPurple,
            child : Text ('$qselect()' , style:  TextStyle(color: Colors.white , fontSize: 18.0)),
          ),
        ),
      ),
    );
  }
  void routeSettingsPage()
  {
    MaterialPageRoute(builder: (context) => SettingsPage());
  }

  String qselect ()
        {
           int current  = 0;
           DateTime dt;
           if (DateTime.now().difference(dt).inHours > 24)
           {
             dt = DateTime.now();
             current += 1;
           }
           return qlist[current];
        }
}