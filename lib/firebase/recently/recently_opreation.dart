import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';

class RecentlyOpreation {
  Future<void> recentlyAdding(Map<String, dynamic> vale) async {
    // log(userId);
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference userCollection = firestore.collection('users');
    final DocumentSnapshot userDoc = await userCollection.doc(userId).get();
    if (!userDoc.exists) {
      await userCollection.doc(userId).set({
        'wishlist': [],
        'cart': [],
        'recently': [],
        'address': [],
        'orders': []
      });
    }
    try {
      final docData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (docData.exists) {
        final List<dynamic> recently = docData.data()?['recently'] ?? [];
        final value =
            recently.where((element) => element['name'] == vale['name']);
        if (value.isNotEmpty) {
          return;
        } else {
          recently.add({'name': vale['name'], 'id': vale['id']});
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({'recently': recently});
        }
      }
    } catch (e) {
      log('Error adding item to recently: $e');
    }
  }

  Future<List<Map<String, dynamic>>> recentlyGet() async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    List<Map<String, dynamic>> recentlyProducts = [];

    for (var products in docData.data()?['recently'] ?? []) {
      final name = products['name'];
      final id = products['id'];
      final docDataMain =
          await FirebaseFirestore.instance.collection('category').doc(id).get();
      for (var mainProduct in docDataMain.data()?['product'] ?? []) {
        if (mainProduct['name'] == name) {
          recentlyProducts.add(mainProduct);
          break;
        }
      }
    }
    return recentlyProducts;
  }
}
