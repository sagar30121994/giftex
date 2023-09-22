import 'package:flutter/material.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:giftex/viewmodel/bottomviewmodel.dart';

class UpcomingAuctionItem extends StatefulWidget {
  UpcomingAuctionItem(this.auctions, this.index, this.auctionViewModel, this.bottomViewModel);

  Auctions auctions;
  int index;
  AuctionViewModel auctionViewModel;
  BottomViewModel bottomViewModel;

  @override
  State<UpcomingAuctionItem> createState() => _UpcommingItemState();
}

class _UpcommingItemState extends State<UpcomingAuctionItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.index % 2 == 0
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: 245,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${widget.auctions.image}"),
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
                              "${widget.auctions.auctionName}",
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
                                  widget.auctionViewModel.selectedAuction = widget.auctions;

                                  widget.bottomViewModel.setIndex(8);
                                });
                                widget.auctionViewModel.liveAuctionType = "lots";
                                widget.auctionViewModel.auctionType = "upcoming";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffEAEEF2), borderRadius: BorderRadius.all(Radius.circular(10))),
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
                              "${widget.auctions.displayDate}",
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
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${widget.auctions.image}"),
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
                                  "${widget.auctions.auctionName}",
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
                                    widget.auctionViewModel.liveAuctionType = "lots";
                                    widget.auctionViewModel.auctionType = "upcoming";
                                    widget.auctionViewModel.selectedAuction = widget.auctions;

                                    widget.bottomViewModel.setIndex(8);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xffEAEEF2), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Text(
                                    "EXPLORE",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D), fontWeight: FontWeight.bold, letterSpacing: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .70,
                                child: Text(
                                  "${widget.auctions.displayDate}",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
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
      ],
    );
  }
}
