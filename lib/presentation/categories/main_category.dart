// import 'dart:math';

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';

import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

String? globalId;

// ignore: must_be_immutable
class CategoryMain extends StatelessWidget {
  CategoryMain({super.key});

  @override
  Widget build(BuildContext context) {
    // log(x)

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
              child: StreamBuilder(
                stream: getproducts,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data != []) {
                    return GridView.count(
                      crossAxisCount: 2, // Number of columns in the grid
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 8,

                      children: List.generate(snapshot.data.length, (index) {
                        final document = snapshot.data[index];
                        globalId = document['id'];
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 80,
                              backgroundColor: const Color(0xFFCFE0E1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return MainWirelessHeadphones(
                                              id: document['id'],
                                              title: document['name']);
                                        },
                                      ));
                                    
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  document['image']),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(document['name'])
                          ],
                        );
                      }),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Stream getproducts = (() async* {
    final QuerySnapshot<Map<String, dynamic>> usersStream =
        await FirebaseFirestore.instance.collection('category').get();
    List productlist = usersStream.docs.map((e) => e.data()).toList();
    yield productlist;
  })();
}
