import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(
    String table,
    Map<String, Object> data,
  ) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDB = await sql.openDatabase(
      path.join(dbPath, 'Places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );

    sqlDB.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
}
