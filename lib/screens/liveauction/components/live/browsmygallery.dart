import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:intl/intl.dart';

import '../../../../data/network/models/responce/lot/upcominglotsresponse.dart';

class BrowseMyGallryListItem extends StatefulWidget {
  BrowseMyGallryListItem(this.lots, this.grid, this.auctionViewModel);
  Lots lots;
  bool grid;
  AuctionViewModel auctionViewModel;

  @override
  State<BrowseMyGallryListItem> createState() => _BrowseMyGallryListItemState();
}

class _BrowseMyGallryListItemState extends State<BrowseMyGallryListItem> with AutomaticKeepAliveClientMixin {
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference? lotReference;
  DatabaseReference? likeReference;
  DatabaseReference? userlikeReference;

  @override
  void initState() {
    print("remaining time ${widget.lots.liveStatus!.remainingSeconds}");
    myDuration = Duration(seconds: int.parse(widget.lots.liveStatus!.remainingSeconds ?? "0"));
    startTimer();
    widget.auctionViewModel.selectedProxyBid = '';

    lotReference = database.ref("Lot/" + widget.lots.lotId!);
    likeReference =
        database.ref("like/" + widget.auctionViewModel.localSharedPrefrence.getUserId() + "/" + widget.lots.lotId!);
    userlikeReference = database.ref("userlike/" + widget.auctionViewModel.localSharedPrefrence.getUserId());
    print(widget.auctionViewModel.localSharedPrefrence.getUserId());

    lotReference!.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print("*********" + data.toString());
      final cleanup = jsonDecode(jsonEncode(data));
      Lots l1 = Lots.fromJson(cleanup as Map<String, dynamic>);

      setState(() {
        widget.lots = l1;
        widget.auctionViewModel.replaceLots(l1);
      });
    });

    // userlikeReference!.onValue.listen((DatabaseEvent event) {
    //   print(event);
    //   final data = event.snapshot.value;
    //
    //   // if (widget.auctionViewModel.liveAuctionType == "mygallery") {
    //   //   widget.auctionViewModel.myAuctionGallery();
    //   // }
    // });

    likeReference!.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print("*********** my gallery page ");
      print(widget.auctionViewModel.liveAuctionType);
      // Lots tempLots = widget.lots;
      // tempLots.isLiked = (data ?? "") as String;
      print(widget.auctionViewModel.liveAuctionType);
      if (data.toString() != "null") {
        if (widget.auctionViewModel.liveAuctionType == "mygallery") {
          setState(() {
            widget.auctionViewModel.myAuctionGallery();
          });
        }
      }

      // else {
      // setState(() {
      //   widget.lots = tempLots;
      // });
      // }
      // updateStarCount(data);
      // auctionViewModel.getUpcommingBidAuction(auctionViewModel.selectedAuction!.auctionId!);
    });

    super.initState();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    // setState(() => myDuration = Duration(days: 5));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    lotReference!.remove();
    likeReference!.remove();
    userlikeReference!.remove();

    super.dispose();
  }

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
    final days = strDigits(myDuration.inDays);
    // Step 7
    setState(() {
      hours = strDigits(myDuration.inHours);
      minutes = strDigits(myDuration.inMinutes.remainder(60));
      seconds = strDigits(myDuration.inSeconds.remainder(60));
    });
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return widget.grid
        ? Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                color: Color(0xffFFFFFF),
                height: 550,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 150 / 2.0, bottom: 0),
                      child: Container(
                        //replace this Container with your Card
                        color: Color(0xffF9F9F9),
                        height: 500.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProductDetailPage(widget.lots, auctionViewModel)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.network(
                          "${widget.lots.thumbImage}",
                          height: 250,
                          width: MediaQuery.of(context).size.width * .65,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 250, bottom: 0, left: 25.0, right: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            widget.lots.auctionType == "1"
                                ? Text(
                                    "${widget.lots.info!.title}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${widget.lots.info!.lotTitle}",
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
                                      "Estimate Value ",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "₹${formateNumber(widget.lots.estimateFrom!.iNR ?? "0")} - ${formateNumber(widget.lots.estimateTo!.iNR ?? "")}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff202232),
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
                                              style:
                                                  Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
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
                                              style:
                                                  Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
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
                                              style:
                                                  Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
                                      "Current Bid",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "₹${formateNumber(widget.lots.liveStatus!.currentBid!.iNR ?? "0")}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff202232),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Next Valid Bid",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "₹${formateNumber(widget.lots.liveStatus!.nextValidBid!.iNR ?? "0")}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                  onPressed: () async {
                                    await auctionViewModel.getProxyAmountByLot(widget.lots);

                                    if (auctionViewModel.getProxyBidAmountResponse!.status == "true") {
                                      showModalBottomSheet<void>(
                                        // context and builder are
                                        // required properties in this widget
                                        context: context,
                                        builder: (BuildContext context) {
                                          // we set up a container inside which
                                          // we create center column and display text

                                          // Returning SizedBox instead of a Container
                                          return StatefulBuilder(builder: (_, builder) {
                                            return SizedBox(
                                              height: MediaQuery.of(context).size.height,
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
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Observer(builder: (context) {
                                                          return Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: auctionViewModel
                                                                .getProxyBidAmountResponse!.result!.nextValidBid!
                                                                .map((e) => InkWell(
                                                                      onTap: () {
                                                                        auctionViewModel.selectedProxyBid =
                                                                            e.iNR ?? "0";
                                                                      },
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.symmetric(
                                                                                horizontal: 8, vertical: 4),
                                                                            decoration: BoxDecoration(
                                                                                color: (auctionViewModel
                                                                                            .selectedProxyBid ==
                                                                                        (e.iNR ?? "0"))
                                                                                    ? Color(0xffB45156)
                                                                                    : Color(0xffF7FAFD),
                                                                                borderRadius: BorderRadius.circular(8)),
                                                                            child: Text(
                                                                                "₹${formateNumber(e.iNR ?? "0")}",
                                                                                style: Theme.of(context)
                                                                                    .textTheme
                                                                                    .button!
                                                                                    .copyWith(
                                                                                        color: (auctionViewModel
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
                                                      (auctionViewModel.selectedProxyBid.trim() == "")
                                                          ? Container()
                                                          : Stack(
                                                              children: [
                                                                Positioned(
                                                                    top: 0,
                                                                    left: auctionViewModel.getIndex(
                                                                                auctionViewModel.selectedProxyBid) ==
                                                                            0
                                                                        ? 42
                                                                        : auctionViewModel.getIndex(auctionViewModel
                                                                                    .selectedProxyBid) ==
                                                                                1
                                                                            ? MediaQuery.of(context).size.width / 4 + 42
                                                                            : auctionViewModel.getIndex(auctionViewModel
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
                                                                  alignment: auctionViewModel.getIndex(
                                                                              auctionViewModel.selectedProxyBid) ==
                                                                          0
                                                                      ? Alignment.topLeft
                                                                      : auctionViewModel.getIndex(
                                                                                  auctionViewModel.selectedProxyBid) ==
                                                                              1
                                                                          ? Alignment.topCenter
                                                                          : auctionViewModel.getIndex(auctionViewModel
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
                                                                        "Your Next Valid Bid ₹${formateNumber(auctionViewModel.selectedProxyBid)}",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(color: Colors.white)),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
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
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
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
                                        padding: const EdgeInsets.only(right: 32.0, left: 32, top: 12, bottom: 12),
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
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        )),
                    Positioned(
                      right: 8,
                      top: 50,
                      child: Column(
                        children: [
                          Container(
                            child: Text("Lot ${widget.lots.lotNumber}"),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xffEAEEF2),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          ),

                          SizedBox(height: 12),
                          Container(
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(16), color: Color(0xffF3E8E9)),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            child: Text("${widget.lots.bidCount} BIDS"),
                          ),
                          SizedBox(height: 12),
                          Icon(
                            (widget.lots.isLiked ?? "false") == "true" ? Icons.favorite : Icons.favorite_border,
                            color: (widget.lots.isLiked ?? "false") == "true" ? Colors.pink : Colors.grey,
                          ),
                          //     :Icon(
                          //   Icons.favorite,
                          //   color: Colors.pink,
                          // ),
                          SizedBox(height: 12),
                          Icon(
                            Icons.open_in_full,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          // Container(
                          //   padding: EdgeInsets.all(16),
                          //   decoration: BoxDecoration(
                          //     color:  Colors.lightBlueAccent.withOpacity(.2),
                          //     borderRadius: BorderRadius.circular(32)
                          //
                          //   ),
                          // )
                          Image.asset(
                            "image/earth.png",
                            height: 50,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                color: Color(0xffF9F9F9),
                height: (hours == "00" && minutes == "00" && seconds == "00") ? 290 : 350,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 24, bottom: 0),
                          child: Container(
                            //replace this Container with your Card
                            color: Color(0xffF9F9F9),
                            height: 180.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(widget.lots, widget.auctionViewModel)));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.network(
                              "${widget.lots.thumbImage}",
                              height: 150,
                              fit: BoxFit.contain,
                              width: 125,
                              // alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 28,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Lot ${widget.lots.lotNumber}"),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffEAEEF2),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16), color: Color(0xffF3E8E9)),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    child: Text("${widget.lots.bidCount} BIDS"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .42,
                                child: Text(
                                  "${widget.lots.info!.title}",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                        color: Colors.black,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${widget.lots.category}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Estimate Value ",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0xff747474),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "₹${formateNumber(widget.lots.estimateFrom!.iNR ?? "0")} - ${formateNumber(widget.lots.estimateTo!.iNR ?? "")}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff202232),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              (hours == "00" && minutes == "00" && seconds == "00")
                                  ? Container(
                                      child: (widget.lots.leadingUser!.id ==
                                              widget.auctionViewModel.localSharedPrefrence.getUserId())
                                          ? Align(
                                              alignment: Alignment.topRight,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "₹${widget.lots.leadingUser!.bid!.iNR}",
                                                    style: Theme.of(context).textTheme.subtitle2,
                                                  ),
                                                  Text("${widget.lots.leadingUser!.notes}"),
                                                ],
                                              ),
                                            )
                                          : Container())
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Current Bid",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff747474),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "₹${formateNumber(widget.lots.liveStatus!.currentBid!.iNR ?? "0")}",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0xff202232),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Next Valid Bid",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff747474),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "₹${formateNumber(widget.lots.liveStatus!.nextValidBid!.iNR ?? "0")}",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Theme.of(context).colorScheme.primary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 16,
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              InkWell(
                                onTap: () {
                                  widget.auctionViewModel.addRemoveLotToWishlist(
                                      widget.lots, (widget.lots.isLiked ?? "false") == "true" ? "false" : "true");
                                },
                                child: Icon(
                                  (widget.lots.isLiked ?? "false") == "true" ? Icons.favorite : Icons.favorite_border,
                                  color: (widget.lots.isLiked ?? "false") == "true" ? Colors.pink : Colors.grey,
                                ),
                              ),
                              SizedBox(height: 12),
                              Icon(
                                Icons.open_in_full,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 12),
                              // Container(
                              //   padding: EdgeInsets.all(16),
                              //   decoration: BoxDecoration(
                              //     color:  Colors.lightBlueAccent.withOpacity(.2),
                              //     borderRadius: BorderRadius.circular(32)
                              //
                              //   ),
                              // )
                              Image.asset(
                                "image/earth.png",
                                height: 50,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    (hours == "00" && minutes == "00" && seconds == "00")
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: (widget.lots.leadingUser!.id ==
                                          widget.auctionViewModel.localSharedPrefrence.getUserId())
                                      ? Colors.blue
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                  "${(widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU WON" : widget.lots.bidCount != "0" ? "BOUGHT IN" : "THIS BID IS CLOSED"}",
                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
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
                              ),
                              Spacer(),
                              (widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId())
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
                                        await auctionViewModel.getProxyAmountByLot(widget.lots);

                                        if (auctionViewModel.getProxyBidAmountResponse!.status == "true") {
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
                                                                  keyboardType: TextInputType.number,
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
                                                                children: auctionViewModel
                                                                    .getProxyBidAmountResponse!.result!.nextValidBid!
                                                                    .map((e) => InkWell(
                                                                          onTap: () {
                                                                            auctionViewModel.selectedProxyBid =
                                                                                e.iNR ?? "0";
                                                                            textEditingController.text = e.iNR!;
                                                                          },
                                                                          child: Column(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(
                                                                                    horizontal: 8, vertical: 4),
                                                                                decoration: BoxDecoration(
                                                                                    color: (auctionViewModel
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
                                                                                            color: (auctionViewModel
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
                                                          (auctionViewModel.selectedProxyBid == "")
                                                              ? Container()
                                                              : Stack(
                                                                  children: [
                                                                    Positioned(
                                                                        top: 0,
                                                                        left: auctionViewModel.getIndex(auctionViewModel
                                                                                    .selectedProxyBid) ==
                                                                                0
                                                                            ? 42
                                                                            : auctionViewModel.getIndex(auctionViewModel
                                                                                        .selectedProxyBid) ==
                                                                                    1
                                                                                ? MediaQuery.of(context).size.width /
                                                                                        4 +
                                                                                    42
                                                                                : auctionViewModel.getIndex(
                                                                                            auctionViewModel
                                                                                                .selectedProxyBid) ==
                                                                                        2
                                                                                    ? MediaQuery.of(context)
                                                                                                .size
                                                                                                .width /
                                                                                            2 +
                                                                                        42
                                                                                    : MediaQuery.of(context)
                                                                                            .size
                                                                                            .width -
                                                                                        42,
                                                                        child: Image.asset(
                                                                          "image/top.png",
                                                                          width: 16,
                                                                          height: 7.5,
                                                                        )),
                                                                    Align(
                                                                      alignment: auctionViewModel.getIndex(
                                                                                  auctionViewModel.selectedProxyBid) ==
                                                                              0
                                                                          ? Alignment.topLeft
                                                                          : auctionViewModel.getIndex(auctionViewModel
                                                                                      .selectedProxyBid) ==
                                                                                  1
                                                                              ? Alignment.topCenter
                                                                              : auctionViewModel.getIndex(
                                                                                          auctionViewModel
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
                                                                            "Your Next Valid Bid ₹${formateNumber(auctionViewModel.selectedProxyBid == "" ? "0" : auctionViewModel.selectedProxyBid)}",
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
                              (widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId())
                                  ? myDuration.inSeconds > 0
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
                                                "${(widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU ARE LEADING" : widget.lots.bidCount != "0" ? "BOUGHT IN" : "THIS BID IS CLOSED"}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(color: Colors.white)),
                                          ),
                                        )
                                      : Container()
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
                                            padding: const EdgeInsets.only(right: 32.0, left: 32, top: 12, bottom: 12),
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
                                    ),
                            ],
                          ),
                  ],
                )),
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
