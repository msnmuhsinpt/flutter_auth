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
/*  //create user object firebase

  UserList? _userFromFirebase(User user) {
    return user.isAnonymous ? UserList(user.uid) : null;
  }

  //auth change  user stream

  Stream<UserList?>? get user {
    try {
      return _auth
          .authStateChanges()
          .map((User? user) => _userFromFirebase(user!));
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //signIn anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // regiter

  Future signInWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign Out

  Future userSignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/
}
