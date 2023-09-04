import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/aboutus/aboutus.dart';
import 'package:giftex/screens/carrerpage/careerpage.dart';
import 'package:giftex/screens/components/drawer/drawermain.dart';
import 'package:giftex/screens/contactus/contactus.dart';
import 'package:giftex/screens/faq/faq.dart';
import 'package:giftex/screens/howtobuy/howtobuy.dart';
import 'package:giftex/screens/howtosell/howtosell.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/liveauction/liveauctiondetailpage.dart';
import 'package:giftex/screens/newsandupdates/newsandupdates.dart';
import 'package:giftex/screens/profile/dashboardoverview.dart';
import 'package:giftex/screens/profile/myauctionreview.dart';
import 'package:giftex/screens/profile/mygallary.dart';
import 'package:giftex/screens/profile/myprofile.dart';
import 'package:giftex/screens/profile/orderhistory.dart';
import 'package:giftex/screens/profile/profile.dart';
import 'package:giftex/screens/record_price_artwork/record_price_artwork.dart';
import 'package:giftex/screens/servicepage/servicepage.dart';
import 'package:giftex/screens/services/mainservices.dart';
import 'package:giftex/screens/signup/login.dart';
import 'package:giftex/viewmodel/bottomviewmodel.dart';

import '../../artmovement/artmovement.dart';
import '../../departments/departments.dart';
import '../../homepage/homapage.dart';

BottomViewModel bottomViewModel = BottomViewModel();

