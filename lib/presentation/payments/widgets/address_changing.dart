// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/profile/addresses/widgets/select_address.dart';

class AdressChanging extends StatelessWidget {
  const AdressChanging({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Deliver to", style: addressName),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return   AddressSelecting();
              },
            ));
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
