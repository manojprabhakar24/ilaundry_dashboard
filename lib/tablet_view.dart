import 'package:flutter/material.dart';



class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
  bool showDashboard = false;

  final List<DrawerItem> drawerItems = [
    DrawerItem(icon: Icons.shopping_cart, title: 'Orders', onTap: () {
      // Navigate to orders screen
    }),
    DrawerItem(icon: Icons.attach_money, title: 'Ready to Dispatch', onTap: () {
      // Navigate to revenue & expense screen
    }),
    DrawerItem(icon: Icons.money, title: 'Billing & Changes', onTap: () {
      // Navigate to billing & changes screen
    }),
    DrawerItem(icon: Icons.settings, title: 'Settings', onTap: () {
      // Navigate to settings screen
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(
        children: <Widget>[
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                // Create drawer items dynamically
                for (var item in drawerItems)
                  ListTile(
                    leading: Icon(item.icon, size: 30),
                    title: Text(item.title, style: TextStyle(fontSize: 18)),

                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // Your main content here
            ),
          ),
        ],
      ),
    );

  }
}
class DrawerItem {
  final IconData icon;
  final String title;
  final Function onTap;

  DrawerItem({required this.icon, required this.title, required this.onTap});
}