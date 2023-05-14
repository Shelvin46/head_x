import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_selecting/address_selecting_bloc.dart';
import 'package:head_x/application/address_showing/address_showing_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/profile/addresses/main_address.dart';
// import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../../../main.dart';

class AddressSelecting extends StatefulWidget {
  const AddressSelecting({super.key});

  @override
  State<AddressSelecting> createState() => _AddressSelectingState();
}

class _AddressSelectingState extends State<AddressSelecting> {
  dynamic val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 206, 198, 198),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "Select Address", appbarColor: Color(0xFF3A72DD))),
      body: Column(
        children: [
          SizedBox(
            height: myMediaQueryData.size.height * 0.04,
          ),
          Expanded(
            child: BlocBuilder<AddressShowingBloc, AddressShowingState>(
              builder: (context, state) {
                if (state.addresses.isEmpty) {
                  return const Center(
                    child: Text('Please add a address'),
                  );
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = state.addresses[index];
                      return SizedBox(
                        height: 100,
                        child: RadioListTile(
                          value: index,
                          groupValue: val,
                          onChanged: (changed) {
                            // log(changed.toString());
                            BlocProvider.of<AddressSelectingBloc>(context).add(
                                SelectingAddress(
                                    addressLine2: data['addressLine2'],
                                    name: data['name'],
                                    addressLine1: data['addressLine1'],
                                    city: data['city'],
                                    code: data['zipcode'].toString(),
                                    state: data['state']));
                            // name = data['name'];
                            // remaining = '${data['addressLine1']}'
                            //     '\n'
                            //     '${data['addressLine2']}'
                            //     '\n'
                            //     '${data['city']}${data['state']}- ${data['zipcode']}';

                            setState(() {
                              val = changed;
                            });
                          },
                          title: Text(data['name']),
                          subtitle: Text('${data['addressLine1']}'
                              '\n'
                              '${data['addressLine2']}'
                              '\n'
                              '${data['city']}${data['state']}- ${data['zipcode']}'),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.addresses.length);
              },
            ),
          )
        ],
      ),
    );
  }
}
