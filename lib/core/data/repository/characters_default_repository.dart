import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/core/data/model/character_page_remote.dart';
import 'package:rick_and_morty/core/data/repository/characters_repository.dart';
import 'package:rick_and_morty/core/domain/entity/character_page.dart';

final class CharactersDefaultRepository implements CharactersRepository {
  CharactersDefaultRepository({required this.charactersRemoteDataSource});

  final CharactersRemoteDataSource charactersRemoteDataSource;

  @override
  Future<DataResult<CharacterPage>> getCharacters(int page) async {
    final response = await charactersRemoteDataSource.getCharacters(page);

    return switch (response) {
      Success() => Success(response.data.toDomain()),
      Error() => Error<CharacterPage>(message: response.message, exception: response.exception),
    };
  }
}
