import 'package:equatable/equatable.dart';

final class CharacterOrigin extends Equatable {
  const CharacterOrigin({
    required this.name,
    required this.url,
  });
  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
