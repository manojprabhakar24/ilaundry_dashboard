import 'package:flutter/material.dart';

import 'mobile_view.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          'iLaundry',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Image.asset('assets/i.png'), // Replace 'your_image.png' with your image path
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
      body: Row(
        children: <Widget>[
          // Drawer
          Container(
            width: MediaQuery.of(context).size.width * 0.3, // 20% width of screen
            color: Colors.white,
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
                  color: Colors.grey,
                ),
                for (var i = 0; i < drawerItems.length; i++)
                  ListTile(
                    leading: Icon(
                      drawerItems[i].icon,
                      color: _currentPageIndex == i ? Colors.green : Colors.black,
                    ),
                    title: i == 0 ? _buildOrdersTileTitle(drawerItems[i]) : Text(drawerItems[i].title),
                    onTap: () {
                      setState(() {
                        _currentPageIndex = i;
                        _pageController.animateToPage(
                          i,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      });
                    },
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