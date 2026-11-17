import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.location, required this.child, super.key});

  final String location;
  final Widget child;

  int get _selectedIndex => location.startsWith('/favorit') ? 1 : 0;

  void _selectDestination(BuildContext context, int index) {
    context.go(index == 1 ? '/favorit' : '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        leading: Icon(
          Icons.explore,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: const Text(
          'Jelajah Sumut',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: MediaQuery.sizeOf(context).width >= 600
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: Text(
                      'PANDUAN WISATA',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 840) {
              return Row(
                children: [
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) =>
                        _selectDestination(context, index),
                    labelType: NavigationRailLabelType.all,
                    groupAlignment: -0.8,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.explore_outlined),
                        selectedIcon: Icon(Icons.explore),
                        label: Text('Jelajahi'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.bookmark_border),
                        selectedIcon: Icon(Icons.bookmark),
                        label: Text('Favorit'),
                      ),
                    ],
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(child: child),
                ],
              );
            }

            return Column(
              children: [
                Expanded(child: child),
                NavigationBar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) =>
                      _selectDestination(context, index),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.explore_outlined),
                      selectedIcon: Icon(Icons.explore),
                      label: 'Jelajahi',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.bookmark_border),
                      selectedIcon: Icon(Icons.bookmark),
                      label: 'Favorit',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
