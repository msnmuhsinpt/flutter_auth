import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import 'app_text_view.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  String name;

  AppAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: AppBar(
        centerTitle: true,
        title: appTextView(
            name: name, color: AppColor.white, isBold: true, size: 18),
        leading: Container(),
        backgroundColor: AppColor.lightRed,
        elevation: 0,
      ),
    );
  }
}
