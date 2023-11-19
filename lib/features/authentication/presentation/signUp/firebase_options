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
    apiKey: 'AIzaSyBg6LWM-XD8QmYKkMGsnvWNEy5KwKbPD8s',
    appId: '1:267240529254:web:4b54fae0f0f99f44323ca7',
    messagingSenderId: '267240529254',
    projectId: 'salon-app-b4afc',
    authDomain: 'salon-app-b4afc.firebaseapp.com',
    storageBucket: 'salon-app-b4afc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByM96HtY6VTk2y8KJ6twaP6Lf3OGhS-xQ',
    appId: '1:267240529254:android:e147316d5433b75f323ca7',
    messagingSenderId: '267240529254',
    projectId: 'salon-app-b4afc',
    storageBucket: 'salon-app-b4afc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1q4IfJwrltNeiwWBRsIN62FIgBHEKMaM',
    appId: '1:267240529254:ios:96d7fc89af335144323ca7',
    messagingSenderId: '267240529254',
    projectId: 'salon-app-b4afc',
    storageBucket: 'salon-app-b4afc.appspot.com',
    iosClientId: '267240529254-k1i6ntc8tioba13247qencqv3o1i58mc.apps.googleusercontent.com',
    iosBundleId: 'com.example.salonAppFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1q4IfJwrltNeiwWBRsIN62FIgBHEKMaM',
    appId: '1:267240529254:ios:96d7fc89af335144323ca7',
    messagingSenderId: '267240529254',
    projectId: 'salon-app-b4afc',
    storageBucket: 'salon-app-b4afc.appspot.com',
    iosClientId: '267240529254-k1i6ntc8tioba13247qencqv3o1i58mc.apps.googleusercontent.com',
    iosBundleId: 'com.example.salonAppFinal',
  );
}