import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/homepage/homapage.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  // NavBar(this.key);
  // GlobalKey key;
  // HomeViewModel? homeViewModel;

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0,
      elevation: 0,
      toolbarHeight: 90, //
      backgroundColor: Colors.white,
      leadingWidth: 96,
      leading: Container(
          padding: EdgeInsets.all(8),
          child: Image.asset("image/giftlogo.png", height: 28, width: 96, fit: BoxFit.fitWidth)),
      actions: [
        // InkWell(
        //   child: Image.asset(
        //     "image/app2.png",
        //     height: 20,
        //   ),
        // ),
        // SizedBox(width: 3,),
        InkWell(
            onTap: () {
              homeViewModel.search = (!homeViewModel.search);
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(34)));
            },
            child: Image.asset(
              "image/app3.png",
              height: 20,
            )),
        // SizedBox(width: 3,),
        InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Cardpage()));
            bottomViewModel.key.currentState!.openEndDrawer();
          },
          child: Container(width: 45, color: Color(0xff1F2A52), child: Image.asset("image/app4.png")),
        ),
        // SizedBox(width: 3,),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
