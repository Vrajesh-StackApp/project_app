import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "Student.db";
  static final _databaseVersion = 1;

  static final tableName = "Student";

  static final columnId = '_id';
  static final columnEmail = 'Email';
  static final columnPassword = 'Password';
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _createDatabase();
    return _database;
  }

  _createDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,$columnEmail TEXT NOT NULL,$columnPassword TEXT NOT NULL)');
  }

  Future<int> insert(Map<String, String> row) async {
    final db = await database;
    return await db.insert(tableName, row);
  }

  Future<List<Map>> displayAllData() async {
    final db = await database;
    List<Map> result = await db.query(tableName);
    // List<Map> result = await db.rawQuery("SELECT * FROM $tableName");

    result.forEach((element) {
      print(element);
    });

    return result;
  }

  Future<List<Map>> getEmail(String email) async {
    final db = await database;
    List<Map> result =
        await db.rawQuery("SELECT Email FROM Student WHERE Email='$email'");
    return result;
  }

  Future deleteRecord(int id) async {
    final db = await database;
    await db.delete(tableName, where: '_id = ?', whereArgs: [id]);
  }

  Future updateData(int id, Map<String, String> data) async {
    final db = await database;
    await db.update(tableName, data, where: '_id = ?', whereArgs: [id]);
  }
}
