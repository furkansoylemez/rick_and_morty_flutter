import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/common/extensions/context_extensions.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.l10n.locations_page_title),
      ),
    );
  }
}
