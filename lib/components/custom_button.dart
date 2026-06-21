import 'package:flutter/material.dart';
import 'package:mobile_exam/helpers/buttonHelpers.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.type,
    required this.label,
    required this.onPressed,
  });
  final VoidCallback? onPressed;
  final String type;
  final String label;
  @override
  State<CustomButton> createState() => CustomSocialButtonState();
}

class CustomSocialButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    String type = widget.type;
    String label = widget.label;
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: getButtonType(type),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: widget.onPressed,
        child: Text(label, style: TextStyle(color: getButtonLabel(type))),
      ),
    );
  }
}
