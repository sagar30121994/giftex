import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/browsitemlistitem.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';

class PastData extends StatefulWidget {
  PastData(this.auctionViewModel);

  AuctionViewModel auctionViewModel;

  @override
  State<PastData> createState() => _PastDataState();
}

class _PastDataState extends State<PastData> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return widget.auctionViewModel.isLoadingForUpCommingAuction
          ? SliverToBoxAdapter(child: LinearProgressIndicator())
          : widget.auctionViewModel.upcomingAuctionResponse == null
              ? SliverToBoxAdapter(child: Container())
              : widget.auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length > 1
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        addAutomaticKeepAlives: true,
                        (BuildContext context, int index) {
                          return Observer(builder: (context) {
                            return BrowseItemListItem(
                                widget.auctionViewModel.upComingLotsResponse!.result!.lots![index],
                                widget.auctionViewModel.isGrid,
                                widget.auctionViewModel);
                          });
                        },
                        // 40 list items
                        childCount: widget.auctionViewModel.upComingLotsResponse == null
                            ? 0
                            : widget.auctionViewModel.upComingLotsResponse!.result!.lots == null
                                ? 0
                                : widget.auctionViewModel.upComingLotsResponse!.result!.lots!.length,
                      ),
                    )
                  : SliverToBoxAdapter(child: Container());
    });
  }
}
