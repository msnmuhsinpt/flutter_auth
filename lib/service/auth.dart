import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/model/user_list.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object firebase

  UserList? _userFromFirebase(User user) {
    return user.isAnonymous ? UserList(user.uid) : null;
  }

  //auth change  user stream

  Stream<UserList?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
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
          email: email, password: password);
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
  }
}
