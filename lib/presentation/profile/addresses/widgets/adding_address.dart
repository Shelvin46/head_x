// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/firebase/address/add_address.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../../../application/address_showing/address_showing_bloc.dart';

class AddressAddingPage extends StatelessWidget {
  const AddressAddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController addressLine1 = TextEditingController();
    TextEditingController addressLine2 = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController code = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "Add Address", appbarColor: Color(0xFFDE40C5))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: addressLine1,
                  decoration: const InputDecoration(
                    labelText: 'Address Line 1',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: addressLine2,
                  decoration: const InputDecoration(
                    labelText: 'Address Line 2',
                  ),
                ),
                TextFormField(
                  controller: city,
                  decoration: const InputDecoration(
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: state,
                  decoration: const InputDecoration(
                    labelText: 'State',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: code,
                  decoration: const InputDecoration(
                    labelText: 'Zip Code',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zip code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      await AddressAdding().addressAdding(
                          name.text,
                          addressLine1.text,
                          addressLine2.text,
                          city.text,
                          state.text,
                          int.parse(code.text));
                      BlocProvider.of<AddressShowingBloc>(context)
                          .add(InitializeAddress());

                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 //Name
//line 1 flat number house name,
//line 2 post name, city
//line 3 district, state - pin code 
