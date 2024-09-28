import 'package:rick_and_morty/core/data/datasource/data_source_module.dart';
import 'package:rick_and_morty/core/data/network/network_module.dart';
import 'package:rick_and_morty/core/data/repository/repository_module.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/core/domain/usecase/use_case_module.dart';

final class ServiceLocator {
  const ServiceLocator._privateConstructor();
  static const ServiceLocator instance = ServiceLocator._privateConstructor();

  Future<void> setUp() {
    _setUpCore();

    return getIt.allReady();
  }

  void _setUpCore() {
    const UseCaseModule().configure(getIt);
    const RepositoryModule().configure(getIt);
    const NetworkModule().configure(getIt);
    const DataSourceModule().configure(getIt);
  }
}
