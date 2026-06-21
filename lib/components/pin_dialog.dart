import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinDialog extends StatefulWidget {
  const PinDialog({super.key});

  @override
  State<PinDialog> createState() => PinDialogState();
}

class PinDialogState extends State<PinDialog> {
  final pinController = TextEditingController();
  int pinLength = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffeeeeee),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),

            const Text(
              "Verify It's You",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            const Text(
              'Please enter your 6 digit PIN',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 28),

            Pinput(
              controller: pinController,
              length: 6,
              obscureText: false,
              autofocus: true,
              showCursor: false,
              keyboardType: TextInputType.number,
              separatorBuilder: (_) => const SizedBox(width: 16),
              onChanged: (_) => setState(() {
                pinLength = pinController.text.length;
              }),
              defaultPinTheme: const PinTheme(
                width: 20,
                height: 35,
                textStyle: TextStyle(fontSize: 22),
                decoration: BoxDecoration(),
              ),
              preFilledWidget: const Text('-', style: TextStyle(fontSize: 22)),
            ),

            const SizedBox(height: 32),

            Container(height: 1, color: Colors.grey),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: pinLength < 6
                        ? null
                        : () => {Navigator.pop(context, pinController.text)},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.green,
                      overlayColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      textStyle: const TextStyle(fontSize: 22),
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: const Text('Enter'),
                  ),
                ),

                Container(width: 1, height: 60, color: Colors.grey),

                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      overlayColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      textStyle: const TextStyle(fontSize: 22),
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
