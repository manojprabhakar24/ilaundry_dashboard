import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  bool isDrawerOpen = false;
  bool isHovered = false; // Flag to track cursor hover

  // List of drawer items
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
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: Image.asset(
                'assets/i.png',
                height: 40,
                width: 30,
              ),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  isDrawerOpen = !isDrawerOpen;
                });
              },
            ),
          ),
          if (isDrawerOpen)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4, // Adjust the width here
                child: Drawer(
                  child: Container(
                    color: Colors.white, // Set the background color to white
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.dashboard,
                                color: Colors.green, // Set icon color to green
                                size: 24,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                  color: Colors.black, // Set text color to black
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        // Create drawer items dynamically
                        for (var item in drawerItems)
                          ListTile(
                            leading: Icon(
                              item.icon,
                              color: Colors.green, // Set icon color to green
                            ),
                            title: Text(
                              item.title,
                              style: TextStyle(
                                color: Colors.black, // Set text color to black
                                fontSize: 18,
                              ),
                            ),
                            onTap: item.onTap as void Function()?,
                          ),
                      ],
                    ),
                  ),
                ),
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
