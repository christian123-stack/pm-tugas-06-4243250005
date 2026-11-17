import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/destinations.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';

class DestinationListPage extends StatefulWidget {
  const DestinationListPage({super.key});

  @override
  State<DestinationListPage> createState() => _DestinationListPageState();
}

class _DestinationListPageState extends State<DestinationListPage> {
  String _query = '';
  String _category = 'Semua';

  List<Destination> get _filteredDestinations {
    return destinations.where((destination) {
      final matchesCategory =
          _category == 'Semua' || destination.category == _category;
      final searchText = '${destination.name} ${destination.location}'
          .toLowerCase();
      return matchesCategory && searchText.contains(_query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 600
            ? 1
            : constraints.maxWidth < 1000
            ? 2
            : 3;
        final items = _filteredDestinations;

        return CustomScrollView(
          key: const ValueKey('destination-list'),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cerita indah dimulai di sini',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Temukan pesona alam dan budaya Sumatera Utara.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) =>
                          setState(() => _query = value.trim()),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Cari destinasi atau daerah',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      children: ['Semua', 'Alam', 'Budaya'].map((category) {
                        return ChoiceChip(
                          label: Text(category),
                          selected: _category == category,
                          onSelected: (_) =>
                              setState(() => _category = category),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Destinasi pilihan',
                      style: Theme.of(context).textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
            if (items.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text('Destinasi tidak ditemukan.')),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
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
  }
}
