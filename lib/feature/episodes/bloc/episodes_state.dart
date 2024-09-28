part of 'episodes_bloc.dart';

final class EpisodesState extends Equatable {
  const EpisodesState(this.itemList, this.error, this.nextPageKey);

  final List<Episode> itemList;
  final dynamic error;
  final int? nextPageKey;

  @override
  List<Object?> get props => [itemList, error, nextPageKey];

  EpisodesState copyWith({List<Episode>? itemList, dynamic error, int? nextPageKey}) {
    return EpisodesState(itemList ?? this.itemList, error ?? this.error, nextPageKey ?? this.nextPageKey);
  }
}
