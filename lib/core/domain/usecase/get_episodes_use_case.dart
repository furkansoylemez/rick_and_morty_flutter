import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/repository/episodes_repository.dart';
import 'package:rick_and_morty/core/domain/entity/episode_page.dart';

final class GetEpisodesUseCase {
  GetEpisodesUseCase({required this.episodesRepository});

  final EpisodesRepository episodesRepository;

  Future<DataResult<EpisodePage>> call(GetEpisodesArgs args) {
    return episodesRepository.getEpisodes(args.page);
  }
}

final class GetEpisodesArgs {
  GetEpisodesArgs({required this.page});

  final int page;
}
