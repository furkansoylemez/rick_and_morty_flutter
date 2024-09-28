part of 'character_detail_bloc.dart';

sealed class CharacterDetailEvent extends Equatable {
  const CharacterDetailEvent();

  @override
  List<Object> get props => [];
}

final class FetchCharacterEvent extends CharacterDetailEvent {
  const FetchCharacterEvent({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