class DashboardUi extends StatefulWidget {
  int selectedIndex;
  DashboardUi(this.selectedIndex);
  @override
  _DashboardUiState createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi> {
  LocalSharedPrefrence? preference;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();

  @override
  void initState() {
    preference = new LocalSharedPrefrence();
    bottomViewModel.selectedIndex = widget.selectedIndex;
    super.initState();
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Are you sure you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text('Exit'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (ctx) => WillPopScope(
          onWillPop: () async {
            if (bottomViewModel.selectedIndex == 8) {
              if (auctionViewModel.auctionType == "live") {
                setState(() {
                  bottomViewModel.selectedIndex = 5;
                });
              } else if (auctionViewModel.auctionType == "upcoming") {
                setState(() {
                  bottomViewModel.selectedIndex = 6;
                });
              } else if (auctionViewModel.auctionType == "past") {
                setState(() {
                  bottomViewModel.selectedIndex = 7;
                });
              }
            } else if (bottomViewModel.selectedIndex == 12 ||
                bottomViewModel.selectedIndex == 13 ||
                bottomViewModel.selectedIndex == 14 ||
                bottomViewModel.selectedIndex == 15 ||
                bottomViewModel.selectedIndex == 16) {
              setState(() {
                bottomViewModel.selectedIndex = 3;
              });
            } else if (bottomViewModel.selectedIndex == 0) {
              _onWillPop(context);
            } else {
              setState(() {
                bottomViewModel.selectedIndex = 0;
              });
            }

            return false;
          },
          child: Scaffold(
            // backgroundColor: Color(0xffF9F9F9),
            key: bottomViewModel.key,
            endDrawer: MainDrawer(),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Color(0xffF9F9F9),
              child: Observer(builder: (context) {
                return Container(
                  height: 75,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          bottomViewModel.selectedIndex = 0;
                        },
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(4),
                                child: Image.asset(
                                  "image/home.png",
                                  width: 24,
                                  height: 24,
                                  color: bottomViewModel.selectedIndex == 0
                                      ? Theme.of(context).colorScheme.primary
                                      : Color(0xff2D2D2D),
                                )),
                            Text(
                              "HOME",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    letterSpacing: 1,
                                    fontWeight:
                                        bottomViewModel.selectedIndex == 0
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    color: bottomViewModel.selectedIndex == 0
                                        ? Theme.of(context).colorScheme.primary
                                        : Color(0xff2D2D2D),
                                  ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          bottomViewModel.selectedIndex = 1;
                        },
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(4),
                                child: Image.asset(
                                  "image/service.png",
                                  width: 24,
                                  height: 24,
                                  color: bottomViewModel.selectedIndex == 1
                                      ? Theme.of(context).colorScheme.primary
                                      : Color(0xff2D2D2D),
                                )),
                            // Icon(
                            //   Icons.dashboard_outlined,size: 32,
                            //   color: bottomViewModel.selectedIndex==1?Color(0xffB45156):Theme.of(context).colorScheme.primary,
                            // ),
                            Text(
                              "SERVICE",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    letterSpacing: 1,
                                    fontWeight:
                                        bottomViewModel.selectedIndex == 1
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    color: bottomViewModel.selectedIndex == 1
                                        ? Theme.of(context).colorScheme.primary
                                        : Color(0xff2D2D2D),
                                  ),
                            )
                          ],
                        ),
                      ),
                      Container(),
                      InkWell(
                        onTap: () {
                          bottomViewModel.selectedIndex = 2;
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * .7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30)),
                                      color: Colors.white),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Color(0xffF3F2EC),
                                              key: cardA,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  "image/jwellery.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              title: Text(
                                                "JEWELLERY",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Color(0XFF8C9FB1),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "image/Group (21).png",
                                                            height: 20,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0,
                                                                      top: 0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "ART",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                        color: Color(
                                                                            0XFF5D7E4D),
                                                                        fontWeight: bottomViewModel.selectedIndex ==
                                                                                0
                                                                            ? FontWeight
                                                                                .bold
                                                                            : FontWeight
                                                                                .normal,
                                                                        letterSpacing:
                                                                            1),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Painting",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1!
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0XFF171515),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        "image/Line 45.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 16),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Sculpture",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1!
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0XFF171515),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20.0,
                                                                top: 16),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Photography",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1!
                                                                  .copyWith(
                                                                      color: Color(
                                                                          0XFF171515),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      letterSpacing:
                                                                          1),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ArtMovementPage()));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 16),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Modern Art",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1!
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0XFF171515),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffEAEEF2),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "image/maskbg.png"))),
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Colors
                                                  .lightBlueAccent
                                                  .withOpacity(.1),
                                              key: cardA,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  "image/art.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              title: Text(
                                                "ART",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Painting",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1!
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0XFF171515),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        "image/Line 45.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 16),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Sculpture",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1!
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0XFF171515),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20.0,
                                                                top: 16),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Photography",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1!
                                                                  .copyWith(
                                                                      color: Color(
                                                                          0XFF171515),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      letterSpacing:
                                                                          1),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ArtMovementPage()));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 16),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Modern Art",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1!
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0XFF171515),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Color(0xffF3F2EC),
                                              key: cardB,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  "image/furniture.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              title: Text(
                                                "FURNITURE",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Color(0XFF8C9FB1),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[],
                                            ),
                                          ),
                                          Container(
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Color(0xffF3F2EC),
                                              key: cardC,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  "image/watches.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              title: Text(
                                                "WATCHES",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Color(0XFF8C9FB1),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[],
                                            ),
                                          ),
                                          Container(
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Color(0xffF3F2EC),
                                              key: cardD,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  "image/books.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              title: Text(
                                                "BOOKS",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Color(0XFF8C9FB1),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[],
                                            ),
                                          ),
                                          Container(
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Color(0xffF3F2EC),
                                              key: cardE,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  "image/mechanidise.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                              title: Text(
                                                "MERCENDISE",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Color(0XFF8C9FB1),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[],
                                            ),
                                          ),
                                          Container(
                                            child: ExpansionTileCard(
                                              finalPadding: EdgeInsets.all(0),
                                              baseColor: Color(0xffFFFFFF),
                                              expandedColor: Color(0xffF3F2EC),
                                              key: cardF,

                                              // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                child: SizedBox(
                                                    width: 8,
                                                    height: 8,
                                                    child: Image.asset(
                                                        "image/print.png",
                                                        width: 8,
                                                        height: 8)),
                                              ),
                                              title: Text(
                                                "PRINT",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: Color(0XFF8C9FB1),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              children: <Widget>[],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(4),
                                child: Image.asset(
                                  "image/bag.png",
                                  width: 24,
                                  height: 24,
                                  color: bottomViewModel.selectedIndex == 2
                                      ? Theme.of(context).colorScheme.primary
                                      : Color(0xff2D2D2D),
                                )),

                            // Icon(
                            //   Icons.shopping_bag_outlined,size: 32),
                            Text(
                              "STORE",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    letterSpacing: 1,
                                    fontWeight:
                                        bottomViewModel.selectedIndex == 2
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    color: bottomViewModel.selectedIndex == 2
                                        ? Theme.of(context).colorScheme.primary
                                        : Color(0xff2D2D2D),
                                  ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (preference!.getLoginStatus()) {
                            bottomViewModel.selectedIndex = 3;
                          } else {
                            WidgetsBinding.instance?.addPostFrameCallback((_) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return PopupWidget();
                                },
                              );
                            });
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(4),
                                child: Image.asset(
                                  "image/profile.png",
                                  width: 24,
                                  height: 24,
                                  color: bottomViewModel.selectedIndex == 3
                                      ? Theme.of(context).colorScheme.primary
                                      : Color(0xff2D2D2D),
                                )),
                            // Icon(
                            //   Icons.person_outline,size: 32),

                            Text(
                              "PROFILE",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    letterSpacing: 1,
                                    fontWeight:
                                        bottomViewModel.selectedIndex == 3
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    color: bottomViewModel.selectedIndex == 3
                                        ? Theme.of(context).colorScheme.primary
                                        : Color(0xff2D2D2D),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,

            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xffE74B52),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            color: Colors.white),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "AUCTION",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Color(0xff5D7E4D).withOpacity(0.4),
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  bottomViewModel.selectedIndex = 5;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Vector 8.png",
                                      width: 30, height: 21),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "LIVE",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Color(0Xff8C9FB1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => LiveAuctionUi("upcoming")));
                                Navigator.of(context).pop();
                                setState(() {
                                  bottomViewModel.selectedIndex = 6;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/upcomming.png",
                                      width: 30, height: 21),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "UPCOMING",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Color(0Xff8C9FB1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  bottomViewModel.selectedIndex = 7;
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => LiveAuctionUi("past")));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/past.png",
                                      width: 30, height: 21),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "PAST",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Color(0Xff8C9FB1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 34,
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Image.asset("image/hammer.png", color: Colors.white),
            ),

            body: Observer(builder: (context) {
              bottomViewModel.selectedIndex;
              return getPage();
            }),
          ),
        ),
      ),
    );
  }

  Widget getPage() {
    switch (bottomViewModel.selectedIndex) {
      case 0:
        return Homepage();

      case 1:
        return Servicepage();
      case 2:
        return Servicepage();
      case 3:
        return Profilepage();
      case 5:
        return LiveAuctionUi("live");
      case 6:
        return LiveAuctionUi("upcoming");
      case 7:
        return LiveAuctionUi("past");
      case 8:
        return LiveAuctionUiDetails();
      case 9:
        return Servicepage();
      case 10:
        return HowToSellPage();
      case 11:
        return HowToBuyPage();
      case 12:
        return MyProfilepage(bottomViewModel);
      case 13:
        return MyOrderHistorypage(bottomViewModel.profileViewModel!);
      case 14:
        return MyGallarypage(bottomViewModel.profileViewModel!);
      case 15:
        return MyAuctionReviewpage(bottomViewModel.profileViewModel!);
      case 16:
        return MyAuctionDashboard(bottomViewModel.profileViewModel!);

      case 17:
        return FaqPage();

      case 18:
        return ServiceAll("client-advisory", "Client Advisory");

      case 19:
        return ServiceAll("restoration", "Restoration");

      case 20:
        return ServiceAll("collection-services", "Collection Services");

      case 21:
        return ServiceAll("museum-services", "Museum Services");

      case 22:
        return ServiceAll("post-sale-services", "Post Sale Services");

      case 23:
        return ServiceAll("private-services", "Private Sales");

      case 24:
        return ServiceAll("storage", "Storage");
      case 25:
        return NewsAndUpdatesPage();
      case 26:
        return CareerPage();
      case 27:
        return Departments();

      case 28:
        return Record_price_artwork();

      case 29:
        return Aboutuspage();
      case 30:
        return CareerPage();

      case 31:
        return ContactusPage();

      default:
        {
          //statements;
          Container();
        }
        break;
    }
    return Container();
  }
}
//   if (bottomViewModel.selectedIndex == 0) {
//   } else if (bottomViewModel.selectedIndex == 1) {
//     return Servicepage();
//   } else if (bottomViewModel.selectedIndex == 2) {
//     return Servicepage();
//   } else if (bottomViewModel.selectedIndex == 3) {
//     return Profilepage();
//   } else if (bottomViewModel.selectedIndex == 5) {
//     return LiveAuctionUi("live");
//   } else if (bottomViewModel.selectedIndex == 6) {
//     return LiveAuctionUi("upcoming");
//   } else if (bottomViewModel.selectedIndex == 7) {
//     return LiveAuctionUi("past");
//   } else if (bottomViewModel.selectedIndex == 8) {
//     return LiveAuctionUiDetails();
//   } else if (bottomViewModel.selectedIndex == 9) {
//     return Servicepage();
//   } else if (bottomViewModel.selectedIndex == 10) {
//     return HowToSellPage();
//   } else if (bottomViewModel.selectedIndex == 11) {
//     return HowToBuyPage();
//   } else if (bottomViewModel.selectedIndex == 12) {
//     return MyProfilepage(bottomViewModel);
//   } else if (bottomViewModel.selectedIndex == 13) {
//     return MyOrderHistorypage(bottomViewModel.profileViewModel!);
//   } else if (bottomViewModel.selectedIndex == 14) {
//     return MyGallarypage(bottomViewModel.profileViewModel!);
//   } else if (bottomViewModel.selectedIndex == 15) {
//     return MyAuctionReviewpage(bottomViewModel.profileViewModel!);
//   } else if (bottomViewModel.selectedIndex == 16) {
//     return MyAuctionDashboard(bottomViewModel.profileViewModel!);
//   }
//
// }

class PopupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('Sign up / Sign in'),
        content: Text('You need to sign up or sign in first.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Loginpage()));
            },
            child: Text('Ok'),
          ),
        ],
      );
}
