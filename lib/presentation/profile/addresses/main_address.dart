// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_showing/address_showing_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:head_x/presentation/profile/addresses/widgets/adding_address.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainAddresses extends StatelessWidget {
  const MainAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "My Addresses", appbarColor: Color(0xFFDE40C5))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cartbacColor,
        child: Column(
          children: [
            addressGap,
            Expanded(
              child: BlocConsumer<AddressShowingBloc, AddressShowingState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.addresses.isEmpty) {
                    return const Center(
                      child: Text('Please Add Address'),
                    );
                  }

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = state.addresses[index];
                      final forAddress = state.addresses[0];

                      // remaining =
                      return Container(
                        width: double.infinity,
                        height: myMediaQueryData.size.height * 0.170,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data['name'], style: addressName),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Delete Address'),
                                            content: const Text(
                                                'Are you sure you want to delete this address?'),
                                            actions: [
                                              TextButton(
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                }, 
                                              ),
                                              ElevatedButton(
                                                child: const Text('Delete'),
                                                onPressed: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      );
                                                    },
                                                  );
                                                  await toDelete(index);
                                                  BlocProvider.of<
                                                              AddressShowingBloc>(
                                                          context)
                                                      .add(InitializeAddress());
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      Icons.more_vert,
                                      size: 30,//198
                                    ),
                                  )
                                ],
                              ),
                            ),
                            addressGap,
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${data['addressLine1']}'
                                      '\n'
                                      '${data['addressLine2']}'
                                      '\n'
                                      '${data['city']}${data['state']}- ${data['zipcode']}'),
                                ],
                              ),
                            ) //data['addressLine2]
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.addresses.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AddressAddingPage();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> toDelete(int index) async {
  final docData = await gettingData(userId, 'users');
  List<dynamic> addresses = docData.data()?['address'] ?? [];
  addresses.removeAt(index);
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .update({'address': addresses});
}
