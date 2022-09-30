import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/ui/screens/home_screen.dart';
import 'package:flutter_auth/ui/widget/common/app_appBar.dart';
import 'package:flutter_auth/ui/widget/common/app_text_view.dart';
import 'package:flutter_auth/ui/widget/common/common_widget.dart';
import 'package:flutter_auth/utils/app_color.dart';
import 'package:flutter_auth/utils/constant.dart';

import '../widget/common/snack_bar.dart';

class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({Key? key}) : super(key: key);

  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  bool isEmailVerify = false;
  bool canResentEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    //every 3 second check
    isEmailVerify = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerify) {
      sentEmailVerification();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (timer) => checkEmailVerify(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerify
        ? const HomeScreen()
        : Scaffold(
            appBar: AppAppBar(
              name: 'Verify Email',
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appTextView(
                      name: 'A verification emil sent to your email',
                      isBold: true,
                      color: AppColor.black),
                  dividerH(),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onPressed: () =>
                          canResentEmail ? sentEmailVerification() : null,
                      child: appTextView(
                          name: 'Resent Verification',
                          color: AppColor.white,
                          isBold: true),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      child: appTextView(
                          name: 'Cancel', color: AppColor.white, isBold: true),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  //sent email verification
  Future sentEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      //multiple click
      setState(() => canResentEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResentEmail = true);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  //check email verified
  Future checkEmailVerify() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerify = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerify) timer?.cancel();
  }
}
