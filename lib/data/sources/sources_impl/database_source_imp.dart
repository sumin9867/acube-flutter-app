import 'package:gpspro/data/sources/database_source.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: DatabaseSource)
class DatabaseSourceImp implements DatabaseSource {
  DatabaseSourceImp();

  late Database database;

  @override
  Future<void> openDb({
    required String tableName,
    OnDatabaseCreateFn? onCreate,
  }) async {
    database = await openDatabase(
      '$tableName/${DatabaseSourceKeys.dbName}',
      version: 1,
      onCreate: onCreate,
    );
  }

  @override
  Future<void> closeDb() {
    return database.close();
  }

  @override
  Future<void> deleteDb(String table) {
    return database.delete(table);
  }

  @override
  Future<void> insert(String table, Map<String, Object?> data) {
    return database.insert(table, data);
  }

  @override
  Future<void> update(
    String table,
    Map<String, dynamic> data, {
    String? where,
    List<Object?>? whereArgs,
  }) {
    return database.update(table, data);
  }

  @override
  Future<void> delete(String table) {
    return database.delete(table);
  }

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) async {
    return database.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    return database.execute(sql, arguments);
  }

  @override
  Batch batch() {
    return database.batch();
  }
}
