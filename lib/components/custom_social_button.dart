import 'package:flutter/material.dart';
import 'package:mobile_exam/helpers/buttonHelpers.dart';

class CustomSocialButton extends StatefulWidget {
  const CustomSocialButton({
    super.key,
    required this.socialName,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final String socialName;
  @override
  State<CustomSocialButton> createState() => CustomSocialButtonState();
}

class CustomSocialButtonState extends State<CustomSocialButton> {
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
