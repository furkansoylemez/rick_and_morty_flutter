import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/data/datasource/characters_default_remote_data_source.dart';
import 'package:rick_and_morty/core/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/core/data/datasource/episodes_default_remote_data_source.dart';
import 'package:rick_and_morty/core/data/datasource/episodes_remote_data_source.dart';
import 'package:rick_and_morty/core/data/datasource/locations_default_remote_data_source.dart';
import 'package:rick_and_morty/core/data/datasource/locations_remote_data_source.dart';
import 'package:rick_and_morty/core/di/base_module.dart';

final class DataSourceModule implements BaseModule {
  const DataSourceModule();

  @override
  void configure(GetIt getIt) {
    getIt
      ..registerLazySingleton<CharactersRemoteDataSource>(
        () => CharactersDefaultRemoteDataSource(rickAndMortyService: getIt()),
      )
      ..registerLazySingleton<LocationsRemoteDataSource>(
        () => LocationsDefaultRemoteDataSource(rickAndMortyService: getIt()),
      )
      ..registerLazySingleton<EpisodesRemoteDataSource>(
        () => EpisodesDefaultRemoteDataSource(rickAndMortyService: getIt()),
      );
  }
}
