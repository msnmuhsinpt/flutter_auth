import 'package:flutter/material.dart';
import 'package:flutter_auth/service/auth.dart';
import 'package:flutter_auth/ui/loginscreen.dart';
import 'package:flutter_auth/utils/appColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightRed,
        leading: Container(),
        centerTitle: true,
        title: const Text("Home"),
        actions: [
          TextButton(
            onPressed: () async {
              await _auth.userSignOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text(
              "Sign Out",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                  fontSize: 17),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Appziac Technology'),
      ),
    );
  }
}
