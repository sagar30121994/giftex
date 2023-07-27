import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/signup/login.dart';
import 'package:giftex/utils/themeutils.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? myGlobalPreference;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   // (!Firebase.apps.length) ? Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,)
   //    : Firebase.app()
  myGlobalPreference = await SharedPreferences.getInstance();
  runApp(MyApp());
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
