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
                        decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        validator: usernameValidators,
                        onChanged: (_) => setState(() {
                          isValid = _formKey.currentState!.validate();
                        }),
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        width: 250,
                        child: CustomButton(
                          type: 'Login',
                          label: 'Login',
                          onPressed: isValid ? _handleSubmit : null,
                        ),
                        // child: FilledButton(
                        //   style: FilledButton.styleFrom(
                        //     backgroundColor: Colors.green[400],
                        //     padding: EdgeInsets.all(20),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(4),
                        //     ),
                        //   ),
                        //   onPressed: isValid ? _handleSubmit : null,
                        //   child: const Text('Enter'),
                        // ),
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
