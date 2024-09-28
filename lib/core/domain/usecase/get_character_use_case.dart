import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/repository/characters_repository.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';

final class GetCharacterUseCase {
  GetCharacterUseCase({required this.charactersRepository});

  final CharactersRepository charactersRepository;

  Future<DataResult<Character>> call(GetCharacterArgs args) {
    return charactersRepository.getCharacter(args.id);
  }
}

final class GetCharacterArgs {
  GetCharacterArgs({required this.id});

  final String id;
}
