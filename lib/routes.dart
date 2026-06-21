import 'package:flutter/material.dart';
import 'package:mobile_exam/pages/dashboard/dashboard.dart';
import 'pages/login/login.dart';

class AppRoutes {
  static const login = '/login';
  static const loading = '/loading';
  static const dashboard = '/dashboard';
}

final Map<String, WidgetBuilder> appRoutes = {
  // AppRoutes.login: (_) => LoginPage(),
  AppRoutes.dashboard: (_) => DashboardPage(),
};
