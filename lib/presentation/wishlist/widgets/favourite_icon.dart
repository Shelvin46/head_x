// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/firebase/wishlist/wishlist_opreation.dart';

import '../../../application/product_list/product_list_bloc.dart';

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
    return BlocBuilder<WishlistCheckingBloc, WishlistCheckingState>(
      builder: (context, state) {
        final valuesOfEachCategory = state.valuesOfEachCategory;
        final wishlistProducts = state.valuesOfWishlist;

        final wishlistIndex = wishlistProducts.indexWhere((product) =>
            product['name'] == valuesOfEachCategory[index]['name']);
        // log(wishlistIndex.toString());
        if (wishlistIndex != -1) {
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
              await WishlistOpreations()
                  .detletion(valuesOfEachCategory[index], index, userId);
              BlocProvider.of<WishlistCheckingBloc>(context)
                  .add(Checking(id: userId, idofMain: idOfAllproduct));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Product Deleted Successflully'),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.pop(context);
            },
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

              await WishlistOpreations()
                  .wishlistUpdate(valuesOfEachCategory[index], userId);
              // BlocProvider.of<WishlistListingBloc>(context)
              //     .add(InitializeWishlist());
              BlocProvider.of<WishlistCheckingBloc>(context)
                  .add(Checking(id: userId, idofMain: idOfAllproduct));

              // BlocProvider.of<WishlistCheckingBloc>(context)
              //     .add(Checking(id: userId, idofMain: idOfAllproduct));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Product Added Successflully'),
                  duration: Duration(seconds: 2),
                ),
              );

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
