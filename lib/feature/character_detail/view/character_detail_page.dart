import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/feature/character_detail/bloc/character_detail_bloc.dart';

final class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharacterDetailBloc>()..add(FetchCharacterEvent(id: id)),
      child: const _CharacterDetailPage(),
    );
  }
}

final class _CharacterDetailPage extends StatelessWidget {
  const _CharacterDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
          builder: (context, state) {
            return switch (state) {
              CharacterDetailInitial() => const SizedBox.shrink(),
              CharacterDetailLoading() => const CircularProgressIndicator(),
              CharacterDetailSuccess() => Text(state.character.name),
              CharacterDetailError() => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
