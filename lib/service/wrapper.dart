import 'package:flutter/material.dart';
import 'package:flutter_auth/model/user_list.dart';
import 'package:flutter_auth/ui/home_screen.dart';
import 'package:flutter_auth/ui/loginscreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserList?>(context);
    if (user == null) {
      print("Not Login");
      return const LoginScreen();
    } else {
      print("Login");
      return const HomeScreen();
    }
  }
}
