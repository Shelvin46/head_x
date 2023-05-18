// import 'package:flutter/cupertino.dart';
// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_selecting/address_selecting_bloc.dart';
import 'package:head_x/application/address_showing/address_showing_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/main.dart';
// import 'package:head_x/presentation/profile/addresses/widgets/address_bottomsheet.dart';

class AdressChanging extends StatefulWidget {
  const AdressChanging({
    super.key,
  });

  @override
  State<AdressChanging> createState() => _AdressChangingState();
}

class _AdressChangingState extends State<AdressChanging> {
  // dynamic selectedValue;
  dynamic val;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Deliver to", style: addressName),
        TextButton(
          onPressed: () {
            // setState(() {});
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return BlocBuilder<AddressShowingBloc, AddressShowingState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: myMediaQueryData.size.height * 0.4,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = state.addresses[index];
                          // bool isSelected = (selectedValue == index);

                          return SizedBox(
                            height: 100,
                            child: RadioListTile(
                              value: index,
                              groupValue: val,
                              onChanged: (changed) {
                                setState(() {
                                  val = changed;
                                  // setState(() {});
                                });
                                // setState(() {});
                                BlocProvider.of<AddressSelectingBloc>(context)
                                    .add(
                                  SelectingAddress(
                                    addressLine2: data['addressLine2'],
                                    name: data['name'],
                                    addressLine1: data['addressLine1'],
                                    city: data['city'],
                                    code: data['zipcode'].toString(),
                                    state: data['state'],
                                  ),
                                );
                                setState(() {});
                              },
                              title: Text(data['name']),
                              subtitle: Text(
                                '${data['addressLine1']}\n${data['addressLine2']}\n${data['city']}${data['state']}- ${data['zipcode']}',
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 2);
                        },
                        itemCount: state.addresses.length,
                      ),
                    );
                  },
                );
              },
            );
          },
          child: const Text(
            "Change To",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
