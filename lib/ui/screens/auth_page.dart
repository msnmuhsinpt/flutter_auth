import 'package:flutter/material.dart';
import 'package:flutter_auth/ui/screens/login_screen.dart';
import 'package:flutter_auth/ui/screens/register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginWidget(toggle) : SignUpWidget(toggle);

  void toggle() {
    setState(() => isLogin = !isLogin);
  }
}
