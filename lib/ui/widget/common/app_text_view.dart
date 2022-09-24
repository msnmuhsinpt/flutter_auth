import 'package:flutter/cupertino.dart';

import '../../../utils/app_color.dart';

Widget appTextView(
    {String name = "",
      double size = 15,
      int maxLines = 1,
      Color color = AppColor.black,
      bool isBold = false}) {
  return Text(
    name,
    style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
        color: color),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}