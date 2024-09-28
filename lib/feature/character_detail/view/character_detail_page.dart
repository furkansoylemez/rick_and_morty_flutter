import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/common/extensions/context_extensions.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';
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
              CharacterDetailSuccess() => _CharacterDetailView(character: state.character),
              CharacterDetailError() => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}

final class _CharacterDetailView extends StatelessWidget {
  const _CharacterDetailView({required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                character.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _SectionTitle(title: context.l10n.character_detail_page_basic_info_title),
          _InfoTile(icon: Icons.person, title: character.name, subtitle: '${character.status} - ${character.species}'),
          _SectionTitle(title: context.l10n.character_detail_page_gender_title),
          _InfoTile(icon: Icons.person_outline, title: character.gender),
          _SectionTitle(title: context.l10n.character_detail_page_origin_title),
          _InfoTile(icon: Icons.location_on, title: character.origin.name),
          _SectionTitle(title: context.l10n.character_detail_page_last_location_title),
          _InfoTile(icon: Icons.location_city, title: character.location.name),
          if (character.type.isNotEmpty) ...[
            _SectionTitle(title: context.l10n.character_detail_page_type_title),
            _InfoTile(icon: Icons.category, title: character.type),
          ],
          _SectionTitle(title: context.l10n.character_detail_page_episodes_title),
          _EpisodeList(episodes: character.episode),
          _SectionTitle(title: context.l10n.character_detail_page_created_title),
          _InfoTile(icon: Icons.calendar_today, title: character.created),
        ],
      ),
    );
  }
}

final class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

final class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    this.subtitle,
  });
  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(color: Colors.grey[700]),
            )
          : null,
    );
  }
}

final class _EpisodeList extends StatelessWidget {
  const _EpisodeList({required this.episodes});
  final List<String> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.tv, color: Colors.blueAccent),
          title: Text(episodes[index]),
        );
      },
    );
  }
}
