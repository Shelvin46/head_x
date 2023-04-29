// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/cart_showing/cart_showing_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainCart extends StatelessWidget {
  const MainCart({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CartShowingBloc>(context).add(CartgShowing());
    });
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "My Cart", appbarColor: catbarColor)),
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
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisExtent: 290,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final data = state.cartValues[index];
                        return Container(
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
                                            fit: BoxFit.contain,
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
                                    data['price'].toString(),
                                    style: priceStyle,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: decrement,
                                        child: const Center(child: Text("-")),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: productCount,
                                        child: Center(
                                            child: Text(
                                          "1",
                                          style: TextStyle(color: countColor),
                                        )),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: catbarColor,
                                        child: const Center(child: Text("+")),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                data['name'].toString(),
                                style: productName,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: deletePadding,
                                child: deleteIcon,
                              )),
                            ],
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
      bottomSheet: Container(
        width: double.infinity,
        height: 60,
        color: catbarColor,
        child: Center(
            child: Text(
          "Check Out",
          style: checkOut,
        )),
      ),
    );
  }
}
