import 'dart:async';
import 'dart:math';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/homepage/liveitem.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

AuctionViewModel auctionViewModel = AuctionViewModel();

class LiveAuctionUi extends StatefulWidget {
  String auction;

  LiveAuctionUi(this.auction);

  @override
  _LiveAuctionUiState createState() => _LiveAuctionUiState();
}

class _LiveAuctionUiState extends State<LiveAuctionUi> {
  int _pageIndex = 0;

  Color tabColor = Color(0xffE74B52);
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true, selected = false;

  @override
  void initState() {
    // TODO: implement initState
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    auctionViewModel.auctionType = widget.auction;

    if (widget.auction == "live") {
      auctionViewModel.getUpcommingAuction("Live");
    } else if (widget.auction == "past") {
      auctionViewModel.getUpcommingAuction("Past");
    } else {
      auctionViewModel.getUpcommingAuction("UpComing");
    }

    super.initState();
    reset();
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = new Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(new Duration(seconds: 1), (_) => addTime());
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
      return CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: NavBar(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: Text(
              "OPULENT COLLECTIBLES",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Observer(builder: (context) {
            return Container(
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
            );
          }),
        ),
        SliverToBoxAdapter(
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
                      child: Image.asset("image/Bitmap.png"),
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
                              "25th-27th Aug, 2022",
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
          child: Observer(builder: (context) {
            return Container(
              color: Theme.of(context).colorScheme.onPrimary,
              child: DefaultTabController(
                length: 3,
                initialIndex: widget.auction == "live"
                    ? 0
                    : widget.auction == "upcoming"
                        ? 1
                        : 2,
                child: TabBar(
                  onTap: (index) async {
                    setState(() async {
                      if (index == 0) {
                        tabColor = Color(0xffE74B52);
                        auctionViewModel.auctionType = "live";
                        await auctionViewModel.getUpcommingAuction("Live");
                      } else if (index == 1) {
                        tabColor = Color(0xffE74B52);
                        auctionViewModel.auctionType = "upcoming";
                        auctionViewModel.getUpcommingAuction("UpComing");
                      } else if (index == 2) {
                        tabColor = Color(0xffE74B52);
                        auctionViewModel.auctionType = "past";
                        auctionViewModel.getUpcommingAuction("Past");
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
            );
          }),
        ),
        auctionViewModel.auctionType == "live"
            ? auctionViewModel.upcomingAuctionResponse == null
                ? SliverToBoxAdapter(child: Container())
                : (auctionViewModel.upcomingAuctionResponse!.result!.auctions ?? []).length == 0
                    ? SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.rotate(
                                angle: -pi / 35.13, child: Image.asset("image/auctionhammer.png", width: 266)),
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
                                      text: 'No Live Auction',
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
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          addAutomaticKeepAlives: true,
                          addSemanticIndexes: true,
                          (BuildContext context, int index) {
                            return LiveItem(auctionViewModel.upcomingAuctionResponse!.result!.auctions![index], index);
                          },
                          // 40 list items
                          childCount: auctionViewModel.upcomingAuctionResponse!.result == null
                              ? 0
                              : auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length,
                        ),
                      )
            : SliverToBoxAdapter(child: Container()),
        auctionViewModel.isLoadingForUpCommingAuction
            ? SliverToBoxAdapter(child: LinearProgressIndicator())
            : SliverToBoxAdapter(
                child: Observer(builder: (context) {
                  return auctionViewModel.auctionType == "upcoming"
                      ? Container(
                          child: auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length == 0
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
                                              text: 'No Upcoming Auction',
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
                              : auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 1
                                  ? Container(
                                      padding: EdgeInsets.all(16),
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "5 Days Until Online \nBidding Opens",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                                  color: Color(0xff2d2d2d),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                              final Event event = Event(
                                                title:
                                                    '${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}',
                                                description:
                                                    '${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}',
                                                location: 'Event location',
                                                startDate: DateTime.parse(auctionViewModel
                                                    .upcomingAuctionResponse!.result!.auctions![0]!.auctionDate!),
                                                endDate: DateTime.parse(auctionViewModel
                                                    .upcomingAuctionResponse!.result!.auctions![0]!.auctionEndDate!),
                                                iosParams: IOSParams(
                                                  reminder: Duration(
                                                      /* Ex. hours:1 */), // on iOS, you can set alarm notification after your event.
                                                  url:
                                                      '${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionURL}', // on iOS, you can set url to your event.
                                                ),
                                                androidParams: AndroidParams(
                                                  emailInvites: [], // on Android, you can add invite emails to your event.
                                                ),
                                              );

                                              Add2Calendar.addEvent2Cal(event);
                                            },
                                            child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context).size.width * .65,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(colors: [
                                                      Color(0xffB45156),
                                                      Color(0xffE74B52),
                                                    ]),
                                                    borderRadius: BorderRadius.circular(20)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(right: 5.0, left: 5, top: 12, bottom: 12),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'ADD TO CALENDER',
                                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                color: Color(0XFFFFFFFF),
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Image.asset(
                                                          "image/cal.png",
                                                          height: 25,
                                                          width: 25,
                                                          color: Color(0XFFFFFFFF),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  top: 54,
                                                  child: Container(
                                                    height: 500,
                                                    width: MediaQuery.of(context).size.width,
                                                    decoration: BoxDecoration(color: Color(0xffF8F8F8)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topCenter,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Image.network(
                                                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].image}",
                                                        fit: BoxFit.contain,
                                                      ),
                                                      Container(
                                                        child: SizedBox(
                                                          width: MediaQuery.of(context).size.width,
                                                          child: Wrap(
                                                            // mainAxisAlignment: MainAxisAlignment.start,
                                                            // mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Text(
                                                                  "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}",
                                                                  style:
                                                                      Theme.of(context).textTheme.headline6!.copyWith(
                                                                            fontWeight: FontWeight.bold,
                                                                            letterSpacing: 2,
                                                                            color: Color(0xff585858),
                                                                          )),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text(
                                                                  "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}",
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .headline6!
                                                                      .copyWith(fontWeight: FontWeight.normal)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LiveAuctionUiDetails(widget.auction)));

                                                          if ((auctionViewModel.upcomingAuctionResponse!.result!
                                                                  .auctions![0].auctionDate!) !=
                                                              "TBA") {
                                                            auctionViewModel.upComingLotsResponse = null;
                                                            setState(() {
                                                              auctionViewModel.selectedAuction = auctionViewModel
                                                                  .upcomingAuctionResponse!.result!.auctions![0];

                                                              bottomViewModel.setIndex(8);
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              color: Color(0xffEAEEF2),
                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                          child: Text(
                                                            (auctionViewModel.upcomingAuctionResponse!.result!
                                                                        .auctions![0].auctionDate!) ==
                                                                    "TBA"
                                                                ? "SHOW INTEREST"
                                                                : "EXPLORE",
                                                            textAlign: TextAlign.start,
                                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                letterSpacing: 2),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                          "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].displayDate!.split(",")[0].trim()}",
                                                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                                              fontWeight: FontWeight.normal,
                                                              color: Theme.of(context).colorScheme.primary,
                                                              letterSpacing: 2)),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                          "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].displayDate!.split(",")[1].trim()}",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .subtitle1!
                                                              .copyWith(color: Color(0xff585858))),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 2
                                              ? Container(
                                                  decoration: BoxDecoration(color: Color(0xffEAEEF2)),
                                                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 4),
                                                  margin: EdgeInsets.only(top: 32),
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Image.network(
                                                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].image}",
                                                        fit: BoxFit.contain,
                                                        height: 120,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width * .5,
                                                            child: Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].auctionName!}",
                                                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                  color: Colors.black, fontWeight: FontWeight.bold),
                                                              textAlign: TextAlign.justify,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 32,
                                                          ),
                                                          Text(
                                                            "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].displayDate!.split(",")[0].trim()}",
                                                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                                                fontWeight: FontWeight.normal,
                                                                color: Colors.black,
                                                                letterSpacing: 2),
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].displayDate!.split(",")[1].trim()}",
                                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Colors.black,
                                                                  )),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if ((auctionViewModel.upcomingAuctionResponse!.result!
                                                                      .auctions![1].auctionDate!) !=
                                                                  "TBA") {
                                                                auctionViewModel.upComingLotsResponse = null;
                                                                setState(() {
                                                                  auctionViewModel.selectedAuction = auctionViewModel
                                                                      .upcomingAuctionResponse!.result!.auctions![1];

                                                                  bottomViewModel.setIndex(8);
                                                                });
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffEAEEF2),
                                                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                                                              child: Text(
                                                                (auctionViewModel.upcomingAuctionResponse!.result!
                                                                            .auctions![1].auctionDate!) ==
                                                                        "TBA"
                                                                    ? "SHOW INTEREST"
                                                                    : "EXPLORE",
                                                                textAlign: TextAlign.start,
                                                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    letterSpacing: 2),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                          auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 3
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].image}"),
                                                          fit: BoxFit.fill,
                                                          opacity: .2)),
                                                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 4),
                                                  // margin: EdgeInsets.symmetric(vertical: 32),
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      // Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].image}",height: 120,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width * .8,
                                                            child: Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].auctionName!}",
                                                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                  color: Colors.white, fontWeight: FontWeight.bold),
                                                              textAlign: TextAlign.justify,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 32,
                                                          ),
                                                          Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].displayDate!.split(",")[0].trim()}",
                                                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                                                  fontWeight: FontWeight.normal,
                                                                  color: Colors.white,
                                                                  letterSpacing: 2)),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].displayDate!.split(",")[1].trim()}",
                                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Colors.white,
                                                                  )),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if ((auctionViewModel.upcomingAuctionResponse!.result!
                                                                      .auctions![2].auctionDate!) !=
                                                                  "TBA") {
                                                                auctionViewModel.upComingLotsResponse = null;
                                                                setState(() {
                                                                  auctionViewModel.selectedAuction = auctionViewModel
                                                                      .upcomingAuctionResponse!.result!.auctions![3];

                                                                  bottomViewModel.setIndex(8);
                                                                });
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffEAEEF2),
                                                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                                                              child: Text(
                                                                (auctionViewModel.upcomingAuctionResponse!.result!
                                                                            .auctions![2].auctionDate!) ==
                                                                        "TBA"
                                                                    ? "SHOW INTEREST"
                                                                    : "EXPLORE",
                                                                textAlign: TextAlign.start,
                                                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    letterSpacing: 2),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                          auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 4
                                              ? Container(
                                                  decoration: BoxDecoration(color: Color(0xffF8F8F8)),
                                                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 4),
                                                  // margin: EdgeInsets.symmetric(vertical: 32),
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Image.network(
                                                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].image}",
                                                        height: 120,
                                                        fit: BoxFit.contain,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width * .5,
                                                            child: Text(
                                                                "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].auctionName!}",
                                                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                    color: Colors.black, fontWeight: FontWeight.bold)),
                                                          ),
                                                          SizedBox(
                                                            height: 32,
                                                          ),
                                                          Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].displayDate!.split(",")[0].trim()}",
                                                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                                                  fontWeight: FontWeight.normal,
                                                                  color: Colors.black,
                                                                  letterSpacing: 2)),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(
                                                              "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].displayDate!.split(",")[1].trim()}",
                                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Colors.black,
                                                                  )),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if ((auctionViewModel.upcomingAuctionResponse!.result!
                                                                      .auctions![3].auctionDate!) !=
                                                                  "TBA") {
                                                                setState(() {
                                                                  auctionViewModel.upComingLotsResponse = null;
                                                                  auctionViewModel.selectedAuction = auctionViewModel
                                                                      .upcomingAuctionResponse!.result!.auctions![3];

                                                                  bottomViewModel.setIndex(8);
                                                                });
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffEAEEF2),
                                                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                                                              child: Text(
                                                                (auctionViewModel.upcomingAuctionResponse!.result!
                                                                            .auctions![1].auctionDate!) ==
                                                                        "TBA"
                                                                    ? "SHOW INTEREST"
                                                                    : "EXPLORE",
                                                                textAlign: TextAlign.start,
                                                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    letterSpacing: 2),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    )
                                  : Container(),
                        )
                      : Container();
                }),
              ),
        auctionViewModel.isLoadingForUpCommingAuction
            ? SliverToBoxAdapter(child: LinearProgressIndicator())
            : SliverToBoxAdapter(
                child: Observer(builder: (context) {
                  print(auctionViewModel.auctionType);
                  return auctionViewModel.auctionType == "past"
                      ? Container(
                          child: auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length == 0
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
                                              text: 'No Past Auction',
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
                              : Container(
                                  padding: EdgeInsets.all(16),
                                  // child: Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Container(
                                  //
                                  //         child: CustomScrollView(slivers: [
                                  //           Column(
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisAlignment: MainAxisAlignment.center,
                                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                                  //                 children: [
                                  //                 Image.asset("image/cal.png",color: Color(0xff80A071),),
                                  //                   SizedBox(width: 10,),
                                  //                   Text("2022",
                                  //                     textAlign: TextAlign.center,
                                  //                     style:
                                  //                     Theme.of(context).textTheme.headline6!.copyWith(
                                  //                       color: Colors.black,
                                  //                       fontWeight: FontWeight.w600,
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //               SizedBox(height: 16,)
                                  //             ],
                                  //           ),
                                  //
                                  //         ])
                                  //     ),
                                  //     SizedBox(height: 10,),
                                  //     Center(
                                  //       child: ElevatedButton(
                                  //         style:   ButtonStyle(
                                  //             backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                  //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  //                 RoundedRectangleBorder(
                                  //                     borderRadius: BorderRadius.circular(20.0),
                                  //                     side: BorderSide(color: Color(0xff747474),width: 0.38)
                                  //                 )
                                  //             )
                                  //         ),
                                  //         onPressed: (){
                                  //         },
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                  //           child: Text('Load More', style:
                                  //           Theme.of(context).textTheme.bodyText1!.copyWith(
                                  //             color: Color(0XFF2D2D2D),
                                  //             fontWeight: FontWeight.w600,
                                  //           ),),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                        )
                      : Container();
                }),
              ),
        auctionViewModel.isLoadingForUpCommingAuction
            ? SliverToBoxAdapter(child: LinearProgressIndicator())
            : auctionViewModel.upcomingAuctionResponse!.result == null
                ? SliverToBoxAdapter(child: Container())
                : auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 1
                    ? auctionViewModel.auctionType == "past"
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                              addAutomaticKeepAlives: true,
                              addSemanticIndexes: true,
                              (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    auctionViewModel.selectedAuction =
                                        auctionViewModel.upcomingAuctionResponse!.result!.auctions![index];

                                    bottomViewModel.selectedIndex = 8;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                        color: Color(0xffFFFFFF),
                                        height: 480.0,
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: MediaQuery.of(context).size.width * .8,
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(bottom: 17),
                                        child: Stack(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 80 / 2.0, bottom: 0),
                                            child: Container(
                                              //replace this Container with your Card
                                              color: Colors.black.withOpacity(0.05),
                                              height: 500.0,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 35.0, right: 25),
                                              child: Image.network(
                                                "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].image}",
                                                height: 300,
                                                width: MediaQuery.of(context).size.width * .8,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 310, bottom: 0, left: 25.0, right: 25),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].auctionName}",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                                          color: Colors.black,
                                                          letterSpacing: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].auctionDate}",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                          color: Color(0xff747474),
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Total Sales Value",
                                                            textAlign: TextAlign.center,
                                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "₹${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].totalSaleValue}",
                                                            textAlign: TextAlign.center,
                                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                  color: Theme.of(context).colorScheme.primary,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                right: 8.0, left: 8, top: 12, bottom: 12),
                                                            child: Text(
                                                              'View All',
                                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    color: Color(0XFF1F2A52),
                                                                    decoration: TextDecoration.underline,
                                                                    letterSpacing: 1,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              )),
                                        ])),
                                  ),
                                );
                              },
                              // 40 list items
                              childCount: auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length,
                            ),
                          )
                        : SliverToBoxAdapter(child: Container())
                    : SliverToBoxAdapter(child: Container()),
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
          child: SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Color(0xff1F2A52),
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ]);
    });
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
