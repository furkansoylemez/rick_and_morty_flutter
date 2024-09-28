import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/datasource/locations_remote_data_source.dart';
import 'package:rick_and_morty/core/data/model/location_page_remote.dart';
import 'package:rick_and_morty/core/data/repository/locations_repository.dart';
import 'package:rick_and_morty/core/domain/entity/location_page.dart';

final class LocationsDefaultRepository implements LocationsRepository {
  LocationsDefaultRepository({required this.locationsRemoteDataSource});

  final LocationsRemoteDataSource locationsRemoteDataSource;

  @override
  Future<DataResult<LocationPage>> getLocations(int page) async {
    final response = await locationsRemoteDataSource.getLocations(page);

    return switch (response) {
      Success() => Success(response.data.toDomain()),
      Error() => Error<LocationPage>(message: response.message, exception: response.exception),
    };
  }
}
