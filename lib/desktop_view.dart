import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'mobile_view.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
  bool showDashboard = false;
  bool showHistory = false;
  int selectedStylist = 0;
  Color dashboardButtonColor = Colors.blue;

  // List of drawer items
  bool isDrawerOpen = true; // Open the drawer by default
  int _currentPageIndex = 0;
  late PageController _pageController;

  final List<DrawerItem> drawerItems = [
    DrawerItem(
      icon: Icons.shopping_cart,
      title: 'Orders',
      page: OrdersPage(),
      notificationCount: 5, // Example: set the notification count to 5
    ),
    DrawerItem(
      icon: Icons.attach_money,
      title: 'Ready to Dispatch',
      page: RevenueExpensePage(),
    ),
    DrawerItem(
      icon: Icons.money,
      title: 'Billing & Changes',
      page: BillingChangesPage(),
    ),
    DrawerItem(
      icon: Icons.settings,
      title: 'Settings',
      page: SettingsPage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image container and drawer
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.2, // 20% width of screen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100,
                  ),
                ),
                Divider(thickness: 5),
                // Drawer items
                Expanded(
                  child: ListView.builder(
                    itemCount: drawerItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(
                          drawerItems[index].icon,
                          color: _currentPageIndex == index ? Colors.green : Colors.black,
                        ),
                        title: index == 0 ? _buildOrdersTileTitle(drawerItems[index]) : Text(drawerItems[index].title),
                        onTap: () {
                          setState(() {
                            _currentPageIndex = index;
                            _pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Page content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: drawerItems.map((item) => item.page).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersTileTitle(DrawerItem item) {
    return Row(
      children: [
        Text(item.title),
        SizedBox(width: 16), // Add some space between the text and the notification count
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            item.notificationCount.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String title;
  final Widget page;
  final int? notificationCount;

  DrawerItem({required this.icon, required this.title, required this.page, this.notificationCount});
}

class RevenueExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Display revenue and expense data
    return Center(
      child: Text('Revenue & Expense Page'),
    );
  }
}

class BillingChangesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Display billing and changes data
    return Center(
      child: Text('Billing & Changes Page'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Display settings data
    return Center(
      child: Text('Settings Page'),
    );
  }
}
