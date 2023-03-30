import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class PaymentOne extends StatelessWidget {
  const PaymentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child:
              AppBarWidget(title: "Payments", appbarColor: Color(0xFF3A72DD))),
      body: Column(
        children: [
          paymentOneGap1,
          Center(
            child: Text(
              "Select Your Payment Methods",
              style: paymentOneText1,
            ),
          ),
          paymentOneGap1,
          Row(
            children: [
              paymentOneGap2,
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
              ),
              Container(
                height: 30,
                width: 200,
                child: Text(
                  "UPI",
                  style: paymentOneText1,
                ),
              )
            ],
          ),
          paymentOneGap1,
          Row(
            children: [
              paymentOneGap2,
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: 2,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 30,
                width: 250,
                child: Text(
                  "Credit/Debit Cards",
                  style: paymentOneText1,
                ),
              )
            ],
          ),
          paymentOneGap1,
          Row(
            children: [
              paymentOneGap2,
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: 2,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 30,
                width: 250,
                child: Text(
                  "RazorPay",
                  style: paymentOneText1,
                ),
              )
            ],
          ),
          paymentOneGap1,
          Row(
            children: [
              paymentOneGap2,
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: 2,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 30,
                width: 250,
                child: Text(
                  "Cash on Delivery",
                  style: paymentOneText1,
                ),
              )
            ],
          ),
          paymentOneGap1,
          Center(
            child: Container(
              width: 180,
              height: 50,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Continue",
                  style: paymentOneText2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
