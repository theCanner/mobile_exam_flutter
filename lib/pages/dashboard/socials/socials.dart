import 'package:flutter/material.dart';
import 'package:mobile_exam/components/socials_item.dart';
import 'package:mobile_exam/helpers/getColors.dart';
import 'package:mobile_exam/pages/dashboard/dashboard.dart';

class SocialsPage extends StatefulWidget {
  const SocialsPage({super.key, required this.social});
  final dynamic social;
  @override
  State<SocialsPage> createState() => SocialsPageState();
}

class SocialsPageState extends State<SocialsPage> {
  @override
  Widget build(BuildContext context) {
    final social = widget.social;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: getSocialColor(social['name']),
        foregroundColor: Colors.white,
        title: Text(social['name'], textAlign: TextAlign.start),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
      ),
      body: SocialItem(social: social),
    );
  }
}
