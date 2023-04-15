import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth auth;
  FirebaseService({required this.auth});
  Future<void> signupWithEmail(
      {required String mail,
      required String password,
      required BuildContext context}) async {
    try {
      auth.createUserWithEmailAndPassword(email: mail, password: password);
      await sentEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(e.message),
      //     backgroundColor: Colors.blue,
      //   ),
      // );
    }
  }

  Future<void> sentEmailVerification(BuildContext context) async{
    try {
      auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verifiacation sent");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      content: Text(text),
    ),
  );
}
