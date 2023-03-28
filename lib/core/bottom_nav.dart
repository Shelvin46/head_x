import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:head_x/presentation/account/main_account.dart';
import 'package:head_x/presentation/cart/main_cart.dart';
import 'package:head_x/presentation/categories/main_category.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:head_x/presentation/notification/main_notification.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      MainHome(),
      CategoryMain(),
      const NotificationMain(),
      const MainAccount(),
      const MainCart(),
    ];

    return Scaffold(
      body: pages[currentSelect],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                //color: Colors.white70,
                fontSize: 13),
          ),
          // indicatorColor:const Color.fromARGB(255, 209, 136, 136),
        ),
        child: NavigationBar(
          selectedIndex: currentSelect,
          onDestinationSelected: (currentSelect) =>
              setState(() => this.currentSelect = currentSelect),
          height: 60,
          //backgroundColor: musiCityBgColor,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  //color: Colors.white60,
                ),
                selectedIcon: Icon(Icons.home_outlined),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Icons.category,
                  // color: Colors.white60,
                ),
                selectedIcon: Icon(Icons.category_outlined),
                label: "Categories"),
            NavigationDestination(
              icon: Icon(
                Icons.notifications_active,
                // color: Colors.white60,
              ),
              selectedIcon: Icon(Icons.notifications_active_outlined),
              label: "Notification",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_circle_rounded,
                // color: Colors.white60,
              ),
              selectedIcon: Icon(Icons.account_box_outlined),
              label: "Account",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.shopping_cart_sharp,
                // color: Colors.white60,
              ),
              selectedIcon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            )
          ],
        ),
      ),
    );
  }
}
