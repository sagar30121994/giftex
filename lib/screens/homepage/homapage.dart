import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:giftex/viewmodel/bottomviewmodel.dart';
import 'package:giftex/viewmodel/home/homeviewmodel.dart';
import 'package:giftex/viewmodel/service/serviceviewmodel.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

ServiceViewModel serviceViewModel = ServiceViewModel();

class Homepage extends StatefulWidget {
  Homepage(this.homeViewModel, this.auctionViewModel, this.bottomViewModel);

  HomeViewModel homeViewModel;
  AuctionViewModel auctionViewModel;
  BottomViewModel bottomViewModel;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  int _pageIndex = 0;
  Color tabColor = Color(0xff6D905D);
  String newsType = "LATEST NEWS";
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  PageController sliderController = PageController();
  final controller1 = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);

  @observable
  int position = 0;

  //
  // PageController controller=PageController();
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (_) async {
      setState(() {
        if (widget.homeViewModel.homeBanerResponse == null) {
        } else {
          if (position != widget.homeViewModel.homeBanerResponse!.pageContent!.banner!.length - 1) {
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
  void initState() {
    startTimer();
    widget.homeViewModel.getHomeBaner();
    // widget.homeViewModel.getHomeUpcommingAuctionBaner();
    widget.homeViewModel.gethomeRecordPriceLots();
    widget.homeViewModel.getNewsVideos();
    widget.homeViewModel.getfeatureditems();
    widget.auctionViewModel.getUpcommingAuction("UpComing");

    checkUpdate();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // HeaderUi(),
                Observer(builder: (context) {
                  return widget.homeViewModel.isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          height: 450,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 50,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 150 / 2.0, bottom: 0),
                                  child: Container(
                                    //replace this Container with your Card
                                    color: Color(0xff1F2A52),
                                    height: 150.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 450,
                                width: MediaQuery.of(context).size.width,
                                child: Observer(builder: (context) {
                                  return PageView.builder(
                                    controller: sliderController,
                                    onPageChanged: (pos) {
                                      setState(() {
                                        // position = pos % 4;
                                      });
                                    },
                                    itemCount: widget.homeViewModel.homeBanerResponse == null
                                        ? 0
                                        : widget.homeViewModel.homeBanerResponse!.pageContent!.banner!.length,
                                    itemBuilder: (context, pos) => SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${widget.homeViewModel.homeBanerResponse!.pageContent!.banner![pos].title1}",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Theme.of(context).colorScheme.primary,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 2.0),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${widget.homeViewModel.homeBanerResponse!.pageContent!.banner![pos].title2}",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * .80,
                                            child: Text(
                                              "${widget.homeViewModel.homeBanerResponse!.pageContent!.banner![pos].title3}",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0XFF747474),
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            height: 300,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                                                  child: Image.network(
                                                      "${widget.homeViewModel.homeBanerResponse!.pageContent!.banner![pos].image!.mobile}",
                                                      fit: BoxFit.cover,
                                                      height: 220,
                                                      width: MediaQuery.of(context).size.width),
                                                ),
                                                SizedBox(
                                                  height: 24,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      widget.auctionViewModel.selectedAuction = Auctions(
                                                        auctionId: widget.homeViewModel.homeBanerResponse!.pageContent!
                                                            .banner![pos].button!.result!.auctions!.first.auctionId,
                                                        image: widget.homeViewModel.homeBanerResponse!.pageContent!
                                                            .banner![pos].button!.result!.auctions!.first.image,
                                                        displayDate: widget
                                                            .homeViewModel
                                                            .homeBanerResponse!
                                                            .pageContent!
                                                            .banner![pos]
                                                            .button!
                                                            .result!
                                                            .auctions!
                                                            .first
                                                            .displayDate,
                                                        // displayDate: widget.homeViewModel.homeBanerResponse!.pageContent!
                                                        //     .banner![pos].button!.result!.auctions!.first.displayDate,
                                                      );

                                                      widget.bottomViewModel.setIndex(8);
                                                    });
                                                    widget.auctionViewModel.liveAuctionType = "lots";
                                                    widget.auctionViewModel.auctionType = "upcoming";
                                                    // launchUrl(
                                                    //   Uri.parse(widget.homeViewModel.homeBanerResponse!.pageContent!.banner![pos]
                                                    //       .button!.cta!.link!),
                                                    //   mode: LaunchMode.externalApplication,
                                                    // );
                                                  },
                                                  child: SizedBox(
                                                    height: 50,
                                                    child: Center(
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(22.0),
                                                            gradient: LinearGradient(
                                                              begin: Alignment.bottomLeft,
                                                              end: Alignment.topRight,
                                                              colors: [
                                                                Color(0xffB45156),
                                                                Color(0xffE74B52),
                                                                // Color(0xffFFFFFF),
                                                              ],
                                                            )),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 8.0, left: 8, top: 12, bottom: 12),
                                                          child: Text(
                                                            '${widget.homeViewModel.homeBanerResponse!.pageContent!.banner![pos].button!.text}',
                                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                color: Color(0XFFFFFFFF),
                                                                fontWeight: FontWeight.w600,
                                                                letterSpacing: 1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        );
                }),
                widget.homeViewModel.homeBanerResponse == null
                    ? Container()
                    : Observer(builder: (context) {
                        return widget.homeViewModel.isLoading
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0${position + 1}/0${widget.homeViewModel.homeBanerResponse!.pageContent!.banner!.length}",
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // Image.asset("image/Line.png",width: 100,),

                                  Container(
                                    width: 120,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  Spacer(),
                                  // Container(
                                  //   height: 70,
                                  //   padding: EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: AssetImage("image/Rectangle Copy.png"),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  //
                                  //   // child:
                                  //   // Icon(Icons.cale)
                                  //   child: Image.asset(
                                  //     "image/calender.png",
                                  //     color: Color(0xff000000),
                                  //   ),
                                  // )
                                ],
                              );
                      }),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .80,
                  child: Text(
                    "SHOP NOW \nON OUR ONLINE STORE",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black, fontWeight: FontWeight.w700, letterSpacing: 0.666667),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .80,
                  child: Text(
                    "Discover our online platform where purchasing is immediate, with items delivered right to your door.",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 460,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .70,
                        child: Text(
                          "FEATURED ITEMS",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Color(0xff2D2D2D), fontWeight: FontWeight.w700, letterSpacing: 1.42857),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (context) {
                        return widget.homeViewModel.isloadingfeatureditems
                            ? Container()
                            : Container(
                                height: 320,
                                width: MediaQuery.of(context).size.width,
                                // padding: EdgeInsets.all(12),
                                child: ListView.builder(
                                  controller: controller,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int pos) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 0,
                                            left: 50,
                                            right: 50,
                                            child: Container(
                                              //replace this Container with your Card
                                              // height: 385,
                                              width: 200,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 25.0, right: 25),
                                            child: Image.network(
                                              "${widget.homeViewModel.getFeaturedItemsResponse!.result!.lots![pos].thumbImage}",
                                              height: 210,
                                              width: 155,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 430 / 2.0, bottom: 0, left: 25.0, right: 25),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "${widget.homeViewModel.getFeaturedItemsResponse!.result!.lots![pos].info!.title ?? ''}",
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0xff2D2D2D),
                                                        fontWeight: FontWeight.w400,
                                                        letterSpacing: 1.5,
                                                        overflow: TextOverflow.ellipsis),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "₹ ${formateNumber(widget.homeViewModel.getFeaturedItemsResponse!.result!.lots![pos].liveStatus!.currentBid!.iNR ?? "0")}",
                                                    // "₹${formateNumber(widget.lots.liveStatus!.nextValidBid!.iNR ?? "0")}"
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                          color: Theme.of(context).colorScheme.primary,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: widget.homeViewModel.getFeaturedItemsResponse == null
                                      ? 0
                                      : widget.homeViewModel.getFeaturedItemsResponse!.result!.lots!.length,
                                ),
                              );
                      }),
                      // Container(
                      //     // width: 45,
                      //     color: Color(0XFF8DAB7F),
                      //     child: Image.asset("image/Bitmap1.png")),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * .70,
                      //   child: Text(
                      //     "Antique Elephant Buddha",
                      //     textAlign: TextAlign.center,
                      //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      //           color: Color(0xff373737),
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * .70,
                      //   child: Text(
                      //     "₹ 20,000",
                      //     textAlign: TextAlign.center,
                      //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      //           color: Theme.of(context).colorScheme.primary,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              widget.bottomViewModel.setIndex(7);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(7)));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xffB45156),
                                      Color(0xffE74B52),
                                    ],
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                child: Text(
                                  'VIEW ALL',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFFFFFFFF), fontWeight: FontWeight.w600, letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .70,
                  child: Text(
                    "UPCOMING AUCTIONS",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 2.14286),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                widget.auctionViewModel.upcomingAuctionResponse == null
                    ? Container()
                    : Observer(builder: (context) {
                        return widget.auctionViewModel.isLoadingForUpCommingAuction
                            ? LinearProgressIndicator()
                            : Container(
                                height: 500,
                                child: PageView.builder(
                                    itemCount:
                                        (widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length / 2)
                                            .toInt(),
                                    itemBuilder: (context, position) {
                                      if (position != 0) {
                                        position = position * 2;
                                      }
                                      return Column(
                                        children: [
                                          widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length >
                                                  position
                                              ? Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 245,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position].image}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  child: Column(children: [
                                                    // widget.homeViewModel.homeUpcommingAuctionResponse!.auctionArray!.map((e) =>
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 245,
                                                      color: Color(0xffEAEEF2).withOpacity(.4),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 42.0, bottom: 12, left: 12),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 0,
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(context).size.width * .70,
                                                              child: Text(
                                                                "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position].auctionName}",
                                                                textAlign: TextAlign.start,
                                                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                      color: Colors.black,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  widget.auctionViewModel.upComingLotsResponse = null;
                                                                  setState(() {
                                                                    widget.auctionViewModel.selectedAuction = widget
                                                                        .auctionViewModel
                                                                        .upcomingAuctionResponse!
                                                                        .result!
                                                                        .auctions![position];

                                                                    widget.bottomViewModel.setIndex(8);
                                                                  });
                                                                  widget.auctionViewModel.liveAuctionType = "lots";
                                                                  widget.auctionViewModel.auctionType = "upcoming";
                                                                });
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets.all(8),
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xffEAEEF2),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(10))),
                                                                child: Text(
                                                                  "EXPLORE",
                                                                  textAlign: TextAlign.start,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(context).size.width * .70,
                                                              child: Text(
                                                                "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position].displayDate}",
                                                                textAlign: TextAlign.start,
                                                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                      color: Colors.black87,
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                              ),
                                                            ),
                                                            // const SizedBox(
                                                            //   height: 8,
                                                            // ),
                                                            // SizedBox(
                                                            //   width: MediaQuery.of(context).size.width * .70,
                                                            //   child: Text(
                                                            //     "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position].displayDate}",
                                                            //     textAlign: TextAlign.start,
                                                            //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            //         color: Colors.black87,
                                                            //         fontWeight: FontWeight.bold,
                                                            //         letterSpacing: 0.772727),
                                                            //   ),
                                                            // ),
                                                            const SizedBox(
                                                              height: 14,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                                )
                                              : Container(),
                                          widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length >
                                                  (position + 1)
                                              ? Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 230,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position + 1].image}"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      color: Color(0xff495E93).withOpacity(1)),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          height: 230,
                                                          color: Color(0xffEAEEF2).withOpacity(.4),
                                                          child: Padding(
                                                            padding: EdgeInsets.only(right: 12.0, top: 34),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                SizedBox(
                                                                  height: 12,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(context).size.width * .70,
                                                                  child: Text(
                                                                    "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position + 1].auctionName}",
                                                                    textAlign: TextAlign.end,
                                                                    style:
                                                                        Theme.of(context).textTheme.headline6!.copyWith(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      widget.auctionViewModel.liveAuctionType = "lots";
                                                                      widget.auctionViewModel.auctionType = "upcoming";
                                                                      widget.auctionViewModel.selectedAuction = widget
                                                                          .auctionViewModel
                                                                          .upcomingAuctionResponse!
                                                                          .result!
                                                                          .auctions![position + 1];

                                                                      widget.bottomViewModel.setIndex(8);
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    padding: EdgeInsets.only(
                                                                        left: 30, right: 10, top: 10, bottom: 10),
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xffEAEEF2),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                    child: Text(
                                                                      "EXPLORE",
                                                                      textAlign: TextAlign.start,
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .subtitle1!
                                                                          .copyWith(
                                                                              color: Color(0xff2D2D2D),
                                                                              fontWeight: FontWeight.bold,
                                                                              letterSpacing: 1),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(context).size.width * .70,
                                                                  child: Text(
                                                                    "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position + 1].displayDate}",
                                                                    textAlign: TextAlign.end,
                                                                    style:
                                                                        Theme.of(context).textTheme.headline6!.copyWith(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                  ),
                                                                ),
                                                                // const SizedBox(
                                                                //   height: 5,
                                                                // ),
                                                                // SizedBox(
                                                                //   width: MediaQuery.of(context).size.width * .70,
                                                                //   child: Text(
                                                                //     "${widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions![position + 1].displayDate}",
                                                                //     textAlign: TextAlign.end,
                                                                //     style:
                                                                //         Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                //               color: Colors.white,
                                                                //               fontWeight: FontWeight.bold,
                                                                //             ),
                                                                //   ),
                                                                // ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      );
                                    }),
                              );

                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 220,
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: AssetImage("image/Bitmap3.png"),
                        //         fit: BoxFit.cover,
                        //
                        //       ),
                        //       color: Color(0xff495E93).withOpacity(1)
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(20.0),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       children: [
                        //         const SizedBox(height: 0,),
                        //         SizedBox(
                        //           width: MediaQuery.of(context).size.width*.70,
                        //           child: Text("Modern Indian",
                        //             textAlign: TextAlign.end,
                        //             style:
                        //             Theme.of(context).textTheme.headline6!.copyWith(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               // letterSpacing: 1
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 16,),
                        //         Container(
                        //           padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        //           decoration: BoxDecoration(
                        //               color: Color(0xffEAEEF2),
                        //               borderRadius: BorderRadius.all(Radius.circular(10))
                        //           ),
                        //           child:  Text("EXPLORE",
                        //             textAlign: TextAlign.start,
                        //             style:
                        //             Theme.of(context).textTheme.subtitle1!.copyWith(
                        //                 color: Color(0xff2D2D2D),
                        //                 fontWeight: FontWeight.bold,
                        //                 letterSpacing: 1
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 5,),
                        //         SizedBox(
                        //           width: MediaQuery.of(context).size.width*.70,
                        //           child: Text("30th-31st Aug",
                        //             textAlign: TextAlign.end,
                        //             style:
                        //             Theme.of(context).textTheme.headline6!.copyWith(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w300,
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 5,),
                        //         SizedBox(
                        //           width: MediaQuery.of(context).size.width*.70,
                        //           child: Text("2022",
                        //             textAlign: TextAlign.end,
                        //             style:
                        //             Theme.of(context).textTheme.bodyText1!.copyWith(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 10,),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      }),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.bottomViewModel.selectedIndex = 10;
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 160,
                        color: Theme.of(context).colorScheme.surface,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("image/sell.png"),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "HOW TO SELL?",
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Color(0xff3A3A3A), fontWeight: FontWeight.w400, letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.bottomViewModel.selectedIndex = 11;
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToBuyPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 160,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("image/sell.png"),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "HOW TO Buy?",
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400, letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "RECORD PRICE ARTWORK",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Color(0xff373737), fontWeight: FontWeight.w900, letterSpacing: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Observer(builder: (context) {
                  return widget.homeViewModel.isLoadingForLots
                      ? LinearProgressIndicator()
                      : widget.homeViewModel.recordPriceLots == null
                          ? Container()
                          : Container(
                              padding: EdgeInsets.all(16),
                              color: Color(0xffFFFFFF),
                              child: DefaultTabController(
                                length: widget.homeViewModel.recordPriceLots!.tabArray!.length,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    //This is for background color
                                    color: Colors.white.withOpacity(0.0),

                                    //This is for bottom border that is needed
                                    border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                                  ),
                                  child: TabBar(
                                      onTap: (index) {
                                        widget.homeViewModel.selectedTabIndex = index;
                                        print(index);
                                      },
                                      indicator: UnderlineTabIndicator(
                                        borderSide:
                                            BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                                      ),
                                      padding: EdgeInsets.all(0),
                                      labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                                      labelColor: const Color(0xFF2D2D2D),
                                      labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff2D2D2D),
                                            fontWeight: FontWeight.w600,
                                          ),
                                      isScrollable: true,
                                      tabs: widget.homeViewModel.recordPriceLots!.tabArray!
                                          .map(
                                            (e) => Tab(
                                              text: e.tabName,
                                            ),
                                          )
                                          .toList()),
                                ),
                              ),
                            );
                }),
                SizedBox(
                  height: 16,
                ),
                Observer(builder: (context) {
                  return widget.homeViewModel.isLoadingForLots
                      ? Container()
                      : Container(
                          color: Color(0xffFFFFFF),
                          height: 320,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(0),
                          child: ListView.builder(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int pos) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    // color: Color(0xffFFFFFF),
                                    height: 185,
                                    width: 200,
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          left: 50,
                                          right: 50,
                                          child: Container(
                                            //replace this Container with your Card
                                            // color: Color(0xffF8F8F8),
                                            height: 100,
                                            width: 200,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                                          child: Image.network(
                                            "${widget.homeViewModel.recordPriceLots!.tabArray![widget.homeViewModel.selectedTabIndex].lots![pos].ThumbImage}",
                                            height: 210,
                                            width: 150,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 430 / 2.0, bottom: 0, left: 25.0, right: 25),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "${widget.homeViewModel.recordPriceLots!.tabArray![widget.homeViewModel.selectedTabIndex].lots![pos].info!.title}",
                                                  textAlign: TextAlign.start,
                                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff2D2D2D),
                                                      fontWeight: FontWeight.w400,
                                                      letterSpacing: 1.5,
                                                      overflow: TextOverflow.ellipsis),
                                                ),
                                                Text(
                                                  "${widget.homeViewModel.recordPriceLots!.tabArray![widget.homeViewModel.selectedTabIndex].lots![pos].info!.description}",
                                                  textAlign: TextAlign.start,
                                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff2D2D2D),
                                                      fontWeight: FontWeight.w400,
                                                      letterSpacing: 1.5,
                                                      overflow: TextOverflow.ellipsis),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  "₹ ${formateNumber(widget.homeViewModel.recordPriceLots!.tabArray![widget.homeViewModel.selectedTabIndex].lots![pos].estimateFrom!.iNR ?? "0")}",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Theme.of(context).colorScheme.primary,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    )),
                              );
                            },
                            itemCount: widget.homeViewModel.recordPriceLots == null
                                ? 0
                                : widget.homeViewModel.recordPriceLots!.tabArray![widget.homeViewModel.selectedTabIndex]
                                    .lots!.length,
                          ),
                        );
                }),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    widget.bottomViewModel.setIndex(28);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(28)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xffB45156),
                            Color(0xffE74B52),
                          ],
                        )),
                    // onPressed: (){
                    //
                    // },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                      child: Text(
                        'VIEW ALL',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 360,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        "WHY ASTA GURU MUSE?",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 80,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 8,
                                        child: Image.asset(
                                          'image/museback.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                    Positioned(
                                        left: 4,
                                        bottom: 8,
                                        child: Image.asset(
                                          'image/authgua.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Authenticity \nGuaranteed",
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 80,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 8,
                                        child: Image.asset(
                                          'image/museback.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                    Positioned(
                                        left: 4,
                                        bottom: 8,
                                        child: Image.asset(
                                          'image/bidaction.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Bid In \nAction",
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 80,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 8,
                                        child: Image.asset(
                                          'image/museback.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                    Positioned(
                                        left: 4,
                                        bottom: 8,
                                        child: Image.asset(
                                          'image/shoponline.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Shop Online\nInstantly ",
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 80,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 8,
                                        child: Image.asset(
                                          'image/museback.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                    Positioned(
                                        left: 4,
                                        bottom: 8,
                                        child: Image.asset(
                                          'image/panindia.png',
                                          height: 65,
                                          width: 55,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Pan India \nShipping",
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "NEWS & UPDATES",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Color(0xff373737),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Observer(builder: (context) {
                  return widget.homeViewModel.isLoadingForNews
                      ? Container()
                      : Container(
                          color: Color(0xffFFFFFF),
                          child: DefaultTabController(
                            length: 3,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                //This is for background color
                                color: Colors.white.withOpacity(0.0),

                                //This is for bottom border that is needed
                                border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                              ),
                              child: TabBar(
                                onTap: (index) {
                                  widget.homeViewModel.selectedNewsTabIndex = index;
                                  print(index);
                                },
                                indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(color: Color(0xffB45156), width: 2.0),
                                ),
                                padding: EdgeInsets.all(0),
                                labelPadding: EdgeInsets.all(0),
                                unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                                labelColor: const Color(0xFF2D2D2D),
                                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff2D2D2D),
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                tabs: [
                                  Tab(text: "LATEST NEWS"),
                                  Tab(text: "VIDEOS"),
                                  Tab(text: "BLOGS"),
                                ],
                              ),
                            ),
                          ),
                        );
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (context) {
                  return widget.homeViewModel.isLoadingForNews
                      ? Container()
                      : Container(
                          color: Color(0xffFFFFFF),
                          height: 340,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(0),
                          child: PageView.builder(
                            controller: controller1,
                            itemBuilder: (BuildContext context, int pos) {
                              return Container(
                                color: Color(0xffFFFFFF),
                                height: 350,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 16),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 0, right: 0, top: 50),
                                      child: Container(
                                        color: Color(0xffEAEEF2),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16, right: 16),
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          widget.homeViewModel.selectedNewsTabIndex == 0
                                              ? InkWell(
                                                  onTap: () {
                                                    // serviceViewModel.newsArry =
                                                    //     serviceViewModel.pressResponse!.pageContent!.array![pos];
                                                    // bottomViewModel.selectedIndex = 35;
                                                  },
                                                  child: Image.network(
                                                      "${widget.homeViewModel.homeNewsVideosBlogsResponse!.news![pos].image!.mobile}",
                                                      fit: BoxFit.contain,
                                                      height: 200),
                                                )
                                              : widget.homeViewModel.selectedNewsTabIndex == 1
                                                  ? Image.network(
                                                      "${widget.homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].image!.mobile}",
                                                      fit: BoxFit.contain,
                                                      height: 200)
                                                  : Image.network(
                                                      "${widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].image!.mobile}",
                                                      fit: BoxFit.contain,
                                                      height: 200),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          widget.homeViewModel.selectedNewsTabIndex == 0
                                              ? Text(
                                                  "${widget.homeViewModel.homeNewsVideosBlogsResponse!.news![pos].timestamp}",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Theme.of(context).colorScheme.primary,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                )
                                              : widget.homeViewModel.selectedNewsTabIndex == 1
                                                  ? Text(
                                                      "${widget.homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].timestamp}",
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Theme.of(context).colorScheme.primary,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                    )
                                                  : Text(
                                                      "${widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].timestamp}",
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Theme.of(context).colorScheme.primary,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                    ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          widget.homeViewModel.selectedNewsTabIndex == 0
                                              ? Container(
                                                  height: 70,
                                                  child: HtmlWidget(
                                                    textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                    "${widget.homeViewModel.homeNewsVideosBlogsResponse!.news![pos].title}",
                                                  ),
                                                )
                                              : widget.homeViewModel.selectedNewsTabIndex == 1
                                                  ? Container(
                                                      height: 70,
                                                      child: HtmlWidget(
                                                        textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                        "${widget.homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].title}",
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 70,
                                                      child: HtmlWidget(
                                                        textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                        "${widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].title}",
                                                      ),
                                                    ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // widget.homeViewModel.selectedNewsTabIndex == 0
                                          //     ? SizedBox(
                                          //         height: 40,
                                          //         child: HtmlWidget(
                                          //           textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                          //           "${widget.homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc!.length > 200 ? widget.homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc!.substring(0, 150) : widget.homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc}",
                                          //         ),
                                          //       )
                                          //     : widget.homeViewModel.selectedNewsTabIndex == 1
                                          //         ? SizedBox(
                                          //             height: 40,
                                          //             child: HtmlWidget(
                                          //               textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                          //               "${widget.homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc!.length > 200 ? widget.homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc!.substring(0, 150) : widget.homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc}",
                                          //             ),
                                          //           )
                                          //         : SizedBox(
                                          //             height: 40,
                                          //             child: HtmlWidget(
                                          //               textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                          //               "${widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc!.length > 200 ? widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc!.substring(0, 150) : widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc}",
                                          //             ),
                                          //           ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: widget.homeViewModel.selectedNewsTabIndex == 0
                                ? widget.homeViewModel.homeNewsVideosBlogsResponse == null
                                    ? 0
                                    : widget.homeViewModel.homeNewsVideosBlogsResponse!.news!.length
                                : widget.homeViewModel.selectedNewsTabIndex == 1
                                    ? widget.homeViewModel.homeNewsVideosBlogsResponse!.videos!.length
                                    : widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs!.length,
                          ),
                        );
                }),
                SizedBox(
                  height: 24,
                ),
                Observer(builder: (context) {
                  return widget.homeViewModel.isLoadingForNews
                      ? Container()
                      : widget.homeViewModel.homeNewsVideosBlogsResponse == null
                          ? Container()
                          : Center(
                              child: SmoothPageIndicator(
                                controller: controller1,
                                count: widget.homeViewModel.selectedNewsTabIndex == 0
                                    ? widget.homeViewModel.homeNewsVideosBlogsResponse!.news!.length
                                    : widget.homeViewModel.selectedNewsTabIndex == 1
                                        ? widget.homeViewModel.homeNewsVideosBlogsResponse!.videos!.length
                                        : widget.homeViewModel.homeNewsVideosBlogsResponse!.blogs!.length,
                                effect: WormEffect(
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    type: WormType.thin,
                                    activeDotColor: Color(0xff3C5233),
                                    dotColor: Color(0xffD1D1D1)
                                    // strokeWidth: 5,
                                    ),
                              ),
                            );
                }),
                SizedBox(
                  height: 34,
                ),
                InkWell(
                  onTap: () {
                    widget.bottomViewModel.setIndex(25);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(25)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xffB45156),
                            Color(0xffE74B52),
                          ],
                        )),
                    // style:   ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
                    //
                    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(16.0),
                    //           // side: BorderSide(color: Colors.red)
                    //         )
                    //     )
                    // ),
                    // onPressed: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
                    // },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                      child: Text(
                        'VIEW ALL',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Color(0XFFFFFFFF), fontWeight: FontWeight.w600, letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  color: Color(0Xff2D2D2D),
                  child: Column(
                    children: [
                      Container(width: MediaQuery.of(context).size.width, child: Footer()),
                      Container(
                        color: Color(0Xff1F2A52),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future checkUpdate() async {
    HttpResponse res = await widget.homeViewModel.checkFeature();
    if (res.status == 200) {
      if ((widget.homeViewModel.checkFeatureResponse!.status ?? "") == "true") {
        HttpResponse res1 = await widget.homeViewModel.checkAppVersion();
        if (res1.status == 200) {
          if ((widget.homeViewModel.checkAppVersionResponse!.status ?? "") == "true") {
            PackageInfo packageInfo = await PackageInfo.fromPlatform();
            String version = packageInfo.version;

            print("++++++++++++++++++++++++++++App Version : ${version}");
            print(
                "++++++++++++++++++++++++++++API Version : ${widget.homeViewModel.checkAppVersionResponse!.result!.version}");
            if (version != widget.homeViewModel.checkAppVersionResponse!.result!.version) {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

                  // title: Text("Update Available"),
                  actionsAlignment: MainAxisAlignment.center,
                  content: SizedBox(
                    height: 170,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: Image.asset(
                            'image/giftlogo.png',
                            height: 70,
                            width: 140,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'We\'re getting better !',
                          style: Theme.of(context).textTheme!.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Update the app to unlock new features !',
                          style: Theme.of(context)
                              .textTheme!
                              .bodySmall!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    /* TextButton(
                            style: TextButton.styleFrom(
                               // shape: StadiumBorder(),
                              //  backgroundColor: Colors.grey,
                            ),
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Update Later")),*/
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: EdgeInsets.all(8),
                        ),
                        onPressed: () async {
                          String strurl =
                              "https://play.google.com/store/apps/details?id=com.astaguru&pcampaignid=web_share";
                          Uri _url = Uri.parse(strurl);
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }

                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Update Now".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme!
                              .button!
                              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                //       ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //             backgroundColor: Colors.black,
                //             padding: EdgeInsets.all(8),
                //           ),
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: Text(
                //             "Update Now".toUpperCase(),
                //             style: Theme.of(context)
                //                 .textTheme!
                //                 .button!
                //                 .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                //           ),
                //
                // );
              );
            }
          }
        }
      }
    }
  }
}
