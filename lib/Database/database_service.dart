import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? database;
  var dbget;
  List dbgetlist = [];
  Future<Database> get databaseget async {
    if (database != null) {
      return database!;
    } else {
      database = await initDatabase();
      return database!;
    }
  }

  Future<Database> initDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'info.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE infotable (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT,mobile TEXT,gender TEXT)');
      },
    );
  }

  Future<void> insertData( String name, String email, String mobile,
      String gender) async {
    final Database db = await databaseget;
    await db.insert('infotable', {
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender
    });
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    Database db = await databaseget;
    dbgetlist = await db.query('infotable');
    dbget = dbgetlist;
    return dbget;
  }

  Future<void> deleteTableContents() async {
    // Open the database
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'info.db');
    final Database db = await openDatabase(path, version: 1);
    // final Database db = await openDatabase();

    // Delete all rows from the table
    await db.delete('infotable');

    // Close the database
    await db.close();
  }
}
