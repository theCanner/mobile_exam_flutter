import 'package:flutter/material.dart';
import 'package:mobile_exam/components/custom_button.dart';
import 'package:mobile_exam/components/pin_dialog.dart';
import 'package:mobile_exam/helpers/validators.dart';
import 'package:mobile_exam/pages/loading/loading.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  bool isValid = false;
  String? usernameError;

  void _handleSubmit() {
    if (isValid) {
      _openPinDialog();
    }
  }

  void _routeToLoading(String result) {
    String username = usernameController.text;
    String pin = result;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LoadingPage(username: username, pin: pin, isLoggingIn: true),
      ),
    );
  }

  Future<void> _openPinDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return PinDialog();
      },
    );

    if (result == null) return;

    _routeToLoading(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Transform.translate(
                    offset: const Offset(25, -25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/youtube.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/spotify.png'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Transform.translate(
                    offset: const Offset(-25, 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/facebook.png'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: SizedBox(
                width: 250,
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 10,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          errorStyle: const TextStyle(height: 0),
                          errorText: null,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: usernameError == null
                                  ? Colors.blue
                                  : Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        validator: usernameValidators,
                        onChanged: (value) => setState(() {
                          usernameError = usernameValidators(value);
                          isValid = usernameError == null;
                        }),
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      if (usernameError != null)
                        Text(
                          usernameError!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      SizedBox(
                        width: 250,
                        child: CustomButton(
                          type: 'Login',
                          label: 'Login',
                          onPressed: isValid ? _handleSubmit : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
