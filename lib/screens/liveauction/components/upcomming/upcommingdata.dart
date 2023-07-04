import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/browsitemlistitem.dart';
import 'package:giftex/screens/liveauction/components/upcomming/browsupcommingitem.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';

class UpcommingData extends StatefulWidget {
  UpcommingData(this.auctionViewModel);
  AuctionViewModel auctionViewModel;

  @override
  State<UpcommingData> createState() => _UpcommingDataState();
}

class _UpcommingDataState extends State<UpcommingData> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return widget.auctionViewModel.isLoadingForUpCommingAuction
          ? SliverToBoxAdapter(child: LinearProgressIndicator())
          : widget.auctionViewModel.upcomingAuctionResponse!.result == null
              ? SliverToBoxAdapter(child: Container())
              : widget.auctionViewModel.upcomingAuctionResponse!.result!
                          .auctions!.length >
                      1
                  ? widget.auctionViewModel.auctionType == "upcoming"
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return BrowsUpcommingItem(
                                  widget.auctionViewModel.upComingLotsResponse!
                                      .result!.lots![index],
                                  widget.auctionViewModel.isGrid,
                                  widget.auctionViewModel);
                            },
                            // 40 list items
                            childCount:
                                widget.auctionViewModel.upComingLotsResponse ==
                                        null
                                    ? 0
                                    : widget
                                                .auctionViewModel
                                                .upComingLotsResponse!
                                                .result!
                                                .lots ==
                                            null
                                        ? 0
                                        : widget
                                            .auctionViewModel
                                            .upComingLotsResponse!
                                            .result!
                                            .lots!
                                            .length,
                          ),
                        )
                      : SliverToBoxAdapter(child: Container())
                  : SliverToBoxAdapter(child: Container());
    });
  }
}
