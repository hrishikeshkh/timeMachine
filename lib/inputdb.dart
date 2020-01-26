import './inputs.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class InputDB {
  static InputDB _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;    
	InputDB._createInstance(); // Named constructor to create instance of DatabaseHelper
  factory InputDB() {

		if (_databaseHelper == null) {
			_databaseHelper = InputDB._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

  Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}
  Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'notes.db';

		// Open/create the database at a given path
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return notesDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE Student(ssh INTEGER , ssm INTEGER, '
    'wth INTEGER, wtm INTEGER, wthh INTEGER , wthm INTEGER  , seh INTEGER  sem INTEGER , sseh INTEGER , ssem INTEGER ,  c INTEGER , n INTEGER , csdwh INTEGER , csdwm INTEGER, cssh INTEGER , cssm INTEGER, cesh INTEGER, cesm INTEGER, cssuh INTEGER, cssum INTEGER, sh INTEGER)');
    //TODO : databases
	}

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query('Student');
		return result;
	}


  Future<int> insertNote(Dog note) async {
		Database db = await this.database;
		var result = await db.insert('Student', dog.toMap());
		return result;
	}

}