// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
//
//
// import 'package:giftex/screens/artistpage/artistpage.dart';
// import 'package:giftex/screens/howtosell/howtosell.dart';
// import 'package:giftex/screens/liveauction/liveauction.dart';
// import 'package:giftex/screens/newsandupdates/newsandupdates.dart';
// import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
// import 'package:giftex/screens/profile/profile.dart';
// import 'package:giftex/screens/recordpage/recordpage.dart';
// import 'package:giftex/screens/servicepage/servicepage.dart';
//
//
// class Dash extends StatefulWidget {
//
//   @override
//   _DashState createState() => _DashState();
// }
//
// class _DashState extends State<Dash> {
//   // int selectedIndex = 0;
//   // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   // void _showBottomSheet() {
//   //   _scaffoldKey.currentState!.showBottomSheet((context) {
//   //     return Container(
//   //       height: 150,
//   //       color: Colors.black12,
//   //       child: const Center(
//   //         child: Text('Hello world'),
//   //       ),
//   //     );
//   //   });
//   // }
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     selectedIndex = index!;
//   //
//   //   });
//   //   // selectedIndex=index;
//   // }
//   //
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   selectedIndex=widget.selectedIndex;
//   //   super.initState();
//   // }
//   @override
//   Widget build(BuildContext context) {
//    showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 leading: new Icon(Icons.photo),
//                 title: new Text('Photo'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: new Icon(Icons.music_note),
//                 title: new Text('Music'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: new Icon(Icons.videocam),
//                 title: new Text('Video'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: new Icon(Icons.share),
//                 title: new Text('Share'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         });
//
//   }
// }
