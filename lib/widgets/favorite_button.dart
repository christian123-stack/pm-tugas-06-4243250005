import 'package:flutter/material.dart';

import '../state/favorite_store.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({required this.destinationId, super.key});

  final String destinationId;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: favoriteStore,
      builder: (context, child) {
        final isFavorite = favoriteStore.contains(destinationId);
        return IconButton(
          tooltip: isFavorite ? 'Hapus dari favorit' : 'Simpan ke favorit',
          onPressed: () => favoriteStore.toggle(destinationId),
          icon: Icon(
            isFavorite ? Icons.bookmark : Icons.bookmark_border,
            color: isFavorite ? Theme.of(context).colorScheme.primary : null,
          ),
        );
      },
    );
  }
}
