import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../widget/common/app_text_view.dart';
import '../widget/common/common_widget.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignUpWidget(this.onClickedSignUp, {Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          registerUi(),
        ],
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
            appTextView(name: "Register", isBold: true, size: 20),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.white,
                //don't show limit
                labelText: 'Email',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // hintText: hintText,
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: AppColor.hash),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: AppColor.hash),
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
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.white,
                //don't show limit
                labelText: 'Password',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // hintText: hintText,
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: AppColor.hash),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: AppColor.hash),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter min 6 character'
                  : null,
            ),
            dividerSH(),
            SizedBox(
              width: screenWidth(context) - 20,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
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
                  validate();
                    AuthService().register(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                  );
                },
              ),
            ),
            dividerSH(),
            RichText(
              text: TextSpan(
                  text: 'I have an account ?  ',
                  style: const TextStyle(color: AppColor.black),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Login',
                      style: const TextStyle(
                          color: AppColor.lightBlue,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
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
