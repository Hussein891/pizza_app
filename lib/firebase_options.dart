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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCh7qffXEstiybGxcM0vi1PvVrpwur9V7k',
    appId: '1:549187288435:web:735d694afde181735c1906',
    messagingSenderId: '549187288435',
    projectId: 'pizza-app-8294e',
    authDomain: 'pizza-app-8294e.firebaseapp.com',
    storageBucket: 'pizza-app-8294e.appspot.com',
    measurementId: 'G-ZJ4YQYW3YK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHtjLmoHaO1ud07kyM2CBRv60qNBmmxjA',
    appId: '1:549187288435:android:e10ef50d301fba7d5c1906',
    messagingSenderId: '549187288435',
    projectId: 'pizza-app-8294e',
    storageBucket: 'pizza-app-8294e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCokcJq60imwS9uPzp5j-hG_APW3R4Qb7w',
    appId: '1:549187288435:ios:f89666d67cfd8f175c1906',
    messagingSenderId: '549187288435',
    projectId: 'pizza-app-8294e',
    storageBucket: 'pizza-app-8294e.appspot.com',
    iosBundleId: 'com.example.pizzaapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCokcJq60imwS9uPzp5j-hG_APW3R4Qb7w',
    appId: '1:549187288435:ios:f89666d67cfd8f175c1906',
    messagingSenderId: '549187288435',
    projectId: 'pizza-app-8294e',
    storageBucket: 'pizza-app-8294e.appspot.com',
    iosBundleId: 'com.example.pizzaapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCh7qffXEstiybGxcM0vi1PvVrpwur9V7k',
    appId: '1:549187288435:web:bc4b901fcbe2004b5c1906',
    messagingSenderId: '549187288435',
    projectId: 'pizza-app-8294e',
    authDomain: 'pizza-app-8294e.firebaseapp.com',
    storageBucket: 'pizza-app-8294e.appspot.com',
    measurementId: 'G-K0899W9643',
  );
}
