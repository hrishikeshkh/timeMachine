import 'package:flutter/material.dart';
import 'package:sqflite/sql.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'dart:async';
import 'package:path/path.dart';
import './inputdb.dart';

class Dog {
       int ssho;
       int ssmo;
       int wtho;
       int wtmo;
       int wthho;
       int wthmo;
       int seho;
       int semo;
       int sseho;
       int ssemo;
       bool co;
       bool no;
       int cswdho;
       int cswdmo;
       int cewdho;
       int cewdmo;
       int cssho;
       int cssmo;
       int cesho;
       int cesmo;
       int cssuho;
       int cssumo;
       int cesuho;
       int cesumo;
       int sho;
  //final String name;
        int go;

  Dog({
    this.ssho,
    this.ssmo,
    this.seho,
    this.semo,
    this.wtho,
    this.wtmo,
    this.wthho,
    this.wthmo,
    this.sseho,
    this.ssemo,
    this.co,
    this.no,
    this.cswdho,
    this.cswdmo,
    this.cewdho,
    this.cewdmo,
    this.cssho,
    this.cssmo,
    this.cesho,
    this.cesmo,
    this.cssuho,
    this.cssumo,
    this.cesuho,
    this.cesumo,
    this.sho,
    this.go,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      //TODO : add these varaiblesss
      'ssmo': ssmo,
      'wth': wtho,
      'wthh': wthho,
      'wthm': wthmo,
      'seh': seho,
      'sem': semo,
      'c': co,
      'n': no,
      'cswdh': cswdho,
      'cswdm': cswdmo,
      'cewdm': cewdmo,
      'cewdh': cewdho,
      'cssh': cssho,
      'cssm': cssmo,
      'cesh': cesho,
      'cesm': cesmo,
      'cesuh': cesuho,
      'cesum': cesumo,
      'sh': sho,
      'g': go
    };
  }

  int get ssm => ssmo;
  int get ssh => ssho;
  
  set ssm(int newssm) {
    this.ssm = newssm;
  }

  set ssh(int newssm) {
    this.ssh = newssm;
  }

  set wth(int newssm) {
    this.wth = newssm;
  }

  set wtm(int newssm) {
    this.wtm = newssm;
  }

  set wthh(int newssm) {
    this.wthh = newssm;
  }

  set wthm(int newssm) {
    this.wthm = newssm;
  }

  set seh(int newssm) {
    this.seh = newssm;
  }

  set sem(int newssm) {
    this.sem = newssm;
  }

  set ssem(int newssm) {
    this.ssem = newssm;
  }

  set sseh(int newssm) {
    this.sseh = newssm;
  }

  set cswdh(int newssm) {
    this.cswdh = newssm;
  }

  set cswdm(int hosacswdm) {
    this.cswdm = hosacswdm;
  }

  set cewdh(int newssm) {
    this.cewdh = newssm;
  }

  set cewdm(int newssm) {
    this.cewdm = newssm;
  }

  set cssh(int newssm) {
    this.cssh = newssm;
  }

  set cssm(int newssm) {
    this.cssm = newssm;
  }

  set cesm(int newssm) {
    this.cesm = newssm;
  }

  set cesh(int newssm) {
    this.cesh = newssm;
  }

  set cssum(int newssm) {
    this.cssum = newssm;
  }

  set cssuh(int newssm) {
    this.cssuh = newssm;
  }

  set cesum(int newssm) {
    this.cesum = newssm;
  }

  set cesuh(int newssm) {
    this.cesuh = newssm;
  }

  set sh(int newssm) {
    this.sh = newssm;
  }

  set c(bool nc) {
    this.c = nc;
  }

  set n(bool nc) {
    this.n = nc;
  }

  set g(int gn) {
    this.g = gn;
  }
}

Dog dog;

class Inputs extends StatefulWidget {
  ///final CounterStorage storage;

//Inputs({Key key, @required this.storage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputsState();
  }
}

class GradeInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GradeInputState();
  }
}

class GradeInputState extends State {
  TextEditingController tc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: tc,
      onChanged: (value) {},
    );
  }
}

