import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_exam/api/login/auth.api.dart';
import 'package:mobile_exam/components/custom_dialog.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    super.key,
    required this.username,
    required this.pin,
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

  Future<void> _login() async {
    final username = widget.username;
    final pin = widget.pin;
    try {
      final response = await auth.login(username: username, pin: pin);
      print(response);
    } catch (error) {
      _showError();
    }
  }

  Future<void> _logout() async {
    final username = widget.username;
    final pin = widget.pin;
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
