import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(

      drawer: isDesktop
          ? Drawer(
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
            ListTile(
              leading: Icon(Icons.shopping_cart, size: 30),
              title: Text('l', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to orders screen
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money, size: 30),
              title: Text('Ready to Dispatch', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to revenue & expense screen
              },
            ),
            ListTile(
              leading: Icon(Icons.money, size: 30),
              title: Text('Billing & Changes', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to billing & changes screen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, size: 30),
              title: Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to settings screen
              },
            ),
          ],
        ),
      )
          : AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isDrawerOpen ? MediaQuery.of(context).size.width * 0.75 : 0,
        child: Drawer(
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
              ListTile(
                leading: Icon(Icons.shopping_cart, size: 30),
                title: Text('Orders', style: TextStyle(fontSize: 18)),
                onTap: () {
                  // Navigate to orders screen
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money, size: 30),
                title: Text('Ready to Dispatch', style: TextStyle(fontSize: 18)),
                onTap: () {
                  // Navigate to revenue & expense screen
                },
              ),
              ListTile(
                leading: Icon(Icons.money, size: 30),
                title: Text('Billing & Changes', style: TextStyle(fontSize: 18)),
                onTap: () {
                  // Navigate to billing & changes screen
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, size: 30),
                title: Text('Settings', style: TextStyle(fontSize: 18)),
                onTap: () {
                  // Navigate to settings screen
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(), // Placeholder for the main content
    );
  }
}
