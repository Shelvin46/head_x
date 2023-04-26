// import 'dart:math';

// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/firebase/wishlist/wishlist_opreation.dart';

import '../../../main.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    Key? key,
    required this.index,
    required this.userId,
    required this.idOfAllproduct,
  }) : super(key: key);

  final String userId;
  final int index;
  final String idOfAllproduct;

  @override
  Widget build(BuildContext context) {
    // Dispatch a Checking event after the widget has been built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WishlistCheckingBloc>(context)
          .add(Checking(id: userId, idofMain: idOfAllproduct));
    });

    return BlocBuilder<WishlistCheckingBloc, WishlistCheckingState>(
      builder: (context, state) {
        final valuesOfEachCategory = state.valuesOfEachCategory;
        final wishlistProducts = state.valuesOfWishlist;

        final wishlistIndex = wishlistProducts.indexWhere((product) =>
            product['name'] == valuesOfEachCategory[index]['name']);

        if (wishlistIndex != -1) {
          return IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.blue,
              size: 38,
            ),
          );
        } else {
          return IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                barrierDismissible: false,
              );
              log(valuesOfEachCategory[index]['id']);

              // Add the product to the wishlist
              await WishlistOpreations()
                  .wishlistUpdate(valuesOfEachCategory[index], index, userId);

              BlocProvider.of<WishlistCheckingBloc>(context)
                  .add(Checking(id: userId, idofMain: idOfAllproduct));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.blue,
              size: 38,
            ),
          );
        }
      },
    );
  }
}
