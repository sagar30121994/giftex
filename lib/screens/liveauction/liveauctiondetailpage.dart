import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/filltersearch/filltersearch.dart';
import 'package:giftex/screens/liveauction/components/live/livedata.dart';
import 'package:giftex/screens/liveauction/components/live/livetabs.dart';
import 'package:giftex/screens/liveauction/components/past/pastauctionresultdata.dart';
import 'package:giftex/screens/liveauction/components/past/pastdata.dart';
import 'package:giftex/screens/liveauction/components/past/pasttabs.dart';
import 'package:giftex/screens/liveauction/components/upcomming/upcommingdata.dart';
import 'package:giftex/screens/liveauction/components/upcomming/upcommingtabs.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';

// import 'package:signalr_netcore/signalr_client.dart';
import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';

class HttpOverrideCertificateVerificationInDev extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class LiveAuctionUiDetails extends StatefulWidget {
  LiveAuctionUiDetails();
  @override
  _LiveAuctionUiDetailsState createState() => _LiveAuctionUiDetailsState();
}

class _LiveAuctionUiDetailsState extends State<LiveAuctionUiDetails> {
  int _pageIndex = 0;
  // String auctions = "live";
  Color tabColor = Color(0xffE74B52);
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true, selected = false;

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference? userlikeReference;

