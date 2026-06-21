import 'package:flutter/material.dart';
import 'package:mobile_exam/api/dashboard/dashboard.api.dart';
import 'package:mobile_exam/components/custom_button.dart';
import 'package:mobile_exam/components/custom_header.dart';
import 'package:mobile_exam/pages/dashboard/others/others.dart';
import 'package:mobile_exam/pages/dashboard/socials/socials.dart';
import 'package:mobile_exam/pages/loading/loading.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, this.user = ''});
  final dynamic user;
  @override
  State<DashboardPage> createState() => DashboardPageStata();
}

class DashboardPageStata extends State<DashboardPage> {
  final dashboard = Dashboard();
  List menuItems = [];
  bool isLoggingOut = false;
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

  void _handleLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoadingPage(isLoggingIn: false)),
    );
  }

  void _openMenu() {
    setState(() {
      isLoggingOut = true;
    });
  }

  void _closeMenu() {
    setState(() {
      isLoggingOut = false;
    });
  }

  void _routeToOther(dynamic social) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OthersPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => _openMenu(),
            child: CustomHeader(user: user),
          ),
        ),
      ),
      body: Column(
        children: [
          if (isLoggingOut)
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              color: Colors.grey[400],
              child: Column(
                spacing: 12,
                children: [
                  CustomButton(
                    type: 'Logout',
                    label: 'Logout',
                    onPressed: _handleLogout,
                  ),
                  CustomButton(
                    type: 'Cancel',
                    label: 'Cancel',
                    onPressed: _closeMenu,
                  ),
                ],
              ),
            ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(60),
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final isOther = item['name'] == 'other';
                return Center(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: GestureDetector(
                      onTap: () =>
                          isOther ? _routeToOther(item) : _routeToSocial(item),
                      child: isOther
                          ? Container(
                              width: 150,
                              height: 150,
                              color: Colors.amber[600],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 70,
                                  ),
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
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }
}
