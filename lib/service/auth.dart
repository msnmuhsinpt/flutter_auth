import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/ui/widget/common/snack_bar.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//sign // login
  Future sign(String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      // snack bar
      Utils.showSnackBar(e.message);
    }
    //navigator not working
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //sign Up // register
  Future register(
    String email,
    String password,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      //snack bar
      Utils.showSnackBar(e.message);
    }
    //navigator not working
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // Reset password
  Future resetPassword(String email, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
      Utils.showSnackBar('Password Rest Email Sent');
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Utils.showSnackBar(e.message);
    }
    //navigator not working
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //signIn anon

  Future signInAnon(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Utils.showSnackBar(e.message);
    }
    //navigator not working
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //sent email verification

  Future sentEmailVerification() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }


}
