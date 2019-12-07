import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './beta-to-do-list.dart';
import './settingsPage.dart';
import './time_table.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'chatbot.dart';
import 'dart:async';
import 'addfeature/protips.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => MyHomePage());
  runApp  (MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(snapshot.data)),
    );
  }
  
}

class HomePage extends StatelessWidget {
  List <String> qlist  = [];
  String diff ;
  bool dark = false;
  String q ;

   final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);
  //TODO : add this is db
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
         drawer : Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Time Conciser'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text('Pro - Tips'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                MaterialPageRoute(builder: (context) => ProTips());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Update your Marks'),
              onTap: () {
                //MaterialPageRoute(builder: (context) => marksupdate());
                 Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Dark Theme"),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: bloc.changeTheme,
              ),
            )
          ],
        )
          ),
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
            child : Column( 
              children: <Widget>[qprint(), RaisedButton( 
                onPressed: ()
                {
                  MaterialPageRoute(builder: (context) => HomePageDialogflow()); 
                },
               )],
            )
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
    Text qprint ()
    {
      q  = qselect();
      return Text ('$q' , style: TextStyle(color: Colors.white),);
    }
  void ChangeTheme ()
  {
    if (dark)
    {
      dark= false;
    }
    else if (!dark)
    {
      dark = true;
    }
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();