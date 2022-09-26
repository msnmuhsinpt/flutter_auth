import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/screens/forgot_screen.dart';
import 'package:flutter_auth/ui/widget/common/app_text_field.dart';
import 'package:flutter_auth/ui/widget/common/app_text_view.dart';
import 'package:flutter_auth/ui/widget/common/common_widget.dart';
import 'package:flutter_auth/utils/app_color.dart';
import 'package:flutter_auth/utils/constant.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget(this.onClickedSignUp, {Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: commonPaddingLR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginUi(),
          ],
        ),
      ),
    );
  }

  //login UI
  Widget loginUi() {
    return Column(
      children: [
        appTextView(
          name: 'Login',
          size: 20,
          isBold: true,
        ),
        const SizedBox(height: 50),
        AppTextField(
          controller: emailController,
          hintText: 'Email',
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
        ),
        dividerSH(),
        AppTextField(
          controller: passwordController,
          hintText: 'Password',
          inputType: TextInputType.visiblePassword,
          inputAction: TextInputAction.done,
        ),
        //forgot button
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgotPage(),),
              );
            },
            child:
                appTextView(name: 'Forgot Password', color: AppColor.lightBlue),
          ),
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
                name: 'Login', isBold: true, color: AppColor.white, size: 16),
            onPressed: () {
              AuthService().sign(
                emailController.text.toString(),
                passwordController.text.toString(),
              );
            },
          ),
        ),
        dividerSH(),
        RichText(
          text: TextSpan(
              text: 'Don' 't have an account?  ',
              style: const TextStyle(color: AppColor.black),
              children: [
                TextSpan(
                  //multiple tap
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text: 'Sign Up',
                  style: const TextStyle(
                      color: AppColor.lightBlue, fontWeight: FontWeight.bold),
                )
              ]),
        )
      ],
    );
  }
}
