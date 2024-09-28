import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/router/router.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Characters Page'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(characterDetailPath);
              },
              child: const Text('Go to details'),
            ),
          ],
        ),
      ),
    );
  }
}
