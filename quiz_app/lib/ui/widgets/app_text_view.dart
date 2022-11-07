import 'package:flutter/material.dart';

import '../../util/app_color.dart';

Widget appTextView(
    {String name = "",
    double size = 15,
    int maxLines = 1,
    Color color = AppColor.kBlack,
    bool isBold = false}) {
  return Text(
    name,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
        color: color),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}
