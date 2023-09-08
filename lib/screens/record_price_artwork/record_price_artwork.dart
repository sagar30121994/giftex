import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
import 'package:giftex/viewmodel/home/homeviewmodel.dart';
import 'package:intl/intl.dart';

class Record_price_artwork extends StatefulWidget {
  const Record_price_artwork({Key? key}) : super(key: key);

  @override
  State<Record_price_artwork> createState() => _Record_price_artworkState();
}

class _Record_price_artworkState extends State<Record_price_artwork> {
  HomeViewModel homeViewModel = HomeViewModel();
  LocalSharedPrefrence? preference;

  bool grid = true;

  @override
  void initState() {
    homeViewModel.getRecordpriceartwork();
    preference = new LocalSharedPrefrence();

    super.initState();
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: NavBar(),
            body: Observer(
              builder: (context) {
                return homeViewModel.isloadinggetpriceartwork
                    ? LinearProgressIndicator(
                        minHeight: 2,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "RECORD PRICE \n\t\t\t\tARTWORK",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.888889),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "START DOING WORK THAT MATTERS",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .90,
                                child: Text(
                                  "we host over 200 auctions annually and\n\toffer a cross-category selection of\nitems available for immediate purchase via both digital and physical shopping\nexperiences as well as private sales",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFF000000), fontWeight: FontWeight.w600, letterSpacing: 1),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 260,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 54,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30, bottom: 0),
                                        child: Container(
                                          //replace this Container with your Card
                                          color: Color(0xff1F2A52),
                                          height: 160.0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 54,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30, bottom: 0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xff8C9FB1),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(265),
                                                bottomRight: Radius.circular(265),
                                              ),
                                            ),
                                            height: 140.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 54,
                                        child: Image.asset(
                                          "image/2.png",
                                          height: 200,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 16,
                                      height: 28,
                                    ),
                                    Text(
                                      'TOP TWENTY ARTWORKS',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            grid = false;
                                          });
                                        },
                                        child: Image.asset("image/list.png", height: 30)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            grid = true;
                                          });
                                          // auctionViewModel.isGrid=true;
                                        },
                                        child: Image.asset("image/grid.png", height: 30)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Observer(builder: (context) {
                                return auctionViewModel.isLoadingForlots
                                    ? LinearProgressIndicator(
                                        minHeight: 2,
                                      )
                                    : Container();
                              }),
                              Observer(builder: (context) {
                                return auctionViewModel.isLoadingForlots
                                    ? Container()
                                    : homeViewModel.getRecordPriceArtworkResponse == null
                                        ? Container(
                                            child: getErrorMEssage(),
                                          )
                                        : homeViewModel.getRecordPriceArtworkResponse!.result == null
                                            ? Container(
                                                child: getErrorMEssage(),
                                              )
                                            : homeViewModel.getRecordPriceArtworkResponse!.result!.lots == []
                                                ? Container(
                                                    child: getErrorMEssage(),
                                                  )
                                                : Container(
                                                    color: Colors.grey.shade200,
                                                    child: Column(
                                                      children: homeViewModel
                                                          .getRecordPriceArtworkResponse!.result!.lots!
                                                          .map(
                                                            (e) => grid
                                                                ? Padding(
                                                                    padding: const EdgeInsets.all(16.0),
                                                                    child: Container(
                                                                        color: Color(0xffFFFFFF),
                                                                        height: 520,
                                                                        width: double.maxFinite,
                                                                        alignment: Alignment.center,
                                                                        child: Stack(
                                                                          children: [
                                                                            Padding(
                                                                              padding:
                                                                                  EdgeInsets.only(top: 0, bottom: 0),
                                                                              child: Container(
                                                                                //replace this Container with your Card
                                                                                color: Color(0xffF9F9F9),
                                                                                height: 520,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) =>
                                                                                            ProductDetailPage(
                                                                                                e, auctionViewModel)));
                                                                              },
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets.only(left: 2.0),
                                                                                child: Image.network(
                                                                                  "${e.thumbImage}",
                                                                                  height: 250,
                                                                                  width: MediaQuery.of(context)
                                                                                          .size
                                                                                          .width *
                                                                                      .65,
                                                                                  alignment: Alignment.center,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                                padding: EdgeInsets.only(
                                                                                    top: 252,
                                                                                    bottom: 0,
                                                                                    left: 25.0,
                                                                                    right: 25),
                                                                                child: Column(
                                                                                  mainAxisAlignment:
                                                                                      MainAxisAlignment.start,
                                                                                  crossAxisAlignment:
                                                                                      CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 34,
                                                                                    ),
                                                                                    e.auctionType == "1"
                                                                                        ? Text(
                                                                                            "${e.info == null ? '' : e.info!.title}",
                                                                                            textAlign: TextAlign.center,
                                                                                            style: Theme.of(context)
                                                                                                .textTheme
                                                                                                .headline6!
                                                                                                .copyWith(
                                                                                                  color: Colors.black,
                                                                                                  letterSpacing: 2,
                                                                                                  fontWeight:
                                                                                                      FontWeight.bold,
                                                                                                ),
                                                                                          )
                                                                                        : Container(),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      "${e.info == null ? '' : e.info!.lotTitle}",
                                                                                      textAlign: TextAlign.left,
                                                                                      maxLines: 2,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: Theme.of(context)
                                                                                          .textTheme
                                                                                          .subtitle1!
                                                                                          .copyWith(
                                                                                            color: Color(0xff747474),
                                                                                            fontWeight: FontWeight.w400,
                                                                                          ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      "${e.lotDesc}",
                                                                                      textAlign: TextAlign.left,
                                                                                      maxLines: 2,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: Theme.of(context)
                                                                                          .textTheme
                                                                                          .subtitle1!
                                                                                          .copyWith(
                                                                                            color: Theme.of(context)
                                                                                                .colorScheme
                                                                                                .primary,
                                                                                            fontWeight: FontWeight.w400,
                                                                                          ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 12,
                                                                                    ),
                                                                                    Row(
                                                                                      // mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Column(
                                                                                          crossAxisAlignment:
                                                                                              CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              "₹${formateNumber(e.leadingUser!.bid!.iNR ?? "0")}",
                                                                                              // "\u20b9 ${e.leadingUser!.bid!.iNR}",
                                                                                              textAlign: TextAlign.left,
                                                                                              maxLines: 2,
                                                                                              overflow:
                                                                                                  TextOverflow.ellipsis,
                                                                                              style: Theme.of(context)
                                                                                                  .textTheme
                                                                                                  .subtitle1!
                                                                                                  .copyWith(
                                                                                                      color: Color(
                                                                                                          0xff747474),
                                                                                                      fontWeight:
                                                                                                          FontWeight
                                                                                                              .bold,
                                                                                                      fontSize: 18),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 8,
                                                                                            ),
                                                                                            Text(
                                                                                              "${e.leadingUser!.notes}",
                                                                                              textAlign: TextAlign.left,
                                                                                              maxLines: 2,
                                                                                              overflow:
                                                                                                  TextOverflow.ellipsis,
                                                                                              style: Theme.of(context)
                                                                                                  .textTheme
                                                                                                  .subtitle1!
                                                                                                  .copyWith(
                                                                                                      color: Color(
                                                                                                          0xff747474),
                                                                                                      fontWeight:
                                                                                                          FontWeight
                                                                                                              .w400,
                                                                                                      fontSize: 14),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Spacer(),
                                                                                        Padding(
                                                                                          padding:
                                                                                              const EdgeInsets.only(
                                                                                                  bottom: 12.0),
                                                                                          child: ElevatedButton(
                                                                                            style: ButtonStyle(
                                                                                                backgroundColor:
                                                                                                    MaterialStateProperty.all(
                                                                                                        Color(
                                                                                                            0XFFF9F9F9)),
                                                                                                shape: MaterialStateProperty.all<
                                                                                                        RoundedRectangleBorder>(
                                                                                                    RoundedRectangleBorder(
                                                                                                        borderRadius:
                                                                                                            BorderRadius.circular(
                                                                                                                20.0),
                                                                                                        side: BorderSide(
                                                                                                            color: Color(
                                                                                                                0xff747474),
                                                                                                            width:
                                                                                                                0.38)))),
                                                                                            onPressed: () {
                                                                                              Navigator.push(
                                                                                                  context,
                                                                                                  MaterialPageRoute(
                                                                                                      builder: (context) =>
                                                                                                          ProductDetailPage(
                                                                                                              e,
                                                                                                              auctionViewModel)));
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding:
                                                                                                  const EdgeInsets.only(
                                                                                                      right: 8.0,
                                                                                                      left: 8,
                                                                                                      top: 12,
                                                                                                      bottom: 12),
                                                                                              child: Text(
                                                                                                'DETAILS',
                                                                                                style: Theme.of(context)
                                                                                                    .textTheme
                                                                                                    .bodyText1!
                                                                                                    .copyWith(
                                                                                                        color: Theme.of(
                                                                                                                context)
                                                                                                            .colorScheme
                                                                                                            .primary,
                                                                                                        fontWeight:
                                                                                                            FontWeight
                                                                                                                .bold,
                                                                                                        letterSpacing:
                                                                                                            2),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                )),
                                                                            Positioned(
                                                                              right: 4,
                                                                              top: 50,
                                                                              child: Column(
                                                                                children: [
                                                                                  Container(
                                                                                    child: Text(
                                                                                      "Lot  ${e.lotNumber}",
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius:
                                                                                          BorderRadius.circular(16),
                                                                                      color: Color(0xffEAEEF2),
                                                                                    ),
                                                                                    padding: EdgeInsets.symmetric(
                                                                                        horizontal: 4, vertical: 4),
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
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )),
                                                                  )
                                                                : Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 8, vertical: 8),
                                                                    child: Container(
                                                                        color: Color(0xffF9F9F9),
                                                                        // height: (hours == "00" && minutes == "00" && seconds == "00") ? 310 : 370,
                                                                        alignment: Alignment.center,
                                                                        child: Column(
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(
                                                                                      top: 24, bottom: 0),
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
                                                                                            builder: (context) =>
                                                                                                ProductDetailPage(
                                                                                                    e as Lots,
                                                                                                    auctionViewModel)));
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(16.0),
                                                                                    child: Image.network(
                                                                                      "${e.thumbImage}",
                                                                                      height: 150,
                                                                                      fit: BoxFit.contain,
                                                                                      width: 125,
                                                                                      // alignment: Alignment.center,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding:
                                                                                      const EdgeInsets.only(left: 150),
                                                                                  child: Column(
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.start,
                                                                                    crossAxisAlignment:
                                                                                        CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 28,
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          Container(
                                                                                            child: Text(
                                                                                              "Lot  ${e.lotNumber}",
                                                                                              textAlign:
                                                                                                  TextAlign.center,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius:
                                                                                                  BorderRadius.circular(
                                                                                                      16),
                                                                                              color: Color(0xffEAEEF2),
                                                                                            ),
                                                                                            padding:
                                                                                                EdgeInsets.symmetric(
                                                                                                    horizontal: 12,
                                                                                                    vertical: 4),
                                                                                          ),
                                                                                          SizedBox(width: 12),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: MediaQuery.of(context)
                                                                                                .size
                                                                                                .width *
                                                                                            .42,
                                                                                        child: Text(
                                                                                          "${e.info!.title}",
                                                                                          textAlign: TextAlign.start,
                                                                                          style: Theme.of(context)
                                                                                              .textTheme
                                                                                              .headline6!
                                                                                              .copyWith(
                                                                                                color: Colors.black,
                                                                                                letterSpacing: 2,
                                                                                                fontWeight:
                                                                                                    FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 8,
                                                                                      ),
                                                                                      Text(
                                                                                        "${e.category}",
                                                                                        textAlign: TextAlign.start,
                                                                                        style: Theme.of(context)
                                                                                            .textTheme
                                                                                            .subtitle1!
                                                                                            .copyWith(
                                                                                              color: Color(0xff747474),
                                                                                              fontWeight:
                                                                                                  FontWeight.w400,
                                                                                            ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 8,
                                                                                      ),
                                                                                      Text(
                                                                                        "${e.category}",
                                                                                        textAlign: TextAlign.start,
                                                                                        style: Theme.of(context)
                                                                                            .textTheme
                                                                                            .subtitle1!
                                                                                            .copyWith(
                                                                                              color: Color(0xff747474),
                                                                                              fontWeight:
                                                                                                  FontWeight.w400,
                                                                                            ),
                                                                                      ),
                                                                                      Spacer(),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  );
                              }),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 16),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                              Container(
                                height: 100,
                                color: Color(0xff1F2A52),
                                width: MediaQuery.of(context).size.width,
                              )
                            ],
                          ),
                        ),
                      );
              },
            )));
  }

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
        Text("No data availavle"),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
