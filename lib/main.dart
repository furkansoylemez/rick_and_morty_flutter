import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/rick_and_morty_app.dart';
import 'package:rick_and_morty/core/di/service_locator.dart';

Future<void> main() async {
  await ServiceLocator.instance.setUp();
  runApp(const RickAndMortyApp());
}
