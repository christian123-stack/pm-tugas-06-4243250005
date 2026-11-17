import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/destinations.dart';
import '../state/favorite_store.dart';
import '../widgets/destination_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: favoriteStore,
      builder: (context, child) {
        final items = destinations
            .where(
              (destination) =>
                  favoriteStore.destinationIds.contains(destination.id),
            )
            .toList();

        if (items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 56,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Belum ada destinasi tersimpan',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tekan ikon penanda pada destinasi untuk menyimpannya.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth < 600
                ? 1
                : constraints.maxWidth < 1000
                ? 2
                : 3;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                    child: Text(
                      'Destinasi favorit',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      mainAxisExtent: 292,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final destination = items[index];
                      return DestinationCard(
                        destination: destination,
                        onTap: () => context.go('/destinasi/${destination.id}'),
                      );
                    }, childCount: items.length),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
