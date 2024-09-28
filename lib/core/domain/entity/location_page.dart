import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/domain/entity/data_info.dart';
import 'package:rick_and_morty/core/domain/entity/location.dart';

final class LocationPage extends Equatable {
  const LocationPage({
    required this.dataInfo,
    required this.locations,
  });
  final DataInfo dataInfo;
  final List<Location> locations;

  @override
  List<Object?> get props => [locations, dataInfo];
}
