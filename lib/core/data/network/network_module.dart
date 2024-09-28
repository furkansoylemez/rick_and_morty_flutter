import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/data/network/rick_and_morty_service.dart';
import 'package:rick_and_morty/core/di/base_module.dart';

final class NetworkModule implements BaseModule {
  const NetworkModule();

  @override
  void configure(GetIt getIt) {
    getIt
      ..registerLazySingleton(Dio.new)
      ..registerLazySingleton(
        () => RickAndMortyService(getIt()),
      );
  }
}
