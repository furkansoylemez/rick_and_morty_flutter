import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/domain/entity/character_origin.dart';

part 'character_origin_remote.g.dart';

@JsonSerializable()
final class CharacterOriginRemote {
  CharacterOriginRemote({
    required this.name,
    required this.url,
  });

  factory CharacterOriginRemote.fromJson(Map<String, dynamic> json) => _$CharacterOriginRemoteFromJson(json);
  final String name;
  final String url;
}

extension CharacterOriginMapper on CharacterOriginRemote {
  CharacterOrigin toDomain() {
    return CharacterOrigin(
      name: name,
      url: url,
    );
  }
}
