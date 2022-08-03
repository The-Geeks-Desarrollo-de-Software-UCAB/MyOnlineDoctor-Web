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
      apiKey: "AIzaSyA9FHnMN0Ms1PJFvjLm1JMp5mlasZ9foyE",
      authDomain: "myonlinedoctor-web.firebaseapp.com",
      projectId: "myonlinedoctor-web",
      storageBucket: "myonlinedoctor-web.appspot.com",
      messagingSenderId: "884147846439",
      appId: "1:884147846439:web:ba69b2fdfcddbe83e3fd02",
      measurementId: "G-GEXWP9YL9P");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbqOlJm94Jy5v9HECn3lv3HBqoQV8bcCw',
    appId: '1:186343523495:android:f2c1ac6060dee05b0e4782',
    messagingSenderId: '186343523495',
    projectId: 'myonlinedoctor-83b1f',
    storageBucket: 'myonlinedoctor-83b1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCMMhjNmoClwPWljtQTXoPAz6Bzxbump8',
    appId: '1:186343523495:ios:f224c09000ec3afc0e4782',
    messagingSenderId: '186343523495',
    projectId: 'myonlinedoctor-83b1f',
    storageBucket: 'myonlinedoctor-83b1f.appspot.com',
    iosClientId:
        '186343523495-afbp8gadadajgic9q5vpumj3ep92a90d.apps.googleusercontent.com',
    iosBundleId: 'com.example.myonlinedoctorMovil',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCMMhjNmoClwPWljtQTXoPAz6Bzxbump8',
    appId: '1:186343523495:ios:f224c09000ec3afc0e4782',
    messagingSenderId: '186343523495',
    projectId: 'myonlinedoctor-83b1f',
    storageBucket: 'myonlinedoctor-83b1f.appspot.com',
    iosClientId:
        '186343523495-afbp8gadadajgic9q5vpumj3ep92a90d.apps.googleusercontent.com',
    iosBundleId: 'com.example.myonlinedoctorMovil',
  );
}
