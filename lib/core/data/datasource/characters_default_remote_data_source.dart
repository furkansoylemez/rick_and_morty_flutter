import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/datasource/characters_remote_data_source.dart';
import 'package:rick_and_morty/core/data/model/character_page_remote.dart';
import 'package:rick_and_morty/core/data/network/rick_and_morty_service.dart';
import 'package:rick_and_morty/core/data/network/safe_api_call.dart';

final class CharactersDefaultRemoteDataSource implements CharactersRemoteDataSource {
  CharactersDefaultRemoteDataSource({required this.rickAndMortyService});

  final RickAndMortyService rickAndMortyService;

  @override
  Future<DataResult<CharacterPageRemote>> getCharacters(int page) {
    return safeApiCall(rickAndMortyService.getCharacters(page));
  }
}
