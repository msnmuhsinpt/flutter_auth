import 'package:flutter/material.dart';

//image
String icBg = 'assets/images/bgImage.jpg';
String icGoogle = 'assets/images/ic_google.png';
String icApple = 'assets/images/ic_apple.png';
String icAnon = 'assets/images/ic_guest.png';

//screen size
double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

// padding size
EdgeInsets commonPaddingAll = const EdgeInsets.all(10);
EdgeInsets commonPaddingAll5 = const EdgeInsets.all(5);
EdgeInsets commonPaddingLR = const EdgeInsets.only(left: 10, right: 10);
EdgeInsets commonPaddingTB = const EdgeInsets.only(top: 10, bottom: 10);
EdgeInsets commonPaddingTB5 = const EdgeInsets.only(top: 5, bottom: 5);
EdgeInsets commonPaddingLR5 = const EdgeInsets.only(left: 5, right: 5);
