import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/di/service_locator.dart';

Future<void> main() async {
  await ServiceLocator.instance.setUp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
