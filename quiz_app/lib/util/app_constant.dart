import 'package:flutter/material.dart';

//image
String icClock = "assets/images/ic_clock.png";

//animation
String icVictory = "assets/lottie/victory.json";

//padding
EdgeInsets commonPaddingAll = const EdgeInsets.all(10);
EdgeInsets commonPaddingAll5 = const EdgeInsets.all(5);
EdgeInsets commonPaddingAll8 = const EdgeInsets.all(8);
EdgeInsets commonPaddingLR = const EdgeInsets.only(left: 10, right: 10);
EdgeInsets commonPaddingTB = const EdgeInsets.only(top: 10, bottom: 10);
EdgeInsets commonPaddingTB5 = const EdgeInsets.only(top: 5, bottom: 5);
EdgeInsets commonPaddingLR5 = const EdgeInsets.only(left: 5, right: 5);

//sizes
double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

//divider

Widget dividerH() {
  return const SizedBox(height: 20);
}

Widget dividerSH() {
  return const SizedBox(height: 8);
}

Widget dividerSW() {
  return const SizedBox(width: 8);
}

Widget dividerSSW() {
  return const SizedBox(width: 3);
}

Widget dividerW() {
  return const SizedBox(width: 20);
}
