import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/ui/widget/common/snack_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

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

  //google sign in

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }

  //google signOut

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Utils.showSnackBar('Error signing out. Try again.'));
    }
  }
}
