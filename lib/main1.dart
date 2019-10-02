// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import './listes.dart';

// List <String> genre = [];
// List <List<String>> todo = [[]];

// void main ()
// {
// TextEditingController _textFieldController = TextEditingController();

//   runApp(
//     new MaterialApp(
//       title : 'TO - DO',
//       home : TextFeildAlertDialog(),
//     )
//   );
// }
// class TextFeildAlertDialog extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _TextFieldAlertDialog();
//   }

// }


//   class _TextFieldAlertDialog extends State<TextFeildAlertDialog> {
//   TextEditingController _textFieldController = TextEditingController();
//      _displayDialog(BuildContext context) async {
//      return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('TextField in Dialog'),
//             content: TextField(
//               controller: _textFieldController,
//               decoration: InputDecoration(hintText: "TextField in Dialog"),
//             ),
//             actions: <Widget>[
//               new FlatButton(
//                 child : new Text ('Add'),
//                 onPressed: ()
//                 {
//                   setState(() {
//                     genre.add(_textFieldController.text);
//                     Navigator.of(context).pop();
//                     print (genre);
//                   });
//                 },
//               ),
//               new FlatButton(
//                 child: new Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('TO - DO'),
//         ),
//         body: Column(children: <Widget>[
//           Container(
//             margin:  EdgeInsets.all(20.0),
//             child : FloatingActionButton(
//               //child : Text('Add Genre'),
//               child: Icon(Icons.person_add),
//               onPressed: (){
//                  _displayDialog(context);
//               },
//             )
//           ),
//           Column(children: 
//             genre.map((element) => FlatButton(
//               child: Text(element), 
//               onPressed: ()
//               {
//                 //SCSC
//                 return TodoList();
//               },            
//               )).toList(),
//           ),
//         ],),
//       );
//   }
//   }