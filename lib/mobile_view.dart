import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  bool isDrawerOpen = false;

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
      appBar: AppBar(
        backgroundColor: Colors.green, // Set app bar background color
        elevation: 0, // Remove app bar elevation
        title: Text(
          'iLaundry',
          style: TextStyle(
            color: Colors.white, // Set app bar title text color
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement notification functionality
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          if (isDrawerOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDrawerOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black26, // Add a semi-transparent color to overlay the entire screen
                ),
              ),
            ),
          Positioned(
            top: 0,
            left: isDrawerOpen ? 0 : -MediaQuery.of(context).size.width * 0.8, // Slide the drawer out of the screen when closed
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width of the drawer
              height: MediaQuery.of(context).size.height, // Extend drawer to the end of the page
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDrawerOpen = false;
                  });
                },
                child: Container(
                  color: Colors.white, // Set drawer background color
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.dashboard,
                              color: Colors.green,
                              size: 24,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey, // Set divider color
                      ),
                      // Create drawer items dynamically
                      for (var item in drawerItems)
                        ListTile(
                          leading: Icon(
                            item.icon,
                            color: Colors.green,
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isDrawerOpen = false;
                            });
                            item.onTap();
                          },
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
