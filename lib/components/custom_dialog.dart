import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key, required this.type, required this.message});
  final String type;
  final String message;
  @override
  State<CustomDialog> createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
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
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    widget.type,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.message, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Container(height: 1, color: Colors.grey),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        overlayColor: Colors.transparent,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text('Close'),
                    ),
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
