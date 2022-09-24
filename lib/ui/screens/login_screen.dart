import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/screens/home_screen.dart';
import 'package:flutter_auth/ui/screens/register_screen.dart';
import 'package:flutter_auth/ui/widget/common/app_text_field.dart';
import 'package:flutter_auth/ui/widget/common/app_text_view.dart';
import 'package:flutter_auth/ui/widget/common/common_widget.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenWidth(context),
        color: AppColor.bgWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // login UI
            loginUi(context),
            // account login
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.bgWhite,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.5, color: AppColor.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child:
                        Image.asset('assets/images/ic_google.png', width: 45),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.bgWhite,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.5, color: AppColor.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/ic_apple.png', width: 45),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.bgWhite,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.5, color: AppColor.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child:
                        Image.asset('assets/images/ic_facebook.png', width: 45),
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.bgWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1.5, color: AppColor.white),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.tag_faces_rounded, size: 45),
                    ),
                  ),
                  onTap: () async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('error sign in');
                    } else {
                      print('sign in');
                      print(result.uId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loginUi(BuildContext context) {
    return Column(
      children: [
        appTextView(
          isBold: true,
          size: 20,
          name: 'Welcome',
        ),
        const SizedBox(
          height: 50,
        ),
        AppTextField(
          controller: userNameController,
          hintText: 'UserName',
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
        ),
        dividerH(),
        AppTextField(
          controller: passwordController,
          hintText: 'password',
          inputAction: TextInputAction.done,
          inputType: TextInputType.visiblePassword,
        ),
        dividerH(),
        SizedBox(
          width: screenWidth(context) - 20,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppColor.lightRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {},
            child: appTextView(
                name: 'Login', color: AppColor.white, isBold: true, size: 16),
          ),
        ),
        dividerH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appTextView(name: ' I have no account'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: appTextView(
                  name: 'Sign Up', isBold: true, color: AppColor.lightBlue),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10, left: 25),
                child: const Divider(
                  thickness: 0.2,
                  color: AppColor.black,
                ),
              ),
            ),
            appTextView(name: 'or continue with'),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(right: 25, left: 10),
                  child: const Divider(
                    thickness: 0.2,
                    color: AppColor.black,
                  )),
            ),
          ],
        ),
        dividerH(),
      ],
    );
  }
}
