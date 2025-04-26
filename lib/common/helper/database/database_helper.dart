import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
      return _database!;
    }
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "tmdb.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {},
    );
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE popular_movies(
    id INTEGER PRIMARY KEY,
    title TEXT,
    overview TEXT,
    poster_path TEXT,
    backdrop_path TEXT,
    vote_average REAL,
    release_date TEXT
      );
    ''');
    await db.execute('''
  CREATE TABLE now_playing(
    id INTEGER PRIMARY KEY,
    title TEXT,
    overview TEXT,
    poster_path TEXT,
    backdrop_path TEXT,
    vote_average REAL,
    release_date TEXT
  );
''');
    await db.execute('''
      CREATE TABLE recommendation(
    id INTEGER PRIMARY KEY,
    title TEXT,
    overview TEXT,
    poster_path TEXT,
    backdrop_path TEXT,
    vote_average REAL,
    release_date TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE popular_tv(
        id INTEGER PRIMARY KEY,
        name TEXT,
        vote_average REAL,
        poster_path TEXT,
        first_air_date TEXT,
        backdrop_path TEXT,
        overview TEXT
      );
    ''');
  }

  Future<void> insert({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final db = await database;
    try {
      await db.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      print('11111111111133333333333222222222222222');
    } catch (e) {
      print('Error inserting data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> get(
      {required String table, int? id}) async {
    final db = await database;
    try {
      return await db.query(table);
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getWhere(
      {required String table,
      required String where,
      required List<dynamic> whereArgs}) async {
    final db = await database;
    try {
      return await db.query(table, where: where, whereArgs: whereArgs);
    } catch (e) {
      print('Error fetching data with condition: $e');
      return [];
    }
  }
}
