import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/data/model/character_location_remote.dart';
import 'package:rick_and_morty/core/data/model/character_origin_remote.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';

part 'character_remote.g.dart';

@JsonSerializable()
final class CharacterRemote {
  CharacterRemote({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterRemote.fromJson(Map<String, dynamic> json) => _$CharacterRemoteFromJson(json);
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOriginRemote origin;
  final CharacterLocationRemote location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;
}

extension CharacterMapper on CharacterRemote {
  Character toDomain() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toDomain(),
      location: location.toDomain(),
      image: image,
      episode: episode,
      url: url,
      created: created,
    );
  }
}
