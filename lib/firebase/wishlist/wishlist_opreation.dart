import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

List<dynamic> listForWishlist = [];

class WishlistOpreations {
  Future<void> wishlistUpdate(Map<String, dynamic> vale, String userId) async {
    log(userId);
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
        'personDetails': []
      });
    }

    try {
      final docData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (docData.exists) {
        final List<dynamic> wishlist = docData.data()?['wishlist'] ?? [];
        wishlist.add({'name': vale['name'], 'id': vale['id']});
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'wishlist': wishlist});
      }
    } catch (e) {
      log('Error adding item to wishlist: $e');
    }
  }

  Future<void> detletion(
      Map<String, dynamic> vale, int index, String userId) async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    List<dynamic> data = docData.data()?['wishlist'] ?? [];
    data.removeWhere((element) => element['name'] == vale['name']);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'wishlist': data});
  }

  Future<List<Map<String, dynamic>>> get(String userId) async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final List<dynamic> eachData = docData.data()?['wishlist'] ?? [];
    List<Map<String, dynamic>> wishlistProducts = [];
    for (var element in eachData) {
      final name = element['name'];
      final id = element['id'];
      final checking =
          await FirebaseFirestore.instance.collection('category').doc(id).get();
      for (var product
          in (checking.data() as Map<String, dynamic>)['product']) {
        if (product['name'] == name) {  
          wishlistProducts.add(product);
          break;
        }
      }
    }
    return wishlistProducts;
  }
}
