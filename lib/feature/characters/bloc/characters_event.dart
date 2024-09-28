part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

final class FetchCharactersEvent extends CharactersEvent {
  const FetchCharactersEvent(this.pageKey);

  final int pageKey;

  @override
  List<Object> get props => [pageKey];
}
