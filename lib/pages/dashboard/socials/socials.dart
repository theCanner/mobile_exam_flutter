import 'package:flutter/material.dart';
import 'package:mobile_exam/components/socials_item.dart';
import 'package:mobile_exam/components/socials_webpage.dart';
import 'package:mobile_exam/helpers/getColors.dart';
import 'package:mobile_exam/pages/dashboard/dashboard.dart';

class SocialsPage extends StatefulWidget {
  const SocialsPage({super.key, required this.social});
  final dynamic social;
  @override
  State<SocialsPage> createState() => SocialsPageState();
}

class SocialsPageState extends State<SocialsPage> {
  bool showWebView = false;

  void _handleWebView() {
    setState(() {
      showWebView = true;
    });
  }

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
      body: showWebView
          ? SocialsWebpage(url: social['webUrl'])
          : SocialItem(onPressed: _handleWebView, social: social),
    );
  }
}
