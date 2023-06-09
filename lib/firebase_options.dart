// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDgzSwmXxncYCJeFDDZ4zbVfhgyTF64gBE',
    appId: '1:997050778891:web:dea2cfebb4507c62088e0e',
    messagingSenderId: '997050778891',
    projectId: 'dpboss-f8a30',
    authDomain: 'dpboss-f8a30.firebaseapp.com',
    storageBucket: 'dpboss-f8a30.appspot.com',
    measurementId: 'G-HTPXVJHJ2M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHbikuqvP2aTZo4bYhVlX0cEuWIqQmMAo',
    appId: '1:997050778891:android:0b6896f0aeaab7b3088e0e',
    messagingSenderId: '997050778891',
    projectId: 'dpboss-f8a30',
    storageBucket: 'dpboss-f8a30.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADKq3HXf03Z699MxCr0jxJ3vPODt2h9sk',
    appId: '1:997050778891:ios:27c0c5aa9c6eeb4d088e0e',
    messagingSenderId: '997050778891',
    projectId: 'dpboss-f8a30',
    storageBucket: 'dpboss-f8a30.appspot.com',
    iosClientId: '997050778891-lfsoncg1aujd6ttlbiem3pol1jqabjpi.apps.googleusercontent.com',
    iosBundleId: 'com.example.dpboss',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADKq3HXf03Z699MxCr0jxJ3vPODt2h9sk',
    appId: '1:997050778891:ios:27c0c5aa9c6eeb4d088e0e',
    messagingSenderId: '997050778891',
    projectId: 'dpboss-f8a30',
    storageBucket: 'dpboss-f8a30.appspot.com',
    iosClientId: '997050778891-lfsoncg1aujd6ttlbiem3pol1jqabjpi.apps.googleusercontent.com',
    iosBundleId: 'com.example.dpboss',
  );
}
