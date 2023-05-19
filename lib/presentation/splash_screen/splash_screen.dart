// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:head_x/application/recently_products/recently_products_bloc.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:head_x/core/bottom_nav.dart';
import 'package:head_x/presentation/auth/userLogin.dart';
// import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import '../../application/wishlist_cheking/wishlist_checking_bloc.dart';


List<dynamic> productDetails = [];
List<Map<String, dynamic>> recentlyAllProducts = [];
List<dynamic> wishlistAllProducts = [];

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
   
    BlocProvider.of<SearchBlocBloc>(context).add(InitialSearch());
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
    productDetails = await get(); // all products
    // // all recentlu

    
    BlocProvider.of<WishlistCheckingBloc>(context)
        .add(SearchWishlist(wishlistProducts: wishlistAllProducts));

    await Future.delayed(const Duration(seconds: 3));
    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserLogin()),
      );
    }
  }
}
