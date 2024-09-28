import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/model/episode_page_remote.dart';

abstract interface class EpisodesRemoteDataSource {
  Future<DataResult<EpisodePageRemote>> getEpisodes(int page);
}
