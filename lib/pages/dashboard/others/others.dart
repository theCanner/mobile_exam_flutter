import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_exam/components/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class OthersPage extends StatefulWidget {
  const OthersPage({super.key});

  @override
  State<OthersPage> createState() => OthersPageState();
}

class OthersPageState extends State<OthersPage> {
  late final PageController pageController;
  Timer? timer;

  final items = [
    {
      'name': 'Samsung',
      'image': 'assets/images/samsung.png',
      'webUrl': 'https://samsung.com',
    },
    {
      'name': 'Apple',
      'image': 'assets/images/apple.png',
      'webUrl': 'https://apple.com',
    },
    {
      'name': 'Windows',
      'image': 'assets/images/windows.png',
      'webUrl': 'https://microsoft.com',
    },
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.78);

    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      final nextIndex = (selectedIndex + 1) % items.length;

      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<void> __visitWeb(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open $url');
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = items[selectedIndex];

    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        title: const Text('Others'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          const Text(
            'You might also like',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: pageController,
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = items[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Image.asset(item['image']!, width: 150),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          Text(
            selectedItem['name']!,
            style: const TextStyle(fontSize: 26, color: Colors.black87),
          ),

          const SizedBox(height: 24),

          CustomButton(
            onPressed: () => __visitWeb(selectedItem['webUrl']!),
            socialName: selectedItem['name']!,
          ),
        ],
      ),
    );
  }
}
