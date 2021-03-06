import 'package:beta_time_machine/addfeature/editschedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';


// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019 , 11 , 9): ['This is some day']
  //TODO : add holidays
};
final List<DateTime> _hd = [DateTime(2019 , 11 , 9) , DateTime(2019, 1, 1)];

void main() {
  initializeDateFormatting().then((_) => MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  static Map <String, List> full_timetable = {};
  // List mo = full_timetable['mon'];
  // List tu = full_timetable['tue'];
  // List we = full_timetable['wed'];
  // List th = full_timetable['thu'];
  // List fr = full_timetable['fri'];
  // List sa = full_timetable['sat'];
  // List su = full_timetable['sun'];
  List<String> mo = ['Study Chemistry', '12', '30'];
  List<String> tu = ['Play basketball', '12', '30' ,'Leave for coaching class' , '13' , '30'];
  List<String> we = ['Study physics', '12', '30'];
  List<String> th = ['Revise school work', '12', '30'];
  List<String> fr = ['Study for UT', '12', '30'];
  List<String> sa = ['Leave for class', '13', '30', 'Study Maths', '14', '30'];
  List<String> su = ['Study Maths', '12', '30' , 'Study Computer Science' , '13' , '30'];


 List daygive (List<List<dynamic>> ott)
{
  List taskdays;
  List <String> days = ['m','t','w','th','f','sa', 'su'];
  for (var i = 1; i < (ott.length + 1); i++) {
    taskdays.add(ListTile (title : Text(days[i])));
    for (var j = 1; j < (ott[i].length + 1); j++)
    {
      taskdays.add(ListTile(
        title:Text (ott[i][j][2]),
        subtitle: Text (ott[i][j][0].toString() + ':' + ott[i][j][1].toString()),
        onTap: () {
          //changesc(i,j);
        },
      ));
    }
  }
  return taskdays;
}

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    List<bool> changed = [];
    for (int i = 0; i < 366; i++) {
    changed.add(false);
    }
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        
      ],
      _selectedDay.subtract(Duration(days: 27)): [],
      _selectedDay.subtract(Duration(days: 20)): [
        
      ],
      _selectedDay.subtract(Duration(days: 16)): [],
      _selectedDay.subtract(Duration(days: 10)): [
      ],
      _selectedDay.subtract(Duration(days: 4)): [
      ],
      _selectedDay.subtract(Duration(days: 2)): [],
      _selectedDay: [],
      _selectedDay.add(Duration(days: 1)): [
        
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from([]).toList(),
      _selectedDay.add(Duration(days: 7)): [
        
      ],
      _selectedDay.add(Duration(days: 11)): [],
      _selectedDay.add(Duration(days: 17)): [

      ],
      _selectedDay.add(Duration(days: 22)): [],
      _selectedDay.add(Duration(days: 26)): [
        
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.yellow.withOpacity(0.8),
      appBar: 
      PreferredSize( 
        preferredSize: Size.fromHeight(100.0),
        child : AppBar(
        //backgroundColor: Colors.deepPurple,
        title: Text('Time-Table'),
      )),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Text(""),
              ButtonTheme(
                buttonColor: Colors.yellow,
                minWidth: 198.0,
                child: FlatButton(
                    //disabledColor: Colors.deepPurple,
                    onPressed: (){
                       print('nothing');
                     },
                    child: Opacity(
                      opacity: 1.0,
                    child : Text('TASK' , style: TextStyle(fontSize: 20.0),)),
                )
              ),
              Text('|' , style : TextStyle(fontSize: 20.0)),
              ButtonTheme(
                //disabledColor: Colors.deepPurple,
                minWidth: 198.0,
                child: FlatButton(
                    child: Opacity(
                      opacity: 1.0,
                     child : Text('TIME TO COMMENCE' , style: TextStyle(fontSize: 15.0),)),
                     onPressed: (){
                       print('nothing');
                     },
                )
              )
            ],
          ),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
       calendarStyle: CalendarStyle(
         selectedColor: Colors.deepPurple[400],
         todayColor: Colors.deepPurple[200],
         markersColor: Colors.yellow.withOpacity(0.8),
         outsideDaysVisible: false,
       ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {},
       calendarStyle: CalendarStyle(
         outsideDaysVisible: false,
         weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
         holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
       ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle(color: Colors.white).copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white).copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: null,
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);
    return Column(
      children: <Widget>[
        const SizedBox(height: 6.0),
        //ButtonTheme(
            //buttonColor: Colors.deepPurple,
            //minWidth: 400.0,
            //child: RaisedButton(
              //child: Text(
                //'Edit Today\'s schedule',
                //style: TextStyle(color: Colors.white),
              //),
              //onPressed: () {
                // _calendarController.setSelectedDay(
                //   DateTime(dateTime.year, dateTime.month, dateTime.day),
                //   runCallback: true,
                // );
                //MaterialPageRoute(builder: (context) => ScheduleEdit());
              //},
   //         ),
      ],
    );
  }

  Widget _buildEventList() {
    var now = DateTime.now();
    List<String> selectedday = [];
    if (now.weekday == 1) {
      selectedday = mo;
    }
    if (now.weekday == 2) {
      selectedday = tu;
    }
    if (now.weekday == 3) {
      selectedday = we;
    }
    if (now.weekday == 4) {
      selectedday = th;
    }
    if (now.weekday == 5) {
      selectedday = fr;
    }
    if (now.weekday == 6) {
      selectedday = sa;
    }
    if (now.weekday == 7 || _hd.contains(DateTime (now.year , now.month , now.day))) {
      selectedday = su;
      print('ya');
    }
      print(_hd.contains(now));

    print (now);
    List<String> daytask = [];
    int j = 0;
    List<Widget> times = [];
    String temp;
    for (var k in selectedday) {
      if (j % 3 == 0 || j == 0) {
        daytask.add(k);
      } else {
        if ((j + 2) % 3 == 0) {
          temp = k;
        } else {
          times.add(Text('$temp : $k',
              style: TextStyle( fontSize: 20.0)));
        } //TODO : change to k.hours + k.minutes
      }
      j++;
      print(times);
      print(daytask);
    }
    return SafeArea(
        child: Card(
            //color: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Text(''),
                  Column(
                    children: daytask
                        .map((task) => SafeArea(
                        child : Column(children: <Widget>[
                              //ListView(
                              //  children : <Widget>[
                              Text(
                                '',
                                style: TextStyle(
                                     fontSize: 18.0),
                              ),
                              Text(
                                '$task',
                                style: TextStyle(
                                    fontSize: 18.0),
                              ),
                                Text('---------------------')

                        //] ,
                        //scrollDirection: Axis.horizontal,
                        ])))
                        .toList(),
                  ),
                  Text('    ', style: TextStyle(fontSize: 35.0)),
                  SafeArea(
                   child : Column(
                      children: times
                          .map((times) => Column(
                                children: <Widget>[Text(''), times,
                                Text('---------------------')
                ]
                              ))
                          .toList())),
                ],
              ),
            ])));
    //
    //ListView(
    // children: _selectedEvents
    //     .map((event) => Container(
    //           decoration: BoxDecoration(
    //             border: Border.all(width: 0.8),
    //             borderRadius: BorderRadius.circular(12.0),
    //           ),
    //           margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    //           child: ListTile(
    //             title: Text(event.toString() , style:  TextStyle(color: Colors.black),),
    //             onTap: () => print('$event tapped'),
    //           ),
    //         ))
    //     .toList(),
    //);
  }
}
