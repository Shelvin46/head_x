import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';

BoxDecoration loginContainer = const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        "assets/logo.png",
      ),
      fit: BoxFit.fill,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)));
SizedBox loginPageGap1 = SizedBox(
  height: myMediaQueryData.size.height * 0.1,
  width: myMediaQueryData.size.width * 10,
);
SizedBox loginPageGap2 = SizedBox(
  height: myMediaQueryData.size.height * 0.03,
);
SizedBox loginPageGap4 = SizedBox(
  height: myMediaQueryData.size.height * 0.05,
);
BoxDecoration textformRadius = BoxDecoration(
    color: textFormCl,
    borderRadius: const BorderRadius.all(Radius.circular(8)));
TextStyle labelColor = const TextStyle(color: Colors.white);
SizedBox loginPageGap3 = SizedBox(
  height: myMediaQueryData.size.height * 0.02,
);
Text fPassword = const Text(
  "Forgot Password?",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
);

Text submitButton = const Text(
  "SUBMIT",
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
);
Text createAcc = const Text(
  "Dont havean account ?",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

    // color: Colors.blue,
  ),
);
Text createButton = const Text(
  "Create",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
);

// <-------------------------------------------------------------------------------------Login Page------------------------------------------------------------------------------------------------>
IconButton bacakArrow = IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.arrow_back,
      size: 35,
      color: Colors.black,
    ));
Text signupText = const Text(
  "Create Account",
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
);
SizedBox createGap = SizedBox(
  height: myMediaQueryData.size.height * 0.04,
);
BoxDecoration stextformRadius = BoxDecoration(
    color: createColor,
    borderRadius: const BorderRadius.all(Radius.circular(8)));
Text csubmitButton = const Text(
  "SUBMIT",
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
);
SizedBox homePageGap1 = SizedBox(
  height: myMediaQueryData.size.height * 0.01,
);
Container homePageLogo = Container(
  width: 50,
  height: 50,
  decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/logo.png"), fit: BoxFit.fill)),
);
SizedBox gap = SizedBox(
  width: myMediaQueryData.size.width * 0.090,
);
Text heading = const Text(
  "Welcome to Head -X",
  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
);
SizedBox homePageGap2 = SizedBox(
  height: myMediaQueryData.size.height * 0.008,
);
Text recentText = const Text(
  "Recently Viewed",
  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
);
SizedBox gap2 = SizedBox(
  width: myMediaQueryData.size.width * 0.020,
);
SizedBox lstviewGap = SizedBox(
  height: myMediaQueryData.size.height * 0.01,
);
Text trendingText = const Text(
  "Trending Products",
  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
);
// <-------------------------------------------------------------------MainHome---------------------------------------------------------------------------------------------------------------->
TextStyle catSection = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  // fontStyle: FontStyle.italic,
  fontSize: 28,
);
//<------------------------------------------------------------------Category--------------------------------------------------------------------------------------------------------------------------->
SizedBox notiGap = SizedBox(
  height: myMediaQueryData.size.height * 0.02,
  width: myMediaQueryData.size.width * 0.7,
);
BoxDecoration notiDec1 = const BoxDecoration(
  color: Color.fromARGB(255, 197, 197, 208),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);
Divider notiLine = const Divider(
  color: Colors.black45,
);
Text notiText = const Text(
  "All",
  textAlign: TextAlign.center,
  style: TextStyle(color: Colors.blue),
);
TextStyle mainTitle = const TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
//<--------------------------------------------------------------------Notifications---------------------------------------------------------------------------------------------------------------------->
TextStyle accSection = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  // fontStyle: FontStyle.italic,
  fontSize: 28,
);
SizedBox accGap1 = SizedBox(
  height: myMediaQueryData.size.height * 0.008,
);
SizedBox accGap2 = SizedBox(
  //width: myMediaQueryData.size.width * 0.05,
  height: myMediaQueryData.size.height * 0.1,
);
BoxDecoration accDec = BoxDecoration(
    borderRadius: BorderRadius.circular(7),
    border: Border.all(color: Colors.black));
TextStyle accText1 = const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
TextStyle accText2 = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
TextStyle accText = const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
TextStyle logStyle = const TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
//<----------------------------------------------------------------------Account--------------------------------------------------------------------------------------------------------------------------->
SizedBox cartGap = SizedBox(
  height: myMediaQueryData.size.height * 0.02,
);
EdgeInsets cartPadding = EdgeInsets.fromLTRB(myMediaQueryData.size.width * 0.01,
    0, 0, myMediaQueryData.size.height * 0.001);
TextStyle ratingStyle = TextStyle(color: cartStar);
Icon starIcon = Icon(
  Icons.star,
  color: cartStar,
  size: 12,
);
SizedBox cartGap2 = SizedBox(
  height: myMediaQueryData.size.height * 0.01,
);
TextStyle priceStyle =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
TextStyle productName =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
EdgeInsets deletePadding =
    EdgeInsets.only(left: myMediaQueryData.size.width * 0.3);
Icon deleteIcon = const Icon(
  Icons.delete,
  size: 37,
  color: Color.fromARGB(255, 234, 150, 225),
);
TextStyle checkOut = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30,
);
//<-----------------------------------------------------------------------Cart------------------------------------------------------------------------------------------------------------------------------------->
SizedBox productGap1 = SizedBox(
  height: myMediaQueryData.size.height * 0.02,
);
BoxDecoration productMainimage = const BoxDecoration(
    image: DecorationImage(
        fit: BoxFit.fill, image: AssetImage("assets/classic -2.jpeg")));
SizedBox productGap2 = SizedBox(
  height: myMediaQueryData.size.height * 0.01,
);
TextStyle productTitileStyle =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
TextStyle productPriceStyle =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26);
//<------------------------------------------------------------------------Product Details--------------------------------------------------------------------------------------------------------------------------------->

TextStyle orderDetailText1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
SizedBox orderGap1 = SizedBox(
  width: myMediaQueryData.size.width * 0.05,
  height: myMediaQueryData.size.height * 0.140,
);
SizedBox orderGap2 = SizedBox(
  width: myMediaQueryData.size.width * 0.2,
);
TextStyle orderPrice = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);
SizedBox orderGap3 = SizedBox(
  height: myMediaQueryData.size.height * 0.02,
);
SizedBox orderGap4 = SizedBox(
  width: myMediaQueryData.size.width * 0.04,
);
TextStyle orderStatus = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 23,
);
TextStyle cancelOrder = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
//<------------------------------------------------------------------------Order Details----------------------------------------------------------------------------------------------------------------------------------->