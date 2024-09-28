import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/domain/entity/data_info.dart';
import 'package:rick_and_morty/core/domain/entity/episode.dart';

final class EpisodePage extends Equatable {
  const EpisodePage({
    required this.dataInfo,
    required this.episodes,
  });
  final DataInfo dataInfo;
  final List<Episode> episodes;

  @override
  List<Object?> get props => [episodes, dataInfo];
}
