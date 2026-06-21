import 'package:flutter/material.dart';
import 'package:mobile_exam/helpers/getColors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.socialName,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final String socialName;
  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    String socialName = widget.socialName;
    return SizedBox(
      width: 250,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: getSocialColor(socialName),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: widget.onPressed,
        child: Text('Visit $socialName'),
      ),
    );
  }
}
