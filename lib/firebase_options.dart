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
    apiKey: 'AIzaSyB39Z0NQ0fr57PsWFFrKCJQA1jaqmSHy74',
    appId: '1:773979056230:android:718479a2546ace6b4f25a7',
    messagingSenderId: '773979056230',
    projectId: 'giftex-uat',
    databaseURL: 'https://giftex-uat-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'giftex-uat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzPSPP_o7YV43kZP5dp07RBOHeXLgiXPA',
    appId: '1:773979056230:ios:298275f83d6b442c4f25a7',
    messagingSenderId: '773979056230',
    projectId: 'giftex-uat',
    storageBucket: 'giftex-uat.appspot.com',
    databaseURL: 'https://giftex-uat-default-rtdb.asia-southeast1.firebasedatabase.app',
    // androidClientId: '654489104519-6nm9sdroh4ashtqvololvu0meqr1sl8u.apps.googleusercontent.com',
    // iosClientId: '654489104519-o9jc47c1015ogqlv8p55ke4fqmop4feb.apps.googleusercontent.com',
    iosBundleId: 'com.giftex',
  );
}
