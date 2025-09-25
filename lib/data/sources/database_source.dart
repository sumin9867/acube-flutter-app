import 'package:sqflite/sqflite.dart';

abstract class DatabaseSource {
  Future<void> openDb({
    required String tableName,
    OnDatabaseCreateFn? onCreate,
  });

  Future<void> closeDb();
  Future<void> deleteDb(String table);

  Future<void> insert(String table, Map<String, Object?> data);

  Future<void> update(
    String table,
    Map<String, dynamic> data, {
    String? where,
    List<Object?>? whereArgs,
  });

  Future<void> delete(String table);

  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset});

  Future<void> execute(String sql, [List<Object?>? arguments]);

  Batch batch();
}

class DatabaseSourceKeys {
  static const String dbName = 'trackon.db';
}

class DatabaseTables {
  static const String positionDatabase = 'positionDatabase';
}
