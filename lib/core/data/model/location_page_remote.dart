import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/data/model/info_remote.dart';
import 'package:rick_and_morty/core/data/model/location_remote.dart';
import 'package:rick_and_morty/core/domain/entity/location_page.dart';

part 'location_page_remote.g.dart';

@JsonSerializable()
final class LocationPageRemote {
  LocationPageRemote({
    required this.info,
    required this.results,
  });

  factory LocationPageRemote.fromJson(Map<String, dynamic> json) => _$LocationPageRemoteFromJson(json);
  final InfoRemote info;
  final List<LocationRemote> results;
}

extension LocationPageMapper on LocationPageRemote {
  LocationPage toDomain() {
    return LocationPage(
      dataInfo: info.toDomain(),
      locations: results.map((location) => location.toDomain()).toList(),
    );
  }
}
