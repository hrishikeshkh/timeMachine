// import 'package:flutter/material.dart';


// class TodoList extends StatefulWidget {
//   @override
//   createState() => new TodoListState();
// }

// class TodoListState extends State<TodoList> {
//   Text txt;
//   List<String> _todoItems = [];
//   List<bool> _ident = [true];
//   String t;
//   String n;
//   void _addTodoItem(String task) {
//     // Only add the task if the user actually entered something
//     Text txt = Text('$n');
//     String val = txt.data;
//     if(task.length > 0) {
//       // Putting our code inside "setState" tells the app that our state has changed, and
//       // it will automatically re-render the list\
//       if (_ident[_ident.length - 1]){
//       setState(() {
//           print (_todoItems);
//           AddAtGenre( t , n);
//           print (_todoItems);
//           print (_todoItems);
//           print (_ident);
//     });
//       }
//       else{
        
//           setState(() => _todoItems.add(task));
//       print (_todoItems);
//       print (_ident);
//         };

//     }
//   }
//   void AddAtGenre (String g ,String v)
//   {
//     setState(() {
//       _todoItems.insert(_findGenre (g) , v);
//     });
//   }

//   void _removeTodoItem(int index) {
//     setState(() => _todoItems.removeAt(index));
//   }

//   void _promptRemoveTodoItem(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return new AlertDialog(
//           title: new Text('Mark "${_todoItems[index]}" as done?'),
//           actions: <Widget>[
//             new FlatButton(
//               child: new Text('CANCEL'),
//               // The alert is actually part of the navigation stack, so to close it, we
//               // need to pop it.
//               onPressed: () => Navigator.of(context).pop()
//             ),
//             new FlatButton(
//               child: new Text('MARK AS DONE'),
//               onPressed: () {
//                 _removeTodoItem(index);
//                 _removeTodoItem(index);
//                 Navigator.of(context).pop();
//               }
//             )
//           ]
//         );
//       }
//     );
//   }

//   // Build the whole list of todo items
//   Widget _buildTodoList() {
//     return new Flexible(
//       child : ListView.builder(
//       itemBuilder: (context, index) {
//         // itemBuilder will be automatically be called as many times as it takes for the
//         // list to fill up its available space, which is most likely more than the
//         // number of todo items we have. So, we need to check the index is OK.
//         if(index < _todoItems.length) {
//           return _buildTodoItem(_todoItems[index], index);
//         }
//       },
//     ));
//   }

//   // Build a single todo item
//   Widget _buildTodoItem(String todoText, int index) {
//     return new ListTile(
//       title: new Text(todoText),
//       onTap: () => _promptRemoveTodoItem(index)
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Colors.yellow.withOpacity(0.2),
//       appBar: new AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: new Text('Todo List')
//       ),
//       body: Column (children : <Widget>[
        
//         Center(
//         child : Row(
//           children: <Widget>[
//             Text(' '),
//          ButtonTheme(
//            minWidth: 200.0,
//            buttonColor: Colors.deepPurple.withOpacity(1),
//          child : new RaisedButton(
//         onPressed: _pushAddTodoScreen,
//         child: new Text ('Add a task' , style : TextStyle(color: Colors.white)),
//       ),),
//       Text(' '),
//       ButtonTheme(
//         minWidth: 200.0,
//         buttonColor: Colors.deepPurple.withOpacity(1),
//         child : RaisedButton(
//           child : Text ('Add a Genre' ,  style : TextStyle(color: Colors.white)),
//           onPressed: (){
//             _pushAddGenreScreen();
//           },
//         )),
//       ],) ),
//       _buildTodoList(),
//       ]
//     ));
//   }

//   void _pushAddTodoScreen() {
//     // of the TextField.
//     setState(() {
//        _ident.add(true);
//     });
//    final myController = TextEditingController();
//    final textController = TextEditingController();
//    final timectrl = TextEditingController();
   
