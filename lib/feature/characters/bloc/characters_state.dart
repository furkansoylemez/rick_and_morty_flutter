part of 'characters_bloc.dart';

final class CharactersState extends Equatable {
  const CharactersState(this.itemList, this.error, this.nextPageKey);

  final List<Character> itemList;
  final dynamic error;
  final int? nextPageKey;

  @override
  List<Object?> get props => [itemList, error, nextPageKey];

  CharactersState copyWith({List<Character>? itemList, dynamic error, int? nextPageKey}) {
    return CharactersState(itemList ?? this.itemList, error ?? this.error, nextPageKey ?? this.nextPageKey);
  }
}
