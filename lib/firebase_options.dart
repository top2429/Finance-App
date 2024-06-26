import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBoE8s4Jsy2-E94zniFkGGlt7ersdm4eJo',
    appId: '1:562333502674:web:17f9824e71935dcc50710b',
    messagingSenderId: '562333502674',
    projectId: 'mobilepaymenttool',
    authDomain: 'mobilepaymenttool.firebaseapp.com',
    storageBucket: 'mobilepaymenttool.appspot.com',
    measurementId: 'G-JKG2VXJ64W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3J6Tmcz-JAHhrL_Fn9l8ZB8XF-xjxCNg',
    appId: '1:562333502674:android:88dafd795668ee7850710b',
    messagingSenderId: '562333502674',
    projectId: 'mobilepaymenttool',
    storageBucket: 'mobilepaymenttool.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnEzi6zPGWvwlviZoxzUfm_lRZNi29Vyc',
    appId: '1:562333502674:ios:3fed11ef7397b6bd50710b',
    messagingSenderId: '562333502674',
    projectId: 'mobilepaymenttool',
    storageBucket: 'mobilepaymenttool.appspot.com',
    iosBundleId: 'com.example.tai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnEzi6zPGWvwlviZoxzUfm_lRZNi29Vyc',
    appId: '1:562333502674:ios:cbc99ad6f25933af50710b',
    messagingSenderId: '562333502674',
    projectId: 'mobilepaymenttool',
    storageBucket: 'mobilepaymenttool.appspot.com',
    iosBundleId: 'com.example.tai.RunnerTests',
  );
}
