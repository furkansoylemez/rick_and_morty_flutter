part of 'locations_bloc.dart';

final class LocationsState extends Equatable {
  const LocationsState(this.itemList, this.error, this.nextPageKey);

  final List<Location> itemList;
  final dynamic error;
  final int? nextPageKey;

  @override
  List<Object?> get props => [itemList, error, nextPageKey];

  LocationsState copyWith({List<Location>? itemList, dynamic error, int? nextPageKey}) {
    return LocationsState(itemList ?? this.itemList, error ?? this.error, nextPageKey ?? this.nextPageKey);
  }
}
