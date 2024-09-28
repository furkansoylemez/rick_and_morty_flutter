import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/data/repository/characters_default_repository.dart';
import 'package:rick_and_morty/core/data/repository/characters_repository.dart';
import 'package:rick_and_morty/core/data/repository/episodes_default_repository.dart';
import 'package:rick_and_morty/core/data/repository/episodes_repository.dart';
import 'package:rick_and_morty/core/data/repository/locations_default_repository.dart';
import 'package:rick_and_morty/core/data/repository/locations_repository.dart';
import 'package:rick_and_morty/core/di/base_module.dart';

final class RepositoryModule implements BaseModule {
  const RepositoryModule();

  @override
  void configure(GetIt getIt) {
    getIt
      ..registerLazySingleton<CharactersRepository>(
        () => CharactersDefaultRepository(charactersRemoteDataSource: getIt()),
      )
      ..registerLazySingleton<LocationsRepository>(
        () => LocationsDefaultRepository(locationsRemoteDataSource: getIt()),
      )
      ..registerLazySingleton<EpisodesRepository>(
        () => EpisodesDefaultRepository(episodesRemoteDataSource: getIt()),
      );
  }
}
