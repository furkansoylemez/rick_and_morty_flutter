import 'package:equatable/equatable.dart';

final class CharacterLocation extends Equatable {
  const CharacterLocation({
    required this.name,
    required this.url,
  });
  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
