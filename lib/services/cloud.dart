import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudProvider extends ChangeNotifier {
  final FirebaseFirestore _cloud = FirebaseFirestore.instance;

  Future<void> saveProfileData(String? userId, String firstname, String secondname, String email, String phoneNumber) async {
    await _cloud.collection('users').doc(userId).set({
      'firstname': firstname,
      'secondname': secondname,
      'phone_number': phoneNumber,
      'email': email,
    });
    notifyListeners();
  }

  Future<Map<String, dynamic>?> getProfileData(String? userId) async {
    try {
      DocumentSnapshot doc = await _cloud.collection('users').doc(userId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      notifyListeners();
    }
  }
}
