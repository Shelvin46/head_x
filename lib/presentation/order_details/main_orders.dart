import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/order_details/order_details_bloc.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/order_details/main_order_details.dart';
// import 'package:head_x/presentation/product_details/product_details.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../core/uiConstWidget.dart';

class MainOrders extends StatelessWidget {
  const MainOrders({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<OrderDetailsBloc>(context).add(InitializeDetails());
    });
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
                title: "My Orders", appbarColor: Color(0xFF798BE7))),
        body: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.orderDetails.isEmpty) {
              return const Center(
                child: Text("No Ordered Products"),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  final data = state.orderDetails[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MainOrderDetails(
                            count: data['count'],
                            name: data['addressName'],
                            pname: data['name'],
                            price: data['price'],
                            remaining: data['remaining'],
                            image: data['image'],
                            total: data['price'] * data['count'],
                            index: index,
                          );
                        },
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: myMediaQueryData.size.height * 0.150,
                                width: myMediaQueryData.size.width * 0.320,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data['image']),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: myMediaQueryData.size.width * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['status'].toString(),
                                    style: mainTitle,
                                  ),
                                  Text(
                                      "Your order for ${data['name']}\nsuccessfully placed tab here for\nmore details"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return notiLine;
                },
                itemCount: state.orderDetails.length);
          },
        ));
  }
}
