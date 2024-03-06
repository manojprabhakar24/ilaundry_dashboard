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
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
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
      appBar: _isSearching ? _buildSearchAppBar() : _buildDefaultAppBar(),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: drawerItems.map((item) => item.page).toList(),
          ),
          if (isDrawerOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDrawerOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black26,
                ),
              ),
            ),
          if (isDrawerOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              child: Container(
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
                          color: _currentPageIndex == i ? Colors.green : Colors
                              .black,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              drawerItems[i].title,
                              style: TextStyle(
                                color: _currentPageIndex == i
                                    ? Colors.green
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            if (drawerItems[i].notificationCount != null &&
                                drawerItems[i].notificationCount! > 0)
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  drawerItems[i].notificationCount!.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            _currentPageIndex = i;
                            _pageController.animateToPage(
                              i,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                            isDrawerOpen = false;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  AppBar _buildDefaultAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0,
      title: Text(
        'iLaundry',
        style: TextStyle(
          color: Colors.white,
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
            setState(() {
              _isSearching = true;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Implement notification functionality
          },
        ),
      ],
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0,
      title: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
              });
            },
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            _isSearching = false;
            _searchController.clear();
          });
        },
      ),
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

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Orders Page'),
    );
  }
}

class RevenueExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Revenue & Expense Page'),
    );
  }
}

class BillingChangesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Billing & Changes Page'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page'),
    );
  }
}
