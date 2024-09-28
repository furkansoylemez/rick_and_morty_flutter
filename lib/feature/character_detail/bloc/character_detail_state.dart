part of 'character_detail_bloc.dart';

sealed class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailInitial extends CharacterDetailState {}

final class CharacterDetailLoading extends CharacterDetailState {}

final class CharacterDetailSuccess extends CharacterDetailState {
  const CharacterDetailSuccess({required this.character});

  final Character character;
  @override
  List<Object> get props => [character];
}

final class CharacterDetailError extends CharacterDetailState {
  const CharacterDetailError({required this.error});

  final Error<Character> error;

  @override
  List<Object> get props => [error];
}
