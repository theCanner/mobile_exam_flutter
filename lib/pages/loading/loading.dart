import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_exam/api/auth/auth.api.dart';
import 'package:mobile_exam/components/custom_dialog.dart';
import 'package:mobile_exam/pages/dashboard/dashboard.dart';
import 'package:mobile_exam/routes.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    super.key,
    this.username = '',
    this.pin = '',
    required this.isLoggingIn,
  });
  final bool isLoggingIn;
  final String username;
  final String pin;

  @override
  State<LoadingPage> createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  final auth = Auth();

  void _showError() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );

    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          type: 'Error',
          message: 'Login Failed, please try again',
        );
      },
    );
  }

  void _routeToDashboard(dynamic response) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage(user: response)),
    );
  }

  Future<void> _login() async {
    final username = widget.username;
    final pin = widget.pin;
    try {
      final response = await auth.login(username: username, pin: pin);
      _routeToDashboard(response);
    } catch (error) {
      _showError();
    }
  }

  Future<void> _logout() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(radius: 14, color: Colors.grey),
            SizedBox(height: 10),
            Text(widget.isLoggingIn ? 'Logging In' : 'Logging Out'),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.isLoggingIn) {
      _login();
      return;
    }
    _logout();
  }
}
