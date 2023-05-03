
import 'package:flutter/material.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/aboutus/aboutus.dart';
import 'package:giftex/screens/artistpage/artistpage.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/ecommercecard/card.dart';
import 'package:giftex/screens/homepage/homapage.dart';
import 'package:giftex/screens/howtosell/howtosell.dart';
import 'package:giftex/screens/kyc/kycpage.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/newsandupdates/newsandupdates.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
import 'package:giftex/screens/servicepage/servicepage.dart';
import 'package:giftex/screens/signup/login.dart';
import 'package:giftex/utils/themeutils.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? myGlobalPreference;

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  myGlobalPreference = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocalSharedPrefrence?  localSharedPrefrence;
  // This widget is the root of your application.
  // late LocalSharedPrefrence localSharedPrefrence;

  @override
  void initState() {
    // TODO: implement initState
     localSharedPrefrence=LocalSharedPrefrence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giftex',
      theme: kDarkTheme,
      home: localSharedPrefrence!
          .getLoginStatus()?DashboardUi(0):Loginpage()

      // home: KYCPage(),
    );
  }
}
