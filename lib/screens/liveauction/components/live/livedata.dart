import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/browsitemlistitem.dart';
import 'package:giftex/screens/liveauction/components/live/browsmygallery.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';

class LiveData extends StatefulWidget {
  LiveData(this.auctionViewModel);

  AuctionViewModel auctionViewModel;

  @override
  State<LiveData> createState() => _LiveDataState();
}

class _LiveDataState extends State<LiveData> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference? likeReference;
  DatabaseReference? userlikeReference;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return (widget.auctionViewModel.auctionType == "live" && widget.auctionViewModel.liveAuctionType != "closingschedule")
          ? (widget.auctionViewModel.isLoadingForlots && widget.auctionViewModel.isLoadingForUpCommingAuction)
              ? SliverToBoxAdapter(child: LinearProgressIndicator())
              : widget.auctionViewModel.upcomingAuctionResponse!.result == null
                  ? SliverToBoxAdapter(
                      child: Observer(builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.rotate(angle: -pi / 35.13, child: Image.asset("image/auctionhammer.png", width: 266)),
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
                        );
                      }),
                    )
                  : widget.auctionViewModel.liveAuctionType == "mygallery"
                      ? Observer(builder: (context) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              addAutomaticKeepAlives: true,
                              (BuildContext context, int index) {
                                // return BrowseItemListItem(auctionViewModel.upcomingAuctionResponse!.result!.auctions![index],index);
                                return BrowseMyGallryListItem(widget.auctionViewModel.myAuctionGalleryResponse!.result!.lots![index], widget.auctionViewModel.isGrid, widget.auctionViewModel);
                              },
                              // 40 list items
                              childCount: widget.auctionViewModel.myAuctionGalleryResponse == null
                                  ? 0
                                  : widget.auctionViewModel.myAuctionGalleryResponse!.result!.lots == null
                                      ? 0
                                      : widget.auctionViewModel.myAuctionGalleryResponse!.result!.lots!.length,
                            ),
                          );
                        })
                      : widget.auctionViewModel.liveAuctionType == "browselist"
                          ? Observer(builder: (context) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  addAutomaticKeepAlives: true,
                                  (BuildContext context, int index) {
                                    // return BrowseItemListItem(auctionViewModel.upcomingAuctionResponse!.result!.auctions![index],index);

                                    return BrowseItemListItem(widget.auctionViewModel.upComingLotsResponse!.result!.lots![index], widget.auctionViewModel.isGrid, widget.auctionViewModel);
                                  },
                                  // 40 list items
                                  childCount: widget.auctionViewModel.upComingLotsResponse == null
                                      ? 0
                                      : widget.auctionViewModel.upComingLotsResponse!.result!.lots == null
                                          ? 0
                                          : widget.auctionViewModel.upComingLotsResponse!.result!.lots!.length,
                                ),
                              );
                            })
                          : Observer(builder: (context) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  addAutomaticKeepAlives: true,
                                  (BuildContext contXext, int index) {
                                    // return BrowseItemListItem(auctionViewModel.upcomingAuctionResponse!.result!.auctions![index],index);
                                    return Observer(builder: (context) {
                                      return BrowseItemListItem(widget.auctionViewModel.getliveauctionsResponse!.result!.lots![index], widget.auctionViewModel.isGrid, widget.auctionViewModel);
                                    });
                                  },
                                  // 40 list items
                                  childCount: widget.auctionViewModel.getliveauctionsResponse == null
                                      ? 0
                                      : widget.auctionViewModel.getliveauctionsResponse!.result!.lots == null
                                          ? 0
                                          : widget.auctionViewModel.getliveauctionsResponse!.result!.lots!.length,
                                ),
                              );
                            })
          : SliverToBoxAdapter(child: Container());
    });
  }
}
