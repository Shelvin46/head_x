import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';

class AddressAdding {
  Future<void> addressAdding(String name, String addressLine1,
      String addressLine2, String city, String state, int zipCode) async {
    //  int  count = vale['count'] != null ? vale['count'].toInt() : 1;
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
      List<dynamic> adresses = docData.data()?['address'] ?? [];
      if (docData.exists) {
        // log("Hii");
        adresses.add({
          'addressLine1': addressLine1,
          'addressLine2': addressLine2,
          'name': name,
          'city': city,
          'state': state,
          'zipcode': zipCode
        });
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'address': adresses});
    } catch (e) {
      log('Error adding item to wishlist: $e');
    }
  }
}
