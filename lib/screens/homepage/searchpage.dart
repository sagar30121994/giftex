import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/screens/liveauction/components/image/imagecomponent.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart'; // import 'package:giftex/data/network/models/responce/lot/upcominglotsresponsectionviewmodel.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:intl/intl.dart';

import '../../data/network/models/responce/liveauction/liveauctionreviewlotresponce.dart';

class SearchBarUi extends StatefulWidget {
  const SearchBarUi({Key? key}) : super(key: key);

  @override
  State<SearchBarUi> createState() => _SearchBarUiState();
}

class _SearchBarUiState extends State<SearchBarUi> {
  AuctionViewModel auctionViewModel = AuctionViewModel();
  TextEditingController searchController = TextEditingController();
  LocalSharedPrefrence? preference;

  String hours = "00";
  String minutes = "00";
  String seconds = "00";
  bool grid = true;

  @override
  void initState() {
    auctionViewModel.newsearchResponse = null;
    preference = new LocalSharedPrefrence();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NavBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Search",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      enabledBorder: getTextBorder(),
                      border: getTextBorder(),
                      focusedBorder: getTextBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            auctionViewModel.newsearchResponse = null;
                            searchController.text = '';
                          });
                        },
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            if (searchController.text.length >= 3) {
                              auctionViewModel.SearchGlobalauctions(searchController.text);
                            } else {
                              auctionViewModel.newsearchResponse = null;
                            }
                          });
                        },
                      ),
                      labelText: "Search",
                      hintText: "Search Here"),
                  onChanged: (str) {
                    if (str.length >= 3) {
                      auctionViewModel.SearchGlobalauctions(str);
                    } else {
                      auctionViewModel.newsearchResponse = null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Icon(Icons.menu_sharp,size: 30,),
                  SizedBox(
                    width: 16,
                  ),
                  Observer(builder: (context) {
                    return auctionViewModel.isLoadingForlots
                        ? Container()
                        : auctionViewModel.newsearchResponse == null
                            ? Container()
                            : auctionViewModel.newsearchResponse!.result == null
                                ? Container()
                                : Text(
                                    ' ${((auctionViewModel.newsearchResponse!.result!.lots!.length))} Items ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.purple.shade50,
                                        fontSize: 14),
                                  );
                  }),
                  Spacer(),

                  InkWell(
                      onTap: () {
                        setState(() {
                          grid = false;
                        });
                      },
                      child: Image.asset("image/list.png", height: 30,color: !grid?Colors.indigo:Colors.black,)),
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
                      child: Image.asset("image/grid.png", height: 30,color: grid?Colors.indigo:Colors.black,)),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              /*  Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  Text("you can also search by "),
                  ElevatedButton(
                      style: getButtonStyle(),
                      onPressed: () {},
                      child: Text("Artist Name")),
                  ElevatedButton(
                      style: getButtonStyle(),
                      onPressed: () {},
                      child: Text("category")),
                  ElevatedButton(
                      style: getButtonStyle(),
                      onPressed: () {},
                      child: Text("Material")),
                  ElevatedButton(
                      style: getButtonStyle(),
                      onPressed: () {},
                      child: Text("period")),
                ],
              ),*/
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
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
                    : auctionViewModel.newsearchResponse == null
                        ? Container(
                            child: getErrorMEssage(),
                          )
                        : auctionViewModel.newsearchResponse!.result == null
                            ? Container(
                                child: getErrorMEssage(),
                              )
                            : auctionViewModel.newsearchResponse!.result!.lots == []
                                ? Container(
                                    child: getErrorMEssage(),
                                  )
                                : Container(
                                    color: Colors.grey.shade200,
                                    child: Column(
                                      children: auctionViewModel.newsearchResponse!.result!.lots!
                                          .map(
                                            (e) => grid
                                                ? Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Container(
                                                        color: Color(0xffFFFFFF),
                                                        height: 480,
                                                        width: double.maxFinite,
                                                        alignment: Alignment.center,
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(top: 0, bottom: 0),
                                                              child: Container(
                                                                //replace this Container with your Card
                                                                color: Color(0xffF9F9F9),
                                                                height: 500,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ProductDetailPage(e, auctionViewModel)));
                                                              },
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 8.0,top: 24),
                                                                child: Image.network(
                                                                  "${e.thumbImage}",
                                                                  height: 200,
                                                                  width: MediaQuery.of(context).size.width * .65,
                                                                  alignment: Alignment.center,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: 200, bottom: 0, left: 25.0, right: 25),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                  fontWeight: FontWeight.bold,
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
                                                                            e.estimateFrom == null
                                                                                ? Text('')
                                                                                : Text(
                                                                                    "₹${formateNumber(e.estimateFrom!.iNR ?? "0")} - ${formateNumber(e.estimateTo!.iNR ?? "")}",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: Theme.of(context)
                                                                                        .textTheme
                                                                                        .bodyText1!
                                                                                        .copyWith(
                                                                                          color: Color(0xff202232),
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                        Spacer(),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            e.leadingUser == null
                                                                                ? Text('')
                                                                                : Text(
                                                                                    "₹${formateNumber(e.leadingUser!.bid!.iNR ?? "0")}",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: Theme.of(context)
                                                                                        .textTheme
                                                                                        .bodyText1!
                                                                                        .copyWith(
                                                                                          color: Color(0xff202232),
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                            Text(
                                                                              "${e.leadingUser!.notes ?? ""}",
                                                                              textAlign: TextAlign.center,
                                                                              style: Theme.of(context)
                                                                                  .textTheme
                                                                                  .subtitle1!
                                                                                  .copyWith(
                                                                                    color: Color(0xff747474),
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Spacer(),
                                                                      ],
                                                                    ),

                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    // e.liveStatus ==
                                                                    //         null
                                                                    //     ? Container()
                                                                    //     : Row(
                                                                    //         mainAxisAlignment: MainAxisAlignment.start,
                                                                    //         crossAxisAlignment: CrossAxisAlignment.start,
                                                                    //         children: [
                                                                    //           Column(
                                                                    //             mainAxisAlignment: MainAxisAlignment.start,
                                                                    //             crossAxisAlignment: CrossAxisAlignment.start,
                                                                    //             children: [
                                                                    //               Text(
                                                                    //                 "Current Bid",
                                                                    //                 textAlign: TextAlign.center,
                                                                    //                 style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    //                       color: Color(0xff747474),
                                                                    //                       fontWeight: FontWeight.w400,
                                                                    //                     ),
                                                                    //               ),
                                                                    //               SizedBox(
                                                                    //                 height: 10,
                                                                    //               ),
                                                                    //               e.liveStatus!.currentBid == null
                                                                    //                   ? Text('')
                                                                    //                   : Text(
                                                                    //                       "₹${formateNumber(e.liveStatus!.currentBid!.iNR ?? "0")}",
                                                                    //                       textAlign: TextAlign.center,
                                                                    //                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                    //                             color: Color(0xff202232),
                                                                    //                             fontWeight: FontWeight.w600,
                                                                    //                           ),
                                                                    //                     ),
                                                                    //             ],
                                                                    //           ),
                                                                    //           Spacer(),
                                                                    //           Column(
                                                                    //             mainAxisAlignment: MainAxisAlignment.start,
                                                                    //             crossAxisAlignment: CrossAxisAlignment.start,
                                                                    //             children: [
                                                                    //               Text(
                                                                    //                 "Next Valid Bid",
                                                                    //                 textAlign: TextAlign.center,
                                                                    //                 style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                    //                       color: Color(0xff747474),
                                                                    //                       fontWeight: FontWeight.w400,
                                                                    //                     ),
                                                                    //               ),
                                                                    //               SizedBox(
                                                                    //                 height: 10,
                                                                    //               ),
                                                                    //               e.liveStatus!.nextValidBid == null
                                                                    //                   ? Text('')
                                                                    //                   : Text(
                                                                    //                       "₹${formateNumber(e.liveStatus!.nextValidBid!.iNR ?? "0")}",
                                                                    //                       textAlign: TextAlign.center,
                                                                    //                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                    //                             color: Theme.of(context).colorScheme.primary,
                                                                    //                             fontWeight: FontWeight.w600,
                                                                    //                           ),
                                                                    //                     ),
                                                                    //             ],
                                                                    //           ),
                                                                    //         ],
                                                                    //       ),
                                                                    SizedBox(
                                                                      height: 16,
                                                                    ),
                                                                    // Row(
                                                                    //   mainAxisAlignment:
                                                                    //       MainAxisAlignment.end,
                                                                    //   children: [
                                                                    //     ElevatedButton(
                                                                    //       style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                                                    //       onPressed: () async {
                                                                    //         if (preference!.getLoginStatus()) {
                                                                    //         } else {
                                                                    //           WidgetsBinding.instance?.addPostFrameCallback((_) {
                                                                    //             showDialog(
                                                                    //               context: context,
                                                                    //               builder: (BuildContext context) {
                                                                    //                 return PopupWidget();
                                                                    //               },
                                                                    //             );
                                                                    //           });
                                                                    //         }
                                                                    //       },
                                                                    //       child: Padding(
                                                                    //         padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                                                    //         child: Text(
                                                                    //           'PROXY BID',
                                                                    //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                    //                 color: Color(0XFF2D2D2D),
                                                                    //                 fontWeight: FontWeight.bold,
                                                                    //               ),
                                                                    //         ),
                                                                    //       ),
                                                                    //     ),
                                                                    //     SizedBox(
                                                                    //       width: 16,
                                                                    //     ),
                                                                    //     InkWell(
                                                                    //       onTap: () {
                                                                    //         if (preference!.getLoginStatus()) {
                                                                    //         } else {
                                                                    //           WidgetsBinding.instance?.addPostFrameCallback((_) {
                                                                    //             showDialog(
                                                                    //               context: context,
                                                                    //               builder: (BuildContext context) {
                                                                    //                 return PopupWidget();
                                                                    //               },
                                                                    //             );
                                                                    //           });
                                                                    //         }
                                                                    //
                                                                    //         // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                                                    //       },
                                                                    //       child: Container(
                                                                    //         height: 50,
                                                                    //         // width: 150,
                                                                    //         decoration: BoxDecoration(
                                                                    //             gradient: LinearGradient(colors: [
                                                                    //               Color(0xffE74B52),
                                                                    //               Color(0xffE74B52),
                                                                    //             ]),
                                                                    //             // color: Color(0xff466D33),
                                                                    //             borderRadius: BorderRadius.circular(24)),
                                                                    //         child: Center(
                                                                    //           child: Padding(
                                                                    //             padding: const EdgeInsets.only(right: 32.0, left: 32, top: 12, bottom: 12),
                                                                    //             child: Text(
                                                                    //               'BID NOW',
                                                                    //               style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                    //                     color: Color(0XFFFFFFFF),
                                                                    //                     fontWeight: FontWeight.bold,
                                                                    //                   ),
                                                                    //             ),
                                                                    //           ),
                                                                    //         ),
                                                                    //       ),
                                                                    //     ),
                                                                    //   ],
                                                                    // ),
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
                                                                    child: Text(
                                                                      "Lot ${e.lotNumber}",
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(16),
                                                                      color: Color(0xffEAEEF2),
                                                                    ),
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal: 6, vertical: 4),
                                                                  ),

                                                                  // SizedBox(
                                                                  //     height:
                                                                  //         12),
                                                                  // Container(
                                                                  //   decoration: BoxDecoration(
                                                                  //       borderRadius:
                                                                  //           BorderRadius.circular(16),
                                                                  //       color: Color(0xffF3E8E9)),
                                                                  //   padding: EdgeInsets.symmetric(
                                                                  //       horizontal:
                                                                  //           10,
                                                                  //       vertical:
                                                                  //           4),
                                                                  //   child: Text(
                                                                  //       "${e.bidCount} BIDS"),
                                                                  // ),
                                                                  // SizedBox(
                                                                  //     height:
                                                                  //         12),
                                                                  // InkWell(
                                                                  //   onTap:
                                                                  //       () {
                                                                  //     if (preference!
                                                                  //         .getLoginStatus()) {
                                                                  //       auctionViewModel.addRemoveLotToWishlist(e as Lots,
                                                                  //           (e.isLiked ?? "false") == "true" ? "false" : "true");
                                                                  //     } else {
                                                                  //       WidgetsBinding.instance?.addPostFrameCallback((_) {
                                                                  //         showDialog(
                                                                  //           context: context,
                                                                  //           builder: (BuildContext context) {
                                                                  //             return PopupWidget();
                                                                  //           },
                                                                  //         );
                                                                  //       });
                                                                  //     }
                                                                  //   },
                                                                  //   child:
                                                                  //       Icon(
                                                                  //     (e.isLiked ?? "false") == "true"
                                                                  //         ? Icons.favorite
                                                                  //         : Icons.favorite_border,
                                                                  //     color: (e.isLiked ?? "false") == "true"
                                                                  //         ? Colors.pink
                                                                  //         : Colors.grey,
                                                                  //   ),
                                                                  // ),
                                                                  //     :Icon(
                                                                  //   Icons.favorite,
                                                                  //   color: Colors.pink,
                                                                  // ),
                                                                  SizedBox(height: 12),
                                                                  InkWell(
                                                                    onTap: () {
                                                                          Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => ImageFullScreenDialog(
                                                                            imageUrl: e.thumbImage ?? '',
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons.open_in_full,
                                                                      color: Colors.grey,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 6),
                                                                  // Container(
                                                                  //   padding: EdgeInsets.all(16),
                                                                  //   decoration: BoxDecoration(
                                                                  //     color:  Colors.lightBlueAccent.withOpacity(.2),
                                                                  //     borderRadius: BorderRadius.circular(32)
                                                                  //
                                                                  //   ),
                                                                  // )
                                                                  // Image
                                                                  //     .asset(
                                                                  //   "image/earth.png",
                                                                  //   height:
                                                                  //       50,
                                                                  // )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                    child: Container(
                                                        color: Color(0xffF9F9F9),
                                                        // height: (hours == "00" && minutes == "00" && seconds == "00") ? 310 : 370,

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
                                                                            builder: (context) => ProductDetailPage(
                                                                                e, auctionViewModel)));
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
                                                                            child: Text(
                                                                              "Lot  ${e.lotNumber}",
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(16),
                                                                              color: Color(0xffEAEEF2),
                                                                            ),
                                                                            padding: EdgeInsets.symmetric(
                                                                                horizontal: 10, vertical: 4),
                                                                          ),
                                                                          // SizedBox(width: 12),
                                                                          // Container(
                                                                          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Color(0xffF3E8E9)),
                                                                          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                                          //   child: Text("${e.bidCount} BIDS"),
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width * .50,
                                                                        child: Text(
                                                                          "${e.info!.title}",
                                                                          textAlign: TextAlign.start,
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .headline6!
                                                                              .copyWith(
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
                                                                        "${e.info == null ? '' : e.info!.lotTitle}",
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        textAlign: TextAlign.start,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(
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
                                                                            "₹${formateNumber(e.estimateFrom!.iNR ?? "0")} - ${formateNumber(e.estimateTo!.iNR ?? "")}",
                                                                            textAlign: TextAlign.center,
                                                                            style: Theme.of(context)
                                                                                .textTheme
                                                                                .bodyText1!
                                                                                .copyWith(
                                                                                  color: Color(0xff202232),
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: 8,
                                                                      ),
                                                                      // (hours == "00" && minutes == "00" && seconds == "00")
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(bottom: 12.0),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.start,
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment.start,
                                                                              children: [
                                                                                e.leadingUser == null
                                                                                    ? Text('')
                                                                                    : Text(
                                                                                        "₹${formateNumber(e.leadingUser!.bid!.iNR ?? "0")}",
                                                                                        textAlign: TextAlign.center,
                                                                                        style: Theme.of(context)
                                                                                            .textTheme
                                                                                            .bodyText1!
                                                                                            .copyWith(
                                                                                              color: Color(0xff202232),
                                                                                              fontWeight:
                                                                                                  FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                Text(
                                                                                  "${e.leadingUser!.notes ?? ""}",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: Theme.of(context)
                                                                                      .textTheme
                                                                                      .subtitle1!
                                                                                      .copyWith(
                                                                                        color: Color(0xff747474),
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Spacer(),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      // Container(
                                                                      //     child: (e.leadingUser!.id == auctionViewModel.localSharedPrefrence.getUserId())
                                                                      //         ? Align(
                                                                      //             alignment: Alignment.topRight,
                                                                      //             child: Column(
                                                                      //               children: [
                                                                      //                 Text(
                                                                      //                   "₹${e.leadingUser!.bid!.iNR}",
                                                                      //                   style: Theme.of(context).textTheme.subtitle2,
                                                                      //                 ),
                                                                      //                 Text("${e.leadingUser!.notes}"),
                                                                      //               ],
                                                                      //             ),
                                                                      //           )
                                                                      //         : Container())

                                                                      //     mainAxisAlignment: MainAxisAlignment.start,
                                                                      //     crossAxisAlignment: CrossAxisAlignment.start,
                                                                      //     children: [
                                                                      //       Column(
                                                                      //         mainAxisAlignment: MainAxisAlignment.start,
                                                                      //         crossAxisAlignment: CrossAxisAlignment.start,
                                                                      //         children: [
                                                                      //           Text(
                                                                      //             "Current Bid",
                                                                      //             textAlign: TextAlign.center,
                                                                      //             style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                      //                   color: Color(0xff747474),
                                                                      //                   fontWeight: FontWeight.w400,
                                                                      //                 ),
                                                                      //           ),
                                                                      //           SizedBox(
                                                                      //             height: 10,
                                                                      //           ),
                                                                      //           Text(
                                                                      //             "₹${formateNumber(e.liveStatus!.currentBid!.iNR ?? "0")}",
                                                                      //             textAlign: TextAlign.center,
                                                                      //             style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                      //                   color: Color(0xff202232),
                                                                      //                   fontWeight: FontWeight.w600,
                                                                      //                 ),
                                                                      //           ),
                                                                      //         ],
                                                                      //       ),
                                                                      //       Spacer(),
                                                                      //       Column(
                                                                      //         mainAxisAlignment: MainAxisAlignment.start,
                                                                      //         crossAxisAlignment: CrossAxisAlignment.start,
                                                                      //         children: [
                                                                      //           Text(
                                                                      //             "Next Valid Bid",
                                                                      //             textAlign: TextAlign.center,
                                                                      //             style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                      //                   color: Color(0xff747474),
                                                                      //                   fontWeight: FontWeight.w400,
                                                                      //                 ),
                                                                      //           ),
                                                                      //           SizedBox(
                                                                      //             height: 10,
                                                                      //           ),
                                                                      //           Text(
                                                                      //             "₹${formateNumber(e.liveStatus!.nextValidBid!.iNR ?? "0")}",
                                                                      //             textAlign: TextAlign.center,
                                                                      //             style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                      //                   color: Theme.of(context).colorScheme.primary,
                                                                      //                   fontWeight: FontWeight.w600,
                                                                      //                 ),
                                                                      //           ),
                                                                      //         ],
                                                                      //       ),
                                                                      //     ],
                                                                      //   ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: 0,
                                                                  top: 16,
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(height: 12),
                                                                      // InkWell(
                                                                      //   onTap:
                                                                      //       () {
                                                                      //     if (preference!.getLoginStatus()) {
                                                                      //       auctionViewModel.addRemoveLotToWishlist(e as Lots, (e.isLiked ?? "false") == "true" ? "false" : "true");
                                                                      //     } else {
                                                                      //       WidgetsBinding.instance?.addPostFrameCallback((_) {
                                                                      //         showDialog(
                                                                      //           context: context,
                                                                      //           builder: (BuildContext context) {
                                                                      //             return PopupWidget();
                                                                      //           },
                                                                      //         );
                                                                      //       });
                                                                      //     }
                                                                      //     // if (preference!.getLoginStatus()) {
                                                                      //     //   auctionViewModel.addRemoveLotToWishlist(e as Lots, (e.isLiked ?? "false") == "true" ? "false" : "true");
                                                                      //     // } else {
                                                                      //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                                                                      //     // }
                                                                      //   },
                                                                      //   child:
                                                                      //       Icon(
                                                                      //     (e.isLiked ?? "false") == "true" ? Icons.favorite : Icons.favorite_border,
                                                                      //     color: (e.isLiked ?? "false") == "true" ? Colors.pink : Colors.grey,
                                                                      //   ),
                                                                      // ),
                                                                      // SizedBox(
                                                                      //     height: 12),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(right: 12.0),
                                                                        child: InkWell(
                                                                          onTap: () {
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => ImageFullScreenDialog(
                                                                                  imageUrl: e.thumbImage ?? '',
                                                                                ),
                                                                              ),
                                                                            );
                                                                            // Navigator.push(
                                                                            //     context,
                                                                            //     MaterialPageRoute(
                                                                            //         builder: (context) =>
                                                                            //             ImageConponent(auctionViewModel.newsearchResponse!.result!.lots!.images.cast<Images>())));
                                                                          },
                                                                          child: Icon(
                                                                            Icons.open_in_full,
                                                                            color: Colors.grey,
                                                                          ),
                                                                        ),
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
                                                                      // Image
                                                                      //     .asset(
                                                                      //   "image/earth.png",
                                                                      //   height:
                                                                      //       50,
                                                                      // )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            // Align(
                                                            //   alignment:
                                                            //       Alignment
                                                            //           .topRight,
                                                            //   child:
                                                            //       Padding(
                                                            //     padding: const EdgeInsets
                                                            //             .only(
                                                            //         bottom:
                                                            //             12.0,
                                                            //         right:
                                                            //             12),
                                                            //     child:
                                                            //         Container(
                                                            //       padding:
                                                            //           EdgeInsets.all(
                                                            //               8),
                                                            //       decoration: BoxDecoration(
                                                            //           color: (e.leadingUser!.id == auctionViewModel.localSharedPrefrence.getUserId())
                                                            //               ? Colors.blue
                                                            //               : Colors.red,
                                                            //           borderRadius: BorderRadius.circular(16)),
                                                            //       child: Text(
                                                            //           "${(e.leadingUser!.id == auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU WON" : e.bidCount == "0" ? "BOUGHT IN" : "BID CLOSED"}",
                                                            //           style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),
                                                            //     ),
                                                            //   ),
                                                            // )
                                                          ],
                                                        )),
                                                  ),
                                            /*Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Image.network('${e.thumbImage}',width: 50,height:50,fit: BoxFit.cover,),
                                            SizedBox(width: 8,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [

                                                      Text("${e.type}"),
                                                    ],
                                                  ),
                                                  Text("${e.artistName}"),
                                                  Text("\u20b9 ${e.estimateFrom!.iNR??''} - \u20b9 ${e.estimateTo!.iNR??''}"),
                                                  Text("${e.leadingUser!.bid!.iNR}\n(${e.leadingUser!.notes})"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )*/
                                          )
                                          .toList(),
                                    ),
                                  );
              }),
            ],
          ),
        ),
      ),
    );
  }

  getButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      foregroundColor: Color(0xFF000000),
      backgroundColor: Color(0xFFC8B290).withOpacity(.2),
    );
  }

  getTextBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
    );
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.tryParse(number) ?? 0);
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
        Text("No data available"),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}


// class ImageFullScreenDialog extends StatelessWidget {
//   final String imageUrl;
//
//   ImageFullScreenDialog({required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white.withOpacity(.3),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     )),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .8,
//                 child: Center(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       child: Image.network(imageUrl,
//                       fit: BoxFit.contain,)),
//                   ),
//                 ),
//                ],
//               ),
//           ),
//         ),
//       );
//   }
// }



class ImageFullScreenDialog extends StatelessWidget {
  final String imageUrl;

  ImageFullScreenDialog({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.3),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(imageUrl,
                      fit: BoxFit.contain,)),
                  ),
                ),
               ],
              ),
          ),
        ),
      );
  }
}

