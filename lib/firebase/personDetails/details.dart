// import 'dart:math';
import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/presentation/auth/userSignup.dart';
// import 'package:head_x/presentation/auth/userSignup.dart';
import 'package:head_x/presentation/home/main_home.dart';

class AddingDetails {
  Future<void> detailsAdding() async {
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
        'personDetails': [],
      });
      try {
        String? name = FirebaseAuth.instance.currentUser!.displayName;
        final docData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        List<dynamic> details = docData.data()?['personDetails'] ?? [];
        log(globalFirstName.text);

        if (name == null || name.isEmpty) {
          log(globalFirstName.text);
          details.add({
            'firstname': globalFirstName.text,
            'lastname': globalLastName.text,
            'mobileno': globalMobileNumber.text,
            'mailid': userId,
            'photo': "",
          });
        } else {
          String forFirst = fromGoogleName.toString().split(" ")[0].trim();
          String forLast = fromGoogleName.toString().split(" ")[1].trim();
          details.add({
            "firstname": forFirst,
            "lastname": forLast,
            "mobileno": "Enter Your Mobile Number ",
            "mailid": userId,
            "photo": fromGooglePhoto
          });
        }
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'personDetails': details});
      } catch (e) {
        log(e.toString());
      }
    }
  }

  Future<void> toUpdateDetails(String photo, String firstName, String lastName,
      String mobileno, String user) async {
    List<dynamic> details = [];
    details.add({
      'firstname': firstName,
      'lastname': lastName,
      'mobileno': mobileno,
      'mailid': user,
      'photo': photo,
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'personDetails': details});
  }
}
