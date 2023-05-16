import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';

class OrdersListing {
  Future<void> ordersAdding(List<dynamic> products) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference userCollection = firestore.collection('users');
    final DocumentSnapshot userDoc = await userCollection.doc(userId).get();
    if (!userDoc.exists) {
      await userCollection.doc(userId).set({
        'wishlist': [],
        'cart': [],
        'recently': [],
        'address': [],
        'orders': [],
      });
    }
    try {
      log("bdsfbdfs");
      final docData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (docData.exists) {
        final List<dynamic> orders = docData.data()?['orders'] ?? [];
        for (var product in products) {
          // log(product.toString());
          // log(products.toString());
          orders.add({
            'name': product['name'],
            'id': product['id'],
            'addressName': product['addressName'],
            'remaining': product['remaining'],
            'count': product['count'] ?? 1
          });
        }
        // orderr
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'orders': orders});
      }
    } catch (e) {
      log('Error adding item to recently: $e');
    }
  }
}
