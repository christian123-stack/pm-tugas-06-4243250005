import 'package:flutter/material.dart';

import '../models/destination.dart';

class DestinationArtwork extends StatelessWidget {
  const DestinationArtwork({required this.destination, this.height, super.key});

  final Destination destination;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  destination.color,
                  Color.lerp(destination.color, const Color(0xFF183D43), 0.55)!,
                ],
              ),
            ),
            child: const SizedBox.expand(),
          ),
          Positioned(
            right: -42,
            bottom: -96,
            child: _DecorativeCircle(
              size: 230,
              color: Colors.white.withValues(alpha: 0.10),
            ),
          ),
          Positioned(
            left: -38,
            top: -88,
            child: _DecorativeCircle(
              size: 190,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
              ),
              child: Icon(destination.icon, size: 58, color: Colors.white),
            ),
          ),
          Positioned(
            left: 14,
            top: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.94),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                destination.category,
                style: TextStyle(
                  color: destination.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 14,
            child: Icon(
              Icons.wb_sunny_outlined,
              color: Colors.white.withValues(alpha: 0.85),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  const _DecorativeCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
