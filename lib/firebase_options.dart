// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDQN0SNYWawuhh8Mu83qsIciYLU7Mvztb4',
    appId: '1:311009788951:web:a78f19a8094086ed470852',
    messagingSenderId: '311009788951',
    projectId: 'todo-2ab36',
    authDomain: 'todo-2ab36.firebaseapp.com',
    storageBucket: 'todo-2ab36.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJZqBfWialcTo6GAlp5Ry34DMiO5fo-TQ',
    appId: '1:311009788951:android:ecfff3ddda7e04a7470852',
    messagingSenderId: '311009788951',
    projectId: 'todo-2ab36',
    storageBucket: 'todo-2ab36.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDQN0SNYWawuhh8Mu83qsIciYLU7Mvztb4',
    appId: '1:311009788951:web:57048a4f1c0c275b470852',
    messagingSenderId: '311009788951',
    projectId: 'todo-2ab36',
    authDomain: 'todo-2ab36.firebaseapp.com',
    storageBucket: 'todo-2ab36.firebasestorage.app',
  );

}