class InputsState extends State<Inputs> {
  InputDB inputDB;
  String saturday;
  final format = DateFormat("hh:mm a");
  bool coaching  = false;
  Dog dog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup'),
      ),
      body: ListView(
        children: <Widget>[
          // SchoolStart(),
          // SchoolEnd(),
          // WakeTime(),
          // WakeTimeHolidays(),
          // SaturdaySchoolEnd(),
          // Coaching(),
          // CoachingStartWeekday(),
          // CoachingEndWeekday(),
          // CoachingStartSaturday(),
          // CoachingEndSaturday(),
          // CoachingStartSunday(),
          // CoachingEndSunday(),
          // SaturdayOff(),
          // Night(),
          Column(children: <Widget>[
            Text(
              'What time do you leave for school? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                print (time);
                return DateTimeField.convert(time);
                  dog.ssh = time.hour;
                dog.ssm = time.minute;
              },
            ),
            SizedBox(height: 24),
          ]),
          Column(children: <Widget>[
            Text(
              'When do you come back from school? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                dog.seh = time.hour;
                dog.sem = time.minute;
                return DateTimeField.convert(time);
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'What time do you wake up regularly? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                dog.wth = time.hour;
                dog.wtm = time.minute;
                return DateTimeField.convert(time);
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'What time do you come back from school on Saturday? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                dog.sseh = time.hour;
                dog.sseh = time.minute;
                return DateTimeField.convert(time);
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'When do you leave for coaching on weekdays? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                dog.cswdh = time.hour;
                dog.cswdm = time.minute;
                return DateTimeField.convert(time);
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'When do you come back from coaching classes on weekdays? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                dog.cewdh = time.hour;
                dog.cewdm = time.minute;
                return DateTimeField.convert(time);
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text('Do you attend coaching classes?'),
                value: coaching,
                onChanged: (value) {
                  setState(() {
                    coaching = value;
                    print('perrinia');
                    print(value);
                    dog.c = coaching;
                  });
                },
              ),
              SizedBox(height: 24),
            ],
          ),
          Column(children: <Widget>[
            Text(
              'When do you leave for coaching on saturdays? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
                dog.cssh = time.hour;
                dog.cssm = time.minute;
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'When do you come back from coaching classes on saturdays? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
                dog.cesh = time.hour;
                dog.cesm = time.minute;
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'When do you leave for coaching on Sunday? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
                dog.cssh = time.hour;
                dog.cssm = time.hour;
              },
            ),
            SizedBox(height: 24),
          ]),
          Column(children: <Widget>[
            Text(
              'When do you come back from coaching classes on Sunday? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
                dog.cssuh = time.hour;
                dog.cssum = time.minute;
              },
            ),
            SizedBox(height: 24),
          ]),

          Column(children: <Widget>[
            Text(
              'What time do you wake up on holidays? (${format.pattern})',
              textAlign: TextAlign.left,
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
                dog.wthh = time.hour;
                dog.wthm = time.minute;
              },
            ),
            SizedBox(height: 24),
          ]),
          Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text(
                    'Do you prefer studying late in the night, rather than get up early?'),
                value: coaching,
                onChanged: (value) {
                  setState(() {
                    coaching = value;
                    dog.n = coaching;
                  });
                },
              ),
              SizedBox(height: 24),
            ],
          ),

          Column(children: <Widget>[
            TextFormField(
              onChanged: (value) {
                saturday = value;
                dog.sh = int.parse(saturday);
              },
              decoration: InputDecoration(
                  hintText: 'Which Saturday is a holiday for you?'),
            ),
            SizedBox(height: 24),
            TextFormField(
              onChanged: (value) {
                String gr = value;
                dog.g = int.parse(gr);
              },
              decoration:
                  InputDecoration(hintText: 'Which grade are u studying in?'),
            ),
            SizedBox(height: 24),
          ]),
          RaisedButton(
            child: Text('Next'),
            onPressed: () {
              inputDB.insertNote(dog);
            },
          )
        ],
      ),
    );
  }
}
