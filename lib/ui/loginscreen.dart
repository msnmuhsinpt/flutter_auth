import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/home_screen.dart';
import 'package:flutter_auth/ui/register_screen.dart';

import '../utils/appColor.dart';
import '../utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

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
            loginUi(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(
                  width: 20,
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
                const SizedBox(
                  width: 20,
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
                const SizedBox(
                  width: 20,
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
            )
          ],
        ),
      ),
    );
  }

  Widget loginUi(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Welcome',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: AppColor.black),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: screenWidth(context) - 50,
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(15)),
          child: const TextField(
            //controller: passwordController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'User Name',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: screenWidth(context) - 50,
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(15)),
          child: const TextField(
            //controller: passwordController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: screenWidth(context) - 50,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColor.lightRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {},
              child: const Text(
                'Sign In',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.white),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('I have no account'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
