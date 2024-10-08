import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.created,
  });
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String created;

  @override
  List<Object?> get props => [id, name, airDate, episode, characters, created];
}
