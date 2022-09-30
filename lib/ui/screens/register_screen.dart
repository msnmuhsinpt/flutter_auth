import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/screens/login_screen.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../widget/common/app_text_view.dart';
import '../widget/common/common_widget.dart';
import '../widget/common/snack_bar.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignUpWidget(this.onClickedSignUp, {Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(icBg), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 180,
              height: screenHeight(context) - 180,
              width: screenWidth(context),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: registerUi(),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Sign Up Form
  Widget registerUi() {
    return Padding(
      padding: commonPaddingLR,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appTextView(
                name: "Register",
                isBold: true,
                size: 30,
                color: AppColor.green),
            dividerH(),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.lightGreen,
                //don't show limit
                labelText: 'Email',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // hintText: hintText,
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0.2, color: AppColor.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0.2, color: AppColor.green),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
            ),
            dividerSH(),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.lightGreen,
                //don't show limit
                labelText: 'Password',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // hintText: hintText,
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0.2, color: AppColor.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0.2, color: AppColor.green),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter min 6 character'
                  : null,
            ),
            dividerSH(),
            TextFormField(
              controller: conformPasswordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.lightGreen,
                //don't show limit
                labelText: 'Conform Password',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // hintText: hintText,
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0.2, color: AppColor.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0.2, color: AppColor.green),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter min 6 character'
                  : null,
            ),
            dividerH(),
            SizedBox(
              width: screenWidth(context) - 20,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: appTextView(
                    name: 'SignUp',
                    isBold: true,
                    color: AppColor.white,
                    size: 16),
                onPressed: () {
                  if (passwordController.text.toString() ==
                      conformPasswordController.text.toString()) {
                    validate();
                    AuthService().register(emailController.text.toString(),
                        passwordController.text.toString(), context);
                  } else {
                    Utils.showSnackBar('This password not same');
                  }
                },
              ),
            ),
            dividerSH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appTextView(name: 'I have an account?', isBold: true),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginWidget(widget.onClickedSignUp),
                      ),
                    );
                  },
                  child: appTextView(
                      name: 'Login', isBold: true, color: AppColor.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validate() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      return;
    }
  }
}
