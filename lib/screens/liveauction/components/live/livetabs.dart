import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/popwidget.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:sliver_tools/sliver_tools.dart';

class LiveTabs extends StatefulWidget {
  LiveTabs(this.auctionViewModel);

  AuctionViewModel auctionViewModel;

  @override
  State<LiveTabs> createState() => _LiveTabsState();
}

class _LiveTabsState extends State<LiveTabs> {
  Color tabColor = Color(0xffE74B52);

  @override
  void initState() {
    // TODO: implement initState
    widget.auctionViewModel.liveAuctionType = "browselist";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      child: Observer(builder: (context) {
        return Container(
          child: Column(
            children: [
              Container(
                color: Color(0xffFFFFFF),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      //This is for background color
                      color: Colors.white.withOpacity(0.0),

                      //This is for bottom border that is needed
                      border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                    ),
                    child: TabBar(
                      onTap: (index) {
                        if (index == 0) {
                          tabColor = Color(0xffE74B52);
                          setState(() {
                            widget.auctionViewModel.liveAuctionType = "browselist";
                            // widget.auctionViewModel.getLotById(
                            //     widget.auctionViewModel!.selectedAuction!
                            //         .auctionId!,
                            //     widget.auctionViewModel.liveAuctionType);
                          });
                        }
                        if (index == 1) {
                          if (widget.auctionViewModel.localSharedPrefrence.getLoginStatus() == false) {
                            WidgetsBinding.instance?.addPostFrameCallback((_) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return PopupWidget();
                                },
                              );
                            });
                          } else {
                            tabColor = Color(0xffE74B52);
                            setState(() {
                              widget.auctionViewModel.liveAuctionType = "mygallery";

                              widget.auctionViewModel.page = 1;
                              widget.auctionViewModel.myAuctionGallery();
                            });
                          }
                        }
                        if (index == 2) {
                          tabColor = Color(0xffE74B52);
                          setState(() {
                            widget.auctionViewModel.liveAuctionType = "review";
                            widget.auctionViewModel.page = 1;
                            widget.auctionViewModel.getReviewauctions(lot: widget.auctionViewModel.selectedAuction!);
                          });
                        }
                        if (index == 3) {
                          setState(() {
                            tabColor = Color(0xffE74B52);
                            widget.auctionViewModel.liveAuctionType = "closingschedule";
                          });
                        }

                        print(index);
                      },
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Color(0xffE74B52), width: 2.0),
                      ),
                      isScrollable: true,
                      padding: EdgeInsets.all(0),
                      labelPadding: EdgeInsets.only(right: 10, left: 5),
                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                      labelColor: const Color(0xFF2D2D2D),
                      labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w600,
                          ),
                      tabs: [
                        Tab(
                          text: "BROWSE LOTS",
                        ),
                        Tab(text: "MY AUCTION GALLERY"),
                        Tab(text: "LIVE AUCTION REVIEW"),
                        Tab(text: "CLOSING SCHEDULE"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          // Container()
        );
      }),
    );
  }
}
