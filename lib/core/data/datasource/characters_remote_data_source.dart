import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/model/character_page_remote.dart';
import 'package:rick_and_morty/core/data/model/character_remote.dart';

abstract interface class CharactersRemoteDataSource {
  Future<DataResult<CharacterPageRemote>> getCharacters(int page);
  Future<DataResult<CharacterRemote>> getCharacter(String id);
}