//     // Push this page onto the stack
//     Navigator.of(context).push(
//       // MaterialPageRoute will automatically animate the screen entry, as well as adding
//       // a back button to close it
//       new MaterialPageRoute(
//         builder: (context) {
//           return new Scaffold(
//             backgroundColor: Colors.yellow,
//             appBar: new AppBar(
//               backgroundColor: Colors.deepPurple,
//               title: new Text('Add a new task')
//             ),
//             body: Column (children: <Widget>[     
//               Text(' '),  
//               new TextField(
//               controller: myController,
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Enter something to do...',
//                 contentPadding: const EdgeInsets.all(16.0)
//               ),
//             ),
//             Text('                               '),
//             new TextField(
//               controller: textController,
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Enter the genre this classifies under',
//                 contentPadding: const EdgeInsets.all(16.0)
//               ),
//             ),
//             Text('                               '),
//             new TextField(
//               controller: timectrl,
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Date And Time',
//                 contentPadding: const EdgeInsets.all(16.0)
//               ),
//             ),
//             Text('                               '),
//             ButtonTheme(
//               minWidth: 400.0,
//               buttonColor: Colors.deepPurple,
//               child :RaisedButton(
//               child: Text('Add' , style: TextStyle(color: Colors.white)),
//               onPressed: ()
//               {
//                 setState(() {
//                    _todoItems.insert(_findGenre (textController.text), myController.text);
//                    _todoItems.insert(_findGenre (textController.text) + 1, timectrl.text);
//                    _ident.add(true);
//                 });
//                 Navigator.of(context).pop();
//               },
//             ))
//             ]
//               )
//           );
//         }
//       )
//     );
//   }

//   void _pushAddGenreScreen() {
//     // of the TextField.
//     setState(() {
//       _ident.add(false);
//     }); 
//    final myController = TextEditingController();
//     // Push this page onto the stack
//     Navigator.of(context).push(
//       // MaterialPageRoute will automatically animate the screen entry, as well as adding
//       // a back button to close it
//       new MaterialPageRoute(
//         builder: (context) {
//           return new Scaffold(
//             backgroundColor: Colors.yellow,
//             appBar: new AppBar(
//               backgroundColor: Colors.deepPurple,
//               title: new Text('Add a new genre')
//             ),
//             body: Column (children: <Widget>[
//             Text('                               '),
//               new TextField(
//               controller: myController,
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Go ahead , type your genre',
//                 contentPadding: const EdgeInsets.all(16.0)
//               ),
//             ),
//             Text('                               '),
//             ButtonTheme(
//               minWidth: 400.0,
//               buttonColor: Colors.deepPurple,
//               child : RaisedButton(
//               child: Text('Add' , style : TextStyle(color: Colors.white)),
//               onPressed: ()
//               {
//                 txt = Text(myController.text , style:  TextStyle(color: Colors.white),);
//                 _addTodoItem(myController.text);
//                 Navigator.of(context).pop();
//               },
//             )
//             )
//             ]
//               )
//           );
//         }
//       )
//     );
//   }
//   int _findGenre (String gs){
//       if (!_ident[_ident.length - 1])
//       {
//         return _todoItems.length - 1;
//       }
//       else 
//       {
//         for (int i  = 0; i < _todoItems.length ; i++ )
//         {
//           if (_todoItems[i] == gs)
//           {
//             return i+1;
//           }
//         }
//       }
//   }
// }


import 'package:flutter/material.dart';
import './screens/note_list.dart';
import './screens/note_detail.dart';

class todolist extends StatelessWidget {

	@override
  Widget build(BuildContext context) {

    return MaterialApp(
	    title: 'NoteKeeper',
	    debugShowCheckedModeBanner: false,
	    theme: ThemeData(
		    primarySwatch: Colors.deepPurple
	    ),
	    home: NoteDetail(),
    );
  }
}