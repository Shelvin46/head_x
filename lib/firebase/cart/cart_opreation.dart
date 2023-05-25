// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:head_x/presentation/splash_screen/splash_screen.dart';

import '../../application/cart_showing/cart_showing_bloc.dart';
// import '../../application/countof_cart/countof_cart_bloc.dart';
// import '../../presentation/categories/wireless_category/main_wireless.dart';/

class CartOperation {
  Future<void> cartAdding(Map<String, dynamic> vale, String userId,
      BuildContext context, int count) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    //  int  count = vale['count'] != null ? vale['count'].toInt() : 1;
    final CollectionReference userCollection = firestore.collection('users');
    final DocumentSnapshot userDoc = await userCollection.doc(userId).get();
    if (!userDoc.exists) {
      await userCollection.doc(userId).set({
        'wishlist': [],
        'cart': [],
        'recently': [],
        'address': [],
        'orders': [],
        'personDetails': []
      });
    }
    try {
      final docData =
          FirebaseFirestore.instance.collection('users').doc(userId);
      final docSnapshot = await docData.get();
      if (!docSnapshot.exists) {
        throw Exception("User document doesn't exist");
      }
      List<dynamic> cart = docSnapshot.data()?['cart']??[];
      final value = cart.where((element) => element['name'] == vale['name']);
      if (value.isNotEmpty) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Product is already Added'),
            duration: Duration(seconds: 2),
          ),
        );
        log(count.toString());
      } else {
        cart.add({'name': vale['name'], 'id': vale['id'], 'count': count});
        await docData.update({'cart': cart});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Product Added Successflully'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      log('Error adding item to cart: $e');
    }
  }

  Future<void> deletion(Map<String, dynamic> value) async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    List<dynamic> data = docData.data()?['cart'] ?? [];
    data.removeWhere((element) => element['name'] == value['name']);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'cart': data});
  }

  Future<List<Map<String, dynamic>>> get(String userId) async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    List<Map<String, dynamic>> cartProducts = [];
    for (var product in docData.data()?['cart'] ?? []) {
      final name = product['name'];
      final id = product['id'];
      final checking =
          await FirebaseFirestore.instance.collection('category').doc(id).get();
      for (var product in checking.data()?['product'] ?? []) {
        if (product['name'] == name) {
          cartProducts.add(product);
          break;
        }
      }
    }
    return cartProducts;
  }

  Future<void> incrementCount(
      Map<String, dynamic> product, BuildContext context) async {
    dynamic forCount =
        productDetails.where((element) => element['name'] == product['name']);
    Map<String, dynamic> data = {};
    for (var element in forCount) {
      data.addAll(element);
    }
    int quantity = data['quantity'];

    final docRef = FirebaseFirestore.instance.collection('users').doc(userId);
    final docSnapshot = await docRef.get();
    List<dynamic> cartProducts = docSnapshot.data()?['cart'] ?? [];
    final productIndex = cartProducts
        .indexWhere((element) => element['name'] == product['name']);
    log(productIndex.toString());
    if (productIndex >= 0 && cartProducts[productIndex]['count'] < quantity) {
      final updatedProduct = {
        'name': product['name'],
        'id': product['id'],
        'count': cartProducts[productIndex]['count'] + 1,
      };
      cartProducts[productIndex] = updatedProduct;
      await docRef.update({'cart': cartProducts});
    } else if (cartProducts[productIndex]['count'] >= quantity) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Icon(
              Icons.cancel_outlined,
              size: 180,
              color: Colors.red,
            ),
            content: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Out of Stock',
                style: TextStyle(fontSize: 30),
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> decrementCount(
      Map<String, dynamic> product, BuildContext context) async {
    final docRef = FirebaseFirestore.instance.collection('users').doc(userId);
    final docSnapshot = await docRef.get();
    List<dynamic> cartProducts = docSnapshot.data()?['cart'] ?? [];
    final productIndex = cartProducts
        .indexWhere((element) => element['name'] == product['name']);
    if (productIndex >= 0) {
      final updatedProduct = {
        'name': product['name'],
        'id': product['id'],
        'count': cartProducts[productIndex]['count'] - 1,
      };

      cartProducts[productIndex] = updatedProduct;
      await docRef.update({'cart': cartProducts});
    }
    if (cartProducts[productIndex]['count'] == 0) {
      cartProducts.removeAt(productIndex);
      await docRef.update({'cart': cartProducts});
      zeroDeletion(context);
    }
  }
}

Future<void> zeroDeletion(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  BlocProvider.of<CartShowingBloc>(context).add(CartgShowing());
  Navigator.pop(context);
}
