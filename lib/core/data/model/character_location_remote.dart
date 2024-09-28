import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/domain/entity/character_location.dart';

part 'character_location_remote.g.dart';

@JsonSerializable()
final class CharacterLocationRemote {
  CharacterLocationRemote({
    required this.name,
    required this.url,
  });

  factory CharacterLocationRemote.fromJson(Map<String, dynamic> json) => _$CharacterLocationRemoteFromJson(json);
  final String name;
  final String url;
}

extension CharacterLocationMapper on CharacterLocationRemote {
  CharacterLocation toDomain() {
    return CharacterLocation(
      name: name,
      url: url,
    );
  }
}
