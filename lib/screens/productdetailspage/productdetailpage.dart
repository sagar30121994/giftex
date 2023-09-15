import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/popwidget.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

import '../../data/network/models/responce/lot/upcominglotsresponse.dart';
import '../components/header.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(this.lots, this.auctionViewModel);

  Lots lots;
  AuctionViewModel auctionViewModel;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with AutomaticKeepAliveClientMixin {
  String newsType = "ARTWORK DETAIL";
  int _pageIndex = 0;
  bool countDown = true, selected = false;
  Color tabColor = Color(0xff6D905D);
  bool onClick = false;
  LocalSharedPrefrence? preference;

  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(10, top, left, 0),
      items: widget.lots.liveStatus!.next5ValidBid!
          .map((e) => PopupMenuItem(
                value: 1,
                child: Text(
                  "₹${formateNumber(e.iNR ?? "0")}",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0XFF2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ))
          .toList(),
      elevation: 8.0,
    );
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###', 'HI');

    return f.format(double.parse(number));
  }

  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  @override
  void initState() {
    // TODO: implement initState
    // print("skjnxkasjsk"+widget.lots.auctionType!);
    preference = new LocalSharedPrefrence();
    initData();
    checkEvent();
    super.initState();
  }

  bool isFirst = false;
  bool isFirstLike = false;
  bool isFirstLot = false;

  void checkEvent() {
    final lotReference = FirebaseDatabase.instance.ref("Lot/" + widget.lots.lotId!);
    final likeReference = FirebaseDatabase.instance
        .ref("like/" + widget.auctionViewModel.localSharedPrefrence.getUserId() + "/" + widget.lots.lotId!);

    final userlikeReference =
        FirebaseDatabase.instance.ref("userlike/" + widget.auctionViewModel.localSharedPrefrence.getUserId());

    userlikeReference.onValue.listen((DatabaseEvent event) {
      print(event);
      final data = event.snapshot.value;

      if (widget.auctionViewModel.liveAuctionType == "mygallery") {
        widget.auctionViewModel.myAuctionGallery();
      }
    });

    print(FirebaseDatabase.instance.databaseURL);

    // firebaseRef = database.ref("Lot/" + widget.lots.lotId!);

    lotReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print("*********" + data.toString());

      if (data.toString() != "null") {
        if (!isFirstLot) {
          isFirstLot = true;
        } else {
          initData();
        }
      }
    });

    likeReference.onValue.listen((DatabaseEvent event) {
      print("*********" + event.toString());
      final data = event.snapshot.value;
      if (data.toString() != "null") {
        setState(() {
          widget.lots.isLiked = data.toString();
        });
      }
    });
  }

  void initData() async {
    await widget.auctionViewModel.getBidHistoryAuction(widget.lots.lotId!);
    await widget.auctionViewModel.getLotById(widget.lots.lotId!);
    setState(() {
      widget.lots = widget.auctionViewModel.getsingleResponse!.result!.lots![0];
    });

    if ((widget.lots.status ?? "") == "Live" && widget.auctionViewModel.auctionType == "live") {
      myDuration = Duration(seconds: int.parse(widget.lots.liveStatus!.remainingSeconds ?? "0"));

      // if (countdownTimer != null) {
      //   setState(() => countdownTimer!.cancel());
      // }

      startTimer();
    }

    widget.auctionViewModel.selectedProxyBid = '';
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  // void resetTimer() {
  //   stopTimer();
  //   setState(() => myDuration = Duration(days: 5));
  // }

  String hours = "00";
  String minutes = "00";
  String seconds = "00";

  void setCountDown() {
    final reduceSecondsBy = 1;

    final secondss = myDuration.inSeconds - reduceSecondsBy;
    if (secondss < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: secondss);
    }
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inHours);
    // Step 7
    if (mounted) {
      setState(() {
        hours = strDigits(myDuration.inHours);
        minutes = strDigits(myDuration.inMinutes.remainder(60));
        seconds = strDigits(myDuration.inSeconds.remainder(60));
      });
    }
  }

  int position = 0;
  final sliderController = PageController();
  Timer? timerForTimer;

  startTimerForSlider() {
    timerForTimer = Timer.periodic(Duration(seconds: 4), (_) async {
      setState(() {
        if (widget.lots.images == null) {
        } else {
          if (position != widget.lots.images!.length - 1) {
            position++;
            sliderController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
          } else {
            position = 0;
            sliderController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("${hours} ${minutes} ${seconds} ${myDuration.inSeconds}");

    return Scaffold(
      body: Observer(builder: (context) {
        return CustomScrollView(slivers: <Widget>[
          // children: [
          SliverToBoxAdapter(
            child: NavBar(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 16,
              color: Colors.white,
            ),
          ),

          widget.auctionViewModel.isLoadingForUpCommingAuction
              ? SliverToBoxAdapter(
                  child: LinearProgressIndicator(),
                )
              : SliverToBoxAdapter(
                  child: (widget.lots.images ?? []).length == 0
                      ? Container()
                      : Observer(builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffF8F8F8),
                            height: 260,
                            child: Column(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 25.0,right: 25),
                                //   child: Image.network("${widget.lots.thumbImage}",height: 180,),
                                // ),
                                SizedBox(
                                  height: 190,
                                  width: MediaQuery.of(context).size.width,
                                  child: PageView.builder(
                                    controller: sliderController,
                                    onPageChanged: (pos) {
                                      setState(() {
                                        position = pos % 4;
                                      });
                                    },
                                    itemCount: (widget.lots.images ?? []).length,
                                    itemBuilder: (context, pos) => SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        height: 190,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                                          child: Image.network("${widget.lots.images![pos].bigImage}",
                                              fit: BoxFit.contain,
                                              height: 220,
                                              width: MediaQuery.of(context).size.width),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  side: BorderSide(color: Color(0xffFFFFFF), width: 0.38)))),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5.0, left: 5, top: 10, bottom: 10),
                                        child: Text(
                                          'View in room',
                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                                color: Color(0XFF2D2D2D),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Share.share('${widget.lots == null ? '' : widget.lots.lotURL ?? ''}');
                                      },
                                      child: Image.asset(
                                        "image/share.png",
                                        height: 32,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    /*  Image.asset(
                                      "image/save.png",
                                      height: 32,
                                    ),*/
                                    // Icon(Icons.bookmark_border,size: 24,color: Theme.of(context).colorScheme.primary,),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                ),

          widget.auctionViewModel.isLoadingForUpCommingAuction
              ? SliverToBoxAdapter()
              : widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo == null
                  ? SliverToBoxAdapter(child: Container())
                  : widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo!.description == null ||
                          widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo!.description == ""
                      ? SliverToBoxAdapter()
                      : SliverToBoxAdapter(
                          child: Container(
                            color: Color(0xffF7FAFD),
                            child: DefaultTabController(
                              length: 2,
                              child: SingleChildScrollView(
                                child: TabBar(
                                  onTap: (index) {
                                    setState(() {
                                      if (index == 1) {
                                        newsType = "PROVENANCE DETAILS";
                                      } else {
                                        newsType = "ARTWORK DETAIL";
                                      }

                                      // if(index==0) { tabColor = Color(0xff6D905D);}
                                      // if(index==1) {tabColor =  Color(0xff6D905D);}
                                      // if(index==2) {tabColor =  Color(0xff6D905D);}
                                    });
                                    print(index);
                                  },
                                  // indicator: BoxDecoration(
                                  //     color: tabColor
                                  // ),
                                  indicatorColor: Theme.of(context).colorScheme.primary,
                                  isScrollable: true,
                                  padding: EdgeInsets.all(0),
                                  unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                                  labelColor: const Color(0xFF000000),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),

                                  tabs: [
                                    Tab(text: "ARTWORK DETAIL"),
                                    Tab(text: "PROVENANCE DETAILS"),
                                    // Tab(text: "Condition"),
                                    // Tab(text: "Provenance"),
                                    // Tab(text: "Condition"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
          widget.auctionViewModel.getsingleResponse == null ||
                  widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo?.description == ""
              ? SliverToBoxAdapter()
              : SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: auctionViewModel.isLoadingForlots ? LinearProgressIndicator() : Container(),
            ),
          ),
          newsType == "ARTWORK DETAIL"
              ? auctionViewModel.isLoadingForlots
                  ? SliverToBoxAdapter()
                  : widget.auctionViewModel.isLoadingForUpCommingAuction
                      ? SliverToBoxAdapter()
                      : widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo == null ||
                              widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo!.description ==
                                  ""
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: HtmlWidget(
                                  '${widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo!.description}',
                                ),
                              ),
                            )
              : newsType == "PROVENANCE DETAILS"
                  ? auctionViewModel.isLoadingForlots
                      ? SliverToBoxAdapter()
                      : SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: HtmlWidget(
                              '${widget.auctionViewModel.getsingleResponse!.result!.lots![0].additionalInfo!.provenance}',
                            ),
                          ),
                        )
                  : SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Auction> Opulent Collectibles >Porcelain Pot ', style:
                  // Theme.of(context).textTheme.bodyText1!.copyWith(
                  //   color: Color(0XFF2D2D2D),
                  //   fontWeight: FontWeight.w600,
                  //   letterSpacing: 1
                  // ),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0xffF8F8F8),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color.fromRGBO(117, 206, 246, 0.249918),
                        ),
                        child: Text(
                          'Lot ${widget.lots.lotNumber}',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Color(0XFF2D2D2D),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(117, 206, 246, 0.249918),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  widget.lots.auctionType == "1"
                      ? Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                "${widget.lots.lotTitle}",
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                if (preference!.getLoginStatus()) {
                                  widget.auctionViewModel.addRemoveLotToWishlist(
                                      widget.lots, (widget.lots.isLiked ?? "false") == "true" ? "false" : "true");
                                } else {
                                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PopupWidget();
                                      },
                                    );
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                                }
                              },
                              icon: Icon(
                                (widget.lots.isLiked ?? "false") == "true" && preference!.getLoginStatus()
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: (widget.lots.isLiked ?? "false") == "true" && preference!.getLoginStatus()
                                    ? Colors.pink
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            )
                          ],
                        )
                      : Container(),

                  // widget.lots.auctionType == "1"
                  //     ? Text(
                  //   "${widget.lots.info!.title}",
                  //   textAlign: TextAlign.center,
                  //   style: Theme.of(context).textTheme.headline6!.copyWith(
                  //     color: Colors.black,
                  //     letterSpacing: 2,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // )
                  //     : Container(),
                  // Text('${widget.lots.info!.title}', style:
                  // Theme.of(context).textTheme.headline5!.copyWith(
                  //   color: Color(0XFF2D2D2D),
                  //   fontWeight: FontWeight.bold,
                  //   letterSpacing: 2
                  // ),),
                  SizedBox(
                    height: 16,
                  ),
                  ((widget.lots.info!.title ?? "") == "")
                      ? Container()
                      : Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                '${widget.lots.info!.title}',
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Color(0xffE74B52),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Color(0xff747474), width: 0.5)))),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0, left: 5, top: 10, bottom: 10),
                                child: Text(
                                  'Follow',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffE74B52), fontWeight: FontWeight.w600, letterSpacing: 1.33333),
                                ),
                              ),
                            ),
                          ],
                        ),
                  // SizedBox(height: 16,),
                  widget.auctionViewModel.auctionType == "past"
                      ? Container()
                      : widget.lots.status!.toLowerCase() == "upcoming"
                          ? Text(
                              'Opening Bid',
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF202232),
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          : Text(
                              'Estimate',
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF202232),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                  SizedBox(
                    height: 10,
                  ),
                  widget.lots.status!.toLowerCase() == "upcoming"
                      ? Text(
                          '₹${formateNumber(widget.lots.openingBid!.iNR ?? "")}',
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                color: Color(0XFF202232),
                                fontWeight: FontWeight.w500,
                              ),
                        )
                      : widget.auctionViewModel.auctionType == "past"
                          ? Column(
                              children: [
                                Text(
                                  '₹${formateNumber(widget.lots.leadingUser!.bid!.iNR ?? "0")}',
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                        color: Color(0XFF202232),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  "${widget.lots.leadingUser!.notes ?? ""}",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            )
                          : Text(
                              '₹${formateNumber(widget.lots.estimateFrom!.iNR ?? "0")} - ₹${formateNumber(widget.lots.estimateTo!.iNR ?? "")}',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Color(0XFF202232),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                  SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (context) {
                    return widget.auctionViewModel.auctionType == "past"
                        ? Container()
                        : widget.lots!.status!.toLowerCase() == "live"
                            ? Row(
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Current Bid',
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFF202232),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '₹${formateNumber(widget.lots.liveStatus!.currentBid!.iNR ?? "0")}',
                                          // style: Theme.of(context).textTheme.headline6!.copyWith(

                                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                                color: Color(0XFF202232),
                                                fontWeight: FontWeight.w600,
                                              ),
                                        )
                                      ]),
                                  IntrinsicHeight(
                                      child: VerticalDivider(color: Color.fromRGBO(226, 238, 220, 1), thickness: 2.0)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Valid Bid',
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0XFF202232),
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '₹${formateNumber(widget.lots.liveStatus!.nextValidBid!.iNR ?? "0")}',
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Color(0xffE74B52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : widget.lots!.status!.toLowerCase() == "upcoming"
                                ? (widget.lots!.proxyStatus == null
                                            ? '0'
                                            : widget.lots.proxyStatus!.proxyAmount!.iNR) ==
                                        "0"
                                    ? Container()
                                    : InkWell(
                                        onTap: () {
                                          if (preference!.getLoginStatus()) {
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
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.yellowAccent.withOpacity(.1),
                                              borderRadius: BorderRadius.circular(16)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Proxy Bid",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff202232),
                                                      // fontWeight: FontWeight.w400,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "₹${formateNumber((widget.lots!.proxyStatus == null ? '0' : widget.lots!.proxyStatus!.proxyAmount!.iNR ?? "0"))}",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff202232),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                : Container();
                  }),

                  SizedBox(
                    height: 16,
                  ),

                  ((widget.lots.proxyStatus == null ? '' : widget.lots.proxyStatus!.status) != "CanBid" &&
                          widget.lots.status!.toLowerCase() == "upcoming")
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            width: MediaQuery.of(context).size.width * .9,
                            decoration:
                                BoxDecoration(color: Color(0xffEAEEF2), borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Icon(Icons.download_outlined),
                                Text("${"DOWNLOAD PDF FOR CHANGE IN PROXY"}",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black)),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  widget.auctionViewModel.auctionType == "past"
                      ? Container()
                      : SizedBox(
                          height: 16,
                        ),
                  widget.auctionViewModel.auctionType == "past"
                      ? Container()
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xffF3E8E9)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xffFFFFFF), width: 0.38)))),
                          onPressed: () async {
                            await widget.auctionViewModel.getAdditionCharge(widget.lots);

                            if (widget.auctionViewModel.additionalChargeResponse!.status == "false") {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("${widget.auctionViewModel.additionalChargeResponse!.message}",
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.all(0),
                                      content: Container(
                                        padding: EdgeInsets.all(16),
                                        height: 580,
                                        width: MediaQuery.of(context).size.width,
                                        color: Color(0xffEAEEF2),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 20,
                                                        color: Color(0xff979797),
                                                      ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "image/Vector (22).png",
                                                    color: Color(0XFF202232),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'ADDITIONAL CHARGES',
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0XFF202232),
                                                        fontWeight: FontWeight.w400,
                                                        letterSpacing: 2),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                                  color: Color(0xffB45156),
                                                ),
                                                child: Text(
                                                  'Lot ${widget.lots.lotNumber}',
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                '${widget.lots.artistName}',
                                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0XFF2D2D2D),
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "image/Vector.png",
                                                    height: 20,
                                                    width: 20,
                                                    color: Color(0XFF202232),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width * .35,
                                                    child: Text(
                                                      'Medium: ${widget.lots.info!.medium}',
                                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0XFF2D2D2D),
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "image/Shape (8).png",
                                                    height: 20,
                                                    width: 20,
                                                    color: Color(0XFF202232),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    'Year: ${widget.lots.info!.year}',
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                          color: Color(0XFF2D2D2D),
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "image/Vector (1).png",
                                                    height: 20,
                                                    width: 20,
                                                    color: Color(0XFF202232),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    'Size: ${widget.lots.info!.size}',
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                          color: Color(0XFF2D2D2D),
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height: 210,
                                                width: MediaQuery.of(context).size.width * .7,
                                                color: Color(0xffD9D9D9),
                                                padding: EdgeInsets.all(16),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Price',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '₹ ${formateNumber(widget.auctionViewModel.additionalChargeResponse!.result!.price!.iNR!)}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${widget.auctionViewModel.additionalChargeResponse!.result!.taxation![0].name}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '₹ ${formateNumber(widget.auctionViewModel.additionalChargeResponse!.result!.taxation![0].value!.iNR!)}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${widget.auctionViewModel.additionalChargeResponse!.result!.taxation![1].name}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '₹ ${formateNumber(widget.auctionViewModel.additionalChargeResponse!.result!.taxation![1].value!.iNR!)}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${widget.auctionViewModel.additionalChargeResponse!.result!.taxation![2].name}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '₹ ${formateNumber(widget.auctionViewModel.additionalChargeResponse!.result!.taxation![2].value!.iNR!)}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Image.asset("image/Line 24.png"),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Total',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '₹ ${formateNumber(widget.auctionViewModel.additionalChargeResponse!.result!.total!.iNR!)}',
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                color: Color(0XFF202232),
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                              side: BorderSide(color: Color(0XFFB45156), width: 0.5)))),
                                                  onPressed: () {},
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(right: 0.0, left: 0, top: 12, bottom: 12),
                                                    child: Text(
                                                      'UPDATE YOUR BILLING DETAILS',
                                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                                          color: Color(0XFFB45156),
                                                          fontWeight: FontWeight.w700,
                                                          letterSpacing: 1.33333),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Note: Crating and shipping charged separately depending on delivery location.',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.caption!.copyWith(
                                                      color: Color(0XFF202232).withOpacity(0.61),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0, left: 5, top: 10, bottom: 10),
                            child: Text(
                              'View Additional charges',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0xffE74B52),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  widget.lots.auctionType == "2"
                      ? Text(
                          'Description',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0XFF202232),
                                fontWeight: FontWeight.w500,
                              ),
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  widget.lots.auctionType == "2"
                      ? Text(
                          '${(widget.lots.info!.lotTitle ?? "") == "" ? "NA" : widget.lots.info!.lotTitle}',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Color(0XFF747474),
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      : Container(),
                  SizedBox(
                    height: 16,
                  ),
                  widget.lots.auctionType == "1"
                      ? Row(
                          children: [
                            Image.asset("image/Vector.png", height: 20, width: 20),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Medium: ${widget.lots.info!.medium}',
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF2D2D2D),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.lots.auctionType == "1"
                      ? SizedBox(
                          height: 16,
                        )
                      : Container(),
                  widget.lots.auctionType == "1"
                      ? Row(
                          children: [
                            Image.asset("image/Shape (8).png", height: 20, width: 20),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Year: ${widget.lots.info!.year}',
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF2D2D2D),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.lots.auctionType == "1"
                      ? SizedBox(
                          height: 16,
                        )
                      : Container(),
                  widget.lots.auctionType == "1"
                      ? Row(
                          children: [
                            Image.asset("image/Vector (1).png", height: 20, width: 20),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Size: ${widget.lots.info!.size}',
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF2D2D2D),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.lots.auctionType == "1"
                      ? SizedBox(
                          height: 16,
                        )
                      : Container(),

                  (myDuration.inSeconds > 1 && widget.lots.status!.toLowerCase() == "live")
                      ? widget.auctionViewModel.auctionType == "past"
                          ? Container()
                          : Row(
                              children: [
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    onClick = true;
                                    _showPopupMenu(details.globalPosition);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Next 5 Bids',
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0XFF2D2D2D),
                                              fontWeight: FontWeight.w500,
                                              // decoration: TextDecoration.underline
                                            ),
                                      ),
                                      // SizedBox(width: 5,),
                                      onClick == false
                                          ? InkWell(
                                              onTap: () {
                                                onClick = true;
                                              },
                                              child: Icon(
                                                Icons.arrow_drop_up_sharp,
                                                size: 26,
                                                color: Color(0xff000000),
                                              ))
                                          : Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 26,
                                              color: Color(0xff000000),
                                            )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                (hours == "00" && minutes == "00" && seconds == "00")
                                    ? Container()
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Color(0xff75CEF6).withOpacity(.24)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    side: BorderSide(color: Color(0xffFFFFFF), width: 0.38)))),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5.0, left: 5, top: 10, bottom: 10),
                                          child: Text(
                                            '${hours}hrs: ${minutes}Mins: ${seconds}sec',
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0XFF2D2D2D),
                                                  fontWeight: FontWeight.w500,

                                                  // decoration: TextDecoration.underline
                                                ),
                                          ),
                                        ),
                                      ),
                              ],
                            )
                      : Container(),
                  (hours == "00" && minutes == "00" && seconds == "00")
                      ? Container()
                      : SizedBox(
                          height: 16,
                        ),
                  // (hours == "00" && minutes == "00" && seconds == "00")
                  //     ? Align(
                  //         alignment: Alignment.topRight,
                  //         child: Container(
                  //           padding: EdgeInsets.all(8),
                  //           decoration: BoxDecoration(
                  //               color: (widget.lots.leadingUser!.id ==
                  //                       widget.auctionViewModel.localSharedPrefrence.getUserId())
                  //                   ? Colors.blue
                  //                   : Colors.red,
                  //               borderRadius: BorderRadius.circular(16)),
                  //           child: Text(
                  //               "${(widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU WON" : widget.lots.bidCount == "0" ? "BOUGHT IN" : "BID CLOSED"}",
                  //               style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                  //         ),
                  //       )
                  //     :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      (widget.lots.status!.toLowerCase() == "live" &&
                              (hours != "00" && minutes != "00" && seconds != "00"))
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bid Closing in",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff747474),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Color(0xff8C9FB1),
                                        ),
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "${hours}",
                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
                                        )),
                                    Container(
                                        // color: Colors.black,
                                        padding: EdgeInsets.all(4),
                                        child: Text(":")),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Color(0xff8C9FB1),
                                        ),
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "${minutes}",
                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
                                        )),
                                    Container(
                                        // color: Colors.black,
                                        padding: EdgeInsets.all(4),
                                        child: Text(":")),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Color(0xff8C9FB1),
                                        ),
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "${seconds}",
                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      Spacer(),
                      (widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId())
                          ? Container()
                          : ((widget.lots.proxyStatus == null ? '' : widget.lots.proxyStatus!.status) == "CanBid" &&
                                  widget.lots.status!.toLowerCase() == "upcoming")
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                  onPressed: () async {
                                    bool checked = false;
                                    final textEditingController = TextEditingController();
                                    await widget.auctionViewModel.getProxyAmountByLot(widget.lots);

                                    if (widget.auctionViewModel.getProxyBidAmountResponse!.status == "true") {
                                      showModalBottomSheet<void>(
                                        // context and builder are
                                        // required properties in this widget
                                        context: context,
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        isDismissible: true,
                                        builder: (BuildContext context) {
                                          // we set up a container inside which
                                          // we create center column and display text

                                          // Returning SizedBox instead of a Container
                                          return StatefulBuilder(builder: (_, builder) {
                                            return SizedBox(
                                              height: MediaQuery.of(context).size.height - 150,
                                              child: Observer(builder: (context) {
                                                return Container(
                                                  height: MediaQuery.of(context).size.height,
                                                  width: MediaQuery.of(context).size.width,
                                                  color: Color(0xffEAEEF2),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment.topRight,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              widget.auctionViewModel.selectedProxyBid = "";
                                                              Navigator.of(context).pop();
                                                            },
                                                            icon: Icon(Icons.close)),
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Text(
                                                        "ENTER YOUR PROXY BID",
                                                        style: Theme.of(context).textTheme.headline5!.copyWith(
                                                            letterSpacing: 2,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black),
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Text(
                                                        "My Maximum Proxy Bid",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1!
                                                            .copyWith(letterSpacing: 2, fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      SizedBox(
                                                        width: 350,
                                                        child: Column(
                                                          children: [
                                                            TextField(
                                                              controller: textEditingController,
                                                              decoration: InputDecoration(
                                                                  icon: Image.asset(
                                                                "image/rs.png",
                                                                height: 16,
                                                              )),
                                                            ),
                                                            SizedBox(
                                                                width: 350,
                                                                child: Image.asset(
                                                                  "image/dottedline.png",
                                                                  height: 2,
                                                                  fit: BoxFit.fitWidth,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Text(
                                                        "Select Next Valid Bid",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1!
                                                            .copyWith(letterSpacing: 2, fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Observer(builder: (context) {
                                                          return Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: widget.auctionViewModel.getProxyBidAmountResponse!
                                                                .result!.nextValidBid!
                                                                .map((e) => InkWell(
                                                                      onTap: () {
                                                                        widget.auctionViewModel.selectedProxyBid =
                                                                            e.iNR ?? "0";
                                                                        textEditingController.text = e.iNR!;
                                                                      },
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.symmetric(
                                                                                horizontal: 8, vertical: 4),
                                                                            decoration: BoxDecoration(
                                                                                color: (widget.auctionViewModel
                                                                                            .selectedProxyBid ==
                                                                                        (e.iNR ?? "0"))
                                                                                    ? Color(0xffB45156)
                                                                                    : Color(0xffF7FAFD),
                                                                                borderRadius: BorderRadius.circular(8)),
                                                                            child: Text(
                                                                                "₹${formateNumber(e.iNR ?? "0")}",
                                                                                style: Theme.of(context)
                                                                                    .textTheme
                                                                                    .caption!
                                                                                    .copyWith(
                                                                                        color: (widget.auctionViewModel
                                                                                                    .selectedProxyBid ==
                                                                                                (e.iNR ?? "0"))
                                                                                            ? Colors.white
                                                                                            : Colors.grey)),
                                                                          ),
                                                                          SizedBox(
                                                                            height: 24,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                          );
                                                        }),
                                                      ),
                                                      (widget.auctionViewModel.selectedProxyBid == "")
                                                          ? Container()
                                                          : Stack(
                                                              children: [
                                                                Positioned(
                                                                    top: 0,
                                                                    left: widget.auctionViewModel.getIndex(widget
                                                                                .auctionViewModel.selectedProxyBid) ==
                                                                            0
                                                                        ? 42
                                                                        : widget.auctionViewModel.getIndex(widget
                                                                                    .auctionViewModel
                                                                                    .selectedProxyBid) ==
                                                                                1
                                                                            ? MediaQuery.of(context).size.width / 4 + 42
                                                                            : widget.auctionViewModel.getIndex(widget
                                                                                        .auctionViewModel
                                                                                        .selectedProxyBid) ==
                                                                                    2
                                                                                ? MediaQuery.of(context).size.width /
                                                                                        2 +
                                                                                    42
                                                                                : MediaQuery.of(context).size.width -
                                                                                    42,
                                                                    child: Image.asset(
                                                                      "image/top.png",
                                                                      width: 16,
                                                                      height: 7.5,
                                                                    )),
                                                                Align(
                                                                  alignment: widget.auctionViewModel.getIndex(widget
                                                                              .auctionViewModel.selectedProxyBid) ==
                                                                          0
                                                                      ? Alignment.topLeft
                                                                      : widget.auctionViewModel.getIndex(widget
                                                                                  .auctionViewModel.selectedProxyBid) ==
                                                                              1
                                                                          ? Alignment.topCenter
                                                                          : widget.auctionViewModel.getIndex(widget
                                                                                      .auctionViewModel
                                                                                      .selectedProxyBid) ==
                                                                                  2
                                                                              ? Alignment.topCenter
                                                                              : Alignment.topRight,
                                                                  child: Container(
                                                                    margin: EdgeInsets.only(top: 7.5),
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal: 8, vertical: 4),
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xffB45156),
                                                                        borderRadius: BorderRadius.circular(8)),
                                                                    child: Text(
                                                                        "Your Next Valid Bid ₹${formateNumber(widget.auctionViewModel.selectedProxyBid == "" ? "0" : widget.auctionViewModel.selectedProxyBid)}",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(color: Colors.white)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                              value: checked,
                                                              onChanged: (check) {
                                                                builder(() {
                                                                  checked = check ?? false;
                                                                });
                                                              }),
                                                          Text(
                                                            "I agree to",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .subtitle2!
                                                                .copyWith(color: Colors.grey),
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                            "Terms & Conditions",
                                                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                                decoration: TextDecoration.underline,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "If placing a proxy bid, enter the max amount you would be writing to bid upto. My Profile Page - To set your Bidding Nickname, you may submit a bid ₹25,000 (next incremental value)",
                                                          textAlign: TextAlign.justify,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .subtitle2!
                                                              .copyWith(color: Colors.grey),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          if (checked) {
                                                            if (widget.auctionViewModel.selectedProxyBid == "") {
                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                content: Text(
                                                                  "Please Select/Enter Valid Bid",
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .subtitle2!
                                                                      .copyWith(color: Colors.white),
                                                                ),
                                                                backgroundColor: Colors.red,
                                                                elevation: 42,
                                                              ));
                                                            } else {
                                                              await widget.auctionViewModel.placeBid(widget.lots,
                                                                  widget.auctionViewModel.selectedProxyBid, "0");

                                                              if (widget.auctionViewModel.proxyBidResponse!.status ==
                                                                  "true") {
                                                                if (widget
                                                                        .auctionViewModel.proxyBidResponse!.bidStatus ==
                                                                    "true") {
                                                                  widget.auctionViewModel.selectedProxyBid = "";
                                                                  Navigator.of(context).pop();

                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                    content: Text(
                                                                      "${widget.auctionViewModel.proxyBidResponse!.bidMessage}",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .subtitle2!
                                                                          .copyWith(color: Colors.white),
                                                                    ),
                                                                    backgroundColor: Colors.green,
                                                                    elevation: 42,
                                                                  ));
                                                                } else {
                                                                  widget.auctionViewModel.selectedProxyBid = "";
                                                                  Navigator.of(context).pop();

                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                    content: Text(
                                                                      "${widget.auctionViewModel.proxyBidResponse!.bidMessage}",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .subtitle2!
                                                                          .copyWith(color: Colors.white),
                                                                    ),
                                                                    backgroundColor: Colors.red,
                                                                    elevation: 42,
                                                                  ));
                                                                }
                                                              } else {}
                                                            }
                                                          } else {
                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                              content: Text(
                                                                "Please accept Terms & Conditions",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .subtitle2!
                                                                    .copyWith(color: Colors.white),
                                                              ),
                                                              backgroundColor: Colors.red,
                                                              elevation: 42,
                                                            ));
                                                          }
                                                        },
                                                        child: SizedBox(
                                                          height: 50,
                                                          width: 250,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                  height: 50,
                                                                  width: 250,
                                                                  decoration: BoxDecoration(
                                                                      gradient: LinearGradient(colors: [
                                                                        Color(0xffE74B52),
                                                                        Color(0xffE74B52),
                                                                      ]),
                                                                      // color: Color(0xff466D33),
                                                                      borderRadius: BorderRadius.circular(24)),
                                                                  child: Center(
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.only(right: 24.0, left: 24),
                                                                      child: Text(
                                                                        "Submit",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyText1!
                                                                            .copyWith(
                                                                              color: Color(0XFFFFFFFF),
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                              widget.auctionViewModel.isLoadingForProxy
                                                                  ? SizedBox(
                                                                      width: 240, child: LinearProgressIndicator())
                                                                  : Container(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 24,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            );
                                          });
                                        },
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                    child: Text(
                                      'PROXY BID',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0XFF2D2D2D),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                )
                              : (hours == "00" && minutes == "00" && seconds == "00")
                                  ? Container()
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                      onPressed: () async {
                                        bool checked = false;
                                        final textEditingController = TextEditingController();
                                        await widget.auctionViewModel.getProxyAmountByLot(widget.lots);

                                        if (widget.auctionViewModel.getProxyBidAmountResponse!.status == "true") {
                                          showModalBottomSheet<void>(
                                            // context and builder are
                                            // required properties in this widget
                                            context: context,
                                            isScrollControlled: true,
                                            enableDrag: true,
                                            isDismissible: true,
                                            builder: (BuildContext context) {
                                              // we set up a container inside which
                                              // we create center column and display text

                                              // Returning SizedBox instead of a Container
                                              return StatefulBuilder(builder: (_, builder) {
                                                return SizedBox(
                                                  height: MediaQuery.of(context).size.height - 150,
                                                  child: Observer(builder: (context) {
                                                    return Container(
                                                      height: MediaQuery.of(context).size.height,
                                                      width: MediaQuery.of(context).size.width,
                                                      color: Color(0xffEAEEF2),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Align(
                                                            alignment: Alignment.topRight,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  widget.auctionViewModel.selectedProxyBid = "";
                                                                  Navigator.of(context).pop();
                                                                },
                                                                icon: Icon(Icons.close)),
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Text(
                                                            "ENTER YOUR PROXY BID",
                                                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                                                letterSpacing: 2,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Text(
                                                            "My Maximum Proxy Bid",
                                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                letterSpacing: 2, fontWeight: FontWeight.bold),
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          SizedBox(
                                                            width: 350,
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  controller: textEditingController,
                                                                  decoration: InputDecoration(
                                                                      icon: Image.asset(
                                                                    "image/rs.png",
                                                                    height: 16,
                                                                  )),
                                                                ),
                                                                SizedBox(
                                                                    width: 350,
                                                                    child: Image.asset(
                                                                      "image/dottedline.png",
                                                                      height: 2,
                                                                      fit: BoxFit.fitWidth,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Text(
                                                            "Select Next Valid Bid",
                                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                letterSpacing: 2, fontWeight: FontWeight.bold),
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(2.0),
                                                            child: Observer(builder: (context) {
                                                              return Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: widget.auctionViewModel
                                                                    .getProxyBidAmountResponse!.result!.nextValidBid!
                                                                    .map((e) => InkWell(
                                                                          onTap: () {
                                                                            widget.auctionViewModel.selectedProxyBid =
                                                                                e.iNR ?? "0";
                                                                            textEditingController.text = e.iNR!;
                                                                          },
                                                                          child: Column(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(
                                                                                    horizontal: 8, vertical: 4),
                                                                                decoration: BoxDecoration(
                                                                                    color: (widget.auctionViewModel
                                                                                                .selectedProxyBid ==
                                                                                            (e.iNR ?? "0"))
                                                                                        ? Color(0xffB45156)
                                                                                        : Color(0xffF7FAFD),
                                                                                    borderRadius:
                                                                                        BorderRadius.circular(8)),
                                                                                child: Text(
                                                                                    "₹${formateNumber(e.iNR ?? "0")}",
                                                                                    style: Theme.of(context)
                                                                                        .textTheme
                                                                                        .caption!
                                                                                        .copyWith(
                                                                                            color: (widget
                                                                                                        .auctionViewModel
                                                                                                        .selectedProxyBid ==
                                                                                                    (e.iNR ?? "0"))
                                                                                                ? Colors.white
                                                                                                : Colors.grey)),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 24,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ))
                                                                    .toList(),
                                                              );
                                                            }),
                                                          ),
                                                          (widget.auctionViewModel.selectedProxyBid == "")
                                                              ? Container()
                                                              : Stack(
                                                                  children: [
                                                                    Positioned(
                                                                        top: 0,
                                                                        left: widget.auctionViewModel.getIndex(widget
                                                                                    .auctionViewModel
                                                                                    .selectedProxyBid) ==
                                                                                0
                                                                            ? 42
                                                                            : widget.auctionViewModel.getIndex(widget
                                                                                        .auctionViewModel
                                                                                        .selectedProxyBid) ==
                                                                                    1
                                                                                ? MediaQuery.of(context).size.width / 4 +
                                                                                    42
                                                                                : widget.auctionViewModel.getIndex(
                                                                                            widget.auctionViewModel
                                                                                                .selectedProxyBid) ==
                                                                                        2
                                                                                    ? MediaQuery.of(context).size.width /
                                                                                            2 +
                                                                                        42
                                                                                    : MediaQuery.of(context).size.width -
                                                                                        42,
                                                                        child: Image.asset(
                                                                          "image/top.png",
                                                                          width: 16,
                                                                          height: 7.5,
                                                                        )),
                                                                    Align(
                                                                      alignment: widget.auctionViewModel.getIndex(widget
                                                                                  .auctionViewModel.selectedProxyBid) ==
                                                                              0
                                                                          ? Alignment.topLeft
                                                                          : widget.auctionViewModel.getIndex(widget
                                                                                      .auctionViewModel
                                                                                      .selectedProxyBid) ==
                                                                                  1
                                                                              ? Alignment.topCenter
                                                                              : widget.auctionViewModel.getIndex(widget
                                                                                          .auctionViewModel
                                                                                          .selectedProxyBid) ==
                                                                                      2
                                                                                  ? Alignment.topCenter
                                                                                  : Alignment.topRight,
                                                                      child: Container(
                                                                        margin: EdgeInsets.only(top: 7.5),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal: 8, vertical: 4),
                                                                        decoration: BoxDecoration(
                                                                            color: Color(0xffB45156),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        child: Text(
                                                                            "Your Next Valid Bid ₹${formateNumber(widget.auctionViewModel.selectedProxyBid == "" ? "0" : widget.auctionViewModel.selectedProxyBid)}",
                                                                            style: Theme.of(context)
                                                                                .textTheme
                                                                                .subtitle1!
                                                                                .copyWith(color: Colors.white)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                          Row(
                                                            children: [
                                                              Checkbox(
                                                                  value: checked,
                                                                  onChanged: (check) {
                                                                    builder(() {
                                                                      checked = check ?? false;
                                                                    });
                                                                  }),
                                                              Text(
                                                                "I agree to",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .subtitle2!
                                                                    .copyWith(color: Colors.grey),
                                                              ),
                                                              SizedBox(
                                                                width: 2,
                                                              ),
                                                              Text(
                                                                "Terms & Conditions",
                                                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                                    decoration: TextDecoration.underline,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              "If placing a proxy bid, enter the max amount you would be writing to bid upto. My Profile Page - To set your Bidding Nickname, you may submit a bid ₹25,000 (next incremental value)",
                                                              textAlign: TextAlign.justify,
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2!
                                                                  .copyWith(color: Colors.grey),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              if (checked) {
                                                                if (widget.auctionViewModel.selectedProxyBid == "") {
                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                    content: Text(
                                                                      "Please Select/Enter Valid Bid",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .subtitle2!
                                                                          .copyWith(color: Colors.white),
                                                                    ),
                                                                    backgroundColor: Colors.red,
                                                                    elevation: 42,
                                                                  ));
                                                                } else {
                                                                  await widget.auctionViewModel.placeBid(widget.lots,
                                                                      widget.auctionViewModel.selectedProxyBid, "0");

                                                                  if (widget
                                                                          .auctionViewModel.proxyBidResponse!.status ==
                                                                      "true") {
                                                                    if (widget.auctionViewModel.proxyBidResponse!
                                                                            .bidStatus ==
                                                                        "true") {
                                                                      widget.auctionViewModel.selectedProxyBid = "";
                                                                      Navigator.of(context).pop();

                                                                      ScaffoldMessenger.of(context)
                                                                          .showSnackBar(SnackBar(
                                                                        content: Text(
                                                                          "${widget.auctionViewModel.proxyBidResponse!.bidMessage}",
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .subtitle2!
                                                                              .copyWith(color: Colors.white),
                                                                        ),
                                                                        backgroundColor: Colors.green,
                                                                        elevation: 42,
                                                                      ));
                                                                    } else {
                                                                      widget.auctionViewModel.selectedProxyBid = "";
                                                                      Navigator.of(context).pop();

                                                                      ScaffoldMessenger.of(context)
                                                                          .showSnackBar(SnackBar(
                                                                        content: Text(
                                                                          "${widget.auctionViewModel.proxyBidResponse!.bidMessage}",
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .subtitle2!
                                                                              .copyWith(color: Colors.white),
                                                                        ),
                                                                        backgroundColor: Colors.red,
                                                                        elevation: 42,
                                                                      ));
                                                                    }
                                                                  } else {}
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                  content: Text(
                                                                    "Please accept Terms & Conditions",
                                                                    style: Theme.of(context)
                                                                        .textTheme
                                                                        .subtitle2!
                                                                        .copyWith(color: Colors.white),
                                                                  ),
                                                                  backgroundColor: Colors.red,
                                                                  elevation: 42,
                                                                ));
                                                              }
                                                            },
                                                            child: SizedBox(
                                                              height: 50,
                                                              width: 250,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                      height: 50,
                                                                      width: 250,
                                                                      decoration: BoxDecoration(
                                                                          gradient: LinearGradient(colors: [
                                                                            Color(0xffE74B52),
                                                                            Color(0xffE74B52),
                                                                          ]),
                                                                          // color: Color(0xff466D33),
                                                                          borderRadius: BorderRadius.circular(24)),
                                                                      child: Center(
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              right: 24.0, left: 24),
                                                                          child: Text(
                                                                            "Submit",
                                                                            style: Theme.of(context)
                                                                                .textTheme
                                                                                .bodyText1!
                                                                                .copyWith(
                                                                                  color: Color(0XFFFFFFFF),
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      )),
                                                                  widget.auctionViewModel.isLoadingForProxy
                                                                      ? SizedBox(
                                                                          width: 240, child: LinearProgressIndicator())
                                                                      : Container(),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                );
                                              });
                                            },
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                        child: Text(
                                          'PROXY BID',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0XFF2D2D2D),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                      SizedBox(
                        width: 16,
                      ),
                      (widget.lots.status!.toLowerCase() == "live" &&
                              (hours != "00" && minutes != "00" && seconds != "00"))
                          ? (widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId())
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    bool checked = false;
                                    showModalBottomSheet<void>(
                                      // context and builder are
                                      // required properties in this widget
                                      context: context,
                                      isScrollControlled: true,
                                      enableDrag: true,
                                      isDismissible: true,
                                      builder: (BuildContext context) {
                                        // we set up a container inside which
                                        // we create center column and display text

                                        // Returning SizedBox instead of a Container
                                        return StatefulBuilder(builder: (_, builder) {
                                          return SizedBox(
                                            height: MediaQuery.of(_).size.height - 150,
                                            child: Observer(builder: (_) {
                                              return Container(
                                                height: MediaQuery.of(_).size.height,
                                                width: MediaQuery.of(_).size.width,
                                                color: Color(0xffEAEEF2),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Align(
                                                      alignment: Alignment.topRight,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            widget.auctionViewModel.selectedProxyBid = "";
                                                            Navigator.of(context).pop();
                                                          },
                                                          icon: Icon(Icons.close)),
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      "PLACE YOUR BID NOW",
                                                      style: Theme.of(context).textTheme.headline5!.copyWith(
                                                          letterSpacing: 2,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    // Text("My Maximum Proxy Bid",style: Theme.of(context).textTheme.subtitle1!.copyWith(letterSpacing: 2,fontWeight: FontWeight.bold),),
                                                    // SizedBox(height: 16,),

                                                    // SizedBox(
                                                    //   width: 350,
                                                    //   child: Column(
                                                    //
                                                    //     children: [
                                                    //       TextField(
                                                    //         controller: textEditingController,
                                                    //         decoration: InputDecoration(
                                                    //             icon: Image.asset("image/rs.png",height: 16,)
                                                    //         ),
                                                    //
                                                    //
                                                    //       ),
                                                    //       SizedBox(
                                                    //           width: 350,
                                                    //           child: Image.asset("image/dottedline.png",height: 2,fit: BoxFit.fitWidth,))
                                                    //     ],
                                                    //   ),
                                                    // ),

                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      "Select Next Valid Bid",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1!
                                                          .copyWith(letterSpacing: 2, fontWeight: FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),

                                                    // Padding(
                                                    //   padding: const EdgeInsets.all(2.0),
                                                    //   child: Observer(
                                                    //       builder: (context) {
                                                    //         return Row(
                                                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    //           children: auctionViewModel.getProxyBidAmountResponse!.result!.nextValidBid!.map((e) =>
                                                    //               InkWell(
                                                    //                 onTap: (){
                                                    //
                                                    //                   auctionViewModel.selectedProxyBid=e.iNR??"0";
                                                    //                   textEditingController.text=e.iNR!;
                                                    //
                                                    //                 },
                                                    //                 child: Column(
                                                    //                   children: [
                                                    //                     Container(
                                                    //                       padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                                    //                       decoration: BoxDecoration(
                                                    //                           color:(auctionViewModel.selectedProxyBid==(e.iNR??"0"))?Color(0xffB45156):Color(0xffF7FAFD) ,
                                                    //                           borderRadius: BorderRadius.circular(8)
                                                    //                       ),
                                                    //                       child: Text("₹${formateNumber(e.iNR??"0")}",style: Theme.of(context).textTheme.caption!.copyWith(color:(auctionViewModel.selectedProxyBid==(e.iNR??"0"))?Colors.white: Colors.grey)),
                                                    //                     ),
                                                    //                     SizedBox(height: 24,),
                                                    //
                                                    //                   ],
                                                    //                 ),
                                                    //               ) ).toList(),
                                                    //         );
                                                    //       }
                                                    //   ),
                                                    // ),
                                                    // (auctionViewModel.selectedProxyBid == "")?Container():
                                                    // Stack(
                                                    //   children: [

                                                    // Positioned(
                                                    //     top:0,
                                                    //     left:auctionViewModel.getIndex(auctionViewModel.selectedProxyBid)==0?42:
                                                    //     auctionViewModel.getIndex(auctionViewModel.selectedProxyBid)==1?MediaQuery.of(context).size.width/4+42:
                                                    //     auctionViewModel.getIndex(auctionViewModel.selectedProxyBid)==2?MediaQuery.of(context).size.width/2+42:
                                                    //     MediaQuery.of(context).size.width-42,
                                                    //     child: Image.asset("image/top.png",width: 16,height: 7.5,)),
                                                    Align(
                                                      alignment: Alignment.topCenter,
                                                      child: Container(
                                                        margin: EdgeInsets.only(top: 7.5),
                                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffB45156),
                                                            borderRadius: BorderRadius.circular(8)),
                                                        child: Text(
                                                            "Your Next Valid Bid ₹${formateNumber(widget.lots.liveStatus!.nextValidBid!.iNR!)}",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .subtitle1!
                                                                .copyWith(color: Colors.white)),
                                                      ),
                                                    ),

                                                    //   ],
                                                    // ),

                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: checked,
                                                            onChanged: (check) {
                                                              builder(() {
                                                                checked = check ?? false;
                                                              });
                                                            }),
                                                        Text(
                                                          "I agree to",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .subtitle2!
                                                              .copyWith(color: Colors.grey),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          "Terms & Conditions",
                                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                              decoration: TextDecoration.underline,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "If placing a proxy bid, enter the max amount you would be writing to bid upto. My Profile Page - To set your Bidding Nickname, you may submit a bid ₹25,000 (next incremental value)",
                                                        textAlign: TextAlign.justify,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(color: Colors.grey),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (checked) {
                                                          widget.auctionViewModel.placeBid(widget.lots, "0",
                                                              widget.lots.liveStatus!.nextValidBid!.iNR!);

                                                          if (widget.auctionViewModel.proxyBidResponse!.status ==
                                                              "true") {
                                                            if (widget.auctionViewModel.proxyBidResponse!.bidStatus ==
                                                                "true") {
                                                              widget.auctionViewModel.selectedProxyBid = "";
                                                              Navigator.of(_).pop();

                                                              ScaffoldMessenger.of(_).showSnackBar(SnackBar(
                                                                content: Text(
                                                                  "${widget.auctionViewModel.proxyBidResponse!.bidMessage}",
                                                                  style: Theme.of(_)
                                                                      .textTheme
                                                                      .subtitle2!
                                                                      .copyWith(color: Colors.white),
                                                                ),
                                                                backgroundColor: Colors.green,
                                                                elevation: 42,
                                                              ));
                                                            } else {
                                                              widget.auctionViewModel.selectedProxyBid = "";

                                                              Navigator.of(_).pop();
                                                              ScaffoldMessenger.of(_).showSnackBar(SnackBar(
                                                                content: Text(
                                                                  "${widget.auctionViewModel.proxyBidResponse!.bidMessage}",
                                                                  style: Theme.of(_)
                                                                      .textTheme
                                                                      .subtitle2!
                                                                      .copyWith(color: Colors.white),
                                                                ),
                                                                backgroundColor: Colors.red,
                                                                elevation: 42,
                                                              ));
                                                            }
                                                          }
                                                        } else {
                                                          Navigator.of(_).pop();
                                                          ScaffoldMessenger.of(_).showSnackBar(SnackBar(
                                                            content: Text(
                                                              "Please accept Terms & Conditions",
                                                              style: Theme.of(_)
                                                                  .textTheme
                                                                  .subtitle2!
                                                                  .copyWith(color: Colors.white),
                                                            ),
                                                            backgroundColor: Colors.red,
                                                            elevation: 42,
                                                          ));
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        height: 50,
                                                        width: 250,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                                height: 50,
                                                                width: 250,
                                                                decoration: BoxDecoration(
                                                                    gradient: LinearGradient(colors: [
                                                                      Color(0xffE74B52),
                                                                      Color(0xffE74B52),
                                                                    ]),
                                                                    // color: Color(0xff466D33),
                                                                    borderRadius: BorderRadius.circular(24)),
                                                                child: Center(
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets.only(right: 24.0, left: 24),
                                                                    child: Text(
                                                                      "Submit",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .bodyText1!
                                                                          .copyWith(
                                                                            color: Color(0XFFFFFFFF),
                                                                            fontWeight: FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                )),
                                                            widget.auctionViewModel.isLoadingForProxy
                                                                ? SizedBox(width: 240, child: LinearProgressIndicator())
                                                                : Container(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 24,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          );
                                        });
                                      },
                                    );
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: 150,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xffE74B52),
                                          Color(0xffE74B52),
                                        ]),
                                        // color: Color(0xff466D33),
                                        borderRadius: BorderRadius.circular(24)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 12, bottom: 12),
                                        child: Text(
                                          'BID NOW',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                          : Container(),
                      widget.auctionViewModel.auctionType == "past"
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                decoration: BoxDecoration(
                                    color: (widget.lots.leadingUser!.id ==
                                            widget.auctionViewModel.localSharedPrefrence.getUserId())
                                        ? Colors.blue
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                    "${(widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU WON" : widget.lots.bidCount == "0" ? "BOUGHT IN" : "BID CLOSED"}",
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                              ),
                            )
                          : (widget.lots.status!.toLowerCase() == "live" &&
                                  (hours == "00" && minutes == "00" && seconds == "00"))
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: (widget.lots.leadingUser!.id ==
                                                widget.auctionViewModel.localSharedPrefrence.getUserId())
                                            ? Colors.blue
                                            : Colors.red,
                                        borderRadius: BorderRadius.circular(16)),
                                    child: Text(
                                        "${(widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU WON" : widget.lots.bidCount == "0" ? "BOUGHT IN" : "BID CLOSED"}",
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                                  ),
                                )
                              : (widget.lots.leadingUser!.id ==
                                      widget.auctionViewModel.localSharedPrefrence.getUserId())
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: (widget.lots.leadingUser!.id ==
                                                    widget.auctionViewModel.localSharedPrefrence.getUserId())
                                                ? Colors.blue
                                                : Colors.red,
                                            borderRadius: BorderRadius.circular(16)),
                                        child: Text("${"CURRENLTY LEADING"}",
                                            style:
                                                Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                                      ),
                                    )
                                  : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  widget.auctionViewModel.bidInfoResponse == null
                      ? Container()
                      : widget.auctionViewModel.bidInfoResponse!.result == null
                          ? Container()
                          : widget.lots.status!.toLowerCase() == "live"
                              ? widget.auctionViewModel.auctionType == "past"
                                  ? Container()
                                  : Text(
                                      "BID HISTORY (No of bids - ${widget.auctionViewModel.bidInfoResponse!.result!.bidHistory!.length})",
                                      style: Theme.of(context).textTheme.headline5!.copyWith(
                                            color: Color(0XFF202232),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                              : Container(),
                  SizedBox(
                    height: 16,
                  ),

                  widget.auctionViewModel.bidInfoResponse == null
                      ? Container()
                      : widget.auctionViewModel.bidInfoResponse!.result == null
                          ? Container()
                          : widget.lots.status!.toLowerCase() == "live"
                              ? widget.auctionViewModel.auctionType == "past"
                                  ? Container()
                                  : Container(
                                      // height: 280,
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                height: 60,

                                                width: MediaQuery.of(context).size.width / 3.2,
                                                // decoration: BoxDecoration(
                                                //     color: Color(0xffFAF7E5),
                                                //   image: DecorationImage(
                                                //     image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                                //   )
                                                // ),
                                                child: Image.asset(
                                                  "image/bidder.png",
                                                  height: 65,
                                                  fit: BoxFit.fill,
                                                ),

                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.center,
                                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                                //   children: [
                                                //
                                                //     // SizedBox(width: 5,),
                                                //     // Text('BIDDER', style:
                                                //     // Theme.of(context).textTheme.caption!.copyWith(
                                                //     //   color: Color(0XFF2D2D2D),
                                                //     //   fontWeight: FontWeight.w600,
                                                //     / Image.asset("image/bidder.png",height: 20,),/ ),),
                                                //   ],
                                                // ),
                                              ),
                                            ),
                                            // SizedBox(width: 5,),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                height: 60,

                                                width: MediaQuery.of(context).size.width / 3.2,
                                                // decoration: BoxDecoration(
                                                //     color: Color(0xffFAF7E5),
                                                //   image: DecorationImage(
                                                //     image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                                //   )
                                                // ),
                                                child: Image.asset(
                                                  "image/datentime.png",
                                                  height: 65,
                                                  fit: BoxFit.fill,
                                                ),

                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.center,
                                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                                //   children: [
                                                //
                                                //     // SizedBox(width: 5,),
                                                //     // Text('BIDDER', style:
                                                //     // Theme.of(context).textTheme.caption!.copyWith(
                                                //     //   color: Color(0XFF2D2D2D),
                                                //     //   fontWeight: FontWeight.w600,
                                                //     / Image.asset("image/bidder.png",height: 20,),/ ),),
                                                //   ],
                                                // ),
                                              ),
                                            ),
                                            // SizedBox(width: 5,),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                height: 60,

                                                width: MediaQuery.of(context).size.width / 3.2,
                                                // decoration: BoxDecoration(
                                                //     color: Color(0xffFAF7E5),
                                                //   image: DecorationImage(
                                                //     image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                                //   )
                                                // ),
                                                child: Image.asset(
                                                  "image/amount.png",
                                                  height: 65,
                                                  fit: BoxFit.fill,
                                                ),

                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.center,
                                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                                //   children: [
                                                //
                                                //     // SizedBox(width: 5,),
                                                //     // Text('BIDDER', style:
                                                //     // Theme.of(context).textTheme.caption!.copyWith(
                                                //     //   color: Color(0XFF2D2D2D),
                                                //     //   fontWeight: FontWeight.w600,
                                                //     / Image.asset("image/bidder.png",height: 20,),/ ),),
                                                //   ],
                                                // ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        widget.auctionViewModel.bidInfoResponse == null
                                            ? Container()
                                            : widget.auctionViewModel.bidInfoResponse!.result == null
                                                ? Container()
                                                : Column(
                                                    children: widget
                                                        .auctionViewModel.bidInfoResponse!.result!.bidHistory!
                                                        .map((e) => Container(
                                                            padding: EdgeInsets.only(top: 10),
                                                            color: Color(0xffFFFFFF),
                                                            alignment: Alignment.center,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      // padding: EdgeInsets.all(15),
                                                                      width: MediaQuery.of(context).size.width / 3.5,
                                                                      child: Text(
                                                                        '${e.name}',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(
                                                                              color: Color(0XFF2D2D2D),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    Container(
                                                                      // padding: EdgeInsets.all(15),
                                                                      width: MediaQuery.of(context).size.width / 3.4,
                                                                      child: Text(
                                                                        '${e.dateTime}',
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(
                                                                              color: Color(0XFF2D2D2D),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Container(
                                                                      // padding: EdgeInsets.all(15),
                                                                      width: MediaQuery.of(context).size.width / 3.5,
                                                                      child: Text(
                                                                        '₹${formateNumber(e.amount!.iNR ?? "0")}',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(
                                                                              color: Color(0XFF2D2D2D),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CustomPaint(painter: DrawDottedhorizontalline()),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                              ],
                                                            )))
                                                        .toList()

                                                    // 40 list items
                                                    // childCount:widget.auctionViewModel.bidInfoResponse==null?0:widget.auctionViewModel.bidInfoResponse!.result!.bidHistory!.length,
                                                    ),
                                      ]),
                                    )
                              : Container(),
                  widget.auctionViewModel.auctionType == "past"
                      ? Container()
                      : SizedBox(
                          height: 16,
                        ),

                  widget.lots.info!.artistDescription == null
                      ? Container()
                      : SizedBox(
                          height: 32,
                        ),
                  widget.lots.info!.artistDescription == null
                      ? Container()
                      : Text(
                          'About Artist',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: Color(0XFF202232),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                  widget.lots.info!.artistDescription == null
                      ? Container()
                      : SizedBox(
                          height: 10,
                        ),
                  widget.lots.info!.artistDescription == null
                      ? Container()
                      : HtmlWidget(
                          '${widget.lots.info!.artistDescription}',
                          // style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //       color: Color(0XFF000000),
                          //       fontWeight: FontWeight.w400,
                          //     ),
                        ),
                  SizedBox(
                    height: 16,
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ]);
      }),
    );

    // bottomNavigationBar: Dashboard2Ui(),
    // );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  getErrorMEssage() {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Icon(
          Icons.info_outline_rounded,
          color: Colors.yellowAccent,
          size: 36,
        ),
        SizedBox(
          height: 24,
        ),
        Text("No data available"),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class DrawDottedhorizontalline extends CustomPainter {
  double start = 0.0, end = 0.0;
  late Paint _paint;

  DrawDottedhorizontalline() {
    this.end;
    this.start;
    _paint = Paint();
    _paint.color = Color(0xff979797); //dots color
    _paint.strokeWidth = 1; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0) canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
