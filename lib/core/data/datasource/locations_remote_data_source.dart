import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/model/location_page_remote.dart';

abstract interface class LocationsRemoteDataSource {
  Future<DataResult<LocationPageRemote>> getLocations(int page);
}
