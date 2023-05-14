// import 'package:flutter/material.dart';
// import 'package:head_x/core/uiConstWidget.dart';
// import 'package:head_x/main.dart';
// import 'package:head_x/presentation/widgets/app_bar_widget.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class PaymentOne extends StatefulWidget {
//   const PaymentOne({super.key});

//   @override
//   State<PaymentOne> createState() => _PaymentOneState();
// }
  
// class _PaymentOneState extends State<PaymentOne> {
//   final _razorpay = Razorpay();
//   @override
//   void initState() {
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
// _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
// _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   })
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: AppBarWidget(
//           title: "Payments",
//           appbarColor: Color(0xFF3A72DD),
//         ),
//       ),
//       body: Column(
//         children: [
//           paymentOneGap1,
//           Center(
//             child: Text(
//               "Select Your Payment Methods",
//               style: paymentOneText1,
//             ),
//           ),
//           paymentOneGap1,
//           Row(
//             children: [
//               paymentOneGap2,
//               Transform.scale(
//                 scale: 1.5,
//                 child: Radio(
//                   value: 1,
//                   groupValue: 1,
//                   onChanged: (value) {},
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//                 width: 200,
//                 child: Text(
//                   "UPI",
//                   style: paymentOneText1,
//                 ),
//               )
//             ],
//           ),
//           paymentOneGap1,
//           Row(
//             children: [
//               paymentOneGap2,
//               Transform.scale(
//                 scale: 1.5,
//                 child: Radio(
//                   value: 2,
//                   groupValue: 1,
//                   onChanged: (value) {},
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//                 width: 250,
//                 child: Text(
//                   "Credit/Debit Cards",
//                   style: paymentOneText1,
//                 ),
//               )
//             ],
//           ),
//           paymentOneGap1,
//           Row(
//             children: [
//               paymentOneGap2,
//               Transform.scale(
//                 scale: 1.5,
//                 child: Radio(
//                   value: 2,
//                   groupValue: 1,
//                   onChanged: (value) {},
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//                 width: 250,
//                 child: Text(
//                   "RazorPay",
//                   style: paymentOneText1,
//                 ),
//               )
//             ],
//           ),
//           paymentOneGap1,
//           Row(
//             children: [
//               paymentOneGap2,
//               Transform.scale(
//                 scale: 1.5,
//                 child: Radio(
//                   value: 2,
//                   groupValue: 1,
//                   onChanged: (value) {},
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//                 width: 250,
//                 child: Text(
//                   "Cash on Delivery",
//                   style: paymentOneText1,
//                 ),
//               )
//             ],
//           ),
//           paymentOneGap1,
//           SizedBox(
//             height: myMediaQueryData.size.height * 0.04,
//           ),
//           Center(
//             child: Container(
//               width: 180,
//               height: 50,
//               color: Colors.blue,
//               child: Center(
//                 child: Text(
//                   "Continue",
//                   style: paymentOneText2,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
