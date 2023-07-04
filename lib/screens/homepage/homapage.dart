import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/howtobuy/howtobuy.dart';
import 'package:giftex/screens/howtosell/howtosell.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/newsandupdates/newsandupdates.dart';
import 'package:giftex/viewmodel/home/homeviewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

HomeViewModel homeViewModel = HomeViewModel();
// AuctionViewModel auViewModel = AuctionViewModel();

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  int _pageIndex = 0;
  Color tabColor = Color(0xff6D905D);
  String newsType = "LATEST NEWS";
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final sliderController = PageController();
  final controller1 = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);

  int position = 0;

  //
  // PageController controller=PageController();
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 4), (_) async {
      setState(() {
        if (homeViewModel.homeBanerResponse == null) {
        } else {
          if (position != homeViewModel.homeBanerResponse!.pageContent!.banner!.length - 1) {
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
    // TODO: implement initState
    startTimer();
    homeViewModel.getHomeBaner();
    homeViewModel.getHomeUpcommingAuctionBaner();
    homeViewModel.gethomeRecordPriceLots();
    homeViewModel.getNewsVideos();
    auctionViewModel.getUpcommingAuction("UpComing");

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
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
                  return homeViewModel.isLoading
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
                                child: PageView.builder(
                                  controller: sliderController,
                                  onPageChanged: (pos) {
                                    setState(() {
                                      position = pos % 4;
                                    });
                                  },
                                  itemCount: homeViewModel.homeBanerResponse == null
                                      ? 0
                                      : homeViewModel.homeBanerResponse!.pageContent!.banner!.length,
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
                                          "${homeViewModel.homeBanerResponse!.pageContent!.banner![pos].title1}",
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
                                          "${homeViewModel.homeBanerResponse!.pageContent!.banner![pos].title2}",
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
                                            "${homeViewModel.homeBanerResponse!.pageContent!.banner![pos].title3}",
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
                                                    "${homeViewModel.homeBanerResponse!.pageContent!.banner![pos].image!.mobile}",
                                                    fit: BoxFit.cover,
                                                    height: 220,
                                                    width: MediaQuery.of(context).size.width),
                                              ),
                                              SizedBox(
                                                height: 24,
                                              ),
                                              SizedBox(
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
                                                        '${homeViewModel.homeBanerResponse!.pageContent!.banner![pos].button!.text}',
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Color(0XFFFFFFFF),
                                                            fontWeight: FontWeight.w600,
                                                            letterSpacing: 1),
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
                                ),
                              ),
                            ],
                          ),
                        );
                }),

                homeViewModel.homeBanerResponse == null
                    ? Container()
                    : Observer(builder: (context) {
                        return homeViewModel.isLoading
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0${position + 1}/0${homeViewModel.homeBanerResponse!.pageContent!.banner!.length}",
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
                                  Container(
                                    height: 70,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("image/Rectangle Copy.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    // child:
                                    // Icon(Icons.cale)
                                    child: Image.asset(
                                      "image/calender.png",
                                      color: Color(0xff000000),
                                    ),
                                  )
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
                  height: 440,
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
                      Container(
                          // width: 45,
                          color: Color(0XFF8DAB7F),
                          child: Image.asset("image/Bitmap1.png")),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .70,
                        child: Text(
                          "Antique Elephant Buddha",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff373737),
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .70,
                        child: Text(
                          "₹ 20,000",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
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
                      )
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
                homeViewModel.homeUpcommingAuctionResponse == null
                    ? Container()
                    : Observer(builder: (context) {
                        return homeViewModel.isLoadingForUpCommingAuction
                            ? LinearProgressIndicator()
                            : Column(
                                children: [
                                  auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 0
                                      ? Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 220,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].image}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(children: [
                                            // homeViewModel.homeUpcommingAuctionResponse!.auctionArray!.map((e) =>
                                            Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: 220,
                                              color: Color(0xffEAEEF2).withOpacity(.4),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
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
                                                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}",
                                                        textAlign: TextAlign.start,
                                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                                              color: Colors.black,
                                                              overflow: TextOverflow.ellipsis,
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
                                                          auctionViewModel.selectedAuction = auctionViewModel
                                                              .upcomingAuctionResponse!.result!.auctions![0];

                                                          bottomViewModel.setIndex(8);
                                                        });
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffEAEEF2),
                                                            borderRadius: BorderRadius.all(Radius.circular(10))),
                                                        child: Text(
                                                          "EXPLORE",
                                                          textAlign: TextAlign.start,
                                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                                        "${homeViewModel.homeUpcommingAuctionResponse!.auctionArray![0].displayDate}",
                                                        textAlign: TextAlign.start,
                                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                                              color: Colors.black87,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width * .70,
                                                      child: Text(
                                                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].displayDate}",
                                                        textAlign: TextAlign.start,
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Colors.black87,
                                                            fontWeight: FontWeight.bold,
                                                            letterSpacing: 0.772727),
                                                      ),
                                                    ),
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
                                  auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 1
                                      ? Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 220,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].image}"),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Color(0xff495E93).withOpacity(1)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 220,
                                                  color: Color(0xffEAEEF2).withOpacity(.4),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 12.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(context).size.width * .70,
                                                          child: Text(
                                                            "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].auctionName}",
                                                            textAlign: TextAlign.end,
                                                            style: Theme.of(context).textTheme.headline6!.copyWith(
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
                                                              auctionViewModel.selectedAuction = auctionViewModel
                                                                  .upcomingAuctionResponse!.result!.auctions![1];

                                                              bottomViewModel.setIndex(8);
                                                            });
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.only(
                                                                left: 30, right: 10, top: 10, bottom: 10),
                                                            decoration: BoxDecoration(
                                                                color: Color(0xffEAEEF2),
                                                                borderRadius: BorderRadius.all(Radius.circular(10))),
                                                            child: Text(
                                                              "EXPLORE",
                                                              textAlign: TextAlign.start,
                                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                                            "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].displayDate}",
                                                            textAlign: TextAlign.end,
                                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w300,
                                                                ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(context).size.width * .70,
                                                          child: Text(
                                                            "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].displayDate}",
                                                            textAlign: TextAlign.end,
                                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                          ),
                                                        ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HowToBuyPage()));
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     SizedBox(width: 16,),
                //     Text("SHOP ONLINE BY CATEGORY",
                //       textAlign: TextAlign.center,
                //       style:
                //       Theme.of(context).textTheme.headline5!.copyWith(
                //         color: Color(0xff373737),
                //         fontWeight: FontWeight.w900,
                //
                //         letterSpacing: 1
                //
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 24,),
                // Observer(
                //   builder: (context) {
                //     return  homeViewModel.isLoadingForLots?LinearProgressIndicator():homeViewModel.recordPriceLots==null?Container(): Container(
                //       color: Color(0xffFFFFFF),
                //       child: DefaultTabController(
                //         length: homeViewModel.recordPriceLots!.tabArray!.length,
                //
                //         child:  DecoratedBox(
                //           decoration: BoxDecoration(
                //             //This is for background color
                //             color: Colors.white.withOpacity(0.0),
                //
                //             //This is for bottom border that is needed
                //             border: Border(
                //                 bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                //           ),
                //           child: TabBar(
                //             onTap: (index) {
                //
                //
                //                 homeViewModel.selectedTabIndex=index;
                //               print(index);
                //
                //             },
                //             indicator: UnderlineTabIndicator(
                //               borderSide:
                //               BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                //             ),
                //             padding: EdgeInsets.all(0),
                //             labelPadding:  EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                //             unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                //             labelColor: const Color(0xFF2D2D2D),
                //
                //             labelStyle:
                //             Theme.of(context).textTheme.bodyText1!.copyWith(
                //               color: Color(0xff2D2D2D),
                //               fontWeight: FontWeight.w600,),
                //               isScrollable: true,
                //
                //
                //             tabs: homeViewModel.recordPriceLots!.tabArray!.map((e) =>
                //               Tab(
                //                     text: e.tabName,
                //                 ),
                //             ).toList()
                //
                //
                //
                //           ),
                //         ),
                //
                //       ),
                //     );
                //   }
                // ),
                // SizedBox(height: 16,),
                //
                //
                // Observer(
                //   builder: (context) {
                //     return homeViewModel.isLoadingForLots?Container(): Container(
                //       color: Color(0xffFFFFFF),
                //       height:320,
                //
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.all(0),
                //       child:  ListView.builder(
                //         controller: controller,
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (BuildContext context, int pos) {
                //           return Padding(
                //             padding: const EdgeInsets.all(10.0),
                //             child: Container(
                //                 color: Color(0xffFFFFFF),
                //                 height:380,
                //                 width: 200,
                //                 alignment: Alignment.center,
                //                 child: Stack(
                //                   children: [
                //                     Positioned(
                //                       bottom: 0,
                //                       left: 50,
                //                       right: 50,
                //
                //                       child: Container(
                //                         //replace this Container with your Card
                //                         color: Color(0xffF8F8F8),
                //                         height:380,
                //                         width: 200,
                //
                //                       ),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(left: 25.0,right: 25),
                //                       child: Image.network("${ homeViewModel.recordPriceLots!.tabArray![homeViewModel.selectedTabIndex].lots![pos].ThumbImage}",height: 210,width: 150,fit: BoxFit.fill,),
                //                     ),
                //                     Padding(
                //                         padding: EdgeInsets.only(top: 430 / 2.0,bottom: 0,left: 25.0,right: 25),
                //                         child:Column(
                //                           mainAxisAlignment: MainAxisAlignment.start,
                //                           crossAxisAlignment: CrossAxisAlignment.start,
                //                           mainAxisSize: MainAxisSize.min,
                //                           children: [
                //                             SizedBox(width: 20,),
                //                             Text("${ homeViewModel.recordPriceLots!.tabArray![homeViewModel.selectedTabIndex].lots![pos].info!.title}",
                //                               textAlign: TextAlign.start,
                //                               style:
                //                               Theme.of(context).textTheme.subtitle1!.copyWith(
                //                                   color: Color(0xff2D2D2D),
                //                                   fontWeight: FontWeight.w400,
                //                                   letterSpacing: 1.5,
                //                                 overflow: TextOverflow.ellipsis
                //                               ),
                //                             ),
                //                             Text("${ homeViewModel.recordPriceLots!.tabArray![homeViewModel.selectedTabIndex].lots![pos].info!.description}",
                //                               textAlign: TextAlign.start,
                //                               style:
                //                               Theme.of(context).textTheme.subtitle1!.copyWith(
                //                                   color: Color(0xff2D2D2D),
                //                                   fontWeight: FontWeight.w400,
                //                                   letterSpacing: 1.5,
                //                                   overflow: TextOverflow.ellipsis
                //                               ),
                //                             ),
                //                             SizedBox(height: 10,),
                //                             Text("₹ ${ homeViewModel.recordPriceLots!.tabArray![homeViewModel.selectedTabIndex].lots![pos].estimateFrom!.iNR}",
                //                               textAlign: TextAlign.center,
                //                               style:
                //                               Theme.of(context).textTheme.subtitle1!.copyWith(
                //                                 color: Theme.of(context).colorScheme.primary,
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                           ],
                //                         )
                //                     ),
                //                   ],
                //                 )
                //             ),
                //           );
                //         },
                //         itemCount:homeViewModel.recordPriceLots==null?0:homeViewModel.recordPriceLots!.tabArray![homeViewModel.selectedTabIndex].lots!.length,
                //       ),
                //     );
                //   }
                // ),
                //
                // SizedBox(height: 10,),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => NewsAndUpdatesPage()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(22.0),
                //         gradient: LinearGradient(
                //           begin: Alignment.bottomLeft,
                //           end: Alignment.topRight,
                //           colors: [
                //             Color(0xffB45156),
                //             Color(0xffE74B52),
                //           ],
                //         )),
                //     // onPressed: (){
                //     //
                //     // },
                //     child: Padding(
                //       padding: const EdgeInsets.only(
                //           right: 8.0, left: 8, top: 12, bottom: 12),
                //       child: Text(
                //         'VIEW ALL',
                //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //             letterSpacing: 1),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: 16,
                // ),
                // Center(
                //   child: SmoothPageIndicator(
                //     controller: controller,
                //     count: 3,
                //     effect: WormEffect(
                //         dotHeight: 10,
                //         dotWidth: 10,
                //         type: WormType.thin,
                //         activeDotColor: Color(0xff3C5233),
                //         dotColor: Color(0xffD1D1D1)
                //         // strokeWidth: 5,
                //         ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 340,
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
                      "NEWS & UPDATES.",
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
                // const SizedBox(height: 20,),

                Observer(builder: (context) {
                  return homeViewModel.isLoadingForNews
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
                                  homeViewModel.selectedNewsTabIndex = index;
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
                                  Tab(
                                    text: "LATEST NEWS",
                                  ),
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
                  return homeViewModel.isLoadingForNews
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
                                width: MediaQuery.of(context).size.width * .9,
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
                                        children: [
                                          homeViewModel.selectedNewsTabIndex == 0
                                              ? Image.network(
                                                  "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].image!.mobile}",
                                                  fit: BoxFit.cover,
                                                  height: 200)
                                              : homeViewModel.selectedNewsTabIndex == 1
                                                  ? Image.network(
                                                      "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].image!.mobile}",
                                                      fit: BoxFit.cover,
                                                      height: 200)
                                                  : Image.network(
                                                      "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].image!.mobile}",
                                                      fit: BoxFit.cover,
                                                      height: 200),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          homeViewModel.selectedNewsTabIndex == 0
                                              ? Text(
                                                  "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].timestamp}",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Theme.of(context).colorScheme.primary,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                )
                                              : homeViewModel.selectedNewsTabIndex == 1
                                                  ? Text(
                                                      "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].timestamp}",
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Theme.of(context).colorScheme.primary,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                    )
                                                  : Text(
                                                      "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].timestamp}",
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Theme.of(context).colorScheme.primary,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                    ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          homeViewModel.selectedNewsTabIndex == 0
                                              ? Container(
                                                  child: Text(
                                                    "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].title}",
                                                    textAlign: TextAlign.left,
                                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                          color: Color(0xff2D2D2D),
                                                          overflow: TextOverflow.ellipsis,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                  ),
                                                )
                                              : homeViewModel.selectedNewsTabIndex == 1
                                                  ? Container(
                                                      child: Text(
                                                        "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].title}",
                                                        textAlign: TextAlign.left,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Color(0xff2D2D2D),
                                                              overflow: TextOverflow.ellipsis,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                      ),
                                                    )
                                                  : Container(
                                                      child: Text(
                                                        "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].title}",
                                                        textAlign: TextAlign.left,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Color(0xff2D2D2D),
                                                              overflow: TextOverflow.ellipsis,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                      ),
                                                    ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          homeViewModel.selectedNewsTabIndex == 0
                                              ? Text(
                                                  "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc}",
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Color(0xff747474),
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                )
                                              : homeViewModel.selectedNewsTabIndex == 1
                                                  ? Text(
                                                      "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc}",
                                                      textAlign: TextAlign.left,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Color(0xff747474),
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                    )
                                                  : Text(
                                                      "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc}",
                                                      textAlign: TextAlign.left,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Color(0xff747474),
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                    ),
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
                            itemCount: homeViewModel.selectedNewsTabIndex == 0
                                ? homeViewModel.homeNewsVideosBlogsResponse == null
                                    ? 0
                                    : homeViewModel.homeNewsVideosBlogsResponse!.news!.length
                                : homeViewModel.selectedNewsTabIndex == 1
                                    ? homeViewModel.homeNewsVideosBlogsResponse!.videos!.length
                                    : homeViewModel.homeNewsVideosBlogsResponse!.blogs!.length,
                          ),
                        );
                }),
                SizedBox(
                  height: 24,
                ),
                Observer(builder: (context) {
                  return homeViewModel.isLoadingForNews
                      ? Container()
                      : homeViewModel.homeNewsVideosBlogsResponse == null
                          ? Container()
                          : Center(
                              child: SmoothPageIndicator(
                                controller: controller1,
                                count: homeViewModel.selectedNewsTabIndex == 0
                                    ? homeViewModel.homeNewsVideosBlogsResponse!.news!.length
                                    : homeViewModel.selectedNewsTabIndex == 1
                                        ? homeViewModel.homeNewsVideosBlogsResponse!.videos!.length
                                        : homeViewModel.homeNewsVideosBlogsResponse!.blogs!.length,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
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
            Positioned(
              top: 0,
              right: 0,
              child: AnimatedContainer(
                width: homeViewModel.search ? MediaQuery.of(context).size.width : 0,
                height: homeViewModel.search ? MediaQuery.of(context).size.height : 0,
                color: Colors.grey.withOpacity(.7),
                duration: Duration(milliseconds: 200),
                curve: Curves.linear,
                child: Column(
                  children: [
                    auctionViewModel.isLoadingForlots ? LinearProgressIndicator() : Container(),
                    Container(
                      color: Color(0xffEAEEF2),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: TextField(
                              onChanged: (str) => auctionViewModel.getGlobalauctions(str),
                              decoration: InputDecoration(
                                  hintText: "Search Here", hintStyle: Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.close, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
