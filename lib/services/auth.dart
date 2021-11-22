import 'package:abcd/models/user.dart';
import 'package:abcd/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserClass? _userFromFirebaseUser(User? user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserClass?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      // _showError();
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String admin_passcode) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid, admin_passcode: admin_passcode)
          .setPrelimUserData();
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      //_showError();
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