  @override
  void initState() {
    // TODO: implement initState
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    // auctionViewModel.auctionType = "live";

    if (auctionViewModel.auctionType == "live") {
      auctionViewModel.page = 1;
      auctionViewModel.getUpcommingAuction("Live");
    } else if (auctionViewModel.auctionType == "past") {
      auctionViewModel.page = 1;
      auctionViewModel.getUpcommingAuction("Past");
    } else {
      auctionViewModel.page = 1;
      auctionViewModel.getUpcommingAuction("UpComing");
    }

    userlikeReference = database.ref("userlike/" + auctionViewModel.localSharedPrefrence.getUserId());

    userlikeReference!.onValue.listen((DatabaseEvent event) {
      print("live action event");
      final data = event.snapshot.value;
      if (auctionViewModel.liveAuctionType == "mygallery") {
        auctionViewModel.myAuctionGallery();
      }
    });

    auctionViewModel.getSingleAuctionDetails(auctionViewModel.selectedAuction!.auctionId!);
    auctionViewModel.getUpcommingBidAuction(auctionViewModel.selectedAuction!.auctionId!);

    super.initState();
    reset();
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    reset();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty)
      return Builder(builder: (context) {
        return ListTile(
            // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
            leading: Checkbox(
              value: selected,
              shape: RoundedRectangleBorder(),
              onChanged: (bool? value) {},
            ),
            title: Text(
              list.name!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
            ));
      });
    return ExpansionTile(
      title: Text(
        list.name!,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: NavBar(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          auctionViewModel.isLoadingForUpCommingAuction
              ? SliverToBoxAdapter(child: LinearProgressIndicator())
              : SliverToBoxAdapter(
                  child: Align(
                    child: Text(
                      "${auctionViewModel.singleAuctionDetsilaResponse!.result!.auctionTitle!}",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
          auctionViewModel.isLoadingForUpCommingAuction
              ? SliverToBoxAdapter(child: LinearProgressIndicator())
              : SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * .80,
                    child: Text(
                      "Bid on works you love with auctions. With bidding opening daily, connects collectors like you to art from leading auction houses, nonprofit organizations, and sellers across the globe.",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),
          auctionViewModel.isLoadingForUpCommingAuction
              ? SliverToBoxAdapter(child: LinearProgressIndicator())
              : SliverToBoxAdapter(
                  child: Observer(builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width * .80,
                      child: Container(
                        height: 250,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 0),
                              child: Container(
                                //replace this Container with your Card
                                color: Theme.of(context).colorScheme.onPrimary,
                                height: 250.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0, right: 25),
                              child: Image.network(
                                "${auctionViewModel.singleAuctionDetsilaResponse!.result!.banner}",
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                              ),
                            ),

                            Padding(
                                padding: EdgeInsets.only(top: 400 / 2.0, bottom: 0, left: 25.0, right: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "image/calender.png",
                                      color: Colors.white,
                                      height: 22,
                                    ),
                                    // Icon(Icons.calendar_today,size: 22,color: Color(0xff80A071),),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${auctionViewModel.selectedAuction!.displayDate}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      "image/share.png",
                                      height: 32,
                                    ),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      "image/save.png",
                                      height: 32,
                                    ),
                                    // SizedBox(width: 10,),
                                  ],
                                )),

                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     Divider(color: Color(0xff466D33),thickness: 1,),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).colorScheme.onPrimary,
              child: DefaultTabController(
                length: 3,
                initialIndex: auctionViewModel.auctionType == "live"
                    ? 0
                    : auctionViewModel.auctionType == "upcoming"
                        ? 1
                        : 2,
                child: TabBar(
                  onTap: (index) async {
                    setState(() async {
                      if (index == 0) {
                        tabColor = Color(0xffE74B52);
                        auctionViewModel.auctionType = "live";
                        bottomViewModel.selectedIndex = 5;
                      } else if (index == 1) {
                        tabColor = Color(0xffE74B52);
                        auctionViewModel.auctionType = "upcoming";
                        bottomViewModel.selectedIndex = 6;
                      } else if (index == 2) {
                        tabColor = Color(0xffE74B52);
                        auctionViewModel.auctionType = "past";
                        bottomViewModel.selectedIndex = 7;
                      }
                    });
                    print(index);
                  },
                  isScrollable: true,
                  indicator: BoxDecoration(color: tabColor),
                  padding: EdgeInsets.all(0),
                  unselectedLabelColor: Color(0xffFFFFFF).withOpacity(0.6),
                  labelColor: const Color(0xFFFFFFFF),
                  unselectedLabelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                  labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  tabs: [
                    Tab(
                      text: "LIVE AUCTION",
                    ),
                    Tab(text: "UPCOMING AUCTION"),
                    Tab(text: "PAST AUCTION"),
                  ],
                ),
              ),
            ),
          ),
          auctionViewModel.auctionType == "live" ? LiveTabs(auctionViewModel) : SliverToBoxAdapter(),
          auctionViewModel.auctionType == "upcoming" ? UpcommingTabs(auctionViewModel) : SliverToBoxAdapter(),
          auctionViewModel.auctionType == "live" ? LiveData(auctionViewModel) : SliverToBoxAdapter(),
          auctionViewModel.auctionType == "past" ? PastTabs(auctionViewModel) : SliverToBoxAdapter(),
          auctionViewModel.isLoadingForUpCommingAuction
              ? SliverToBoxAdapter(child: LinearProgressIndicator())
              : SliverToBoxAdapter(
                  child: Observer(builder: (context) {
                    return Container(
                        child: (auctionViewModel.upComingLotsResponse!.result!.lots ?? []).length == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("image/Bitmap1.png"),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .70,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'There is ',
                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'No Lots',
                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text: '\n at this moment',
                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container());
                  }),
                ),
          auctionViewModel.auctionType == "past" && auctionViewModel.liveAuctionType == "browselots"
              ? PastData(auctionViewModel)
              : SliverToBoxAdapter(),
          auctionViewModel.auctionType == "upcoming" && auctionViewModel.liveAuctionType == "lots"
              ? UpcommingData(auctionViewModel)
              : SliverToBoxAdapter(),
          auctionViewModel.auctionType == "past" && auctionViewModel.liveAuctionType == "auctionresult"
              ? PastAuctionResultData(auctionViewModel)
              : SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: auctionViewModel.liveAuctionType != "closingschedule"
                ? Container()
                : Observer(builder: (context) {
                    return SizedBox(
                      height: 40,
                    );
                  }),
          ),
          SliverToBoxAdapter(
              child: auctionViewModel.liveAuctionType == "review"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                builder: (BuildContext dialogContext) {
                                  return SafeArea(
                                    child: Scaffold(
                                      body: StatefulBuilder(builder:
                                          (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                        return Observer(builder: (context) {
                                          return Container(
                                              padding: EdgeInsets.all(16),
                                              height: MediaQuery.of(context).size.height,
                                              color: Color(0xffF5F5F5),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.tune_rounded,
                                                        size: 30,
                                                        color: Theme.of(context).colorScheme.primary,
                                                      ),
                                                      // Image.asset("image/filter.png",color: Theme.of(context).,),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "FILTER BY",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Color(0xffE74B52),
                                                              letterSpacing: 1,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "RESET",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Colors.grey,
                                                              letterSpacing: 1,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                      ),
                                                      // Image.asset("image/sort.png",color: Theme.of(context).colorScheme.primary),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 24,
                                                  ),
                                                  Expanded(
                                                    child: Scrollbar(
                                                      interactive: true,
                                                      thumbVisibility: true,
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        // physics: ScrollPhysics(),
                                                        itemCount: data.length,
                                                        itemBuilder: (BuildContext context, int index) =>
                                                            _buildList(data[index]),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                    side: BorderSide(
                                                                        color: Color(0xff747474), width: 0.38)))),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 32.0, left: 32, top: 12, bottom: 12),
                                                          child: Text(
                                                            'CLOSE',
                                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                  color: Colors.black,
                                                                  letterSpacing: 1,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Spacer(),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all(Color(0xffE74B52)),
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                              // side: BorderSide(color: Colors.red)
                                                            ))),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => FillterSearchpage()));
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 32.0, left: 32, top: 12, bottom: 12),
                                                          child: Text(
                                                            'APPLY',
                                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                ],
                                              ));
                                        });
                                      }),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            color: Color(0xffF4F4F4),
                            padding: EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12),
                            child: Row(
                              children: [
                                // Image.asset("image/filter.png",color: Colors.grey,height: 24),
                                Icon(
                                  Icons.tune_rounded,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "FILTER BY",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder: (_, state) {
                                    return Observer(builder: (context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Image.asset("image/sort.png",color: Theme.of(context).colorScheme.primary),
                                            Text(
                                              "Sort By",
                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Colors.black,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),

                                            Column(children: [
                                              ListTile(
                                                leading: Checkbox(
                                                  value: auctionViewModel.sort == "LatestLots",
                                                  onChanged: (bool? value) {
                                                    state(() {
                                                      if (value ?? false) {
                                                        auctionViewModel.sort = "LatestLots";
                                                      } else {
                                                        auctionViewModel.sort = "";
                                                      }
                                                    });
                                                  },
                                                ),
                                                title: Text(
                                                  "Latest Bids",
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                ),
                                                onTap: () {
                                                  // Navigator.pop(context);
                                                  state(() {
                                                    auctionViewModel.sort = "LatestLots";
                                                  });
                                                },
                                              ),
                                              ListTile(
                                                leading: Checkbox(
                                                  value: auctionViewModel.sort == "SignificantLots",
                                                  onChanged: (bool? value) {
                                                    state(() {
                                                      if (value ?? false) {
                                                        auctionViewModel.sort = "SignificantLots";
                                                      } else {
                                                        auctionViewModel.sort = "";
                                                      }
                                                    });
                                                  },
                                                ),
                                                title: Text(
                                                  "Significant Lots By Value",
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                ),
                                                onTap: () {
                                                  state(() {
                                                    auctionViewModel.sort = "SignificantLots";
                                                  });
                                                },
                                              ),
                                              ListTile(
                                                leading: Checkbox(
                                                  value: auctionViewModel.sort == "NoOfBidsLots",
                                                  onChanged: (bool? value) {
                                                    state(() {
                                                      if (value ?? false) {
                                                        auctionViewModel.sort = "NoOfBidsLots";
                                                      } else {
                                                        auctionViewModel.sort = "";
                                                      }
                                                    });
                                                  },
                                                ),
                                                title: Text(
                                                  "No of Bids",
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                ),
                                                onTap: () {
                                                  state(() {
                                                    auctionViewModel.sort = "NoOfBidsLots";
                                                  });
                                                },
                                              ),
                                              ListTile(
                                                leading: Checkbox(
                                                  value: auctionViewModel.sort == "ClosingLots",
                                                  onChanged: (bool? value) {
                                                    state(() {
                                                      if (value ?? false) {
                                                        auctionViewModel.sort = "ClosingLots";
                                                      } else {
                                                        auctionViewModel.sort = "";
                                                      }
                                                    });
                                                    // auctionViewModel.sort =
                                                    //     "Closing_Lots";
                                                  },
                                                ),
                                                title: Text(
                                                  "Closing Lots",
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                ),
                                                onTap: () {
                                                  state(() {
                                                    auctionViewModel.sort = "ClosingLots";
                                                  });
                                                },
                                              ),
                                            ]),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                              side:
                                                                  BorderSide(color: Color(0xff747474), width: 0.38)))),
                                                  onPressed: () {
                                                    state(() {
                                                      auctionViewModel.sort = "";
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        right: 32.0, left: 32, top: 12, bottom: 12),
                                                    child: Text(
                                                      'CLOSE',
                                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Colors.black,
                                                            letterSpacing: 1,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Spacer(),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Color(0xffE74B52)),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        // side: BorderSide(color: Colors.red)
                                                      ))),
                                                  onPressed: () async {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             FillterSearchpage()));
                                                    await auctionViewModel.sortAUction(
                                                        auctionViewModel.selectedAuction!.auctionId!,
                                                        auctionViewModel.sort);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        right: 32.0, left: 32, top: 12, bottom: 12),
                                                    child: Text(
                                                      'APPLY',
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Colors.white,
                                                            letterSpacing: 1,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  });
                                });
                          },
                          child: Container(
                            color: Color(0xffF4F4F4),
                            padding: EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sort,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "SORT BY",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : Container()),
          SliverToBoxAdapter(
            child: Container(
              // color: Color(0xff1F2A52),
              height: 30,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SliverToBoxAdapter(
              child: auctionViewModel.auctionType == "upcoming"
                  ? Container()
                  : auctionViewModel.isLoadingForlots
                      ? Container()
                      : Center(
                          child: getPageNavigator(
                              auctionViewModel.liveAuctionType == "browselist"
                                  ? auctionViewModel.upComingLotsResponse!.result!.lots!.last.PaginationSize ?? 1
                                  : auctionViewModel.liveAuctionType == "review"
                                      ? auctionViewModel.getliveauctionsResponse!.result!.lots!.last.PaginationSize ?? 1
                                      : auctionViewModel.liveAuctionType == "browselist"
                                          ? auctionViewModel
                                                  .myAuctionGalleryResponse!.result!.lots!.last.PaginationSize ??
                                              1
                                          : 1,
                              auctionViewModel.page),
                        )),
          SliverToBoxAdapter(
            child: Container(
              // color: Color(0xff1F2A52),
              height: 30,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xff1F2A52),
              height: 30,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ]),
      );
    });
  }

  getPageNavigator(int totalPages, int current_Page) {
    List numList = [];
    if (current_Page < 4) {
      if (totalPages < 9) {
        for (int i = 0; i < totalPages; i++) {
          numList.add(i);
        }
      } else {
        for (int i = 0; i < 9; i++) {
          numList.add(i);
        }
      }
    } else {
      if ((current_Page + 4) < (totalPages)) {
        for (int i = current_Page - 4; i < current_Page + 5; i++) {
          numList.add(i);
        }
      } else {
        for (int i = totalPages > 9 ? totalPages - 9 : 0; i < totalPages; i++) {
          numList.add(i);
        }
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          totalPages < 6
              ? Container()
              : InkWell(
                  child: Image.asset(
                    'image/arrow-previous-pngrepo-com.png',
                    width: 20,
                    height: 30,
                    color: Color(0xffE74B52),
                  ),
                  onTap: () {
                    // loadData(purchaseViewModel.itemperpage, 0);
                  },
                ),
          totalPages < 6
              ? Container()
              : SizedBox(
                  width: 8,
                ),
          totalPages < 6
              ? Container()
              : InkWell(
                  child: Image.asset(
                    'image/previous-pngrepo-com.png',
                    width: 20,
                    height: 30,
                    color: Color(0xffE74B52),
                  ),
                  onTap: () async {
                    // await loadData(purchaseViewModel.itemperpage ?? 10, current_Page == 0 ? 0 : (current_Page - 1));
                  },
                ),
          SizedBox(
            width: 8,
          ),
          Row(
            //  children: List.generate(productViewModel.getProductsPagingatedResponse!.totalpage??1, (index) =>
            children: numList
                .map((index) => InkWell(
                      onTap: () async {
                        auctionViewModel.page = index + 1;
                        await auctionViewModel.getUpcommingBidAuction(auctionViewModel.selectedAuction!.auctionId!);
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(color: current_Page == (index + 1) ? Color(0xffE74B52) : Colors.blue),
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 8, bottom: 0),
                        child: Center(
                          child: Text(
                            "${(index + 1)}",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            width: 8,
          ),
          totalPages < 6
              ? Container()
              : InkWell(
                  child: Image.asset(
                    'image/next-pngrepo-com.png',
                    width: 20,
                    height: 30,
                    color: Color(0xffE74B52),
                  ),
                  onTap: () async {
                    // await loadData(purchaseViewModel.itemperpage ?? 10,
                    //     current_Page == (totalPages - 1) ? (current_Page) : (current_Page + 1));
                  },
                ),
          totalPages < 6
              ? Container()
              : SizedBox(
                  width: 8,
                ),
          totalPages < 6
              ? Container()
              : InkWell(
                  child: Image.asset(
                    'image/next-pngrepo-com (1).png',
                    width: 20,
                    height: 30,
                    color: Color(0xffE74B52),
                  ),
                  onTap: () {
                    // loadData(purchaseViewModel.itemperpage, (totalPages ?? 1) - 1);
                  },
                ),
        ],
      ),
    );
  }
}

class Menu {
  String? name;
  IconData? icon;
  List<Menu>? subMenu = [];

  Menu({this.name, this.subMenu, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new Menu.fromJson(v));
      });
    }
  }
}

List dataList = [
  {
    "name": "Category",
    "icon": Icons.payment,
    "subMenu": [
      {"name": "Contemporary Art"},
      {"name": "Paintings"},
      {"name": "Antique Furniture"},
      {"name": "Antique"}
    ]
  },
  {
    "name": "Artist Name",
    "icon": Icons.volume_up,
    "subMenu": [
      {"name": "Jamini Roy"},
      {"name": "M. F. Hussain"},
      {"name": "Horace Van Ruth"},
      {"name": "Sailoz Mookherhea"}
    ]
  },
  {
    "name": "Price",
    "subMenu": [
      {"name": "0-500"},
      {"name": "500-1000"},
      {"name": "1000-2000"},
      {"name": "above 2000"}
    ]
  },
];
