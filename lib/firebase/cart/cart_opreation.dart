import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/categories/wireless_category/main_wireless.dart';

class CartOperation {
  Future<void> cartAdding(Map<String, dynamic> vale, String userId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference userCollection = firestore.collection('users');
    final DocumentSnapshot userDoc = await userCollection.doc(userId).get();
    if (!userDoc.exists) {
      await userCollection.doc(userId).set({'wishlist': [], 'cart': []});
    }
    try {
      final docData =
          FirebaseFirestore.instance.collection('users').doc(userId);
      final docSnapshot = await docData.get();
      if (!docSnapshot.exists) {
        throw Exception("User document doesn't exist");
      }
      List<dynamic> cart = docSnapshot.data()?['cart'];
      cart.add({'name': vale['name'], 'id': vale['id']});
      await docData.update({'cart': cart});
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
    for (var product in docData.data()?['cart']) {
      final name = product['name'];
      final id = product['id'];
      final checking =
          await FirebaseFirestore.instance.collection('category').doc(id).get();
      for (var product in checking.data()?['product']) {
        if (product['name'] == name) {
          cartProducts.add(product);
          break;
        }
      }
    }
    return cartProducts;
  }
}
