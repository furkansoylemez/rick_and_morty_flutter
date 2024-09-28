import 'package:rick_and_morty/core/common/data_result/data_result.dart';
import 'package:rick_and_morty/core/data/repository/locations_repository.dart';
import 'package:rick_and_morty/core/domain/entity/location_page.dart';

final class GetLocationsUseCase {
  GetLocationsUseCase({required this.locationsRepository});

  final LocationsRepository locationsRepository;

  Future<DataResult<LocationPage>> call(GetLocationsArgs args) {
    return locationsRepository.getLocations(args.page);
  }
}

final class GetLocationsArgs {
  GetLocationsArgs({required this.page});

  final int page;
}
