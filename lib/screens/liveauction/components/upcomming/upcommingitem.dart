import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/network/models/responce/lot/upcominglotsresponse.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:intl/intl.dart';

class UpcommingItem extends StatefulWidget {
  UpcommingItem(this.lots, this.grid, this.auctionViewModel);

  Lots lots;
  bool grid;
  AuctionViewModel auctionViewModel;

  @override
  State<UpcommingItem> createState() => _UpcommingItemState();
}

class _UpcommingItemState extends State<UpcommingItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return widget.auctionViewModel.isGrid
        ? Observer(builder: (context) {
            return Padding(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(widget.lots, auctionViewModel)));
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
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       "Estimate Value ",
                                  //       textAlign: TextAlign.center,
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .subtitle1!
                                  //           .copyWith(
                                  //             color: Color(0xff747474),
                                  //             fontWeight: FontWeight.w400,
                                  //           ),
                                  //     ),
                                  //     SizedBox(
                                  //       height: 10,
                                  //     ),
                                  //     Text(
                                  //       "₹${formateNumber(widget.lots.estimateFrom!.iNR ?? "0")} - ${formateNumber(widget.lots.estimateTo!.iNR ?? "")}",
                                  //       textAlign: TextAlign.center,
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .bodyText1!
                                  //           .copyWith(
                                  //             color: Color(0xff202232),
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //     ),
                                  //   ],
                                  // ),
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
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(8)),
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
                                                                              ? MediaQuery.of(context).size.width / 4 +
                                                                                  42
                                                                              : auctionViewModel.getIndex(
                                                                                          auctionViewModel
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
                                                                        : auctionViewModel.getIndex(auctionViewModel
                                                                                    .selectedProxyBid) ==
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
            );
          })
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                color: Color(0xffF9F9F9),
                // height: 310,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      children: [
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
                              width: 125,
                              // alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 28,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .5,
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
                                  // SizedBox(width: 12),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    widget.lots.bidCount == "0"
                        ? Container()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹${formateNumber(widget.lots.leadingUser!.bid!.iNR ?? "0")}",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff202232),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${widget.lots.leadingUser!.notes ?? ""}",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Color(0xff747474),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 8,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 24, bottom: 0),
                    //   child: Container(
                    //     //replace this Container with your Card
                    //     color: Color(0xffF9F9F9),
                    //     height: 180.0,
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(16)),
                        child: Text(
                            "${(widget.lots.leadingUser!.id == widget.auctionViewModel.localSharedPrefrence.getUserId()) ? "YOU OWN" : "DETAILS"}",
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.red)),
                      ),
                    ),
                  ],
                )),
          );
  }
}
