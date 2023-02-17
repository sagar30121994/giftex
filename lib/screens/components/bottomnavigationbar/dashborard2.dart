import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'package:giftex/screens/artistpage/artistpage.dart';
import 'package:giftex/screens/carrerpage/careerpage.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/newsandupdates/newsandupdates.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
import 'package:giftex/screens/profile/profile.dart';

import '../../homepage/homapage.dart';
import '../../servicepage/servicepage.dart';

class Dashboard2Ui extends StatefulWidget {
  @override
  _Dashboard2UiState createState() => _Dashboard2UiState();
}

class _Dashboard2UiState extends State<Dashboard2Ui> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(0)));
      }else   if(selectedIndex==1){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
      }  else if (selectedIndex == 3) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(3)));

      } else if (selectedIndex == 4) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(4)));

      }
    });
    // selectedIndex=index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'

        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard_outlined,
          ),
          label: 'Store',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.circle,size: 0,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store_sharp,
          ),
          label: 'Service',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        ),

      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black38,
      unselectedItemColor: Colors.black38,
      // unselectedLabelStyle: Theme.of(context).textTheme.headline6!.copyWith(
      //   color: Colors.black,
      //   fontWeight: FontWeight.w600,
      // ),
    );

  }
}
