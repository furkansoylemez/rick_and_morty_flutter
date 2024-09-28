import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/data/model/episode_remote.dart';
import 'package:rick_and_morty/core/data/model/info_remote.dart';
import 'package:rick_and_morty/core/domain/entity/episode_page.dart';

part 'episode_page_remote.g.dart';

@JsonSerializable()
final class EpisodePageRemote {
  EpisodePageRemote({
    required this.info,
    required this.results,
  });

  factory EpisodePageRemote.fromJson(Map<String, dynamic> json) => _$EpisodePageRemoteFromJson(json);
  final InfoRemote info;
  final List<EpisodeRemote> results;
}

extension EpisodePageMapper on EpisodePageRemote {
  EpisodePage toDomain() {
    return EpisodePage(
      dataInfo: info.toDomain(),
      episodes: results.map((episode) => episode.toDomain()).toList(),
    );
  }
}
