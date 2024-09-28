import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/domain/entity/episode.dart';

part 'episode_remote.g.dart';

@JsonSerializable()
class EpisodeRemote {
  EpisodeRemote({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeRemote.fromJson(Map<String, dynamic> json) => _$EpisodeRemoteFromJson(json);
  final int id;
  final String name;
  @JsonKey(name: 'air_date')
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;
}

extension EpisodeMapper on EpisodeRemote {
  Episode toDomain() {
    return Episode(
      id: id,
      name: name,
      airDate: airDate,
      episode: episode,
      characters: characters,
      created: created,
    );
  }
}
