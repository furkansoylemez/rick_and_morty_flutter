import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/domain/entity/episode.dart';
import 'package:rick_and_morty/core/widget/icon_text_row.dart';

class EpisodeListItem extends StatelessWidget {
  const EpisodeListItem({required this.episode, super.key});
  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              episode.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.calendar_today,
              iconColor: Colors.blueAccent,
              text: episode.airDate,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.tv,
              iconColor: Colors.purpleAccent,
              text: episode.episode,
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.people,
              iconColor: Colors.green,
              text: episode.characters.length.toString(),
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.timer,
              iconColor: Colors.redAccent,
              text: episode.created,
            ),
          ],
        ),
      ),
    );
  }
}
