part of 'locations_bloc.dart';

sealed class LocationsEvent extends Equatable {
  const LocationsEvent();

  @override
  List<Object> get props => [];
}

final class FetchLocationsEvent extends LocationsEvent {
  const FetchLocationsEvent(this.pageKey);

  final int pageKey;

  @override
  List<Object> get props => [pageKey];
}
