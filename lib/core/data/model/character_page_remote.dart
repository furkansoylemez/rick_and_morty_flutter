import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/data/model/character_remote.dart';
import 'package:rick_and_morty/core/data/model/info_remote.dart';
import 'package:rick_and_morty/core/domain/entity/character_page.dart';

part 'character_page_remote.g.dart';

@JsonSerializable()
final class CharacterPageRemote {
  CharacterPageRemote({
    required this.info,
    required this.results,
  });

  factory CharacterPageRemote.fromJson(Map<String, dynamic> json) => _$CharacterPageRemoteFromJson(json);
  final InfoRemote info;
  final List<CharacterRemote> results;
}

extension CharacterPageMapper on CharacterPageRemote {
  CharacterPage toDomain() {
    return CharacterPage(
      dataInfo: info.toDomain(),
      characters: results.map((character) => character.toDomain()).toList(),
    );
  }
}
