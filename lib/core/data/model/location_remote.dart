import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/domain/entity/location.dart';

part 'location_remote.g.dart';

@JsonSerializable()
class LocationRemote {
  LocationRemote({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationRemote.fromJson(Map<String, dynamic> json) => _$LocationRemoteFromJson(json);
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;
}

extension LocationMapper on LocationRemote {
  Location toDomain() {
    return Location(
      id: id,
      name: name,
      type: type,
      dimension: dimension,
      residents: residents,
      created: created,
    );
  }
}
