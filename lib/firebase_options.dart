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
    apiKey: 'AIzaSyDlGWjd8QVAdOcm8c6dE2IfIB3FjrE9i-k',
    appId: '1:298476618636:web:f0d6222b4d7cee9e054ca9',
    messagingSenderId: '298476618636',
    projectId: 'fluttercourse-7326c',
    authDomain: 'fluttercourse-7326c.firebaseapp.com',
    storageBucket: 'fluttercourse-7326c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDua3n2wBUlWZW802SpZ3vK7YsxKf0kluA',
    appId: '1:298476618636:android:e64b39bc79838c5e054ca9',
    messagingSenderId: '298476618636',
    projectId: 'fluttercourse-7326c',
    storageBucket: 'fluttercourse-7326c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJcyiSevheNG-dOwbctAci9Im98qUKt3Q',
    appId: '1:298476618636:ios:dba56f430006feb0054ca9',
    messagingSenderId: '298476618636',
    projectId: 'fluttercourse-7326c',
    storageBucket: 'fluttercourse-7326c.appspot.com',
    androidClientId: '298476618636-0r51l1pbvalvsgpv3i2857p9iu02qak1.apps.googleusercontent.com',
    iosClientId: '298476618636-ecl0ldvc4so5clfi7n0rqub4d45arqt9.apps.googleusercontent.com',
    iosBundleId: 'com.example.salmdjareb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJcyiSevheNG-dOwbctAci9Im98qUKt3Q',
    appId: '1:298476618636:ios:dba56f430006feb0054ca9',
    messagingSenderId: '298476618636',
    projectId: 'fluttercourse-7326c',
    storageBucket: 'fluttercourse-7326c.appspot.com',
    androidClientId: '298476618636-0r51l1pbvalvsgpv3i2857p9iu02qak1.apps.googleusercontent.com',
    iosClientId: '298476618636-ecl0ldvc4so5clfi7n0rqub4d45arqt9.apps.googleusercontent.com',
    iosBundleId: 'com.example.salmdjareb',
  );
}
