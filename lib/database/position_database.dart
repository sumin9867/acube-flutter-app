import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpspro/data/sources/database_source.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';

@Singleton()
class PositionDatabase {
  final DatabaseSource databaseSource;

  PositionDatabase(this.databaseSource) {
    _initDatabase();
  }

  final String _columnId = 'vehicleId';
  final String _columnDay = 'day';
  final String _columnPosition = 'position';

  _initDatabase() async {
    await databaseSource.openDb(
      tableName: DatabaseTables.positionDatabase,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE ${DatabaseTables.positionDatabase} (
            $_columnId STRING PRIMARY KEY,
            $_columnDay DATE NOT NULL,
            $_columnPosition TEXT NOT NULL
          )
          ''');
      },
    );
  }

  Future<void> deleteDatabase() async {
    await databaseSource.deleteDb(DatabaseTables.positionDatabase);
  }

  Future<void> storePositions(String vehicleId, List<PositionModel> positions) async {
    try {
      await _initDatabase();
      for (PositionModel position in positions) {
        final result = await databaseSource.query(
          DatabaseTables.positionDatabase,
          where: '$_columnId = ? AND $_columnDay = ?',
          whereArgs: [
            vehicleId,
            Jiffy.parseFromDateTime(position.serverTime.toUtc()).yMd,
          ],
        );
        if (result.isNotEmpty) {
          // update the position
          await databaseSource.update(
            DatabaseTables.positionDatabase,
            {
              _columnPosition: jsonEncode(position.toJson()),
            },
            where: '$_columnId = ? AND $_columnDay = ?',
            whereArgs: [
              vehicleId,
              Jiffy.parseFromDateTime(position.serverTime.toUtc()).yMd,
            ],
          );
        } else {
          // insert the position
          await databaseSource.insert(
            DatabaseTables.positionDatabase,
            {
              _columnId: vehicleId,
              _columnDay: Jiffy.parseFromDateTime(position.serverTime.toUtc()).yMd,
              _columnPosition: jsonEncode(position.toJson()),
            },
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<PositionModel>> getPositions(String vehicleId, DateTimeRange dateTime) async {
    try {
      final List<PositionModel> positions = [];
      await _initDatabase();
      for (var day = dateTime.start; day.isBefore(dateTime.end); day = day.add(const Duration(days: 1))) {
        final result = await databaseSource.query(
          DatabaseTables.positionDatabase,
          where: '$_columnId = ? AND $_columnDay = ?',
          whereArgs: [
            vehicleId,
            Jiffy.parseFromDateTime(day).yMd,
          ],
        );
        if (result.isEmpty) {
          return [];
        } else {
          positions.addAll(
            List<PositionModel>.generate(
              result.length,
              (index) {
                final dataString = result[index][_columnPosition];
                final dataMap = jsonDecode(dataString.toString());
                return PositionModel.fromJson(dataMap as Map<String, dynamic>);
              },
            ),
          );
        }
      }
      return positions;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
