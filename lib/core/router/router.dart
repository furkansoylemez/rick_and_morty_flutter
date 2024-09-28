import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/feature/character_detail/view/character_detail_page.dart';
import 'package:rick_and_morty/feature/characters/view/characters_page.dart';
import 'package:rick_and_morty/feature/dashboard/view/dashboard_page.dart';
import 'package:rick_and_morty/feature/episodes/view/episodes_page.dart';
import 'package:rick_and_morty/feature/locations/view/locations_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _charactersTabNavigatorKey = GlobalKey<NavigatorState>();

const charactersPath = '/characters';
const locationsPath = '/locations';
const episodesPath = '/episodes';
const characterDetailPath = '/character-detail';

final router = GoRouter(
  initialLocation: charactersPath,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return _getPage(
          child: DashboardPage(
            child: navigationShell,
          ),
          state: state,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _charactersTabNavigatorKey,
          routes: [
            GoRoute(
              path: charactersPath,
              pageBuilder: (context, GoRouterState state) {
                return _getPage(
                  child: const CharactersPage(),
                  state: state,
                );
              },
            ),
            GoRoute(
              path: characterDetailPath,
              pageBuilder: (context, GoRouterState state) {
                return _getPage(
                  child: const CharacterDetailPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: locationsPath,
              pageBuilder: (context, state) {
                return _getPage(
                  child: const LocationsPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: episodesPath,
              pageBuilder: (context, state) {
                return _getPage(
                  child: const EpisodesPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

Page<dynamic> _getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}
