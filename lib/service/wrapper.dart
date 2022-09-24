import 'package:flutter/material.dart';
import 'package:flutter_auth/model/user_list.dart';
import 'package:flutter_auth/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../ui/screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserList?>(context);
    if (user == null) {
      print("Not Login");
      print(user.toString());
      return const LoginScreen();
    } else {
      print("Login");
      print(user.toString());
      return const HomeScreen();
    }
  }
}
