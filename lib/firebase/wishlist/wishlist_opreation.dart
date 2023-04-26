import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistOpreations {
  Future<void> wishlistUpdate(
      Map<String, dynamic> vale, int index, String userId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference userCollection = firestore.collection('users');
    final DocumentSnapshot userDoc = await userCollection.doc(userId).get();
    if (!userDoc.exists) {
      await userCollection.doc(userId).set({
        'wishlist': [],
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

  // Future<List> get(String userId) async {
  //   final docData =
  //       await FirebaseFirestore.instance.collection('users').doc(userId).get();
  //   // log((docData.data() as Map<String, dynamic>)['wishlist'].toString());
  //   final eachData = (docData.data() as Map<String, dynamic>)['wishlist'];
  //   for (var element in eachData) {
  //     // log(element.toString());
  //     final name = element['name'];
  //     final id = element['id'];
  //     print(name);
  //     final checking =
  //         await FirebaseFirestore.instance.collection('category').doc(id).get();

  //     for (var element
  //         in (checking.data() as Map<String, dynamic>)['product']) {
  //       if (element['name'] == name) {
  //         print(element);
  //       }
  //     }

  //     // print((checking.data() as Map<String, dynamic>)['product'][0]['name'] == name);
  //   }
  // }
}
