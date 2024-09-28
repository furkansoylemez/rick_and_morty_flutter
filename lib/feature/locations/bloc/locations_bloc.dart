import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/location.dart';
import 'package:rick_and_morty/core/domain/entity/location_page.dart';
import 'package:rick_and_morty/core/domain/usecase/get_locations_use_case.dart';

part 'locations_event.dart';
part 'locations_state.dart';

final class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc(this._getLocationsUseCase) : super(const LocationsState([], null, null)) {
    on<FetchLocationsEvent>(_onFetchLocations);
  }

  final GetLocationsUseCase _getLocationsUseCase;

  Future<void> _onFetchLocations(FetchLocationsEvent event, Emitter<LocationsState> emit) async {
    final pageKey = event.pageKey;
    final response = await _getLocationsUseCase(GetLocationsArgs(page: pageKey));
    switch (response) {
      case Success<LocationPage>():
        emit(
          LocationsState(
            [...state.itemList, ...response.data.locations],
            null,
            response.data.dataInfo.totalPageCount == pageKey ? null : pageKey + 1,
          ),
        );

      case Error<LocationPage>():
        emit(state.copyWith(error: response.message));
    }
  }
}
