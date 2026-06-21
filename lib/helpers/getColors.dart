import 'package:flutter/material.dart';

Color getSocialColor(String name) {
  if (name == 'YouTube') return Colors.red;
  if (name == 'Spotify') return Colors.green;
  if (name == 'Facebook') return Colors.blue;
  return Colors.amber;
}
