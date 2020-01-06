import 'package:beta_time_machine/changetheme/theme.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './beta-to-do-list.dart';
//import './settingsPage.dart';
import './time_table.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'chatbot.dart';
import 'dart:async';
import 'changetheme/theme.dart';
import 'addfeature/protips.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import './destress/destressmaster.dart';

//import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => MyHomePage());
  runApp  (MyAppreal());
}

class MyAppreal extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
  
}

class HomePage extends State<MyAppreal> {
  List <String> qlist  = [];
  String diff ;
  bool dark = false;
  String q ;
  DynamicTheme dynamicTheme = new DynamicTheme();
   //final bool darkThemeEnabled;
  //final ValueChanged<Brightness> onSelectedTheme;
  
  //HomePage(this.darkThemeEnabled);
  //TODO : add this is db
  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider<ThemeChanger>(
        builder: (_) => ThemeChanger(ThemeData.dark()),

       child : new MaterialAppWithTheme()
      );
    void changeBrightness() {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }
  }
  void routeSettingsPage()
  {
    //MaterialPageRoute(builder: (context) => SettingsPage());
  }

  // String qselect ()
  //       {
  //          int current  = 0;
  //          DateTime dt;
  //          if (DateTime.now().difference(dt).inHours > 24)
  //          {
  //            dt = DateTime.now();
  //            current += 1;
  //          }
  //          return qlist[current];
  //       }
  //   Text qprint ()
  //   {
  //     q  = qselect();
  //     return Text ('$q' , style: TextStyle(color: Colors.white),);
  //   }
  bool ChangeTheme ()
  {
    if (dark)
    {
      return false;
      dark = false;
    }
    else if (!dark)
    {
      dark = true;
      return true;
    }
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  bool ch;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final _themeChanger = Provider.of<ThemeChanger>(context);
    //double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'overtime',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
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
           child: Text('OVERTIME'),
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
       ],
     )
       ),
       ////backgroundColor: Colors.yellow.withOpacity(0.8),
       appBar: AppBar(
         ////backgroundColor: Colors.deepPurple,
         bottom: TabBar(
           tabs: [
             Tab(icon: Icon(Icons.timer)),
             Tab(icon: Icon(Icons.list)),
             //Tab(icon: Icon(Icons.timeline)),
             Tab(icon: Icon(Icons.casino)),
           ],
         ),
         title: SafeArea(child : Row(           
           children: <Widget>[Text('Overtime'),
           //Text('  '),
          //  Switch(
          //    value: ch,
          //    onChanged: (ch){
          //      if (ch)
          //      {
          //        _themeChanger.setTheme(ThemeData.dark());
          //      }
          //      else
          //      {
          //        _themeChanger.setTheme(ThemeData.light());
          //      }
          //    },
          //  )
         FlatButton(
           padding: EdgeInsets.only(right : 10.0 , left : 80),
           child : Text('Go Dark'),
           onPressed: (){
             _themeChanger.setTheme(ThemeData.dark());
           }
          ), //todo
         FlatButton(
           padding: EdgeInsets.only(right: 10.0 , left : 10),
           child: Text ('Go Light'),
            onPressed: (){
              _themeChanger.setTheme(ThemeData.light());
            },
         )
         //IconButton(icon: Icon(Icons.settings), onPressed: () => routeSettingsPage()),
         ],
         ) 
       )),
       body: TabBarView(
         children: [
           MyHomePage(),
           Todolist(),
           //Icon(Icons.directions_bike),
           DestressMaster(),
         ],
       ),
       // bottomNavigationBar: BottomAppBar(
       //   color:  Colors.deepPurple,
       //   child : Column( 
       //     children: <Widget>[Text('SC'), RaisedButton( 
       //       onPressed: ()
       //       {
       //         MaterialPageRoute(builder: (context) => HomePageDialogflow()); 
       //       },
       //      )],
       //   )
       // ),
     ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}


final bloc = Bloc();