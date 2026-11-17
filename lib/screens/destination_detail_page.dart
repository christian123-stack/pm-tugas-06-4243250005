import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/destinations.dart';
import '../models/destination.dart';
import '../widgets/destination_artwork.dart';
import '../widgets/favorite_button.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({required this.destinationId, super.key});

  final String destinationId;

  @override
  Widget build(BuildContext context) {
    Destination? destination;
    for (final item in destinations) {
      if (item.id == destinationId) {
        destination = item;
        break;
      }
    }

    if (destination == null) {
      return _MissingDestination(destinationId: destinationId);
    }

    final selectedDestination = destination;
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720;
        final artwork = ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: DestinationArtwork(destination: selectedDestination),
        );
        final details = _DestinationInformation(
          destination: selectedDestination,
        );

        return SingleChildScrollView(
          padding: EdgeInsets.all(isWide ? 28 : 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: isWide
                  ? Row(
                      key: const ValueKey('detail-horizontal'),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: AspectRatio(aspectRatio: 1.08, child: artwork),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: details,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      key: const ValueKey('detail-vertical'),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(aspectRatio: 1.48, child: artwork),
                        const SizedBox(height: 24),
                        details,
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _DestinationInformation extends StatelessWidget {
  const _DestinationInformation({required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                destination.category.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            FavoriteButton(destinationId: destination.id),
          ],
        ),
        Text(
          destination.name,
          style: Theme.of(context).textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                destination.location,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Text(
          'Tentang tempat ini',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          destination.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
        const SizedBox(height: 22),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(
                Icons.confirmation_number_outlined,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perkiraan tiket masuk',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      destination.ticketPrice,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.explore_outlined),
          label: const Text('Jelajahi destinasi lain'),
        ),
      ],
    );
  }
}

class _MissingDestination extends StatelessWidget {
  const _MissingDestination({required this.destinationId});

  final String destinationId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_off_outlined,
              size: 52,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(
              'Destinasi tidak ditemukan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text('ID "$destinationId" tidak tersedia.'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/'),
              child: const Text('Kembali ke daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
