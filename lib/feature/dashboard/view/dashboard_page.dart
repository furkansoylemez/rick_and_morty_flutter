import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/common/extensions/context_extensions.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({required this.child, super.key});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: context.l10n.characters_page_title,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.public),
        label: context.l10n.locations_page_title,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.subscriptions),
        label: context.l10n.episodes_page_title,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: child.currentIndex,
        onTap: _onBottomItemTap,
        items: items,
      ),
    );
  }

  void _onBottomItemTap(int index) {
    child.goBranch(
      index,
      initialLocation: index == child.currentIndex,
    );
  }
}
