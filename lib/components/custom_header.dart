import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({super.key, this.user = '', required this.onTap});
  final dynamic user;
  final GestureTapCallback onTap;
  @override
  State<CustomHeader> createState() => CustomHeaderState();
}

class CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      child: Row(
        spacing: 12,
        children: [
          ClipOval(
            child: GestureDetector(
              onTap: widget.onTap,
              child: Image.network(
                'https://indexcodex.com/api/v1/assets/userimage.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(user['userName']), Text(user['userId'])],
          ),
        ],
      ),
    );
  }
}
