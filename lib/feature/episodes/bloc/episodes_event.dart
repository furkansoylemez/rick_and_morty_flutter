part of 'episodes_bloc.dart';

sealed class EpisodesEvent extends Equatable {
  const EpisodesEvent();

  @override
  List<Object> get props => [];
}

final class FetchEpisodesEvent extends EpisodesEvent {
  const FetchEpisodesEvent(this.pageKey);

  final int pageKey;

  @override
  List<Object> get props => [pageKey];
}
