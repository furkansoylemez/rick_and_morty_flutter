import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/core/domain/usecase/get_character_use_case.dart';
import 'package:rick_and_morty/core/domain/usecase/get_characters_use_case.dart';
import 'package:rick_and_morty/core/domain/usecase/get_episodes_use_case.dart';
import 'package:rick_and_morty/core/domain/usecase/get_locations_use_case.dart';

final class UseCaseModule implements BaseModule {
  const UseCaseModule();

  @override
  void configure(GetIt getIt) {
    getIt
      ..registerLazySingleton(
        () => GetCharactersUseCase(charactersRepository: getIt()),
      )
      ..registerLazySingleton(
        () => GetCharacterUseCase(charactersRepository: getIt()),
      )
      ..registerLazySingleton(
        () => GetLocationsUseCase(locationsRepository: getIt()),
      )
      ..registerLazySingleton(
        () => GetEpisodesUseCase(episodesRepository: getIt()),
      );
  }
}
