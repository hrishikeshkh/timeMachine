import 'package:beta_time_machine/addfeature/editschedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Predictions extends StatefulWidget {
  int _class = 11;
  bool coaching = true;
  int avmks = 90;
  // TODO: create times
  List<DateTime> schoolTiming = [];
  List<DateTime> schoolTiming_saturday = [];
  List<DateTime> coachingTiming_weekday = [];
  List<DateTime> coachingTiming_saturday = [];
  List<DateTime> coachingTiming_sunday = [];
  List<String> coaching_days = [];
  bool night = true;
  int saturday = 3;
  List<String> subjects = [
    'Chemistry',
    'Physics',
    'Maths',
    'Computer Science',
    'Biology',
    'English'
  ];
  static DateTime wakeTime;
  static DateTime wakeTime_holiday;
  int study_min = 0;
  int reqd_study_min = 0;
  //TODO: create function for reqd min

  int returnMinute(prev_min, add_min) {
    if ((prev_min + add_min) >= 60) {
      return (prev_min + add_min - 60);
    } else {
      return (prev_min + add_min);
    }
  }

  int returnHour(prev_min, add_min) {
    if ((prev_min + add_min) >= 60) {
      return (1);
    } else {
      return (0);
    }
  }

  int subtract(currentHour, currentMinutes, targetHour, targetMinutes) {
    DateTime a = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, targetHour, targetMinutes);
    DateTime b = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, currentHour, currentMinutes);
    return (a.difference(b).inMinutes);
  }
  List<List<dynamic>> schedule = [];
  //TODO : input waketime
  void assignTime_weekday_coaching(_class, coaching, avmks, schoolTiming, coachingTiming_weekday, night, subjects) {
    if (coaching){
      schedule.add([wakeTime.hour, wakeTime.minute, 'Wake up']);
      if (night == false) {
        schedule.add([
          (schoolTiming[0] - wakeTime).hour,
          (schoolTiming[0] - wakeTime).minute,
          'Extra Study'
        ]);
        study_min = study_min +
            subtract(wakeTime.hour, wakeTime.minute, schoolTiming[0].hour,
                schoolTiming[0].minute);
      }
      schedule
          .add([schoolTiming[0].hour, schoolTiming[0].minute, 'School begins']);
      schedule.add([schoolTiming[1].hour, schoolTiming[1].minute, 'School ends']);
      schedule
          .add([schoolTiming[1].hour, schoolTiming[1].minute, 'Eat/daily task']);
      if ((coachingTiming_weekday[0] - schoolTiming[1]).hour > 1) {
        schedule.add([
          schedule[schedule.length - 1][0].hour +
              returnHour(schoolTiming[1].minute, 30),
          returnMinute(schoolTiming[1].minute, 30),
          'Revise School work'
        ]);
        study_min += 30;
        String x = subjects[0];
        schedule.add([
          schedule[schedule.length - 1][0].hour +
              returnHour(schedule[schedule.length - 1][0], 30),
          returnMinute(schedule[schedule.length - 1][0], 30),
          'Study $x'
        ]);
        study_min += subtract(
            schedule[schedule.length - 1][0],
            schedule[schedule.length - 1][1],
            coachingTiming_weekday[0].hour,
            coachingTiming_weekday[0].minute);
      } else {
        schedule.add([
          schedule[schedule.length - 1][0].hour +
              returnHour(schoolTiming[1].minute, 30),
          returnMinute(schoolTiming[1].minute, 30),
          'Excercise'
        ]);
      }
      schedule.add([
        coachingTiming_weekday[0].hour,
        coachingTiming_weekday[1].minute,
        'Leave for coaching class'
      ]);
      schedule.add([
        coachingTiming_weekday[1].hour,
        coachingTiming_weekday[1].minute,
        'Come home from coaching'
      ]);
      if (subtract(coachingTiming_weekday[1].hour,
              coachingTiming_weekday[1].minute, 21, 00) >=
          30) {
        schedule.add([
          coachingTiming_weekday[1].hour,
          coachingTiming_weekday[1].minute,
          'Revise Coaching class work'
        ]);
        study_min += subtract(coachingTiming_weekday[1].hour,
            coachingTiming_weekday[1].minute, 21, 00);
      }
      schedule.add([21, 00, 'Eat Dinner']);
      schedule.add([21, 20, 'Relax, Take a break, Have a kit kat']);
      if (night && study_min < reqd_study_min) {
        schedule.add([22, 00, 'Study!!']);
        schedule.add([
          22 + (reqd_study_min - study_min) ~/ 60,
          (reqd_study_min - study_min) % 60,
          'Sleep'
        ]);
      }
    }
    else{
      schedule.add([wakeTime.hour, wakeTime.minute, 'Wake up']);
      if (night == false) {
        schedule.add([
          (schoolTiming[0] - wakeTime).hour,
          (schoolTiming[0] - wakeTime).minute,
          'Extra Study'
        ]);
        study_min = study_min +
            subtract(wakeTime.hour, wakeTime.minute, schoolTiming[0].hour,
                schoolTiming[0].minute);
      }
      schedule
          .add([schoolTiming[0].hour, schoolTiming[0].minute, 'School begins']);
      schedule.add([schoolTiming[1].hour, schoolTiming[1].minute, 'School ends']);
      schedule
          .add([schoolTiming[1].hour, schoolTiming[1].minute, 'Eat/daily task']);
      schedule.add([
        schoolTiming[1].hour + returnHour(schoolTiming[1].minute, 30),
        returnMinute(schoolTiming[1].minute, 30),
        'Revise School Work'
      ]);
      study_min += 30;
      schedule.add([
        schoolTiming[1].hour + returnHour(schoolTiming[1].minute, 60),
        returnMinute(schoolTiming[1].minute, 60),
        'Excercise'
      ]);
      schedule.add([
        returnHour(schedule[schedule.length - 1][1], 60),
        returnMinute(schedule[schedule.length - 1][1], 60),
        'Take a break'
      ]);
      schedule.add([
        returnHour(schedule[schedule.length - 1][1], 30),
        returnMinute(schedule[schedule.length - 1][1], 30),
        'Homework lol'
      ]);
      study_min += 30;
      schedule.add([
        returnHour(schedule[schedule.length - 1][1], 30),
        returnMinute(schedule[schedule.length - 1][1], 30),
        'Study!!'
      ]);
      study_min += 120;
      //TODO:sort out subject priorities
      schedule.add([21, 00, 'Eat Dinner']);
      schedule.add([21, 20, 'Free Time']);  
    }
  }

  void assignTime_weekday_noncoaching(_class, coaching, avmks, schoolTiming,
      coachingTiming_weekday, night, subjects) {
    schedule.add([wakeTime.hour, wakeTime.minute, 'Wake up']);
    if (night == false) {
      schedule.add([
        (schoolTiming[0] - wakeTime).hour,
        (schoolTiming[0] - wakeTime).minute,
        'Extra Study'
      ]);
      study_min = study_min +
          subtract(wakeTime.hour, wakeTime.minute, schoolTiming[0].hour,
              schoolTiming[0].minute);
    }
    schedule
        .add([schoolTiming[0].hour, schoolTiming[0].minute, 'School begins']);
    schedule.add([schoolTiming[1].hour, schoolTiming[1].minute, 'School ends']);
    schedule
        .add([schoolTiming[1].hour, schoolTiming[1].minute, 'Eat/daily task']);
    schedule.add([
      schoolTiming[1].hour + returnHour(schoolTiming[1].minute, 30),
      returnMinute(schoolTiming[1].minute, 30),
      'Revise School Work'
    ]);
    study_min += 30;
    schedule.add([
      schoolTiming[1].hour + returnHour(schoolTiming[1].minute, 60),
      returnMinute(schoolTiming[1].minute, 60),
      'Excercise'
    ]);
    schedule.add([
      returnHour(schedule[schedule.length - 1][1], 60),
      returnMinute(schedule[schedule.length - 1][1], 60),
      'Take a break'
    ]);
    schedule.add([
      returnHour(schedule[schedule.length - 1][1], 30),
      returnMinute(schedule[schedule.length - 1][1], 30),
      'Homework lol'
    ]);
    study_min += 30;
    schedule.add([
      returnHour(schedule[schedule.length - 1][1], 30),
      returnMinute(schedule[schedule.length - 1][1], 30),
      'Study!!'
    ]);
    study_min += 120;
    //TODO:sort out subject priorities
    schedule.add([21, 00, 'Eat Dinner']);
    schedule.add([21, 20, 'Free Time']);
  }

  void assignTime_saturday(date) {
    if (date > (saturday - 1) * 7 && date < (saturday) * 7) {
      //holiday
      schedule.add([wakeTime_holiday.hour, wakeTime_holiday.minute, 'Wake up']);
      schedule.add([
        wakeTime_holiday.hour,
        wakeTime_holiday.minute,
        'Daily acitivities, breakfast'
      ]);
      if (coaching) {   
        //TODO: input days of the week for coaching
        if (coachingTiming_saturday[0].hour < 12) {
          if (subtract(
                  schedule[schedule.length - 1][0] +
                      returnHour(schedule[schedule.length - 1][1], 60),
                  schedule[schedule.length - 1][0] +
                      returnMinute(schedule[schedule.length - 1][1], 60),
                  coachingTiming_saturday[0].hour,
                  coachingTiming_saturday[0].minute) >=
              30) {
            schedule.add([
              schedule[schedule.length - 1][0] +
                  returnHour(schedule[schedule.length - 1][1], 60),
              schedule[schedule.length - 1][0] +
                  returnMinute(schedule[schedule.length - 1][1], 60),
              'Study'
            ]);
            study_min += subtract(
                schedule[schedule.length - 1][0] +
                    returnHour(schedule[schedule.length - 1][1], 60),
                schedule[schedule.length - 1][0] +
                    returnMinute(schedule[schedule.length - 1][1], 60),
                coachingTiming_saturday[0].hour,
                coachingTiming_saturday[0].minute);
          }
          schedule.add([
            coachingTiming_saturday[0].hour,
            coachingTiming_saturday[0].minute,
            'Leave for coaching class'
          ]);
          schedule.add([
            coachingTiming_saturday[1].hour,
            coachingTiming_saturday[1].minute,
            'Coaching class ends'
          ]);
          schedule.add([
            coachingTiming_saturday[1].hour,
            coachingTiming_saturday[1].minute,
            'Take a break'
          ]);
          schedule.add([14, 00, 'Lunch']);
          schedule.add([14, 30, 'Revise coaching class work']);
          study_min += 30;
          String x = subjects[0];
          schedule.add([15, 00, 'Study $x']);
          study_min += 60;
          //TODO:Sort subject priorities
          schedule.add([16, 00, 'Excercise']);
          x = subjects[1];
          schedule.add([17, 00, 'Study $x']);
          study_min += 120;
          schedule.add([18, 30, 'Homework']);
          study_min += 30;
          schedule.add([19, 00, 'Take a break']);
          schedule.add([19, 30, 'Study $x']);
          study_min += 120;
          schedule.add([21, 00, 'Dinner']);
          schedule.add([21, 30, 'Free time']);
          if (study_min < reqd_study_min) {
            schedule.add([22, 00, 'Study']);
            study_min += (reqd_study_min - study_min);
            schedule.add([
              21 + returnHour(00, reqd_study_min - study_min),
              returnMinute(00, reqd_study_min - study_min),
              'Sleep'
            ]);
          } else {
            schedule.add([22, 00, 'Sleep']);
          }
        } else {
          String x = subjects[1];
          schedule.add([
            schedule[schedule.length - 1][0],
            schedule[schedule.length - 1][1],
            'Study $x'
          ]);
          study_min += 90;
          schedule.add([
            schedule[schedule.length - 1][0] +
                1 +
                returnHour(schedule[schedule.length - 1][1], 30),
            returnMinute(schedule[schedule.length - 1][1], 30),
            'Take a break'
          ]);
          x = subjects[0];
          schedule.add([
            schedule[schedule.length - 1][0] +
                returnHour(schedule[schedule.length - 1][1], 30),
            returnMinute(schedule[schedule.length - 1][1], 30),
            'Study $x'
          ]);
          study_min += 60;
          if (subtract(schedule[schedule.length - 2][0] + 1,
                  schedule[schedule.length - 2][1], 14, 00) >=
              60) {
            x = subjects[2];
            schedule.add([
              schedule[schedule.length - 2][0] + 1,
              schedule[schedule.length - 2][1],
              'Study $x'
            ]);
            study_min += subtract(schedule[schedule.length - 2][0] + 1,
                schedule[schedule.length - 2][1], 14, 00);
          } else {
            schedule.add([
              schedule[schedule.length - 2][0] + 1,
              schedule[schedule.length - 2][1],
              'Take a break'
            ]);
          }
          schedule.add([14, 00, 'Lunch']);
          schedule.add([14, 30, 'Homework + School revision']);
          schedule.add([
            coachingTiming_saturday[0].hour,
            coachingTiming_saturday[0].minute,
            'Leave for coaching class'
          ]);
          schedule.add([
            coachingTiming_saturday[1].hour,
            coachingTiming_saturday[1].minute,
            'Coaching class ends'
          ]);
          if (subtract(coachingTiming_saturday[1].hour,
                  coachingTiming_saturday[1].minute, 21, 00) >=
              60) {
            schedule.add([
              coachingTiming_saturday[1].hour,
              coachingTiming_saturday[1].minute,
              'Refresh yourself'
            ]);
            schedule.add([
              coachingTiming_saturday[1].hour +
                  returnHour(coachingTiming_saturday[1].minute, 30),
              returnMinute(coachingTiming_saturday[1].minute, 30),
              'Revise coaching class work'
            ]);
          } else {
            schedule.add([
              coachingTiming_saturday[1].hour,
              coachingTiming_saturday[1].minute,
              'Refresh yourself'
            ]);
          }
          schedule.add([21, 00, 'Dinner']);
          schedule.add([21, 30, 'Free time']);
          if (study_min < reqd_study_min) {
            schedule.add([22, 00, 'Study']);
            study_min += (reqd_study_min - study_min);
            schedule.add([
              21 + returnHour(00, reqd_study_min - study_min),
              returnMinute(00, reqd_study_min - study_min),
              'Sleep'
            ]);
          } else {
            schedule.add([22, 00, 'Sleep']);
          }
        }
      } 
      else {
        String x = subjects[1];
        schedule.add([
          schedule[schedule.length - 1][0],
          schedule[schedule.length - 1][1],
          'Study $x'
        ]);
        study_min += 90;
        schedule.add([
          schedule[schedule.length - 1][0] +
              1 +
              returnHour(schedule[schedule.length - 1][1], 30),
          returnMinute(schedule[schedule.length - 1][1], 30),
          'Take a break'
        ]);
        x = subjects[0];
        schedule.add([
          schedule[schedule.length - 1][0] +
              returnHour(schedule[schedule.length - 1][1], 30),
          returnMinute(schedule[schedule.length - 1][1], 30),
          'Study $x'
        ]);
        study_min += 60;
        if (subtract(schedule[schedule.length - 2][0] + 1,
                schedule[schedule.length - 2][1], 14, 00) >=
            60) {
          x = subjects[2];
          schedule.add([
            schedule[schedule.length - 2][0] + 1,
            schedule[schedule.length - 2][1],
            'Study $x'
          ]);
          study_min += subtract(schedule[schedule.length - 2][0] + 1,
              schedule[schedule.length - 2][1], 14, 00);
        } else {
          schedule.add([
            schedule[schedule.length - 2][0] + 1,
            schedule[schedule.length - 2][1],
            'Take a break'
          ]);
        }
        schedule.add([14, 00, 'Lunch']);
        schedule.add([14, 30, 'Homework + School revision']);
        study_min += 60;
        schedule.add([15, 30, 'Free time']);
        schedule.add([16, 30, 'Excercise']);
        schedule.add([17, 30, 'Eat/Daily activities']);
        x = subjects[3];
        schedule.add([18, 30, 'Study $x']);
        study_min += 30;
        schedule.add([19, 00, 'Take a break']);
        x = subjects[2];
        schedule.add([19, 30, 'Study $x']);
        study_min += 120;
        schedule.add([21, 00, 'Dinner']);
        schedule.add([21, 30, 'Free time']);
        if (study_min < reqd_study_min) {
          schedule.add([22, 00, 'Study']);
          study_min += (reqd_study_min - study_min);
          schedule.add([
            21 + returnHour(00, reqd_study_min - study_min),
            returnMinute(00, reqd_study_min - study_min),
            'Sleep'
          ]);
        } else {
          schedule.add([22, 00, 'Sleep']);
        }
      }
    }
    else {
      schedule.add([wakeTime_holiday.hour, wakeTime_holiday.minute, 'Wake up']);
      schedule.add([
        schoolTiming_saturday[0].hour,
        schoolTiming_saturday[0].minute,
        'Leave for school'
      ]);
      schedule.add([
        schoolTiming_saturday[1].hour,
        schoolTiming_saturday[1].minute,
        'School ends'
      ]);
      schedule.add(
          [schoolTiming[1].hour, schoolTiming[1].minute, 'Eat/daily task']);
      if (subtract(
              coachingTiming_saturday[0].hour,
              coachingTiming_saturday[0].minute,
              schoolTiming[1].hour,
              schoolTiming[1].minute) >
          1) {
        schedule.add([
          schedule[schedule.length - 1][0].hour +
              returnHour(schoolTiming[1].minute, 30),
          returnMinute(schoolTiming[1].minute, 30),
          'Revise School work'
        ]);
        study_min += 30;
        String x = subjects[0];
        schedule.add([
          schedule[schedule.length - 1][0].hour +
              returnHour(schedule[schedule.length - 1][0], 30),
          returnMinute(schedule[schedule.length - 1][0], 30),
          'Study $x'
        ]);
        study_min += subtract(
            schedule[schedule.length - 1][0],
            schedule[schedule.length - 1][1],
            coachingTiming_saturday[0].hour,
            coachingTiming_saturday[0].minute);
      } else {
        schedule.add([
          schedule[schedule.length - 1][0].hour +
              returnHour(schoolTiming[1].minute, 30),
          returnMinute(schoolTiming[1].minute, 30),
          'Excercise'
        ]);
      }
      schedule.add([
        coachingTiming_saturday[0].hour,
        coachingTiming_saturday[1].minute,
        'Leave for coaching class'
      ]);
      schedule.add([
        coachingTiming_saturday[1].hour,
        coachingTiming_saturday[1].minute,
        'Come home from coaching'
      ]);
      if (subtract(coachingTiming_saturday[1].hour,
              coachingTiming_saturday[1].minute, 21, 00) >=
          30) {
        schedule.add([
          coachingTiming_saturday[1].hour,
          coachingTiming_saturday[1].minute,
          'Revise Coaching class work'
        ]);
        study_min += subtract(coachingTiming_saturday[1].hour,
            coachingTiming_saturday[1].minute, 21, 00);
        schedule.add([
          schedule[schedule.length - 1][0] +
              returnHour(schedule[schedule.length - 1][1], 30),
          returnMinute(schedule[schedule.length - 1][1], 30),
          'Study'
        ]);
      }
      schedule.add([21, 00, 'Eat Dinner']);
      schedule.add([21, 20, 'Relax, Take a break, Have a kit kat']);
      if (night && study_min < reqd_study_min) {
        schedule.add([22, 00, 'Study!!']);
        schedule.add([
          22 + (reqd_study_min - study_min) ~/ 60,
          (reqd_study_min - study_min) % 60,
          'Sleep'
        ]);
      }
    }
  }

  void assignTime_sunday() {
    schedule.add([wakeTime_holiday.hour, wakeTime_holiday.minute, 'Wake up']);
      schedule.add([
        wakeTime_holiday.hour,
        wakeTime_holiday.minute,
        'Daily acitivities, breakfast'
      ]);
      if (coaching) {   
        //TODO: input days of the week for coaching
        if (coachingTiming_sunday[0].hour < 12) {
          if (subtract(
                  schedule[schedule.length - 1][0] +
                      returnHour(schedule[schedule.length - 1][1], 60),
                  schedule[schedule.length - 1][0] +
                      returnMinute(schedule[schedule.length - 1][1], 60),
                  coachingTiming_sunday[0].hour,
                  coachingTiming_sunday[0].minute) >=
              30) {
            schedule.add([
              schedule[schedule.length - 1][0] +
                  returnHour(schedule[schedule.length - 1][1], 60),
              schedule[schedule.length - 1][0] +
                  returnMinute(schedule[schedule.length - 1][1], 60),
              'Study'
            ]);
            study_min += subtract(
                schedule[schedule.length - 1][0] +
                    returnHour(schedule[schedule.length - 1][1], 60),
                schedule[schedule.length - 1][0] +
                    returnMinute(schedule[schedule.length - 1][1], 60),
                coachingTiming_sunday[0].hour,
                coachingTiming_sunday[0].minute);
          }
          schedule.add([
            coachingTiming_sunday[0].hour,
            coachingTiming_sunday[0].minute,
            'Leave for coaching class'
          ]);
          schedule.add([
            coachingTiming_sunday[1].hour,
            coachingTiming_sunday[1].minute,
            'Coaching class ends'
          ]);
          schedule.add([
            coachingTiming_sunday[1].hour,
            coachingTiming_sunday[1].minute,
            'Take a break'
          ]);
          schedule.add([14, 00, 'Lunch']);
          schedule.add([14, 30, 'Revise coaching class work']);
          study_min += 30;
          String x = subjects[0];
          schedule.add([15, 00, 'Study $x']);
          study_min += 60;
          //TODO:Sort subject priorities
          schedule.add([16, 00, 'Excercise']);
          x = subjects[1];
          schedule.add([17, 00, 'Study $x']);
          study_min += 120;
          schedule.add([18, 30, 'Homework']);
          study_min += 30;
          schedule.add([19, 00, 'Take a break']);
          schedule.add([19, 30, 'Study $x']);
          study_min += 120;
          schedule.add([21, 00, 'Dinner']);
          schedule.add([21, 30, 'Free time']);
          if (study_min < reqd_study_min) {
            schedule.add([22, 00, 'Study']);
            study_min += (reqd_study_min - study_min);
            schedule.add([
              21 + returnHour(00, reqd_study_min - study_min),
              returnMinute(00, reqd_study_min - study_min),
              'Sleep'
            ]);
          } else {
            schedule.add([22, 00, 'Sleep']);
          }
        } else {
          String x = subjects[1];
          schedule.add([
            schedule[schedule.length - 1][0],
            schedule[schedule.length - 1][1],
            'Study $x'
          ]);
          study_min += 90;
          schedule.add([
            schedule[schedule.length - 1][0] +
                1 +
                returnHour(schedule[schedule.length - 1][1], 30),
            returnMinute(schedule[schedule.length - 1][1], 30),
            'Take a break'
          ]);
          x = subjects[0];
          schedule.add([
            schedule[schedule.length - 1][0] +
                returnHour(schedule[schedule.length - 1][1], 30),
            returnMinute(schedule[schedule.length - 1][1], 30),
            'Study $x'
          ]);
          study_min += 60;
          if (subtract(schedule[schedule.length - 2][0] + 1,
                  schedule[schedule.length - 2][1], 14, 00) >=
              60) {
            x = subjects[2];
            schedule.add([
              schedule[schedule.length - 2][0] + 1,
              schedule[schedule.length - 2][1],
              'Study $x'
            ]);
            study_min += subtract(schedule[schedule.length - 2][0] + 1,
                schedule[schedule.length - 2][1], 14, 00);
          } else {
            schedule.add([
              schedule[schedule.length - 2][0] + 1,
              schedule[schedule.length - 2][1],
              'Take a break'
            ]);
          }
          schedule.add([14, 00, 'Lunch']);
          schedule.add([14, 30, 'Homework + School revision']);
          schedule.add([
            coachingTiming_sunday[0].hour,
            coachingTiming_sunday[0].minute,
            'Leave for coaching class'
          ]);
          schedule.add([
            coachingTiming_sunday[1].hour,
            coachingTiming_sunday[1].minute,
            'Coaching class ends'
          ]);
          if (subtract(coachingTiming_sunday[1].hour,
                  coachingTiming_sunday[1].minute, 21, 00) >=
              60) {
            schedule.add([
              coachingTiming_sunday[1].hour,
              coachingTiming_sunday[1].minute,
              'Refresh yourself'
            ]);
            schedule.add([
              coachingTiming_sunday[1].hour +
                  returnHour(coachingTiming_sunday[1].minute, 30),
              returnMinute(coachingTiming_sunday[1].minute, 30),
              'Revise coaching class work'
            ]);
          } else {
            schedule.add([
              coachingTiming_sunday[1].hour,
              coachingTiming_sunday[1].minute,
              'Refresh yourself'
            ]);
          }
          schedule.add([21, 00, 'Dinner']);
          schedule.add([21, 30, 'Free time']);
          if (study_min < reqd_study_min) {
            schedule.add([22, 00, 'Study']);
            study_min += (reqd_study_min - study_min);
            schedule.add([
              21 + returnHour(00, reqd_study_min - study_min),
              returnMinute(00, reqd_study_min - study_min),
              'Sleep'
            ]);
          } else {
            schedule.add([22, 00, 'Sleep']);
          }
        }
      } 
      else {
        String x = subjects[1];
        schedule.add([
          schedule[schedule.length - 1][0],
          schedule[schedule.length - 1][1],
          'Study $x'
        ]);
        study_min += 90;
        schedule.add([
          schedule[schedule.length - 1][0] +
              1 +
              returnHour(schedule[schedule.length - 1][1], 30),
          returnMinute(schedule[schedule.length - 1][1], 30),
          'Take a break'
        ]);
        x = subjects[0];
        schedule.add([
          schedule[schedule.length - 1][0] +
              returnHour(schedule[schedule.length - 1][1], 30),
          returnMinute(schedule[schedule.length - 1][1], 30),
          'Study $x'
        ]);
        study_min += 60;
        if (subtract(schedule[schedule.length - 2][0] + 1,
                schedule[schedule.length - 2][1], 14, 00) >=
            60) {
          x = subjects[2];
          schedule.add([
            schedule[schedule.length - 2][0] + 1,
            schedule[schedule.length - 2][1],
            'Study $x'
          ]);
          study_min += subtract(schedule[schedule.length - 2][0] + 1,
              schedule[schedule.length - 2][1], 14, 00);
        } else {
          schedule.add([
            schedule[schedule.length - 2][0] + 1,
            schedule[schedule.length - 2][1],
            'Take a break'
          ]);
        }
        schedule.add([14, 00, 'Lunch']);
        schedule.add([14, 30, 'Homework + School revision']);
        study_min += 60;
        schedule.add([15, 30, 'Free time']);
        schedule.add([16, 30, 'Excercise']);
        schedule.add([17, 30, 'Eat/Daily activities']);
        x = subjects[3];
        schedule.add([18, 30, 'Study $x']);
        study_min += 30;
        schedule.add([19, 00, 'Take a break']);
        x = subjects[2];
        schedule.add([19, 30, 'Study $x']);
        study_min += 120;
        schedule.add([21, 00, 'Dinner']);
        schedule.add([21, 30, 'Free time']);
        if (study_min < reqd_study_min) {
          schedule.add([22, 00, 'Study']);
          study_min += (reqd_study_min - study_min);
          schedule.add([
            21 + returnHour(00, reqd_study_min - study_min),
            returnMinute(00, reqd_study_min - study_min),
            'Sleep'
          ]);
        } else {
          schedule.add([22, 00, 'Sleep']);
        }
      }
  }

  List week_tt (){
    List <List<dynamic>> ott;
    List <String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    for (var i = 0; i < 7; i++) {
      ott.add([days[i]]);
      if (i <= 5) {
        if (coaching) {
          bool flag = false;
          for (var j = 0; j<7; j++) {
            if (days[i] == coaching_days[j]) {
              flag = true;
            }
          }
          if (flag) {
          schedule = [];
          assignTime_weekday_coaching(_class, coaching, avmks, schoolTiming, coachingTiming_weekday, night, subjects);
          ott[i][1] = schedule;
        }
        else {
          schedule = [];
          assignTime_weekday_noncoaching(_class, coaching, avmks, schoolTiming, coachingTiming_weekday, night, subjects);
          ott[i][1] = schedule;
        }
        }
        else {
          schedule = [];
          assignTime_weekday_noncoaching(_class, coaching, avmks, schoolTiming, coachingTiming_weekday, night, subjects);
          ott[i][1] = schedule;
        }
      }
      else if (i == 6) {
          int date = DateTime.now().day;
          schedule = [];
          assignTime_saturday(date);
          ott[i][1] = schedule;
      }
      else {
        schedule = [];
        assignTime_sunday();
        ott[i][1] = schedule;
      }
    }
    return ott;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
