import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/domain/entity/character_location.dart';
import 'package:rick_and_morty/core/domain/entity/character_origin.dart';

final class Character extends Equatable {
  const Character({
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
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOrigin origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}
