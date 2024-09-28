import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';
import 'package:rick_and_morty/core/domain/entity/character_page.dart';
import 'package:rick_and_morty/core/domain/usecase/get_characters_use_case.dart';

part 'characters_event.dart';
part 'characters_state.dart';

final class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this._getCharactersUseCase) : super(const CharactersState([], null, null)) {
    on<FetchCharactersEvent>(_onFetchCharacters);
  }

  final GetCharactersUseCase _getCharactersUseCase;

  Future<void> _onFetchCharacters(FetchCharactersEvent event, Emitter<CharactersState> emit) async {
    final pageKey = event.pageKey;
    final response = await _getCharactersUseCase(GetCharactersArgs(page: pageKey));
    switch (response) {
      case Success<CharacterPage>():
        emit(
          CharactersState(
            [...state.itemList, ...response.data.characters],
            null,
            response.data.dataInfo.totalPageCount == pageKey ? null : pageKey + 1,
          ),
        );

      case Error<CharacterPage>():
        emit(state.copyWith(error: response.message));
    }
  }
}
