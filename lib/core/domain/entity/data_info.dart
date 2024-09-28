import 'package:equatable/equatable.dart';

final class DataInfo extends Equatable {
  const DataInfo({
    required this.totalCount,
    required this.totalPageCount,
  });
  final int totalCount;
  final int totalPageCount;

  @override
  List<Object?> get props => [totalCount, totalPageCount];
}
