import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';
import 'package:rick_and_morty/core/domain/entity/data_info.dart';

final class CharacterPage extends Equatable {
  const CharacterPage({
    required this.dataInfo,
    required this.characters,
  });
  final DataInfo dataInfo;
  final List<Character> characters;

  @override
  List<Object?> get props => [characters, dataInfo];
}
