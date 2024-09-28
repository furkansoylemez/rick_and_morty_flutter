import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/datasource/episodes_remote_data_source.dart';
import 'package:rick_and_morty/core/data/model/episode_page_remote.dart';
import 'package:rick_and_morty/core/data/repository/episodes_repository.dart';
import 'package:rick_and_morty/core/domain/entity/episode_page.dart';

final class EpisodesDefaultRepository implements EpisodesRepository {
  EpisodesDefaultRepository({required this.episodesRemoteDataSource});

  final EpisodesRemoteDataSource episodesRemoteDataSource;

  @override
  Future<DataResult<EpisodePage>> getEpisodes(int page) async {
    final response = await episodesRemoteDataSource.getEpisodes(page);

    return switch (response) {
      Success() => Success(response.data.toDomain()),
      Error() => Error<EpisodePage>(message: response.message, exception: response.exception),
    };
  }
}
