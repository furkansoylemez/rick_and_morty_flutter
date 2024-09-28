import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/repository/characters_repository.dart';
import 'package:rick_and_morty/core/domain/entity/character_page.dart';

final class GetCharactersUseCase {
  GetCharactersUseCase({required this.charactersRepository});

  final CharactersRepository charactersRepository;

  Future<DataResult<CharacterPage>> call(GetCharactersArgs args) {
    return charactersRepository.getCharacters(args.page);
  }
}

final class GetCharactersArgs {
  GetCharactersArgs({required this.page});

  final int page;
}
