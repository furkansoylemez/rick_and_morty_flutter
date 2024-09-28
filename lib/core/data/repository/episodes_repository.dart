import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/episode_page.dart';

abstract interface class EpisodesRepository {
  Future<DataResult<EpisodePage>> getEpisodes(int page);
}
