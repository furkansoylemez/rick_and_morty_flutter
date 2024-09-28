import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/character_page.dart';

abstract interface class CharactersRepository {
  Future<DataResult<CharacterPage>> getCharacters(int page);
}
