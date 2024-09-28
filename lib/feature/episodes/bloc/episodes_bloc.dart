import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/episode.dart';
import 'package:rick_and_morty/core/domain/entity/episode_page.dart';
import 'package:rick_and_morty/core/domain/usecase/get_episodes_use_case.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

final class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc(this._getEpisodesUseCase) : super(const EpisodesState([], null, null)) {
    on<FetchEpisodesEvent>(_onFetchEpisodes);
  }

  final GetEpisodesUseCase _getEpisodesUseCase;

  Future<void> _onFetchEpisodes(FetchEpisodesEvent event, Emitter<EpisodesState> emit) async {
    final pageKey = event.pageKey;
    final response = await _getEpisodesUseCase(GetEpisodesArgs(page: pageKey));
    switch (response) {
      case Success<EpisodePage>():
        emit(
          EpisodesState(
            [...state.itemList, ...response.data.episodes],
            null,
            response.data.dataInfo.totalPageCount == pageKey ? null : pageKey + 1,
          ),
        );

      case Error<EpisodePage>():
        emit(state.copyWith(error: response.message));
    }
  }
}
