import 'package:flutter/material.dart';
// import 'package:mobile_exam/pages/dashboard/dashboard.dart';
import 'pages/login/login.dart';

class AppRoutes {
  static const login = '/login';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.login: (_) => LoginPage(),
};
