import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/domain/entity/data_info.dart';

part 'info_remote.g.dart';

@JsonSerializable()
final class InfoRemote {
  InfoRemote({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory InfoRemote.fromJson(Map<String, dynamic> json) => _$InfoRemoteFromJson(json);
  final int count;
  final int pages;
  final String? next;
  final String? prev;
}

extension InfoMapper on InfoRemote {
  DataInfo toDomain() {
    return DataInfo(
      totalCount: count,
      totalPageCount: pages,
    );
  }
}
