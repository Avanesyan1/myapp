import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

// User model
class ApplicationUser extends ChangeNotifier {
  User? _user;

  User? get user => _user;
  String? get uid => _user?.uid;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}

// Auth provider 
class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ApplicationUser _applicationUser = ApplicationUser();

  ApplicationUser get applicationUser => _applicationUser;

  // Create new account with email and password
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _applicationUser.setUser(userCredential.user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _applicationUser.setUser(userCredential.user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User cancelled the sign-in

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      _applicationUser.setUser(userCredential.user);
    } catch (e) {
      print(e);
    }
  }

  // Reset Password
  Future<void> resetPassword(String email)async{
    try {
     await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    _applicationUser.setUser(null);
  }

  bool checkIfUserIsLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  String? getUid() {
    return _applicationUser.uid;
  }
}

// Email provider
class EmailProvider extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}
