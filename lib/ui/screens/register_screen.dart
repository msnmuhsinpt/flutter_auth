import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/screens/home_screen.dart';
import 'package:flutter_auth/ui/widget/common/app_appBar.dart';
import 'package:flutter_auth/ui/widget/common/app_text_field.dart';
import 'package:flutter_auth/ui/widget/common/common_widget.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String error = "";
  final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();

  //
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppBar(
        name: 'Sign UP',
      ),
      body: Container(
        width: screenWidth(context),
        color: AppColor.bgWhite,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                  controller: nameController,
                  hintText: 'Name',
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.name),
              dividerSH(),
              AppTextField(
                  controller: emailController,
                  hintText: 'Email',
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.name),
              dividerSH(),
              AppTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword),
             dividerH(),
              SizedBox(
                width: screenWidth(context) - 20,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColor.lightRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                        nameController.text.toString(),
                        emailController.text.toString(),
                        passwordController.text.toString(),
                      );
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      } else {
                        const HomeScreen();
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
