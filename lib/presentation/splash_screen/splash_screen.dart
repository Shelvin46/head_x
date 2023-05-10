import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/recently_products/recently_products_bloc.dart';
import 'package:head_x/core/bottom_nav.dart';
import 'package:head_x/presentation/auth/userLogin.dart';

class SplahScrenn extends StatefulWidget {
  const SplahScrenn({super.key});

  @override
  State<SplahScrenn> createState() => _SplahScrennState();
}

class _SplahScrennState extends State<SplahScrenn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    checkingTheUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecentlyProductsBloc>(context).add(InitialRecently());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage('assets/logo.png'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> checkingTheUser() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = _auth.currentUser;
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserLogin()),
      );
    }
  }
}
