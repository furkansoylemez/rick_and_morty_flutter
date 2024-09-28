import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/domain/entity/location_page.dart';

abstract interface class LocationsRepository {
  Future<DataResult<LocationPage>> getLocations(int page);
}
