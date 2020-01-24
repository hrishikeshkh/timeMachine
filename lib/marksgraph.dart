import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import './marks_data.dart';
 
//void main() => runApp(HomePage());
 
class HomePagemks extends StatefulWidget {
 @override
 _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePagemks> {
 Widget chartContainer = Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [Text('Chart Viewer')],
 );
 
 @override
 Widget build(BuildContext context) {
      debugShowCheckedModeBanner: false;
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text('MARKS GRAPH'),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Container(
               height: 300,
               child: chartContainer,
             ),
             Padding(
               padding: EdgeInsets.only(top: 10),
               child: Text('Bar Charts'),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 RaisedButton(
                   child: Text('Show marks graph '),
                   onPressed: () {
                     setState(() {
                       chartContainer = SimpleBarChart.withSampleData();
                     });
                   },
                 ),
               ],
             ),
           ],
         ),
       ),
     ),
   );
 }
}
class SimpleBarChart extends StatelessWidget {
 final List<charts.Series> seriesList;
 final bool animate;
 
 SimpleBarChart(this.seriesList, {this.animate});
 
 /// Creates a [BarChart] with sample data and no transition.
 factory SimpleBarChart.withSampleData() {
   return new SimpleBarChart(
     _createSampleData(),
     // Disable animations for image tests.
     animate: false,
     

   );
 }
 
 @override
 Widget build(BuildContext context) {
   return new charts.BarChart(
     seriesList,
     animate: animate,
   );
 }
 
 /// Create one series with sample hard coded data.
 static List<charts.Series<OrdinalMarks, String>> _createSampleData() {
   final data = [
     new OrdinalMarks('MATHS',10),
     new OrdinalMarks('ENGLISH', 5),
     new OrdinalMarks('PHYSICS', 25),
     new OrdinalMarks('CHEMISTRY', 100),
     new OrdinalMarks('BIO/COMP', 75),
   ];
   final data2= [
     new OrdinalMarks('MATHS', 5),
     new OrdinalMarks('ENGLISH', 25),
     new OrdinalMarks('PHYSICS', 100),
     new OrdinalMarks('CHEMISTRY', 75),
     new OrdinalMarks('BIO/COMP',50),
   ];
 
   return [
     new charts.Series<OrdinalMarks, String>(
       id: 'Marks',
       colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
       domainFn: (OrdinalMarks marks, _) => marks.test,
       measureFn: (OrdinalMarks marks, _) => marks.marks,
       data:data
     ),
     new charts.Series<OrdinalMarks, String>(
       id: 'marks',
       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
       domainFn: (OrdinalMarks marks, _) => marks.test,
       measureFn: (OrdinalMarks marks, _) => marks.marks , 
       data:data2
     ),
   
   
 

       
     
   ];
 }
}