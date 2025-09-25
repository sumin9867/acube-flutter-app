import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gpspro/presentation/repository/i_share_repo.dart';
import 'package:gpspro/presentation/repository/i_share_repo_imp.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DiModules {
  @Singleton()
  Dio get dio => Dio();

  @Singleton()
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  @Singleton()
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @Singleton()
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  IShareRepo get shareRepo => ShareRepo();
}
