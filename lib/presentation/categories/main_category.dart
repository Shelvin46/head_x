import 'package:flutter/material.dart';
import 'package:head_x/presentation/categories/neckbands/neckbands.dart';
import 'package:head_x/presentation/categories/premium_headphones/main_premium.dart';
import 'package:head_x/presentation/categories/true_wireless/true_wireless.dart';
import 'package:head_x/presentation/categories/wired_category/main_wired.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

// ignore: must_be_immutable
class CategoryMain extends StatelessWidget {
  CategoryMain({super.key});
  List pages = [
    const MainWiredHeadphones(),
    const MainWirelessHeadphones(),
    const MainNeckbands(),
    const MainTrueWireless(),
    const MainPremiumHeadphones(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "All Categories",
          appbarColor: Color(0xFF7AABA8),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 30,
                crossAxisSpacing: 8,

                children: List.generate(pages.length, (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Color(0xFFCFE0E1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return pages[index];
                                  },
                                ));
                              },
                              child: Container(
                                width: 100,
                                height: 110,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text("Wired Headphones")
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
