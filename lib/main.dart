import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_selecting/address_selecting_bloc.dart';
import 'package:head_x/application/address_showing/address_showing_bloc.dart';
import 'package:head_x/application/all_products/all_products_bloc.dart';
import 'package:head_x/application/cart_showing/cart_showing_bloc.dart';
import 'package:head_x/application/countof_cart/countof_cart_bloc.dart';
import 'package:head_x/application/details_checking/details_checking_bloc.dart';
import 'package:head_x/application/indicator_bloc/indicator_bloc_bloc.dart';
import 'package:head_x/application/order_details/order_details_bloc.dart';
import 'package:head_x/application/order_summary/order_summary_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/recently_products/recently_products_bloc.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';
// import 'package:head_x/presentation/auth/userLogin.dart';
import 'package:head_x/presentation/splash_screen/splash_screen.dart';

late MediaQueryData myMediaQueryData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  myMediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductListBloc(),
        ),
        BlocProvider(
          create: (context) {
            return IndicatorBlocBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return WishlistCheckingBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return WishlistListingBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return CartShowingBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return CountofCartBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return OrderSummaryBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return SearchBlocBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return AllProductsBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return RecentlyProductsBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return AddressShowingBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return AddressSelectingBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return OrderDetailsBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return DetailsCheckingBloc();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const SplahScrenn(),
      ),
    );
  }
}
