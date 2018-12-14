import 'dart:async';
import 'package:quiver/iterables.dart' show zip;
import 'package:path/path.dart';
import 'package:cogasoc_hymnal/database/model.dart';
import 'package:cogasoc_hymnal/database/utils.dart';
import 'package:sqflite/sqflite.dart' show Database, Sqflite, deleteDatabase, getDatabasesPath, openDatabase;


class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableSong = 'songTable';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnWords = 'words';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db!= null){
      return _db;
    }
    _db = await initDb();

    return _db;

  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'songs.db');

    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;

  }
  

  void _onCreate(Database db, int newVersion) async {
    var dict =  new Map.fromIterable(zip([titles, words]).toList(), key: (v) => v[0], value: (v) => v[1]);
    await db.execute('CREATE TABLE $tableSong($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnTitle TEXT, $columnWords TEXT)');
    dict.forEach((k, v) => db.execute('INSERT INTO $tableSong($columnTitle, $columnWords) VALUES ("$k", "$v")'));
  }


  Future<int> saveSong(Song song) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableSong, song.toMap());
    return result;
  }

  Future<List> getAllSongs() async {
    var dbClient = await db;
    var result = await dbClient.query(tableSong, columns: [columnId, columnTitle, columnWords]);
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableSong'));
  }

  Future<Song> getSong(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableSong,
        columns: [columnId, columnTitle, columnWords],
        where: '$columnId = ?',
        whereArgs: [id]);
    //  var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Song.fromMap(result.first);
    }

    return null;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}

