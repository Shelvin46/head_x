// import 'dart:ui';
// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/cart_showing/cart_showing_bloc.dart';
import 'package:head_x/application/countof_cart/countof_cart_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/product_details/product_details.dart';
import 'package:head_x/presentation/profile/addresses/widgets/select_address.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:lottie/lottie.dart';

import '../../application/address_showing/address_showing_bloc.dart';
// import '../../application/order_summary/order_summary_bloc.dart';

// import 'package:razorpay_flutter/razorpay_flutter.dart';.

class MainCart extends StatelessWidget {
  const MainCart({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // BlocProvider.of<CartShowingBloc>(context).add(event)
      BlocProvider.of<CartShowingBloc>(context).add(CartgShowing());
      BlocProvider.of<ProductListBloc>(context).add(CartDetails());
      BlocProvider.of<AddressShowingBloc>(context).add(InitializeAddress());
    });

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child:
              AppBarWidget(title: "My Cart", appbarColor: Color(0xFF7AABA8))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cartbacColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cartGap,
            BlocBuilder<CartShowingBloc, CartShowingState>(
              builder: (context, state) {
                // int forCount = state.count;
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.cartValues.isEmpty) {
                  return const Center(
                    child: Text('Please Add any items into Cart'),
                  );
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      // shrinkWrap: true,
                      itemCount: state.cartValues.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        mainAxisSpacing: 30.0, // Spacing between rows
                        crossAxisSpacing: 10.0,
                        mainAxisExtent: 290,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final data = state.cartValues[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return MainProductDetails(
                                  id: data['id'],
                                  index: index,
                                  checking: 'normal',
                                );
                              },
                            ));
                            BlocProvider.of<ProductListBloc>(context)
                                .add(CartDetails());
                            BlocProvider.of<WishlistCheckingBloc>(context)
                                .add(CartWishlistChecking());
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: myMediaQueryData.size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  data['images'][0]))),
                                    )
                                  ],
                                ),
                                cartGap2,
                                Row(
                                  children: [
                                    SizedBox(
                                      width: myMediaQueryData.size.width * 0.01,
                                    ),
                                    Text(
                                      '\u20B9${data['price'].toString()}',
                                      style: priceStyle,
                                    ),
                                    const Spacer(),
                                    BlocBuilder<CountofCartBloc,
                                        CountofCartState>(
                                      builder: (context, state) {
                                        final count = state.cartProducts[index];
                                        return Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await CartOperation()
                                                    .decrementCount(
                                                        data, context);

                                                BlocProvider.of<
                                                            CountofCartBloc>(
                                                        context)
                                                    .add(InitializeCount());
                                                BlocProvider.of<
                                                            CartShowingBloc>(
                                                        context)
                                                    .add(CartgShowing());
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                color: decrement,
                                                child: const Center(
                                                    child: Text("-")),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              color: productCount,
                                              child: Center(
                                                  child: Text(
                                                count['count'].toString(),
                                                style: TextStyle(
                                                    color: countColor),
                                              )),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await CartOperation()
                                                    .incrementCount(
                                                        data, context);

                                                BlocProvider.of<
                                                            CountofCartBloc>(
                                                        context)
                                                    .add(InitializeCount());
                                                BlocProvider.of<
                                                            CartShowingBloc>(
                                                        context)
                                                    .add(CartgShowing());
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                color: catbarColor,
                                                child: const Center(
                                                    child: Text("+")),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  data['name'],
                                  style: productName,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: deletePadding,
                                  child: InkWell(
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                          barrierDismissible: false,
                                        );
                                        await CartOperation().deletion(data);
                                        BlocProvider.of<CartShowingBloc>(
                                                context)
                                            .add(CartgShowing());
                                        Navigator.pop(context);
                                      },
                                      child: deleteIcon),
                                )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: BlocBuilder<CartShowingBloc, CartShowingState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.cartValues.isNotEmpty) {
            int index = 0;
            String name = "";
            String remaining = "";

            return InkWell(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const AddressSelecting(
                      checking: 'fromCart',
                      eachProduct: [],
                    );
                  },
                ));
              },
              child: Container(
                width: double.infinity,
                height: 60,
                color: Color(0xFF7AABA8),
                child: Center(
                    child: Text(
                  "Check Out",
                  style: checkOut,
                )),
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/4496-empty-cart.json'),
                const Text(
                  'Please Add any items into Cart',
                  style: emptyStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
