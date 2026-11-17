import 'package:flutter/material.dart';

class Destination {
  const Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.description,
    required this.ticketPrice,
    required this.icon,
    required this.color,
  });

  final String id;
  final String name;
  final String location;
  final String category;
  final String description;
  final String ticketPrice;
  final IconData icon;
  final Color color;
}
