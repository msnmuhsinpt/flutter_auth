import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/ui/widget/common/snack_bar.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//sign // login
  Future sign(
    String email,
    String password,
  ) async {
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
  }

  //sign Up // register
  Future register(
    String email,
    String password,
  ) async {
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
  }

  // Reset password
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Utils.showSnackBar(e.message);
    }
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
