import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';
import 'package:rick_and_morty/core/domain/usecase/get_character_use_case.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

final class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc(this._getCharacterUseCase) : super(CharacterDetailInitial()) {
    on<FetchCharacterEvent>(_onFetchCharacterEvent);
  }

  final GetCharacterUseCase _getCharacterUseCase;

  Future<void> _onFetchCharacterEvent(FetchCharacterEvent event, Emitter<CharacterDetailState> emit) async {
    emit(CharacterDetailLoading());
    final response = await _getCharacterUseCase(GetCharacterArgs(id: event.id));
    switch (response) {
      case Success<Character>():
        emit(CharacterDetailSuccess(character: response.data));
      case Error<Character>():
        emit(CharacterDetailError(error: response));
    }
  }
}
