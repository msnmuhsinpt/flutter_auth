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
      resizeToAvoidBottomInset: true,
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
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: commonPaddingLR,
                  child: loginUi(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //login UI
  Widget loginUi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        dividerH(),
        appTextView(
            name: 'Welcome Back',
            color: AppColor.green,
            size: 30,
            isBold: true),
        appTextView(
            name: 'Login to your account',
            color: AppColor.green,
            size: 15,
            isBold: true),
        dividerH(),
        AppTextField(
          controller: emailController,
          hintText: 'Email',
          color: AppColor.lightGreen,
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
        ),
        dividerSH(),
        AppTextField(
          controller: passwordController,
          hintText: 'Password',
          color: AppColor.lightGreen,
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
                MaterialPageRoute(
                  builder: (context) => const ForgotPage(),
                ),
              );
            },
            child: appTextView(name: 'Forgot Password', color: AppColor.green),
          ),
        ),
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
                name: 'Login', isBold: true, color: AppColor.white, size: 16),
            onPressed: () {
              AuthService().sign(emailController.text.toString(),
                  passwordController.text.toString(), context);
            },
          ),
        ),
        dividerSH(),
        Row(children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10, left: 25),
              child: const Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
            ),
          ),
          const Text('or continue with'),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(right: 25, left: 10),
                child: const Divider(
                  thickness: 0.2,
                  color: AppColor.black,
                )),
          ),
        ]),
        dividerSH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 50,
              child: Card(
                color: AppColor.lightGreen,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(width: 0.2, color: AppColor.green),
                ),
                child: Padding(
                  padding: commonPaddingAll5,
                  child: Image.asset(icGoogle, fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Card(
                color: AppColor.lightGreen,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(width: 0.2, color: AppColor.green),
                ),
                child: Padding(
                  padding: commonPaddingAll5,
                  child: Image.asset(icApple, fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Card(
                color: AppColor.lightGreen,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(width: 0.2, color: AppColor.green),
                ),
                child: Padding(
                  padding: commonPaddingAll5,
                  child: Image.asset(icAnon, fit: BoxFit.cover),
                ),
              ),
            ),

          ],
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
        ),
        dividerSH(),
      ],
    );
  }
}
