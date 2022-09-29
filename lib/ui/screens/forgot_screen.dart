import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/widget/common/app_text_view.dart';
import 'package:flutter_auth/ui/widget/common/common_widget.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appTextView(name: 'Receive an Email to', size: 18, isBold: true),
            appTextView(name: 'Reset your password', size: 18, isBold: true),
            const SizedBox(height: 50),
            SizedBox(
              width: screenWidth(context) - 20,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.white,
                  //don't show limit
                  labelText: 'Email',
                  labelStyle:
                      const TextStyle(fontSize: 15, color: Colors.black),
                  // hintText: hintText,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: AppColor.hash),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: AppColor.hash),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
            ),
            dividerH(),
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
                    name: 'Reset Password',
                    isBold: true,
                    color: AppColor.white,
                    size: 16),
                onPressed: () {
                  AuthService()
                      .resetPassword(emailController.text.toString(), context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
