import 'package:flutter/material.dart';
import 'package:mobile_exam/api/dashboard/dashboard.api.dart';
import 'package:mobile_exam/components/custom_header.dart';
import 'package:mobile_exam/pages/dashboard/socials/socials.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => DashboardPageStata();
}

class DashboardPageStata extends State<DashboardPage> {
  final dashboard = Dashboard();
  List menuItems = [];
  Future<void> _loadItems() async {
    menuItems = await dashboard.getItems();
    setState(() {
      menuItems.add({
        "name": "other",
        "history": "",
        "iconUrl": "",
        "imgUrl": "",
        "webUrl": "",
      });
    });
  }

  void _routeToSocial(dynamic social) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SocialsPage(social: social)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(child: CustomHeader()),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(60),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 60,
          crossAxisSpacing: 60,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final isOther = item['name'] == 'other';
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: GestureDetector(
                onTap: () => _routeToSocial(item),
                child: isOther
                    ? Container(
                        width: 150,
                        height: 150,
                        color: Colors.amber[600],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout, color: Colors.white, size: 70),
                          ],
                        ),
                      )
                    : Image.network(
                        item['iconUrl'],
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }
}
