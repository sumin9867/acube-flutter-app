import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:gpspro/core/di/get_injectable.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'servicesLocator',
  usesNullSafety: true,
  generateForDir: ['lib'],
)
void configureDependencies() => locator.servicesLocator();
