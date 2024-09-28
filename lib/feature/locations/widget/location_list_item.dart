import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/domain/entity/location.dart';
import 'package:rick_and_morty/core/widget/icon_text_row.dart';

class LocationListItem extends StatelessWidget {
  const LocationListItem({required this.location, super.key});
  final Location location;

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
              location.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.public,
              iconColor: Colors.blueAccent,
              text: '${location.type} - ${location.dimension}',
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.people,
              iconColor: Colors.green,
              text: location.residents.length.toString(),
            ),
            const SizedBox(height: 8),
            IconTextRow(
              icon: Icons.calendar_today,
              iconColor: Colors.redAccent,
              text: location.created,
            ),
          ],
        ),
      ),
    );
  }
}
