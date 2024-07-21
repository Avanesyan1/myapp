import 'package:firebase_auth/firebase_auth.dart';

class ApplicationUser {
  final User? user;

  ApplicationUser({this.user});

  String? get uid => user?.uid;
}
