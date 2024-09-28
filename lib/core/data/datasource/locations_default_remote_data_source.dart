import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/datasource/locations_remote_data_source.dart';
import 'package:rick_and_morty/core/data/model/location_page_remote.dart';
import 'package:rick_and_morty/core/data/network/rick_and_morty_service.dart';
import 'package:rick_and_morty/core/data/network/safe_api_call.dart';

final class LocationsDefaultRemoteDataSource implements LocationsRemoteDataSource {
  LocationsDefaultRemoteDataSource({required this.rickAndMortyService});

  final RickAndMortyService rickAndMortyService;

  @override
  Future<DataResult<LocationPageRemote>> getLocations(int page) {
    return safeApiCall(rickAndMortyService.getLocations(page));
  }
}
