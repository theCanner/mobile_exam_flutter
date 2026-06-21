import 'package:flutter/material.dart';

Color getSocialColor(String name) {
  if (name == 'YouTube') return Colors.red;
  if (name == 'Spotify') return Colors.green;
  if (name == 'Facebook') return Colors.blue;
  return Colors.amber;
}

Color getButtonType(String type) {
  if (type == 'Login') return Colors.green;
  if (type == 'Logout') return Colors.grey.shade300;
  if (type == 'Cancel') return Colors.white;
  return Colors.green;
}

Color getButtonLabel(String type) {
  if (type == 'Login') return Colors.white;
  if (type == 'Logout') return Colors.red;
  if (type == 'Cancel') return Colors.blue;
  return Colors.white;
}
