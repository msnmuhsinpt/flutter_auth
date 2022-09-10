import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen(this.user, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
        children: [
          Text('Name : ${_currentUser.displayName}'),
          const SizedBox(height: 10,),
          Text('Email : ${_currentUser.email}'),
          const SizedBox(height: 10,),

        ],  
          
        ),
      ),
    );
  }
}
