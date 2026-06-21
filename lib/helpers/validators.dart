String? usernameValidators(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'please enter your username';
  }

  final alphanumeric = RegExp(r'[^A-Za-z0-9]');

  if (alphanumeric.hasMatch(value)) {
    return 'Values must be alphanumeric';
  }

  if (value.length > 24) {
    return 'Must not exceed 24 characters';
  }
  return null;
}
