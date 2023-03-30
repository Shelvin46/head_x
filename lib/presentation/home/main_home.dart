import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/product_details/product_details.dart';

import '../../main.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});
  final listImage = [
    "assets/banner-1.png",
    "assets/music-you-banner-web-template_23-2148641826.jpg",
    "assets/gadget-concept-landing-page-template_23-2148626924.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageGap1,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: myMediaQueryData.size.width * 0.04),
                  child: homePageLogo,
                ),
                gap,
                heading,
              ],
            ),
            homePageGap2,
            GestureDetector(
              child: Container(
                width: myMediaQueryData.size.width * 0.97,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    // controller: searchController,
                    onChanged: (value) async {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      hintText: 'Explore Your Headphones',
                      hintStyle: TextStyle(color: Color(0xFF052F3D)),
                      filled: true,
                      fillColor: Color(0xFFB3CDD6),
                    ),
                  ),
                ),
              ),
            ),
            homePageGap1,
            CarouselSlider.builder(
                itemCount: listImage.length,
                itemBuilder: (context, index, realIndex) {
                  final listOne = listImage[index];
                  return buildImage(listOne, index);
                },
                options: CarouselOptions(
                    pageSnapping: false,
                    enableInfiniteScroll: false,
                    height: 170,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1)),
            homePageGap2,
            Padding(
              padding:
                  EdgeInsets.only(left: myMediaQueryData.size.width * 0.04),
              child: recentText,
            ),
            lstviewGap,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: myMediaQueryData.size.height * 0.2083,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: myMediaQueryData.size.width * 0.3300,
                        color: const Color.fromARGB(255, 172, 184, 190),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: myMediaQueryData.size.height * 0.01),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MainProductDetails();
                                    },
                                  ));
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              child: Text(
                                "realme Buds Classic",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return gap2;
                    },
                    itemCount: 10),
              ),
            ),
            lstviewGap,
            Padding(
              padding:
                  EdgeInsets.only(left: myMediaQueryData.size.width * 0.04),
              child: trendingText,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: myMediaQueryData.size.height * 0.2083,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: myMediaQueryData.size.width * 0.3300,
                        color: const Color.fromARGB(255, 172, 184, 190),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: myMediaQueryData.size.height * 0.01),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              child: Text(
                                "realme Buds Classic",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return gap2;
                    },
                    itemCount: 10),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildImage(String image, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: myMediaQueryData.size.width * 0.9,
        // color: Colors.green,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
