import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDheIcB1Vipj28UxUBFEuetGtgLYuL5nAY',
    appId: '1:733714402116:android:1a1056637726bc82e7a511',
    messagingSenderId: '733714402116',
    projectId: 'shopping-app-ba8d4',
    storageBucket: 'YOUR_STORAGE_BUCKET',
  );

  static FirebaseOptions get currentPlatform => android;
}
