

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
    apiKey: 'AIzaSyD3u4px0G1CTp8f2eajB2tvs8iY-0yCXQk',
    appId: '1:610916686048:web:417fe1d860a7bbb25c5885',
    messagingSenderId: '610916686048',
    projectId: 'auvnet-a17f3',
    authDomain: 'auvnet-a17f3.firebaseapp.com',
    storageBucket: 'auvnet-a17f3.firebasestorage.app',
    measurementId: 'G-NTQLYD7LQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5sj5va-wENoywkNEviYqes3_dLARksBw',
    appId: '1:610916686048:android:9bf1b45e193411265c5885',
    messagingSenderId: '610916686048',
    projectId: 'auvnet-a17f3',
    storageBucket: 'auvnet-a17f3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCasWv_b4LZB6_RFFhBoDljuU7T1OYWPoQ',
    appId: '1:610916686048:ios:b9db3977fd2eb8145c5885',
    messagingSenderId: '610916686048',
    projectId: 'auvnet-a17f3',
    storageBucket: 'auvnet-a17f3.firebasestorage.app',
    iosBundleId: 'com.example.auvnetFlutterInternship',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCasWv_b4LZB6_RFFhBoDljuU7T1OYWPoQ',
    appId: '1:610916686048:ios:65af1a03ac2e68605c5885',
    messagingSenderId: '610916686048',
    projectId: 'auvnet-a17f3',
    storageBucket: 'auvnet-a17f3.firebasestorage.app',
    iosBundleId: 'com.example.auvnetFlutterInternship.RunnerTests',
  );
}
