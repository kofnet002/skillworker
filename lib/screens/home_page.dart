// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillworker/widgets/booking_page.dart';
import 'package:skillworker/widgets/services_page.dart';
import 'package:provider/provider.dart';
import 'package:skillworker/providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  late PageController pageController;

// Store data in the user provider
  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    addData();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CupertinoContextMenu.kEndBoxShadow,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: CupertinoTabBar(
            backgroundColor: Colors.transparent,
            border: Border.all(color: Colors.transparent),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: _page == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade500,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: _page == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade500,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: _page == 2
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade500,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _page == 3
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade500,
                ),
                label: '',
              ),
            ],
            onTap: navigationTapped,
          ),
        ),
      ),

      // ******************************** BODY

      body: PageView(
        children: [
          BookingPage(),
          ServicesPage(),
          Center(
            child: Text(
              'Search',
            ),
          ),
          Center(
            child: Text(
              'favorite',
            ),
          ),
          Center(
            child: Text(
              'Profile',
            ),
          ),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        // physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}


//  Provider.of<ThemeProvider>(context, listen: false)
//                     .toggleTheme();