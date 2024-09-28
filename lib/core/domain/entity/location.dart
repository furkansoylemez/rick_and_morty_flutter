import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.created,
  });
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String created;

  @override
  List<Object?> get props => [id, name, type, dimension, residents, created];
}
