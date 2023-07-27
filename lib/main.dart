import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/signup/login.dart';
import 'package:giftex/utils/themeutils.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? myGlobalPreference;

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isAndroid) {
      await Firebase.initializeApp();
    } else if (Platform.isIOS) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    }

    //  (!Firebase.apps.length) ? Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,)
    //     : Firebase.app()
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    myGlobalPreference = await SharedPreferences.getInstance();
    runApp(MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocalSharedPrefrence? localSharedPrefrence;
  // This widget is the root of your application.
  // late LocalSharedPrefrence localSharedPrefrence;

  @override
  void initState() {
    // TODO: implement initState
    localSharedPrefrence = LocalSharedPrefrence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Giftex',
        theme: kDarkTheme,
        home: localSharedPrefrence!.getLoginStatus()
            ? DashboardUi(0)
            : Loginpage()

        // home: KYCPage(),
        );
  }
}
