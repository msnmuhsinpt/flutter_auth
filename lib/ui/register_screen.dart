import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/home_screen.dart';

import '../utils/appColor.dart';
import '../utils/constant.dart';

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
      body: Container(
        width: screenWidth(context),
        color: AppColor.bgWhite,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sing Up',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: screenWidth(context) - 20,
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColor.white,
                    hintText: 'Name',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (val) => val!.isEmpty ? 'Enter Name' : null,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth(context) - 20,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColor.white,
                    hintText: 'Email',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (val) => val!.isEmpty ? 'Enter Email' : null,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth(context) - 20,
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Password',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (val) =>
                      val!.length < 6 ? 'Enter Password 6+ character' : null,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
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
                    child: const Text('Register')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
