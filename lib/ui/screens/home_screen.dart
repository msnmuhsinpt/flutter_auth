import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/ui/widget/common/app_text_view.dart';
import 'package:flutter_auth/utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: appTextView(
            name: 'Home', isBold: true, size: 18, color: AppColor.white),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              sighOut();
            },
            child:
                appTextView(name: 'Sign Out', size: 16, color: AppColor.white),
          ),
        ],
        backgroundColor: AppColor.lightRed,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appTextView(name: user!.email.toString(), isBold: true),
            appTextView(
              name: user!.uid.toString(),
            ),
          ],
        ),
      ),
    );
  }

  void sighOut() {
    FirebaseAuth.instance.signOut();
  }
}
