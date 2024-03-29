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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDipD1PEuIu4ut-q5XBc2zexHWj3poKYaA',
    appId: '1:313973812470:android:d64a2afd1570ec2f6890d7',
    messagingSenderId: '313973812470',
    projectId: 'flutter-prep-mossosouk',
    databaseURL: 'https://flutter-prep-mossosouk-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-prep-mossosouk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0h3MQvavqCzif4PUTE0sYKCDvVMMYWZk',
    appId: '1:313973812470:ios:ba353049c073bc396890d7',
    messagingSenderId: '313973812470',
    projectId: 'flutter-prep-mossosouk',
    databaseURL: 'https://flutter-prep-mossosouk-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-prep-mossosouk.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );
}
